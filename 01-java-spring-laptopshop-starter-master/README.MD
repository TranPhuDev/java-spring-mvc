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

# Laptop Shop Spring Boot Project

## Prerequisites

- Java 17 or higher
- Maven 3.6 or higher
- MySQL 8.0 or higher
- IDE (IntelliJ IDEA, Eclipse, or VS Code)

## Setup Instructions

1. **Clone the repository**

```bash
git clone <repository-url>
cd laptopshop
```

2. **Database Setup**

- Create a new MySQL database
- Update database configuration in `src/main/resources/application.properties`:
  - Copy `application.properties.template` to `application.properties`
  - Update database name, username, and password

3. **Build and Run**

```bash
# Build the project
mvn clean install

# Run the application
mvn spring-boot:run
```

4. **Access the Application**

- Open your browser and navigate to `http://localhost:8080`

## Project Structure

```
src/main/java/vn/tranphudev/laptopshop/
├── controller/     # Controller classes
├── domain/        # Entity classes
├── repository/    # Repository interfaces
├── service/       # Service classes
└── config/        # Configuration classes
```

## Features

- User authentication and authorization
- Product management
- Shopping cart functionality
- Order processing
- Payment integration
- Admin dashboard

## Configuration Files

- `application.properties`: Main configuration file
- `application-dev.properties`: Development environment configuration
- `application-prod.properties`: Production environment configuration

## Important Notes

- Make sure to update sensitive information in configuration files
- Create necessary directories for file uploads
- Set up proper email configuration if using email features

## Troubleshooting

If you encounter any issues:

1. Check database connection settings
2. Verify Java and Maven versions
3. Ensure all required directories exist
4. Check application logs in `logs/application.log`

## Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a new Pull Request
