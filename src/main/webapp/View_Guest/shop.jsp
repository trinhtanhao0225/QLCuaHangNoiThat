<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="author" content="Untree.co">
  <link rel="shortcut icon" href="favicon.png">

  <meta name="description" content="" />
  <meta name="keywords" content="bootstrap, bootstrap4" />

		<!-- Bootstrap CSS -->
		<link href="../css/bootstrap.min.css" rel="stylesheet">
		<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
		<link href="../css/tiny-slider.css" rel="stylesheet">
		<link href="../css/style.css" rel="stylesheet">
		<title>Furni Free Bootstrap 5 Template for Furniture and Interior Design Websites by Untree.co </title>
	</head>

	<body>

		<c:import url="includes/header.jsp" />

		<script>
			function toggleFilter() {
				const filterOptions = document.querySelector('.filter-options');
				filterOptions.style.display = filterOptions.style.display === 'block' ? 'none' : 'block';
			}
		</script>
		<!-- Start Hero Section -->
		

		<div class="hero">
			<div class="container">
				<div class="row justify-content-between position-relative">
					<div class="col-lg-5">
						<div class="intro-excerpt">
							<h1>Shop</h1><br>
							<div class="input-group mb-3">
								<input type="text" class="form-control" placeholder="Nhập từ khóa tìm kiếm...">
								<input type="button" class="btn btn-outline-primary ms-2" value="Tìm kiếm">
								<input type="button" class="btn btn-outline-secondary ms-2" value="Lọc" onclick="toggleFilter()">
							</div>
							<!-- Thanh tìm kiếm và nút lọc -->
							
						</div>
					</div>
					<div class="col-lg-7">
						

						<!-- Bảng bộ lọc sản phẩm nằm bên phải -->
						<div id="filter" class="filter-options mt-2 p-3 rounded">
							<h5>Bộ lọc sản phẩm</h5>
							<!-- Lọc theo giá -->
							<div class="row mb-3">
								<div class="col">
									<label for="priceMin" class="form-label">Giá từ</label>
									<input type="number" class="form-control" id="priceMin" placeholder="VNĐ">
								</div>
								<div class="col">
									<label for="priceMax" class="form-label">đến</label>
									<input type="number" class="form-control" id="priceMax" placeholder="VNĐ">
								</div>
							</div>

							<!-- Lọc theo loại sản phẩm -->
							<div class="mb-3">
								<label for="productType" class="form-label">Loại sản phẩm</label>
								<select class="form-select" id="productType">
									<option value="" selected>Chọn loại sản phẩm</option>
									<option value="electronics">Điện tử</option>
									<option value="fashion">Thời trang</option>
									<option value="beauty">Làm đẹp</option>
									<option value="home">Gia dụng</option>
								</select>
							</div>

							<!-- Lọc theo đánh giá sao -->
							<div class="mb-3">
								<label for="rating" class="form-label">Đánh giá</label>
								<select class="form-select" id="rating">
									<option value="" selected>Chọn đánh giá</option>
									<option value="5">5 sao</option>
									<option value="4">4 sao trở lên</option>
									<option value="3">3 sao trở lên</option>
									<option value="2">2 sao trở lên</option>
									<option value="1">1 sao trở lên</option>
								</select>
							</div>

							<!-- Nút áp dụng bộ lọc -->
							<button class="btn btn-primary w-100" type="button">Áp dụng bộ lọc</button>
						</div>
						<!-- Nội dung khác ở đây -->
					</div>
				</div>
			</div>
		</div>
		<!-- End Hero Section -->

		

		<div class="untree_co-section product-section before-footer-section">
		    <div class="container">
		      	<div class="row">
				
				<c:forEach var="furniture" items="${listFurnitures}">
					<div class="col-12 col-md-4 col-lg-3 mb-5">
						<a class="product-item" href="controller/LoadCategoryController?categoryId=${furniture.category.categoryID}">
							<img src="${furniture.furnitureImage}" class="img-fluid product-thumbnail">
							<h3 class="product-title">${furniture.furnitureName}</h3>
							<strong class="product-color">${furniture.furniture.Color}</strong>
							<strong class="product-price">${furniture.furniturePrice}</strong>

						     <a href="controller/AddFurToCartController?furnitureId=${furniture.furnitureID}& furnitureImage=${furniture.furnitureImage}&furniture=${furniture.furnitureName}&furnitureColor=${furniture.Color}&furniturePrice=${furniture.Price}" class="icon-cross">
					            <img src="images/cross.svg" class="img-fluid">
					        </a>
						</a>
					</div> 
				</c:forEach>
		      	</div>
		    </div>
		</div>

		<c:import url="includes/footer.jsp" />

		<script src="js/bootstrap.bundle.min.js"></script>
		<script src="js/tiny-slider.js"></script>
		<script src="js/custom.js"></script>
	</body>

</html>
