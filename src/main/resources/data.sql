-- Insert roles data
INSERT INTO roles (id, description, name) VALUES 
(1, 'Admin thì full quyền', 'ADMIN'),
(2, 'User thông thường', 'USER')
ON DUPLICATE KEY UPDATE 
description = VALUES(description),
name = VALUES(name); 

-- Insert admin user
INSERT INTO users (id, email, password, full_name, role_id, avatar, provider) VALUES 
(1, 'admin@laptopshop.com', '$2a$10$Mc6tp.ATvhSGWevAQj0TceEELkNaAPLGbi0ZiCo4pVlivoiJZ7kVK', 'Admin User', 1, 'default.jpg', 'LOCAL')
ON DUPLICATE KEY UPDATE 
email = VALUES(email),
password = VALUES(password),
full_name = VALUES(full_name),
role_id = VALUES(role_id),
avatar = VALUES(avatar),
provider = VALUES(provider);

-- Insert sample products if not exists
INSERT INTO products (id, detail_desc, factory, image, name, price, quantity, short_desc, sold, target)
VALUES (1, 'ASUS TUF Gaming F15 FX506HF HN017W là chiếc laptop gaming giá rẻ nhưng vô cùng mạnh mẽ. Không chỉ bộ vi xử lý Intel thế hệ thứ 11, card đồ họa RTX 20 series mà điểm mạnh còn đến từ việc trang bị sẵn 16GB RAM, cho bạn hiệu năng xuất sắc mà không cần nâng cấp máy.', 'ASUS', '1711078092373-asus-01.png', 'Laptop Asus TUF Gaming', 17490000, 100, 'Intel, Core i5, 11400H', 0, 'GAMING')
ON DUPLICATE KEY UPDATE id=id;

INSERT INTO products (id, detail_desc, factory, image, name, price, quantity, short_desc, sold, target)
VALUES (2, 'Khám phá sức mạnh tối ưu từ Dell Inspiron 15 N3520, chiếc laptop có cấu hình cực mạnh với bộ vi xử lý Intel Core i5 1235U thế hệ mới và dung lượng RAM lên tới 16GB. Bạn có thể thoải mái xử lý nhiều tác vụ, nâng cao năng suất trong công việc mà không gặp bất kỳ trở ngại nào.', 'DELL', '1711078452562-dell-01.png', 'Laptop Dell Inspiron 15', 15490000, 200, 'i5 1235U/16GB/512GB/15.6\"FHD', 0, 'SINHVIEN-VANPHONG')
ON DUPLICATE KEY UPDATE id=id;

INSERT INTO products (id, detail_desc, factory, image, name, price, quantity, short_desc, sold, target)
VALUES (3, 'Mới đây, Lenovo đã tung ra thị trường một sản phẩm gaming thế hệ mới với hiệu năng mạnh mẽ, thiết kế tối giản, lịch lãm phù hợp cho những game thủ thích sự đơn giản. Tản nhiệt mát mẻ với hệ thống quạt kép kiểm soát được nhiệt độ máy luôn mát mẻ khi chơi game.', 'LENOVO', '1711079073759-lenovo-01.png', 'Lenovo IdeaPad Gaming 3', 19500000, 150, 'i5-10300H, RAM 8G', 0, 'GAMING')
ON DUPLICATE KEY UPDATE id=id;

INSERT INTO products (id, detail_desc, factory, image, name, price, quantity, short_desc, sold, target)
VALUES (4, 'Tận hưởng cảm giác mát lạnh sành điệu với thiết kế kim loại. Được thiết kế để đáp ứng những nhu cầu điện toán hàng ngày của bạn, dòng máy tính xách tay ASUS K Series sở hữu thiết kế tối giản, gọn nhẹ và cực mỏng với một lớp vỏ họa tiết vân kim loại phong cách. Hiệu năng của máy rất mạnh mẽ nhờ trang bị bộ vi xử lý Intel® Core™ i7 processor và đồ họa mới nhất.', 'ASUS', '1711079496409-asus-02.png', 'Asus K501UX', 11900000, 99, 'VGA NVIDIA GTX 950M- 4G', 0, 'THIET-KE-DO-HOA')
ON DUPLICATE KEY UPDATE id=id;

