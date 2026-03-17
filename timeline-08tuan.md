# Thực tập Cơ sở – Kế hoạch & Tiến độ 08 Tuần

> **Học phần:** Thực tập Cơ sở – Nhóm 21 – D23 – PTIT (2026)
> **Giảng viên:** Đặng Ngọc Hùng – Bộ môn CNPM | hungdn@ptit.edu.vn

---

## 1. Thông tin sinh viên

| Trường        | Nội dung                                            |
|---------------|-----------------------------------------------------|
| Họ tên        | Nguyễn Đức Hà Hùng                                    |
| MSSV          | B23DCCE039                                         |
| Lớp           | D23CQPT01-B                                         |
| Email         | HungNDH.B23CE039@stu.ptit.edu.vn                  |
| GitHub username | haHung-pre                                |
| Link repository | https://github.com/haHung-pre/ttcs-B23DCCE039-Nguyen_Duc_Ha_Hung/edit/main/timeline-08tuan.md |

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
>
> Phạm vi này đủ thực tế, không quá tham lam, và có sản phẩm đầu ra rõ ràng để demo.

---

## 3. Đăng ký chủ đề thực tập

**Định hướng:**
- [ ] Cải thiện / củng cố kỹ năng đang có (7–8)
- [ ] Học kỹ năng mới / theo trend (8–9)
- [x] **Gắn với nghiên cứu / đề tài / dự án (9–10)**

---

**1–3 kỹ năng chính muốn học / cải thiện:**

| # | Kỹ năng | Lý do chọn |
|---|---------|------------|
| 1 | **FastAPI + PostgreSQL + SQLAlchemy (async)** | Framework Python hiện đại, hiệu năng cao, được dùng rộng rãi tại các startup và công ty tech |
| 2 | **Docker & Docker Compose** | Bắt buộc trong quy trình phát triển chuyên nghiệp; không có Docker thì không thể làm DevOps hay CI/CD |
| 3 | **CI/CD với GitHub Actions** | Tự động hoá test + build + deploy; kỹ năng phân biệt Backend Dev cơ bản và Backend Dev thực chiến |

---

**Bài toán / nội dung áp dụng cụ thể:**

> **Xây dựng `TaskFlow API`** – một RESTful API backend hoàn chỉnh cho ứng dụng quản lý công việc cá nhân (to-do / task manager), bao gồm:
>
> - **Tính năng chính**: Đăng ký / đăng nhập (JWT Auth), CRUD Task, phân loại theo trạng thái (TODO / IN_PROGRESS / DONE), lọc & phân trang
> - **Stack**: FastAPI + PostgreSQL + SQLAlchemy (async) + Alembic (migration)
> - **Infrastructure**: Docker + Docker Compose (app + db + pgAdmin)
> - **Automation**: GitHub Actions – chạy test tự động khi push, build Docker image, deploy lên Railway (free tier)
> - **Tài liệu**: Swagger UI tự sinh từ FastAPI, ghi chú học tập trong `docs/`
>
> **Lý do chọn bài toán này**: Đơn giản về domain nhưng đủ phức tạp để áp dụng đầy đủ 3 kỹ năng mục tiêu. Sản phẩm có thể demo trực tiếp qua Swagger UI mà không cần frontend.

---

**Làm việc nhóm:** Thực hiện cá nhân

---

## 4. Kế hoạch thực hiện 08 tuần

> **Nguyên tắc xuyên suốt: Đọc → Hiểu → Thực hiện. Không bỏ qua bước nào.**
> Mỗi kết quả đầu ra phải có bằng chứng cụ thể: file `.md` ghi chú, link commit, screenshot, hoặc demo URL.

---

### 🗓 Tuần 1 – Khởi động & Nền tảng FastAPI
**Thời gian:** 23/02 – 01/03/2026
**Mục tiêu tuần:** Hiểu cách FastAPI hoạt động, tạo được API CRUD đơn giản với dữ liệu in-memory trước khi kết nối database.

#### Tìm hiểu / Đọc:

