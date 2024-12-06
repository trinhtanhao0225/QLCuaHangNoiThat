<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Thời trang</title>
<link rel="stylesheet" href="/QLCuaHangNoiThat/css/style.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
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

.header {
	display: flex;
	justify-content: space-between;
	/* Chia đều khoảng cách giữa các phần */
	align-items: center; /* Canh giữa theo chiều dọc */
	padding: 10px 20px; /* Khoảng cách bên trong */
	background-color: #f8f8f8; /* Màu nền */
	border-bottom: 1px solid #ddd; /* Đường viền dưới */
}

/* Phong cách cho logo */
.logo {
	font-size: 24px;
	font-weight: bold;
	color: #333;
}

/* Container chứa thanh tìm kiếm */
.search-container {
	display: flex;
	align-items: center;
	flex-grow: 1; /* Mở rộng không gian để căn giữa thanh tìm kiếm */
	justify-content: center; /* Căn giữa thanh tìm kiếm */
}

/* Phong cách cho thanh tìm kiếm */
#search-box {
	display: flex;
	align-items: center;
	border: 1px solid #ddd;
	border-radius: 5px;
	padding: 5px;
	background-color: #fff;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

#search-box input {
	border: none;
	outline: none;
	padding: 5px 10px;
	font-size: 14px;
	max-width: 80%;
	/* Thanh tìm kiếm sẽ chiếm 80% chiều rộng của khung cha */
	min-width: 500px; /* Đảm bảo không nhỏ hơn 300px */
	border-radius: 5px 0 0 5px;
}

#search-box button {
	border: none;
	background-color: #007bff; /* Màu xanh dương */
	color: white;
	cursor: pointer;
	font-size: 16px;
	padding: 5px 15px;
	border-radius: 0 5px 5px 0; /* Làm tròn góc phải */
	transition: background-color 0.3s ease;
}

#search-box button:hover {
	background-color: #0056b3; /* Màu xanh đậm hơn khi hover */
}

/* Phong cách cho biểu tượng */
.icons {
	display: flex;
	align-items: center;
	position: relative;
}

.icon {
	margin-left: 15px; /* Khoảng cách giữa các biểu tượng */
	width: 24px;
	height: 24px;
	cursor: pointer;
}

/* Badge hiển thị số lượng sản phẩm trong giỏ hàng */
.cart-badge {
	background: red;
	color: white;
	font-size: 12px;
	padding: 2px 6px;
	border-radius: 50%;
	position: absolute;
	top: -5px;
	right: -5px;
}

/* Phong cách cho nút Đăng nhập */
.login-button-container {
	margin-left: 20px;
	/* Khoảng cách giữa nút Đăng nhập và các phần khác */
}

.login-button {
	padding: 8px 15px;
	font-size: 14px;
	color: white;
	background-color: #007bff; /* Màu xanh dương */
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.login-button:hover {
	background-color: #0056b3; /* Màu xanh đậm hơn khi hover */
}
</style>
</head>
<body>

	<!-- Header -->
	<header class="header">
		<div class="logo">CHANCOS</div>
		<div class="search-container">
			<form id="search-box" action="searchProduct" method="get">
				<input type="text" name="query" placeholder="Tìm kiếm sản phẩm...">
				<button type="submit">🔍</button>
			</form>
		</div>
		<div class="login-button-container">
			<a href="<%= request.getContextPath() %>/views/nhanVien/login.jsp">
				<button class="login-button">Đăng nhập</button>
			</a>
		</div>

		<div class="icons">
			<a href="/QLCuaHangNoiThat/views/khachHang/viewCart.jsp"> <img
				src="/QLCuaHangNoiThat/image/cart.png" alt="Giỏ hàng" class="icon">
				<span class="cart-badge"> ${sessionScope.cartSize != null ? sessionScope.cartSize : 0}
			</span>
			</a>
		</div>
	</header>

	<div class="product-container">

		<c:if test="${not empty listDNT}">
			<c:forEach var="product" items="${listDNT}">
				<div class="product">
					<img src="<c:url value='/image/${product.hinhAnh}'/>"
						alt="${product.ten}" style="width: 300px; height: 280px;">
					<h3>
						<b>${product.ten}</b>
					</h3>
					<div style="display: flex">
						<span><p>
								Giá :
								<fmt:formatNumber value="${product.gia}" type="currency"
									currencySymbol="đ" />
								|
							</p></span> <span><p>Màu sắc : ${product.mauSac}</p></span>
					</div>
					<a
						href="<%= request.getContextPath() %>/chiTietSanPham?id=${product.id}">
						<button type="button" class="btn btn-dark">Xem Chi Tiết</button>
					</a>
					<c:if test="${product.soLuong > 0}">
						<form action="<%= request.getContextPath() %>/addToCart"
							method="post">
							<input type="hidden" name="id" value="${product.id}"> <input
								type="hidden" name="ten" value="${product.ten}"> <input
								type="hidden" name="hinhAnh" value="${product.hinhAnh}">
							<input type="hidden" name="gia"
								value="<fmt:formatNumber value='${product.gia}' type='number' pattern='#.##' />">
							<input type="hidden" name="soLuong" value="${product.soLuong}">
							<input type="hidden" name="soLuongMua" value="1">

							<button type="submit" class="add-to-cart">Thêm vào giỏ
								hàng</button>
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
			<h4>3MEN</h4>
			<ul>
				<li><a href="#">Lâm Quang Hồ</a></li>
				<li><a href="#">Trịnh Tấn Hào</a></li>
				<li><a href="#">Tô Thành Hậu</a></li>

			</ul>
			<p>Email: info@3menshop.com</p>
			<p>Hotline: 0868.444.644</p>
		</div>
		<div class="footer-section">
			<h4>Hỗ Trợ Khách Hàng</h4>
			<ul>
				<li><a href="#">Thanh toán - Giao hàng</a></li>
				<li><a href="#">Chính sách bảo mật</a></li>
				<li><a href="#">Chính sách cookie</a></li>
			</ul>
		</div>
		<div class="footer-section">
			<h4>Địa chỉ Cửa Hàng</h4>
			<img src="/QLCuaHangNoiThat/image/footer-map.jpg"
				alt="Hệ thống cửa hàng" class="store-map"> <a href="#"
				class="map-link">Số 1 Võ Văn Ngân, Linh Chiểu, Thủ Đức, Thành
				Phố Hồ Chí Minh »</a>
		</div>
		<div class="footer-section">
			<h4>Kết Nối Với 3MEN</h4>
			<p>253K người theo dõi</p>
			<div class="social-icons">
				<a href="#"><img src="/QLCuaHangNoiThat/image/facebook.png"
					alt="Facebook"></a> <a href="#"><img
					src="/QLCuaHangNoiThat/image/youtube.png" alt="YouTube"></a> <a
					href="#"><img src="/QLCuaHangNoiThat/image/instagram.png"
					alt="Instagram"></a>
			</div>
			<button class="follow-button">Thích 5,8K</button>
		</div>
	</footer>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>
