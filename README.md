# TaskFlow API 🚀

![CI](https://github.com/haHung-pre/ttcs-B23DCCE039-Nguyen_Duc_Ha_Hung/actions/workflows/ci.yml/badge.svg)
![Python](https://img.shields.io/badge/Python-3.11-blue)
![FastAPI](https://img.shields.io/badge/FastAPI-0.115-green)
![Docker](https://img.shields.io/badge/Docker-ready-blue)
![License](https://img.shields.io/badge/license-MIT-lightgrey)

> **Thực tập Cơ sở – B23DCCE039 – Nguyễn Đức Hà Hùng**
> PTIT D23CQCE06-B | GV: Đặng Ngọc Hùng

RESTful API backend hoàn chỉnh cho ứng dụng quản lý công việc cá nhân, xây dựng với **FastAPI + PostgreSQL + Docker + CI/CD**.

🌐 **Live Demo:** https://taskflow-api.up.railway.app/docs

---

## ✨ Tính năng

- 🔐 **JWT Authentication** – Register, Login, Bearer token
- ✅ **CRUD Task** – Tạo, đọc, cập nhật, xoá task
- 🔍 **Filter & Pagination** – Lọc theo status/priority, phân trang
- 🐳 **Docker Ready** – Chạy toàn bộ môi trường bằng 1 lệnh
- 🤖 **CI/CD** – Test tự động + deploy lên Railway khi push vào main
- 📖 **Auto Docs** – Swagger UI tại `/docs`, ReDoc tại `/redoc`

---

## 🛠 Tech Stack

| Layer | Technology |
|-------|-----------|
| Framework | FastAPI 0.115 |
| Language | Python 3.11 |
| Database | PostgreSQL 16 |
| ORM | SQLAlchemy 2.0 (async) |
| Migration | Alembic |
| Auth | JWT (python-jose + passlib bcrypt) |
| Container | Docker + Docker Compose |
| CI/CD | GitHub Actions + Railway |
| Testing | pytest + httpx AsyncClient |

---

## 🚀 Quick Start (Docker – Recommended)

```bash
# 1. Clone repo
git clone https://github.com/haHung-pre/ttcs-B23DCCE039-Nguyen_Duc_Ha_Hung.git
cd ttcs-B23DCCE039-Nguyen_Duc_Ha_Hung/src/project

# 2. Setup env
cp .env.example .env

# 3. Start everything
docker compose up --build

# API ready at: http://localhost:8000/docs
# pgAdmin at:   http://localhost:5050  (admin@taskflow.local / admin123)
```

---

## 💻 Local Development (Without Docker)

**Prerequisites:** Python 3.11+, PostgreSQL 16

```bash
# 1. Create virtual environment
python -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate

# 2. Install dependencies
pip install -r requirements.txt

# 3. Configure environment
cp .env.example .env
# Edit .env: set DATABASE_URL to your local PostgreSQL

# 4. Run database migrations
alembic upgrade head

# 5. Start server
uvicorn app.main:app --reload

# API: http://localhost:8000/docs
```

---

## 📡 API Endpoints

### Authentication
| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/auth/register` | Register new user |
| POST | `/auth/login` | Login, get JWT token |
| GET | `/auth/me` | Get current user info |

### Tasks (requires Bearer token)
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/tasks/` | List tasks (filter + paginate) |
| POST | `/tasks/` | Create new task |
| GET | `/tasks/{id}` | Get task by ID |
| PUT | `/tasks/{id}` | Update task |
| DELETE | `/tasks/{id}` | Delete task |

**Filter params:** `?status=TODO&priority=HIGH&page=1&limit=10`

---

## 🧪 Running Tests

```bash
pytest tests/ -v
```

---

## 📁 Project Structure

```
src/project/
├── app/
│   ├── main.py              ← FastAPI app, middleware, routers
│   ├── core/
│   │   ├── config.py        ← pydantic-settings, env vars
│   │   └── security.py      ← JWT utils, get_current_user
│   ├── db/
│   │   └── session.py       ← async engine, session, Base
│   ├── models/              ← SQLAlchemy ORM models
│   ├── schemas/             ← Pydantic request/response schemas
│   ├── services/            ← Business logic layer
│   └── routers/             ← HTTP route handlers
├── alembic/                 ← Database migrations
├── tests/                   ← pytest test suite
├── docs/                    ← Weekly research notes (week01–week06)
├── Dockerfile               ← Multi-stage Docker build
├── docker-compose.yml       ← App + PostgreSQL + pgAdmin
└── .github/workflows/       ← CI (test+build) + CD (deploy)
```

---

## 🔄 CI/CD Pipeline

```
git push → GitHub Actions
    ├── Job: test    → pytest (with real PostgreSQL service)
    └── Job: build   → Docker build + push to Docker Hub (main only)
                            ↓
                     Railway webhook → auto redeploy
```

---

*Nguyễn Đức Hà Hùng – B23DCCE039 – PTIT 2026*