| Nội dung cần đọc / tìm hiểu | Nguồn tham khảo | Trạng thái | Ghi chú / Điều đã hiểu |
|---|---|---|---|
| FastAPI – Overview, Why FastAPI, so sánh với Flask/Django | [fastapi.tiangolo.com/](https://fastapi.tiangolo.com/) | [ ] | FastAPI dùng Python type hints để tự sinh docs; async by default |
| Pydantic BaseModel – khai báo schema, validation tự động | [docs.pydantic.dev](https://docs.pydantic.dev) | [ ] | Pydantic validate data tại runtime, không cần viết if/else thủ công |
| Path params, Query params, Request Body trong FastAPI | [fastapi.tiangolo.com/tutorial/](https://fastapi.tiangolo.com/tutorial/) | [ ] | Ba cách nhận input khác nhau, phân biệt rõ use case |
| HTTP status codes – 200/201/400/401/404/422/500 | [developer.mozilla.org/en-US/docs/Web/HTTP/Status](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status) | [ ] | Hiểu ngữ nghĩa từng mã, không dùng 200 cho mọi response |
| Roadmap Backend Developer – xem mình đang ở đâu | [roadmap.sh/backend](https://roadmap.sh/backend) | [ ] | Xác định vị trí hiện tại, lên kế hoạch 8 tuần |

#### Thực hành:

| Nhiệm vụ | Kết quả đầu ra | Trạng thái | Ghi chú |
|---|---|---|---|
| Cài đặt môi trường: Python 3.11, venv, FastAPI, Uvicorn | `src/samples/step01-hello/` – chạy được `uvicorn main:app --reload` | [ ] | |
| Viết API đầu tiên: `GET /` trả về `{"message": "Hello TaskFlow"}` | Commit + screenshot Swagger UI | [ ] | |
| Xây dựng CRUD Task in-memory (list Python): GET all, GET by ID, POST, PUT, DELETE | `src/samples/step02-crud-inmemory/` | [ ] | |
| Dùng Pydantic tạo `TaskCreate`, `TaskResponse` schema | Swagger UI tự động hiển thị schema đúng | [ ] | |
| Viết `docs/week01-research.md` – ghi lại concept đã hiểu | `docs/week01-research.md` có ≥ 300 từ | [ ] | |

---

### 🗓 Tuần 2 – Kết nối Database (Buổi trao đổi 1)
**Thời gian:** 02/03 – 08/03/2026
**Mục tiêu tuần:** Thay thế in-memory bằng PostgreSQL thực sự. Hiểu ORM, migrations, async session.

#### Tìm hiểu / Đọc:

| Nội dung | Nguồn | Trạng thái | Ghi chú |
|---|---|---|---|
| SQLAlchemy 2.0 async – AsyncSession, async_engine | [docs.sqlalchemy.org/en/20/orm/extensions/asyncio.html](https://docs.sqlalchemy.org/en/20/orm/extensions/asyncio.html) | [ ] | Khác với sync SQLAlchemy ở chỗ phải dùng `await` khi query |
| Alembic – tại sao cần migration, không dùng `create_all()` trong production | [alembic.sqlalchemy.org](https://alembic.sqlalchemy.org) | [ ] | `create_all()` nguy hiểm vì không track history thay đổi schema |
| FastAPI Dependency Injection – `Depends()` để inject DB session | [fastapi.tiangolo.com/tutorial/dependencies/](https://fastapi.tiangolo.com/tutorial/dependencies/) | [ ] | Pattern sạch, tách biệt database logic khỏi route handler |
| Repository Pattern – tại sao nên tách CRUD logic ra riêng | Blog: testdriven.io / architecturenotes.co | [ ] | Dễ test, dễ thay đổi ORM sau này mà không sửa router |

#### Thực hành:

| Nhiệm vụ | Kết quả đầu ra | Trạng thái | Ghi chú |
|---|---|---|---|
| Cài PostgreSQL local (hoặc dùng Docker image), tạo database `taskflow_db` | Kết nối thành công, `psql` vào được | [ ] | |
| Định nghĩa model `Task` với SQLAlchemy, chạy Alembic migration đầu tiên | File migration trong `alembic/versions/` | [ ] | |
| Refactor CRUD sang dùng `AsyncSession` + Repository pattern | `src/samples/step03-db/` – API CRUD hoạt động với PostgreSQL | [ ] | |
| Test thủ công toàn bộ endpoint qua Swagger UI, xác nhận data persist sau restart | Screenshot trước/sau restart ứng dụng | [ ] | |
| Viết `docs/week02-research.md` | ≥ 300 từ, có giải thích tại sao dùng async session | [ ] | |

#### Chuẩn bị cho buổi trao đổi 1:
- **Đã đọc / tìm hiểu được gì?** FastAPI cơ bản, Pydantic, SQLAlchemy async, Alembic migration, Dependency Injection pattern.
- **Đã thực hành được gì?** API CRUD Task kết nối PostgreSQL thực sự, có migration history. Link: *(cập nhật trước buổi trao đổi)*
- **Vướng mắc?** *(ghi rõ trước buổi trao đổi, ví dụ: "Chưa hiểu rõ cách xử lý AsyncSession khi rollback")*

---

### 🗓 Tuần 3 – Authentication & API hoàn thiện
**Thời gian:** 09/03 – 15/03/2026
**Mục tiêu tuần:** Thêm JWT Authentication, xử lý lỗi chuẩn, cấu trúc project theo production-ready.

#### Tìm hiểu / Đọc:

| Nội dung | Nguồn | Trạng thái | Ghi chú |
|---|---|---|---|
| JWT – cấu trúc Header.Payload.Signature, access token vs refresh token | [jwt.io/introduction](https://jwt.io/introduction) | [ ] | Token là stateless, server không cần lưu session |
| `python-jose` + `passlib[bcrypt]` – hash password, tạo/verify JWT | FastAPI Security tutorial | [ ] | Không bao giờ lưu plain-text password |
| FastAPI Security – `OAuth2PasswordBearer`, `HTTPBearer` | [fastapi.tiangolo.com/tutorial/security/](https://fastapi.tiangolo.com/tutorial/security/) | [ ] | `OAuth2PasswordBearer` phù hợp với form login; HTTPBearer cho Bearer token |
| Global Exception Handler trong FastAPI – `@app.exception_handler` | FastAPI docs – Handling Errors | [ ] | Trả response lỗi nhất quán, không để stacktrace lộ ra ngoài |
| Project structure best practices – tách `routers/`, `models/`, `schemas/`, `services/` | [github.com/zhanymkanov/fastapi-best-practices](https://github.com/zhanymkanov/fastapi-best-practices) | [ ] | |

#### Thực hành:

| Nhiệm vụ | Kết quả đầu ra | Trạng thái | Ghi chú |
|---|---|---|---|
| Thêm model `User`, migration mới | Alembic migration `add_user_table` | [ ] | |
| Viết `POST /auth/register` và `POST /auth/login` – trả về JWT | Endpoint hoạt động, test qua Swagger | [ ] | |
| Protect CRUD Task endpoints – chỉ user đã login mới access được | `Depends(get_current_user)` trên các route | [ ] | |
| Task thuộc về user (foreign key `user_id`) – user chỉ thấy task của mình | Query có filter `where task.user_id == current_user.id` | [ ] | |
| Refactor cấu trúc project: `app/routers/`, `app/models/`, `app/schemas/`, `app/services/` | Cấu trúc thư mục gọn gàng, không có code lẫn lộn | [ ] | |
| Viết `docs/week03-research.md` | Giải thích JWT flow từng bước bằng lời của mình | [ ] | |

---

### 🗓 Tuần 4 – Hoàn thiện API & Tự đánh giá giữa kỳ (Buổi trao đổi 2)
**Thời gian:** 16/03 – 22/03/2026
**Mục tiêu tuần:** API hoàn chỉnh, có thể demo end-to-end. Viết unit test cơ bản. Tự đánh giá tiến độ.

#### Tìm hiểu / Đọc:

| Nội dung | Nguồn | Trạng thái | Ghi chú |
|---|---|---|---|
| Pytest + `httpx.AsyncClient` – test FastAPI async endpoint | [fastapi.tiangolo.com/tutorial/testing/](https://fastapi.tiangolo.com/tutorial/testing/) | [ ] | Dùng test database riêng, không test trên production DB |
| Filtering, sorting, pagination trong FastAPI | Blog: realpython.com / fastapi docs | [ ] | Dùng query params: `?status=TODO&page=1&limit=10` |
| Environment variables – `python-dotenv`, không hardcode secret | [12factor.net/config](https://12factor.net/config) | [ ] | Secret phải vào `.env`, không commit lên Git |

#### Thực hành:

| Nhiệm vụ | Kết quả đầu ra | Trạng thái | Ghi chú |
|---|---|---|---|
| Thêm filter task theo `status`, `priority`; phân trang (`page`, `limit`) | API hoạt động đúng với các query param khác nhau | [ ] | |
| Viết ít nhất 5 unit test: register, login, tạo task, lấy task list, unauthorized access | `pytest` chạy pass 5/5 test | [ ] | |
| Quản lý config bằng `pydantic-settings` + file `.env` | Không còn hardcode DB URL hay secret key | [ ] | |
| Cập nhật `README.md` chính với hướng dẫn chạy project | Người khác đọc README có thể chạy được ngay | [ ] | |
| Viết `docs/week04-research.md` + cập nhật `docs/references.md` | | [ ] | |

#### Tự đánh giá giữa kỳ:
- **Đã hoàn thành được bao nhiêu % kế hoạch?** *(điền sau tuần 4)*
- **Kỹ năng đã hiểu chắc:** FastAPI routing, Pydantic validation, JWT Auth, SQLAlchemy async CRUD
- **Kỹ năng còn mơ hồ:** *(ghi thật, ví dụ: "Alembic khi có nhiều migration phức tạp")*
- **Điều chỉnh kế hoạch nửa sau:** *(nếu tiến độ chậm, thu hẹp scope Docker; nếu nhanh, thêm Redis caching)*

---

### 🗓 Tuần 5 – Docker hoá ứng dụng
**Thời gian:** 23/03 – 29/03/2026
**Mục tiêu tuần:** Đóng gói toàn bộ ứng dụng vào Docker. Hiểu từng dòng trong `Dockerfile` và `docker-compose.yml`.

#### Tìm hiểu / Đọc:

| Nội dung | Nguồn | Trạng thái | Ghi chú |
|---|---|---|---|
| Docker fundamentals – image, container, layer, cache | [docs.docker.com/get-started/](https://docs.docker.com/get-started/) | [ ] | Image là immutable blueprint; container là instance đang chạy |
| Viết `Dockerfile` tối ưu – multi-stage build, `.dockerignore` | [docs.docker.com/develop/develop-images/dockerfile_best-practices/](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/) | [ ] | Multi-stage giảm image size; `.dockerignore` tránh copy `.git`, `__pycache__` |
| Docker Compose – services, networks, volumes, depends_on | [docs.docker.com/compose/](https://docs.docker.com/compose/) | [ ] | `depends_on` không đảm bảo service sẵn sàng, cần `healthcheck` |
| Environment variables trong Docker – `-e`, `env_file`, Docker secrets | Docker docs | [ ] | Không bao giờ hardcode secret vào `Dockerfile` |

#### Thực hành:

| Nhiệm vụ | Kết quả đầu ra | Trạng thái | Ghi chú |
|---|---|---|---|
| Viết `Dockerfile` cho FastAPI app (multi-stage: `builder` + `runtime`) | Image build thành công, size < 200MB | [ ] | |
| Viết `docker-compose.yml` với 3 service: `app`, `db` (postgres:16), `pgadmin` | `docker compose up -d` khởi động cả 3 service | [ ] | |
| Cấu hình volume cho PostgreSQL (data persist khi container restart) | Xoá container rồi up lại, data vẫn còn | [ ] | |
| Cấu hình Alembic chạy migration tự động khi container `app` khởi động | `entrypoint.sh`: `alembic upgrade head && uvicorn ...` | [ ] | |
| Test toàn bộ flow: build image → compose up → gọi API → data trong pgAdmin | Screenshot + ghi lại lệnh đã dùng | [ ] | |
| Viết `docs/week05-research.md` – giải thích từng dòng `Dockerfile` bằng lời | ≥ 400 từ, có lý giải tại sao dùng multi-stage | [ ] | |

---

### 🗓 Tuần 6 – CI/CD với GitHub Actions (Buổi trao đổi 3)
**Thời gian:** 30/03 – 05/04/2026
**Mục tiêu tuần:** Tự động hoá test + build Docker image khi push code. Hiểu workflow YAML từng bước.

#### Tìm hiểu / Đọc:

| Nội dung | Nguồn | Trạng thái | Ghi chú |
|---|---|---|---|
| GitHub Actions – concepts: workflow, job, step, runner, trigger | [docs.github.com/en/actions](https://docs.github.com/en/actions) | [ ] | Workflow = file YAML; Job chạy song song; Step chạy tuần tự trong job |
| `on: push`, `on: pull_request` – khi nào workflow chạy | GitHub Actions docs | [ ] | Nên trigger test trên mọi PR, không chỉ main branch |
| Secrets trong GitHub Actions – `${{ secrets.SECRET_NAME }}` | GitHub docs – Encrypted secrets | [ ] | Không hardcode token/password trong workflow file |
| Docker Hub – tạo account, push/pull image | [hub.docker.com](https://hub.docker.com) | [ ] | Image name format: `username/image:tag` |
| Railway / Render – deploy từ Docker image | [railway.app/docs](https://railway.app/docs) | [ ] | Free tier đủ để demo, không cần trả tiền |

#### Thực hành:

| Nhiệm vụ | Kết quả đầu ra | Trạng thái | Ghi chú |
|---|---|---|---|
| Tạo workflow `ci.yml`: trigger on push → setup Python → install deps → run pytest | Workflow chạy thành công trên GitHub, badge ✅ | [ ] | |
| Thêm job `build-and-push`: build Docker image → push lên Docker Hub | Image xuất hiện trên Docker Hub sau mỗi push | [ ] | |
| Thêm service PostgreSQL vào workflow để chạy integration test | Test kết nối DB thật trong CI pipeline | [ ] | |
| Tạo workflow `cd.yml`: trigger on push to `main` → deploy lên Railway | App live trên Railway với URL public | [ ] | |
| Viết `docs/week06-research.md` – vẽ sơ đồ CI/CD pipeline đã build | Sơ đồ ASCII hoặc Mermaid diagram trong `.md` | [ ] | |

---

### 🗓 Tuần 7 – Hoàn thiện & Nâng chất
**Thời gian:** 06/04 – 12/04/2026
**Mục tiêu tuần:** Nâng chất lượng code, dọn dẹp repo, hoàn thiện tài liệu, thêm tính năng nếu còn thời gian.

#### Thực hành:

| Nhiệm vụ | Kết quả đầu ra | Trạng thái | Ghi chú |
|---|---|---|---|
| Code review cá nhân: xoá dead code, đặt tên biến rõ ràng, thêm docstring | Không còn `# TODO` hay code comment out | [ ] | |
| Hoàn thiện toàn bộ `docs/` – đảm bảo có ghi chú ≥ 6 tuần | `docs/week01` đến `docs/week07` đều có nội dung | [ ] | |
| Cập nhật `docs/references.md` – liệt kê tất cả nguồn tham khảo đã dùng | ≥ 15 nguồn, có category (docs chính thức / blog / video) | [ ] | |
| Viết `README.md` tổng kết đầy đủ: giới thiệu, tech stack, cách chạy local, CI/CD badge, demo link | README chuyên nghiệp, người lạ đọc hiểu ngay | [ ] | |
| Hoàn thiện `src/project/` – đảm bảo `docker compose up` chạy được ngay từ repo clone | Kiểm tra bằng cách clone về máy mới, thử từ đầu | [ ] | |
| *(Bonus nếu còn thời gian)* Thêm rate limiting với `slowapi` hoặc Redis cache | Tính năng hoạt động, có ghi chú trong docs | [ ] | |

---

### 🗓 Tuần 8 – Tổng kết & Demo (Buổi trao đổi 4)
**Thời gian:** 13/04 – 23/04/2026
**Mục tiêu tuần:** Demo end-to-end toàn bộ hệ thống. Trình bày rõ những gì đã học và hiểu.

#### Thực hành:

| Nhiệm vụ | Kết quả đầu ra | Trạng thái | Ghi chú |
|---|---|---|---|
| Demo cuối kỳ: walk-through toàn bộ flow từ code → CI/CD → live API | Demo URL (Railway) + recording Loom/OBS nếu cần | [ ] | |
| Đảm bảo có thể giải thích bất kỳ dòng code nào trong repo mà không cần nhìn gợi ý | Chuẩn bị 10 câu hỏi tự vấn đáp | [ ] | |
| Nộp báo cáo / cập nhật lần cuối `timeline-08tuan.md` | File này với tất cả checkbox đã tick | [ ] | |

#### Phản ánh cuối kỳ:
- **Kỹ năng nào tôi thực sự đã học và hiểu được?** *(điền sau tuần 8)*
- **Nếu làm lại, tôi sẽ thay đổi gì trong kế hoạch?** *(điền sau tuần 8)*
- **Kỹ năng này hữu ích như thế nào cho định hướng nghề nghiệp của tôi?** *(điền sau tuần 8)*

---

## 5. Checklist & Tổng kết

- [ ] Nộp kế hoạch trước 23/02/2026
- [ ] Tham gia đủ 04 buổi trao đổi (Tuần 2, 4, 6, 8)
- [ ] Cập nhật `timeline-08tuan.md` mỗi tuần
- [ ] Có ghi chú tìm hiểu trong `docs/` (ít nhất 6 tuần)
- [ ] Sản phẩm cuối chạy được / demo được qua URL public
- [ ] CI/CD pipeline xanh ✅ trên GitHub Actions
- [ ] Có thể giải thích những gì đã làm mà không cần nhìn code

---

**Tự đánh giá mức độ hoàn thành:** ……%

**Điều tôi tự hào nhất trong đợt thực tập này:**
> *(điền sau khi kết thúc)*

**Vướng mắc / nội dung cần giảng viên hỗ trợ thêm:**
> *(cập nhật liên tục trong suốt quá trình)*

**Link repository cuối cùng:**
> [https://github.com/nguyenvanan-ptit/ttcs-B23DCPT001-nguyenvanan](https://github.com/haHung-pre/ttcs-B23DCCE039-Nguyen_Duc_Ha_Hung/edit/main/timeline-08tuan.md)

---

*Cập nhật lần cuối: 22/02/2026*