INSERT INTO products (id, detail_desc, factory, image, name, price, quantity, short_desc, sold, target)
VALUES (5, 'Chiếc MacBook Air có hiệu năng đột phá nhất từ trước đến nay đã xuất hiện. Bộ vi xử lý Apple M1 hoàn toàn mới đưa sức mạnh của MacBook Air M1 13 inch 2020 vượt xa khỏi mong đợi người dùng, có thể chạy được những tác vụ nặng và thời lượng pin đáng kinh ngạc.', 'APPLE', '1711079954090-apple-01.png', 'MacBook Air 13', 17690000, 99, 'Apple M1 GPU 7 nhân', 0, 'GAMING')
ON DUPLICATE KEY UPDATE id=id;

INSERT INTO products (id, detail_desc, factory, image, name, price, quantity, short_desc, sold, target)
VALUES (6, '14.0 Chính: inch, 2880 x 1800 Pixels, OLED, 90 Hz, OLED', 'LG', '1711080386941-lg-01.png', 'Laptop LG Gram Style', 31490000, 99, 'Intel Iris Plus Graphics', 0, 'DOANH-NHAN')
ON DUPLICATE KEY UPDATE id=id;

INSERT INTO products (id, detail_desc, factory, image, name, price, quantity, short_desc, sold, target)
VALUES (7, 'Không chỉ khơi gợi cảm hứng qua việc cách tân thiết kế, MacBook Air M2 2022 còn chứa đựng nguồn sức mạnh lớn lao với chip M2 siêu mạnh, thời lượng pin chạm ngưỡng 18 giờ, màn hình Liquid Retina tuyệt đẹp và hệ thống camera kết hợp cùng âm thanh tân tiến.', 'APPLE', '1711080787179-apple-02.png', 'MacBook Air 13', 24990000, 99, 'Apple M2 GPU 8 nhân', 0, 'MONG-NHE')
ON DUPLICATE KEY UPDATE id=id;

INSERT INTO products (id, detail_desc, factory, image, name, price, quantity, short_desc, sold, target)
VALUES (8, 'Là chiếc laptop gaming thế hệ mới nhất thuộc dòng Nitro 5 luôn chiếm được rất nhiều cảm tình của game thủ trước đây, Acer Nitro Gaming AN515-58-769J nay còn ấn tượng hơn nữa với bộ vi xử lý Intel Core i7 12700H cực khủng và card đồ họa RTX 3050, sẵn sàng cùng bạn chinh phục những đỉnh cao.', 'ACER', '1711080948771-acer-01.png', 'Laptop Acer Nitro', 23490000, 99, 'AN515-58-769J i7 12700H', 0, 'SINHVIEN-VANPHONG')
ON DUPLICATE KEY UPDATE id=id;

INSERT INTO products (id, detail_desc, factory, image, name, price, quantity, short_desc, sold, target)
VALUES (9, '15.6 inch, FHD (1920 x 1080), IPS, 144 Hz, 250 nits, Acer ComfyView LED-backlit', 'ASUS', '1711081080930-asus-03.png', 'Laptop Acer Nitro V', 26999000, 99, 'NVIDIA GeForce RTX 4050', 0, 'MONG-NHE')
ON DUPLICATE KEY UPDATE id=id;

INSERT INTO products (id, detail_desc, factory, image, name, price, quantity, short_desc, sold, target)
VALUES (10, 'Dell Inspiron N3520 là chiếc laptop lý tưởng cho công việc hàng ngày. Bộ vi xử lý Intel Core i5 thế hệ thứ 12 hiệu suất cao, màn hình lớn 15,6 inch Full HD 120Hz mượt mà, thiết kế bền bỉ sẽ giúp bạn giải quyết công việc nhanh chóng mọi lúc mọi nơi.', 'DELL', '1711081278418-dell-02.png', 'Laptop Dell Latitude 3420', 21399000, 99, 'Intel Iris Xe Graphics', 0, 'MONG-NHE')
ON DUPLICATE KEY UPDATE id=id; 