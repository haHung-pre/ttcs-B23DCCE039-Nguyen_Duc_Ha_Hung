#!/bin/sh
set -e

echo "⏳ Waiting for PostgreSQL to be ready..."

MAX_RETRIES=15
COUNT=0

until python -c "
import asyncio, asyncpg, os, sys
async def check():
    try:
        conn = await asyncpg.connect(os.environ['DATABASE_URL'].replace('+asyncpg',''))
        await conn.close()
    except Exception as e:
        sys.exit(1)
asyncio.run(check())
" 2>/dev/null; do
    COUNT=$((COUNT + 1))
    if [ "$COUNT" -ge "$MAX_RETRIES" ]; then
        echo "❌ PostgreSQL did not become ready in time. Exiting."
        exit 1
    fi
    echo "  Retry $COUNT/$MAX_RETRIES – waiting 2s..."
    sleep 2
done

echo "✅ PostgreSQL is ready."

echo "⚙️  Running Alembic migrations..."
alembic upgrade head
echo "✅ Migrations complete."

echo "🚀 Starting TaskFlow API..."
exec uvicorn app.main:app --host 0.0.0.0 --port 8000
