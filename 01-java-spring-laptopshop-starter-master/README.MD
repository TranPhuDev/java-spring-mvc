# 🚀 Java Spring MVC - Xây Dựng FullStack Website với Spring Boot


- DMCA takedown requests.
- Account suspension on learning platforms.
- Legal action in serious cases.

📩 For inquiries, contact: **tranphudev3110@gmail.com**

---

## 📖 Hướng dẫn cài đặt và chạy dự án

### Yêu cầu hệ thống

- Java JDK 17
- Maven
- IDE (khuyến nghị sử dụng Vscode hoặc Eclipse)
- MySQL Database

### Các bước cài đặt

1. **Clone dự án**

   ```bash
   git clone [repository-url]
   cd [project-directory]
   ```

2. **Cấu hình Database**

   - Tạo database MySQL mới
   - Cập nhật thông tin kết nối database trong file `application.properties`:
     ```properties
     spring.datasource.url=jdbc:mysql://localhost:3306/[your-database-name]
     spring.datasource.username=[your-username]
     spring.datasource.password=[your-password]
     ```

3. **Build và chạy dự án**

   ```bash
   # Build project
   mvn clean install

   # Chạy ứng dụng
   mvn spring-boot:run
   ```

4. **Truy cập ứng dụng**
   - Mở trình duyệt và truy cập: `http://localhost:8080`

### Cấu trúc thư mục

```
src/
├── main/
│   ├── java/        # Mã nguồn Java
│   ├── resources/   # Cấu hình và tài nguyên
│   └── webapp/      # Frontend resources
└── test/           # Unit tests
```

### Troubleshooting

- Nếu gặp lỗi port 8080 đã được sử dụng, bạn có thể thay đổi port trong `application.properties`:
  ```properties
  server.port=8081
  ```
- Đảm bảo MySQL đang chạy trước khi khởi động ứng dụng
- Kiểm tra logs trong console để xem thông báo lỗi chi tiết

---

## Về tác giả

Facebook "Trần Phú" : https://www.facebook.com/phu.tran.244255
