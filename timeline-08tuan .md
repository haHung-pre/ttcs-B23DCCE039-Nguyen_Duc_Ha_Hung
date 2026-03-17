# Thực tập Cơ sở – Kế hoạch & Tiến độ 08 Tuần

> **Học phần:** Thực tập Cơ sở – Nhóm 21 – D23 – PTIT (2026)
> **Giảng viên:** Đặng Ngọc Hùng – Bộ môn CNPM | hungdn@ptit.edu.vn

---

## 1. Thông tin sinh viên

| Trường | Nội dung |
|--------|----------|
| Họ tên | Nguyễn Đức Hà Hùng |
| MSSV | B23DCCE039 |
| Lớp | D23CQCE06-B |
| Email | HungNDH.B23CE039@stu.ptit.edu.vn |
| GitHub username | haHung-pre |
| Link repository | https://github.com/haHung-pre/ttcs-B23DCCE039-Nguyen_Duc_Ha_Hung |

---

## 2. Định hướng & Mục tiêu

### Trả lời 3 câu hỏi định hướng

**① Tôi muốn làm vai trò gì sau khi ra trường?**

> **Backend Developer** – Tập trung vào thiết kế và xây dựng các RESTful API có khả năng mở rộng cao, kết hợp với kỹ năng containerization và CI/CD để đáp ứng yêu cầu của môi trường làm việc hiện đại. Mục tiêu dài hạn là hướng tới **Solution Architect** sau 4–5 năm kinh nghiệm.

**② Kỹ năng tôi còn thiếu / yếu trong vai trò đó là gì?**

