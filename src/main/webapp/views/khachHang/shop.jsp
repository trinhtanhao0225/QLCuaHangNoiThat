<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thời trang</title>
    <!-- Liên kết đến file CSS -->
    <link rel="stylesheet" href="../../css/style.css">

</head>
<body>
    <!-- Phần header -->
    <header class="header">
        <div class="logo">CHANCOS</div>
        <nav>
            <a href="#">Giới thiệu</a>
            <a href="#">New In</a>
            <a href="#">Sản phẩm</a>
            <a href="#">Bộ sưu tập</a>
            <a href="#">Blog</a>
            <a href="#">V.I.P</a>
        </nav>
        <div class="icons">
            <a href="#"><img src="../../image/search.png" alt="Tìm kiếm" class="icon"></a>
            <a href="#"><img src="../../image/user.png" alt="Người dùng" class="icon"></a>
            <a href="#"><img src="../../image/cart.png" alt="Giỏ hàng" class="icon"></a>
        </div>
    </header>

    <!-- Phần banner -->
    <div class="banner">
        <img src="../image/banner.jpg" alt="Echoes of the Wild">
        <div class="banner-content">
            <h1>ECHOES OF THE WILD</h1>
            <p>Highlighting its natural factors and meticulous craftsmanship.</p>
            <button>Khám Phá Ngay</button>
        </div>
    </div>

    <!-- Phần sản phẩm -->
    <div class="product-container">
        <div class="product">
            <div class="discount-banner">UP TO 50% BLACK FRIDAY</div>
            <img src="../image/product2.jpg" alt="Chân váy Cerin">
            <h3>Chân váy Cerin</h3>
            <p>5,000,000đ</p>
        </div>
        <div class="product">
            <div class="discount-banner">UP TO 50% BLACK FRIDAY</div>
            <img src="../image/product2.jpg" alt="Áo Cerin">
            <h3>Áo Cerin</h3>
            <p>7,000,000đ</p>
        </div>
        <div class="product">
            <div class="discount-banner">UP TO 50% BLACK FRIDAY</div>
            <img src="../image/product2.jpg" alt="Juyp Jolis">
            <h3>Juyp Jolis</h3>
            <p>6,000,000đ</p>
        </div>
        <div class="product">
            <div class="discount-banner">UP TO 50% BLACK FRIDAY</div>
            <img src="../image/product2.jpg" alt="Áo Vest Jolis">
            <h3>Áo Vest Jolis</h3>
            <p>12,000,000đ</p>
        </div>
    </div>
    
    <!-- footer -->
    
        <!-- Phần footer -->
    <footer class="footer">
        <div class="footer-section">
            <h4>4MEN</h4>
            <ul>
                <li><a href="#">Giới thiệu</a></li>
                <li><a href="#">Liên hệ</a></li>
                <li><a href="#">Tuyển dụng</a></li>
                <li><a href="#">Tin tức</a></li>
            </ul>
            <p>Email: info@4menshop.com</p>
            <p>Hotline: 0868.444.644</p>
        </div>
        <div class="footer-section">
            <h4>Hỗ Trợ Khách Hàng</h4>
            <ul>
                <li><a href="#">Hướng dẫn đặt hàng</a></li>
                <li><a href="#">Hướng dẫn chọn size</a></li>
                <li><a href="#">Câu hỏi thường gặp</a></li>
                <li><a href="#">Chính sách khách VIP</a></li>
                <li><a href="#">Thanh toán - Giao hàng</a></li>
                <li><a href="#">Chính sách đổi hàng</a></li>
                <li><a href="#">Chính sách bảo mật</a></li>
                <li><a href="#">Chính sách cookie</a></li>
            </ul>
        </div>
        <div class="footer-section">
            <h4>Hệ Thống Cửa Hàng</h4>
            <img src="image/footer-map.jpg" alt="Hệ thống cửa hàng" class="store-map">
            <a href="#" class="map-link">Tìm địa chỉ cửa hàng gần bạn »</a>
        </div>
        <div class="footer-section">
            <h4>Kết Nối Với 4MEN</h4>
            <p>253K người theo dõi</p>
            <div class="social-icons">
                <a href="#"><img src="image/facebook.png" alt="Facebook"></a>
                <a href="#"><img src="image/youtube.png" alt="YouTube"></a>
                <a href="#"><img src="image/instagram.png" alt="Instagram"></a>
            </div>
            <button class="follow-button">Thích 5,8K</button>
        </div>
    </footer>
    <!-- End footer -->
    
</body>
</html>