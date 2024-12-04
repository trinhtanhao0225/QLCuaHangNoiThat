<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thời trang</title>
    <link rel="stylesheet" href="/QLCuaHangNoiThat/css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" 
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script>
        function toggleSearchBox(event) {
            event.preventDefault();
            const searchBox = document.getElementById("search-box");
            if (searchBox.style.display === "none" || searchBox.style.display === "") {
                searchBox.style.display = "flex";
            } else {
                searchBox.style.display = "none";
            }
        }
    </script>
    <style>
        .search-container {
            position: relative;
            display: inline-block;
        }
        #search-box {
            position: absolute;
            top: 100%;
            right: 0;
            display: none;
            background: white;
            border: 1px solid #ddd;
            padding: 5px;
            z-index: 1000;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        #search-box input {
            border: none;
            padding: 5px;
            width: 200px;
        }
        #search-box button {
            border: none;
            background: none;
            cursor: pointer;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <!-- Header -->
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
            <!-- Tìm kiếm -->
            <div class="search-container">
                <a href="#" class="search-icon" onclick="toggleSearchBox(event)">
                    <img src="/QLCuaHangNoiThat/image/search.png" alt="Tìm kiếm" class="icon">
                </a>
                <form id="search-box" action="searchProduct" method="get">
                    <input type="text" name="query" placeholder="Tìm kiếm sản phẩm...">
                    <button type="submit">🔍</button>
                </form>
            </div>
            <!-- Giỏ hàng -->
            <a href="/QLCuaHangNoiThat/views/khachHang/viewCart.jsp">
                <img src="/QLCuaHangNoiThat/image/cart.png" alt="Giỏ hàng" class="icon">
                <span class="cart-badge">
                    ${sessionScope.cartSize != null ? sessionScope.cartSize : 0}
                </span>
            </a>
             <a href="/QLCuaHangNoiThat/views/khachHang/viewCart.jsp">
                <img src="/QLCuaHangNoiThat/image/list.png" alt="Giỏ hàng" class="icon">
            </a>
        </div>
        <!-- Button Đăng nhập -->
        <div class="login-button-container">
            <a href="<%= request.getContextPath() %>/views/nhanVien/login.jsp">
                <button class="login-button">Đăng nhập</button>
            </a>
        </div>
    </header>

    <!-- Banner -->
    <div class="banner">
        <img src="/QLCuaHangNoiThat/image/banner.png" alt="Echoes of the Wild">
        <div class="banner-content">
            <h1>ECHOES OF THE WILD</h1>
            <p>Highlighting its natural factors and meticulous craftsmanship.</p>
            <button>Khám Phá Ngay</button>
        </div>
    </div>
	<c:if test="${not empty error}">
    <div class="alert alert-danger">${error}</div>
</c:if>
	
    <!-- Sản phẩm -->
    <div class="product-container">
        <c:if test="${not empty errorMessage}">
            <div class="error-message">${errorMessage}</div>
        </c:if>
        <c:if test="${not empty listDNT}">
            <c:forEach var="product" items="${listDNT}">
                <div class="product">
                    <img src="<c:url value='/image/${product.hinhAnh}'/>" alt="${product.ten}" style="width: 380px; height: 400px;">
                    <h3><b>${product.ten}</b></h3>
                    <div style="display:flex">
                        <span><p>Giá : ${product.gia}đ   | </p></span>
                        <span><p>Màu sắc : ${product.mauSac}</p></span>
                    </div>
                    <a href="<%= request.getContextPath() %>/chiTietSanPham?id=${product.id}">
                        <button type="button" class="btn btn-dark">Xem Chi Tiết</button>
                    </a>
                    <c:if test="${product.soLuong > 0}">
                        <form action="<%= request.getContextPath() %>/addToCart" method="post">
                            <input type="hidden" name="id" value="${product.id}">
                            <input type="hidden" name="ten" value="${product.ten}">
                            <input type="hidden" name="hinhAnh" value="${product.hinhAnh}">
                            <input type="hidden" name="gia" value="${product.gia}">
                            <input type="hidden" name="soLuong" value="${product.soLuong}">
                            <input type="hidden" name="soLuongMua" value="1">
                            
                            <button type="submit" class="add-to-cart">Thêm vào giỏ hàng</button>
                        </form>
                    </c:if>
                    <c:if test="${product.soLuong == 0}">
                        <button disabled class="out-of-stock">Hết hàng</button>
                    </c:if>
                </div>
            </c:forEach>
        </c:if>
    </div>

    <!-- Footer -->
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
            <img src="/QLCuaHangNoiThat/image/footer-map.jpg" alt="Hệ thống cửa hàng" class="store-map">
            <a href="#" class="map-link">Tìm địa chỉ cửa hàng gần bạn »</a>
        </div>
        <div class="footer-section">
            <h4>Kết Nối Với 4MEN</h4>
            <p>253K người theo dõi</p>
            <div class="social-icons">
                <a href="#"><img src="/QLCuaHangNoiThat/image/facebook.png" alt="Facebook"></a>
                <a href="#"><img src="/QLCuaHangNoiThat/image/youtube.png" alt="YouTube"></a>
                <a href="#"><img src="/QLCuaHangNoiThat/image/instagram.png" alt="Instagram"></a>
            </div>
            <button class="follow-button">Thích 5,8K</button>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