> Sau khi tham khảo lộ trình tại [roadmap.sh/backend](https://roadmap.sh/backend) và tự đánh giá, tôi xác định 3 điểm yếu rõ ràng:
>
> - **FastAPI / Python backend framework**: Hiện chỉ quen với Flask ở mức cơ bản, chưa biết async, dependency injection, Pydantic schemas.
> - **Docker & Docker Compose**: Biết Docker ở mức lý thuyết, chưa từng viết `Dockerfile` hoàn chỉnh hay orchestrate multi-container.
> - **CI/CD với GitHub Actions**: Hoàn toàn chưa có kinh nghiệm. Đây là kỹ năng gần như bắt buộc ở mọi công ty tuyển dụng.

**③ Tôi có thể học và thực hành được kỹ năng đó trong 8 tuần không?**

> Có. Sau khi chia nhỏ phạm vi:
> - **Tuần 1–2**: Nền tảng FastAPI + PostgreSQL (CRUD cơ bản)
> - **Tuần 3–4**: Nâng cao FastAPI (Auth, Middleware, Error Handling) → kết quả giữa kỳ
> - **Tuần 5–6**: Docker hoá ứng dụng + Docker Compose multi-service
> - **Tuần 7–8**: CI/CD với GitHub Actions → deploy tự động lên VPS/Railway

---

## 3. Đăng ký chủ đề thực tập

**Định hướng:**
- [ ] Cải thiện / củng cố kỹ năng đang có (7–8)
- [ ] Học kỹ năng mới / theo trend (8–9)
- [x] **Gắn với nghiên cứu / đề tài / dự án (9–10)**

**1–3 kỹ năng chính muốn học / cải thiện:**

| # | Kỹ năng | Lý do chọn |
|---|---------|------------|
| 1 | **FastAPI + PostgreSQL + SQLAlchemy (async)** | Framework Python hiện đại, hiệu năng cao, được dùng rộng rãi tại các startup và công ty tech |
| 2 | **Docker & Docker Compose** | Bắt buộc trong quy trình phát triển chuyên nghiệp; không có Docker thì không thể làm DevOps hay CI/CD |
| 3 | **CI/CD với GitHub Actions** | Tự động hoá test + build + deploy; kỹ năng phân biệt Backend Dev cơ bản và Backend Dev thực chiến |

**Bài toán / nội dung áp dụng cụ thể:**

> **Xây dựng `TaskFlow API`** – một RESTful API backend hoàn chỉnh cho ứng dụng quản lý công việc cá nhân (to-do / task manager), bao gồm:
>
> - **Tính năng chính**: Đăng ký / đăng nhập (JWT Auth), CRUD Task, phân loại theo trạng thái (TODO / IN_PROGRESS / DONE), lọc & phân trang
> - **Stack**: FastAPI + PostgreSQL + SQLAlchemy (async) + Alembic (migration)
> - **Infrastructure**: Docker + Docker Compose (app + db + pgAdmin)
> - **Automation**: GitHub Actions – chạy test tự động khi push, build Docker image, deploy lên Railway (free tier)
> - **Tài liệu**: Swagger UI tự sinh từ FastAPI, ghi chú học tập trong `docs/`

**Làm việc nhóm:** Thực hiện cá nhân

---

## 4. Kế hoạch thực hiện 08 tuần

> **Nguyên tắc xuyên suốt: Đọc → Hiểu → Thực hiện. Không bỏ qua bước nào.**

---

### 🗓 Tuần 1 – Khởi động & Nền tảng FastAPI
**Thời gian:** 23/02 – 01/03/2026
**Mục tiêu tuần:** Hiểu cách FastAPI hoạt động, tạo được API CRUD đơn giản với dữ liệu in-memory trước khi kết nối database.

#### Tìm hiểu / Đọc:

| Nội dung cần đọc / tìm hiểu | Nguồn tham khảo | Trạng thái | Ghi chú / Điều đã hiểu |
|---|---|---|---|
| FastAPI – Overview, Why FastAPI, so sánh với Flask/Django | [fastapi.tiangolo.com](https://fastapi.tiangolo.com/) | [x] | FastAPI dùng Python type hints để tự sinh OpenAPI docs; nhanh hơn Flask nhờ Starlette + async; không cần decorator phức tạp như Django |
| Pydantic BaseModel – khai báo schema, validation tự động | [docs.pydantic.dev](https://docs.pydantic.dev) | [x] | Pydantic validate data tại runtime dựa trên type hint; sai kiểu → trả lỗi 422 tự động, không cần if/else thủ công |
| Path params, Query params, Request Body trong FastAPI | [fastapi.tiangolo.com/tutorial](https://fastapi.tiangolo.com/tutorial/) | [x] | Path param: `/tasks/{id}`; Query param: `?status=TODO`; Body: JSON – ba cơ chế khác nhau, không được nhầm lẫn |
| HTTP status codes – 200/201/400/401/404/422/500 | [developer.mozilla.org](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status) | [x] | 201 khi tạo resource mới; 401 chưa xác thực; 403 đã xác thực nhưng không có quyền; không dùng 200 cho mọi response |
| Roadmap Backend Developer – xem mình đang ở đâu | [roadmap.sh/backend](https://roadmap.sh/backend) | [x] | Xác định bản thân đang ở mức beginner-intermediate; FastAPI, Docker, CI/CD là 3 skill gap lớn nhất cần lấp trong 8 tuần |

#### Thực hành:

| Nhiệm vụ | Kết quả đầu ra | Trạng thái | Ghi chú |
|---|---|---|---|
| Cài đặt môi trường: Python 3.11, venv, FastAPI, Uvicorn | `src/samples/step01-hello/` – `uvicorn main:app --reload` chạy thành công | [x] | Tạo venv riêng, không dùng global Python để tránh conflict thư viện giữa các project |
| Viết API đầu tiên: `GET /` trả về `{"message": "Hello TaskFlow"}` | Commit đầu tiên + screenshot Swagger UI tại `/docs` | [x] | Swagger UI tự hiện mà không cần config gì thêm – điểm khác biệt lớn so với Flask |
| Xây dựng CRUD Task in-memory: GET all, GET by ID, POST, PUT, DELETE | `src/samples/step02-crud-inmemory/` có đủ 5 endpoint | [x] | Dùng `list` Python làm "database tạm"; hiểu rõ HTTP method: GET=đọc, POST=tạo, PUT=cập nhật, DELETE=xoá |
| Dùng Pydantic tạo `TaskCreate`, `TaskResponse` schema | Swagger UI tự động hiển thị đúng schema với type và example | [x] | Tách `TaskCreate` (input, không có id) và `TaskResponse` (output, có id + created_at) – không lộ field nhạy cảm |
| Viết `docs/week01-research.md` – ghi lại concept đã hiểu | `docs/week01-research.md` – 420 từ | [x] | Ghi lại sự khác biệt FastAPI vs Flask, cách Pydantic hoạt động, diagram luồng request-response cơ bản |

---

### 🗓 Tuần 2 – Kết nối Database (Buổi trao đổi 1)
**Thời gian:** 02/03 – 08/03/2026
**Mục tiêu tuần:** Thay thế in-memory bằng PostgreSQL thực sự. Hiểu ORM, migrations, async session.

#### Tìm hiểu / Đọc:

| Nội dung | Nguồn | Trạng thái | Ghi chú |
|---|---|---|---|
| SQLAlchemy 2.0 async – AsyncSession, async_engine | [docs.sqlalchemy.org](https://docs.sqlalchemy.org/en/20/orm/extensions/asyncio.html) | [x] | Phải dùng `await session.execute(...)`, `await session.commit()`; không thể gọi blocking I/O trong async context – khác hoàn toàn sync SQLAlchemy |
| Alembic – tại sao cần migration, không dùng `create_all()` trong production | [alembic.sqlalchemy.org](https://alembic.sqlalchemy.org) | [x] | `create_all()` không track lịch sử thay đổi schema; Alembic tạo file migration có version, rollback được – bắt buộc khi làm production |
| FastAPI Dependency Injection – `Depends()` để inject DB session | [fastapi.tiangolo.com/tutorial/dependencies](https://fastapi.tiangolo.com/tutorial/dependencies/) | [x] | `Depends(get_db)` inject session vào route; session tự đóng sau request kể cả khi có exception – sạch hơn try/finally thủ công |
| Repository Pattern – tại sao nên tách CRUD logic ra riêng | Blog: testdriven.io | [x] | Tách `TaskRepository` ra file riêng; router chỉ gọi repo method, không viết SQL/ORM trực tiếp trong router – dễ test, dễ swap ORM |

#### Thực hành:

| Nhiệm vụ | Kết quả đầu ra | Trạng thái | Ghi chú |
|---|---|---|---|
| Cài PostgreSQL local, tạo database `taskflow_db` | Kết nối thành công qua `psql -U postgres -d taskflow_db` | [x] | Dùng PostgreSQL 16; tạo user riêng `taskflow_user` thay vì dùng superuser `postgres` |
| Định nghĩa model `Task` với SQLAlchemy, chạy Alembic migration đầu tiên | `alembic/versions/001_create_tasks_table.py` | [x] | Bảng `tasks`: id, title, description, status, priority, created_at, updated_at |
| Refactor CRUD sang dùng `AsyncSession` + Repository pattern | `src/samples/step03-db/` – API CRUD hoạt động với PostgreSQL thực sự | [x] | `TaskRepository` có 5 method: `get_all`, `get_by_id`, `create`, `update`, `delete`; inject qua `Depends` |
| Test thủ công toàn bộ endpoint, data persist sau restart | Screenshot trước và sau khi restart `uvicorn`: data vẫn còn trong DB | [x] | Xác nhận data không mất khi tắt server – khác hoàn toàn in-memory |
| Viết `docs/week02-research.md` | `docs/week02-research.md` – 380 từ | [x] | Giải thích tại sao async session quan trọng, vẽ sơ đồ: Request → Router → Repository → DB → Response |

#### Chuẩn bị cho buổi trao đổi 1:
- **Đã đọc / tìm hiểu được gì?** FastAPI routing & Pydantic schema, SQLAlchemy 2.0 async, Alembic migration workflow, Dependency Injection pattern với `Depends()`, Repository pattern.
- **Đã thực hành được gì?** API CRUD Task đầy đủ kết nối PostgreSQL thực sự, có migration history, áp dụng Repository pattern. [Link repo](https://github.com/haHung-pre/ttcs-B23DCCE039-Nguyen_Duc_Ha_Hung)
- **Vướng mắc?** Ban đầu bị lỗi `MissingGreenlet` khi dùng lazy loading với async session → tìm hiểu được nguyên nhân: SQLAlchemy async không hỗ trợ lazy load, phải dùng `selectinload()` khi cần relationship. Mất ~2 tiếng debug nhưng hiểu sâu hơn về async ORM.

---

### 🗓 Tuần 3 – Authentication & API hoàn thiện
**Thời gian:** 09/03 – 15/03/2026
**Mục tiêu tuần:** Thêm JWT Authentication, xử lý lỗi chuẩn, cấu trúc project theo production-ready.

#### Tìm hiểu / Đọc:

| Nội dung | Nguồn | Trạng thái | Ghi chú |
|---|---|---|---|
| JWT – cấu trúc Header.Payload.Signature, access token vs refresh token | [jwt.io/introduction](https://jwt.io/introduction) | [x] | JWT gồm 3 phần ngăn cách bởi `.`; Payload chứa `sub` (user id), `exp` (expiry); stateless nên server không lưu session – scale dễ hơn session-based auth |
| `python-jose` + `passlib[bcrypt]` – hash password, tạo/verify JWT | FastAPI Security docs | [x] | `bcrypt` hash có salt tự động, không thể reverse; `python-jose` tạo JWT với `SECRET_KEY`; không bao giờ lưu plain-text password |
| FastAPI Security – `OAuth2PasswordBearer`, `HTTPBearer` | [fastapi.tiangolo.com/tutorial/security](https://fastapi.tiangolo.com/tutorial/security/) | [x] | `OAuth2PasswordBearer(tokenUrl="/auth/login")` tự thêm nút "Authorize" vào Swagger UI; `get_current_user` dependency decode token và trả về user object |
| Global Exception Handler trong FastAPI – `@app.exception_handler` | FastAPI docs – Handling Errors | [x] | Không để stacktrace lộ ra ngoài; `HTTPException` cho lỗi business logic; `@app.exception_handler(Exception)` bắt lỗi không mong đợi, trả JSON nhất quán |
| Project structure best practices | [github.com/zhanymkanov/fastapi-best-practices](https://github.com/zhanymkanov/fastapi-best-practices) | [x] | Cấu trúc `app/routers/`, `app/models/`, `app/schemas/`, `app/services/`, `app/core/` – mỗi layer có trách nhiệm riêng |

#### Thực hành:

| Nhiệm vụ | Kết quả đầu ra | Trạng thái | Ghi chú |
|---|---|---|---|
| Thêm model `User`, migration mới | `alembic/versions/002_add_users_table.py` | [x] | Bảng `users`: id, email (unique), hashed_password, is_active, created_at |
| Viết `POST /auth/register` và `POST /auth/login` – trả về JWT | Endpoint hoạt động, login trả về `access_token` và `token_type` | [x] | Register hash password trước khi lưu; login verify hash rồi mới cấp token; token expire sau 30 phút |
| Protect CRUD Task endpoints | `Depends(get_current_user)` trên tất cả route của `tasks` router | [x] | Không có token hoặc token hết hạn → tự động trả 401 Unauthorized |
| Task thuộc về user (foreign key `user_id`) | Query filter `where task.user_id == current_user.id` | [x] | User A không thấy task của user B; nếu request task không thuộc user hiện tại → 404 Not Found |
| Refactor cấu trúc project | `app/routers/auth.py`, `app/routers/tasks.py`, `app/models/`, `app/schemas/`, `app/services/` | [x] | `main.py` chỉ còn ~20 dòng; business logic nằm trong `services/`; router chỉ validate input và gọi service |
| Viết `docs/week03-research.md` | `docs/week03-research.md` | [x] | Vẽ JWT flow: login → server tạo token → client lưu token → gửi kèm `Authorization: Bearer <token>` → server decode → xác thực |

---

### 🗓 Tuần 4 – Hoàn thiện API & Tự đánh giá giữa kỳ (Buổi trao đổi 2)
**Thời gian:** 16/03 – 22/03/2026
**Mục tiêu tuần:** API hoàn chỉnh, có thể demo end-to-end. Viết unit test cơ bản. Tự đánh giá tiến độ.

#### Tìm hiểu / Đọc:

| Nội dung | Nguồn | Trạng thái | Ghi chú |
|---|---|---|---|
| Pytest + `httpx.AsyncClient` – test FastAPI async endpoint | [fastapi.tiangolo.com/tutorial/testing](https://fastapi.tiangolo.com/tutorial/testing/) | [x] | `AsyncClient` gửi HTTP request đến app không cần server thật; dùng SQLite in-memory làm test DB để tránh ảnh hưởng data production |
| Filtering, sorting, pagination trong FastAPI | realpython.com / fastapi docs | [x] | Query params: `?status=TODO&page=1&limit=10`; `offset = (page-1)*limit` trong SQLAlchemy; response trả về `total`, `page`, `items` |
| Environment variables – `pydantic-settings`, không hardcode secret | [12factor.net/config](https://12factor.net/config) | [x] | `pydantic-settings` load `.env` và validate kiểu tự động; `.env` vào `.gitignore`, commit `.env.example` thay thế |

#### Thực hành:

| Nhiệm vụ | Kết quả đầu ra | Trạng thái | Ghi chú |
|---|---|---|---|
| Thêm filter theo `status`, `priority`; phân trang (`page`, `limit`) | API trả đúng kết quả với mọi tổ hợp query param | [x] | Test: `GET /tasks?status=TODO&priority=HIGH&page=2&limit=5` hoạt động đúng |
| Viết 5 unit test: register, login, tạo task, lấy task list, unauthorized | `pytest` pass 5/5, coverage ~65% | [x] | Test `unauthorized`: gọi không có token → expect 401; test `forbidden`: token user A xoá task user B → expect 404 |
| Quản lý config bằng `pydantic-settings` + `.env` | Không còn hardcode DB URL hay secret key | [x] | `Settings` class với `DATABASE_URL`, `SECRET_KEY`, `ACCESS_TOKEN_EXPIRE_MINUTES`; load tự động từ `.env` |
| Cập nhật `README.md` với hướng dẫn chạy project | README có: giới thiệu, tech stack, prerequisites, quick start, API endpoints | [x] | Người khác clone về, làm theo README là chạy được ngay |
| Viết `docs/week04-research.md` + `docs/references.md` | `docs/week04-research.md` | [x] | |

#### Tự đánh giá giữa kỳ:
- **Đã hoàn thành được bao nhiêu % kế hoạch?** ~95% – còn thiếu refresh token (không ảnh hưởng core flow)
- **Kỹ năng đã hiểu chắc:** FastAPI routing, Pydantic validation, JWT Auth (giải thích được từng bước không nhìn code), SQLAlchemy async CRUD, Alembic migration, Repository pattern
- **Kỹ năng còn mơ hồ:** Alembic khi merge migration từ nhiều branch; test async endpoint với DB thật (hiện dùng SQLite in-memory thay thế)
- **Điều chỉnh kế hoạch nửa sau:** Giữ nguyên – tiến độ đúng schedule. Nếu còn thời gian tuần 7 sẽ thêm Redis cache cho `GET /tasks`.

#### Chuẩn bị cho buổi trao đổi 2:
- **Đã đọc / tìm hiểu được gì?** Testing với pytest + AsyncClient, pagination pattern, 12-factor app config, pydantic-settings.
- **Đã thực hành được gì?** API hoàn chỉnh: Auth + CRUD + filter + pagination + unit test. [Link repo](https://github.com/haHung-pre/ttcs-B23DCCE039-Nguyen_Duc_Ha_Hung)
- **Vướng mắc?** Khi test async endpoint, `AsyncClient` cần `anyio` backend; bị `RuntimeError: no running event loop` → fix bằng `@pytest.mark.anyio` decorator. Mất ~1 tiếng debug nhưng hiểu rõ hơn về event loop trong Python async.

---

### 🗓 Tuần 5 – Docker hoá ứng dụng
**Thời gian:** 23/03 – 29/03/2026
**Mục tiêu tuần:** Đóng gói toàn bộ ứng dụng vào Docker. Hiểu từng dòng trong `Dockerfile` và `docker-compose.yml`.

#### Tìm hiểu / Đọc:

| Nội dung | Nguồn | Trạng thái | Ghi chú |
|---|---|---|---|
| Docker fundamentals – image, container, layer, cache | [docs.docker.com/get-started](https://docs.docker.com/get-started/) | [x] | Image = immutable blueprint; container = instance đang chạy; mỗi `RUN` tạo một layer cache – thứ tự instruction quan trọng để tận dụng build cache |
| Viết `Dockerfile` tối ưu – multi-stage build, `.dockerignore` | [docs.docker.com/develop/develop-images/dockerfile_best-practices](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/) | [x] | Stage `builder` cài deps; stage `runtime` chỉ copy những gì cần → image size từ 800MB xuống 178MB. `.dockerignore` loại `.git`, `__pycache__`, `.env` |
| Docker Compose – services, networks, volumes, depends_on | [docs.docker.com/compose](https://docs.docker.com/compose/) | [x] | `depends_on` chỉ đảm bảo container start trước, không đảm bảo service sẵn sàng → cần `healthcheck` hoặc retry logic trong `entrypoint.sh` |
| Environment variables trong Docker – `env_file`, Docker secrets | Docker docs | [x] | Dùng `env_file: .env` trong compose; không `COPY .env` vào image; production nên dùng Docker secrets hoặc Vault |

#### Thực hành:

| Nhiệm vụ | Kết quả đầu ra | Trạng thái | Ghi chú |
|---|---|---|---|
| Viết `Dockerfile` cho FastAPI app (multi-stage: `builder` + `runtime`) | Image build thành công, size 178MB | [x] | Stage builder: `python:3.11-slim` + install deps; stage runtime: copy chỉ `app/` và installed packages |
| Viết `docker-compose.yml` với 3 service: `app`, `db` (postgres:16), `pgadmin` | `docker compose up -d` khởi động cả 3 service | [x] | `app` depends on `db` với healthcheck `pg_isready`; pgAdmin map port 5050 ra ngoài để quản lý DB qua browser |
| Cấu hình volume cho PostgreSQL (data persist khi container restart) | Xoá container rồi `up` lại, data vẫn còn | [x] | Named volume `postgres_data` – khác anonymous volume: không bị xoá khi `docker compose down` |
| Cấu hình Alembic chạy migration tự động khi container `app` khởi động | `entrypoint.sh`: chờ DB sẵn sàng → `alembic upgrade head` → `uvicorn ...` | [x] | Script retry 10 lần trước khi chạy migration; tránh lỗi "connection refused" khi DB chưa ready |
| Test toàn bộ flow: build → compose up → gọi API → data trong pgAdmin | Screenshot đầy đủ từng bước | [x] | Clone repo về máy mới, chỉ `docker compose up --build` là có đủ môi trường – không cần cài Python hay PostgreSQL local |
| Viết `docs/week05-research.md` | `docs/week05-research.md` – 520 từ | [x] | Giải thích từng dòng `Dockerfile`, lý do multi-stage, so sánh image size trước/sau tối ưu |

---

### 🗓 Tuần 6 – CI/CD với GitHub Actions (Buổi trao đổi 3)
**Thời gian:** 30/03 – 05/04/2026
**Mục tiêu tuần:** Tự động hoá test + build Docker image khi push code. Hiểu workflow YAML từng bước.

#### Tìm hiểu / Đọc:

| Nội dung | Nguồn | Trạng thái | Ghi chú |
|---|---|---|---|
| GitHub Actions – workflow, job, step, runner, trigger | [docs.github.com/en/actions](https://docs.github.com/en/actions) | [x] | Workflow = file YAML trong `.github/workflows/`; Job chạy song song trên runner riêng; Step chạy tuần tự trong 1 job; `ubuntu-latest` là runner phổ biến nhất |
| `on: push`, `on: pull_request` – trigger điều kiện | GitHub Actions docs | [x] | Trigger test trên mọi branch khi push; chỉ deploy khi push vào `main`; dùng `branches: [main]` để lọc |
| Secrets trong GitHub Actions – `${{ secrets.SECRET_NAME }}` | GitHub docs – Encrypted secrets | [x] | Secret lưu trong repo Settings → Secrets; không in ra log; truyền vào step qua `env:` |
| Docker Hub – tạo account, push/pull image | [hub.docker.com](https://hub.docker.com) | [x] | Login bằng `docker/login-action`; build & push bằng `docker/build-push-action`; tag: `username/taskflow-api:latest` và `sha-${{ github.sha }}` |
| Railway – deploy từ Docker image | [railway.app/docs](https://railway.app/docs) | [x] | Free tier: 500 giờ/tháng, đủ để demo; connect GitHub repo, Railway detect `Dockerfile` và auto-deploy khi push vào main |

#### Thực hành:

| Nhiệm vụ | Kết quả đầu ra | Trạng thái | Ghi chú |
|---|---|---|---|
| Tạo workflow `ci.yml`: push → setup Python → install deps → run pytest | CI badge ✅ xanh trên GitHub | [x] | Thêm service `postgres:16` trong workflow để chạy test với DB thật; `pytest --cov` để xem coverage |
| Thêm job `build-and-push`: build Docker image → push lên Docker Hub | Image `hahung-pre/taskflow-api:latest` xuất hiện trên Docker Hub | [x] | Job `build-and-push` dùng `needs: [test]` – chỉ chạy sau khi test pass |
| Thêm service PostgreSQL vào CI workflow để chạy integration test | Test kết nối DB thật trong pipeline, không mock | [x] | `services: postgres:` trong YAML; truyền `DATABASE_URL` qua `env:` với `${{ secrets.TEST_DATABASE_URL }}` |
| Tạo workflow `cd.yml`: push to `main` → deploy lên Railway | App live tại URL public Railway | [x] | Railway nhận webhook từ GitHub, tự build lại image và redeploy |
| Viết `docs/week06-research.md` – vẽ sơ đồ CI/CD pipeline | `docs/week06-research.md` có Mermaid diagram | [x] | Sơ đồ: `git push` → Actions trigger → test job → build job → push Docker Hub → Railway webhook → redeploy |

#### Chuẩn bị cho buổi trao đổi 3:
- **Đã đọc / tìm hiểu được gì?** GitHub Actions YAML syntax, job dependency (`needs:`), secrets management, Docker Hub integration, Railway deployment workflow.
- **Đã thực hành được gì?** Pipeline CI/CD hoàn chỉnh: push code → tự động test → build Docker image → deploy Railway. [Link Actions](https://github.com/haHung-pre/ttcs-B23DCCE039-Nguyen_Duc_Ha_Hung/actions) | [Live API](https://taskflow-api.up.railway.app/docs)
- **Vướng mắc?** CI bị lỗi `Connection refused` khi test kết nối PostgreSQL service → do PostgreSQL chưa ready khi test chạy; fix bằng `options: --health-cmd pg_isready --health-retries 5` trong service config. Sau khi fix, hiểu rõ tại sao `depends_on` trong compose không đủ và cần healthcheck.

---

### 🗓 Tuần 7 – Hoàn thiện & Nâng chất
**Thời gian:** 06/04 – 12/04/2026
**Mục tiêu tuần:** Nâng chất lượng code, dọn dẹp repo, hoàn thiện tài liệu.

#### Thực hành:

| Nhiệm vụ | Kết quả đầu ra | Trạng thái | Ghi chú |
|---|---|---|---|
| Code review cá nhân: xoá dead code, đặt tên biến rõ ràng, thêm docstring | Không còn `# TODO` hay code comment out | [ ] | |
| Hoàn thiện toàn bộ `docs/` – ghi chú đủ 7 tuần | `docs/week01` đến `docs/week07` đều có nội dung | [ ] | |
| Cập nhật `docs/references.md` – liệt kê tất cả nguồn tham khảo | ≥ 15 nguồn, có category (docs / blog / video) | [ ] | |
| Viết `README.md` tổng kết: tech stack, cách chạy local, CI/CD badge, demo link | README chuyên nghiệp, người lạ đọc hiểu ngay | [ ] | |
| Hoàn thiện `src/project/` – `docker compose up` chạy được ngay từ clone | Test clone về máy mới, thử từ đầu | [ ] | |
| *(Bonus)* Thêm rate limiting với `slowapi` hoặc Redis cache | Tính năng hoạt động, có ghi chú trong docs | [ ] | |

---

### 🗓 Tuần 8 – Tổng kết & Demo (Buổi trao đổi 4)
**Thời gian:** 13/04 – 23/04/2026
**Mục tiêu tuần:** Demo end-to-end toàn bộ hệ thống. Trình bày rõ những gì đã học và hiểu.

#### Thực hành:

| Nhiệm vụ | Kết quả đầu ra | Trạng thái | Ghi chú |
|---|---|---|---|
| Demo cuối kỳ: walk-through flow từ code → CI/CD → live API | Demo URL (Railway) + recording nếu cần | [ ] | |
| Có thể giải thích bất kỳ dòng code nào không cần nhìn gợi ý | Chuẩn bị 10 câu hỏi tự vấn đáp | [ ] | |
| Nộp báo cáo / cập nhật lần cuối `timeline-08tuan.md` | File này với tất cả checkbox đã tick | [ ] | |

#### Phản ánh cuối kỳ:
- **Kỹ năng nào tôi thực sự đã học và hiểu được?** *(điền sau tuần 8)*
- **Nếu làm lại, tôi sẽ thay đổi gì trong kế hoạch?** *(điền sau tuần 8)*
- **Kỹ năng này hữu ích như thế nào cho định hướng nghề nghiệp của tôi?** *(điền sau tuần 8)*

---

## 5. Checklist & Tổng kết

- [x] Nộp kế hoạch trước 23/02/2026
- [x] Tham gia buổi trao đổi 1 (Tuần 2)
- [x] Tham gia buổi trao đổi 2 (Tuần 4)
- [x] Tham gia buổi trao đổi 3 (Tuần 6)
- [ ] Tham gia buổi trao đổi 4 (Tuần 8)
- [x] Cập nhật `timeline-08tuan.md` mỗi tuần (Tuần 1–6 ✅)
- [x] Có ghi chú tìm hiểu trong `docs/` (6 tuần: week01 → week06)
- [ ] Sản phẩm cuối chạy được / demo được qua URL public
- [x] CI/CD pipeline xanh ✅ trên GitHub Actions
- [ ] Có thể giải thích những gì đã làm mà không cần nhìn code

---

**Tự đánh giá mức độ hoàn thành:** 75% *(sau 6/8 tuần)*

**Điều tôi tự hào nhất trong đợt thực tập này:**
> *(điền sau khi kết thúc)*

**Vướng mắc / nội dung cần giảng viên hỗ trợ thêm:**
> Tuần 6: Cần hỏi thêm về cách quản lý secrets an toàn hơn trong môi trường production (hiện dùng GitHub Secrets + Railway env vars, nhưng chưa rõ best practice khi scale lên nhiều service).

**Link repository cuối cùng:**
> https://github.com/haHung-pre/ttcs-B23DCCE039-Nguyen_Duc_Ha_Hung

---

*Cập nhật lần cuối: 05/04/2026*
