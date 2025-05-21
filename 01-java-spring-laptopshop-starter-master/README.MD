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
- MySQL 5.7 hoặc cao hơn
- Docker và Docker Compose (tùy chọn)

### Các bước cài đặt

1. **Clone dự án**

   ```bash
   git clone [repository-url]
   cd [project-directory]
   ```

2. **Cấu hình Database**

   - Tạo database MySQL mới với tên `laptopshop`
   - Copy file `application.properties.template` thành `application.properties`
   - Cấu hình đã được thiết lập sẵn cho VNPay và Google OAuth2
   - Chỉ cần cập nhật thông tin database nếu cần

3. **Build và chạy dự án**

   **Cách 1: Chạy trực tiếp**

   ```bash
   # Build project
   mvn clean install

   # Chạy ứng dụng
   mvn spring-boot:run
   ```

4. **Tạo tài khoản Admin**

   ```sql
   -- Tạo role ADMIN
   INSERT INTO roles (name, description)
   VALUES ('ADMIN', 'Administrator role');

   Sau khi chạy ứng dụng lần đầu, thực hiện đăng nhập bằng google để vào admin:

   ```




5. **Truy cập ứng dụng**
   - Website: http://localhost:8080
   - Admin Panel: http://localhost:8080/admin

### Cấu trúc thư mục

```
src/
├── main/
│   ├── java/        # Mã nguồn Java
│   ├── resources/   # Cấu hình và tài nguyên
│   └── webapp/      # Frontend resources
└── test/           # Unit tests
```

### Tính năng đã được cấu hình sẵn

- ✅ Đăng nhập/Đăng ký với Google OAuth2
- ✅ Thanh toán qua VNPay Sandbox (Thẻ nội địa và tài khoản ngân hàng -> NCB -> 
      Số thẻ: 9704198526191432198
      Tên chủ thẻ	: NGUYEN VAN A
      Ngày phát hành	: 07/15
      Mật khẩu OTP : 123456 
 ) 
- ✅ Quản lý sản phẩm
- ✅ Giỏ hàng
- ✅ Quản lý đơn hàng
- ✅ Dashboard admin

### Quyền truy cập Admin

Sau khi đăng nhập với tài khoản admin, bạn có thể truy cập các trang quản trị:

- Dashboard: `/admin`
- Quản lý người dùng: `/admin/user`
- Quản lý sản phẩm: `/admin/product`
- Quản lý đơn hàng: `/admin/order`

### Troubleshooting

1. **Lỗi kết nối database**

   - Kiểm tra MySQL đang chạy
   - Kiểm tra thông tin kết nối trong application.properties

2. **Lỗi port 8080 đã được sử dụng**

   - Thay đổi port trong application.properties:
     ```properties
     server.port=8081
     ```

3. **Không thể đăng nhập admin**
   - Kiểm tra role_id trong bảng users có đúng là 1 không
   - Kiểm tra bảng roles có role ADMIN không
   - Thử xóa và tạo lại tài khoản admin

### Liên hệ

- Email: tranphudev3110@gmail.com
- Facebook: [Trần Phú](https://www.facebook.com/phu.tran.244255)
