<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="product">
    <img src="image/product1.jpg" alt="Cụm bàn làm việc 2 người">
    <h3>Cụm bàn làm việc 2 người</h3>
    <p>2,000,000đ</p>
    <button onclick="showDetails()">Xem chi tiết</button>
    <button class="add-to-cart" onclick="addToCart()">Thêm vào giỏ hàng</button>
</div>

<div class="details" id="details">
    <h3>Thông tin chi tiết</h3>
    <p>Mã: EUC07-1212</p>
    <p>Thương hiệu: Thiên Hòa Furniture</p>
    <p>Chất liệu: Khung sắt sơn tĩnh điện, mặt bàn gỗ phủ melamine</p>
    <p>Kích thước: W1200 x D1200 x H750 mm</p>
    <p>Màu sắc: Có thể tùy chọn theo bảng màu</p>
    <p>Bảo hành: 12 tháng</p>
</div>

<div>
    <p>Số sản phẩm trong giỏ hàng: <span id="cart-count">0</span></p>
</div>

<script src="script.js"></script>
</body>
</html>