<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chi tiết sản phẩm</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    
    <link rel="stylesheet" href="/QLCuaHangNoiThat/css/style.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        header {
            background-color: #6c4b3d;
            padding: 15px;
            text-align: center;
            color: white;
        }
        header a {
		    display: inline-block;
		    padding: 10px 20px;
		    background-color: #6c4b3d; /* Màu nền */
		    color: white; /* Màu chữ */
		    font-size: 16px;
		    font-weight: bold;
		    text-decoration: none; /* Bỏ gạch chân */
		    border-radius: 5px; /* Bo tròn các góc */
		    transition: all 0.3s ease; /* Hiệu ứng chuyển đổi mượt */
		}
		
		header a:hover {
		    background-color: #5a3d32; /* Màu nền khi hover */
		    color: #f4f4f4; /* Màu chữ khi hover */
		    transform: scale(1.05); /* Phóng to nhẹ khi hover */
		    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Thêm bóng */
		}
        

        .product-detail {
            display: flex;
            justify-content: left;
            align-items: center;
            margin: 30px;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .product-detail img {
            width: 600px;
            height: 800px;
            margin-right: 30px;
            border-radius: 8px;
        }
		.product-info {
            margin-left :60px;
            margin-bottom: 380px;
        }

        .product-info h2 {
            font-size: 50px;
            margin-bottom: 50px;
        }

        .product-info p {
            font-size: 16px;
            margin: 10px 0;
        }

        .add-to-cart {
            display: block;
            padding: 15px 30px;
            background-color: #6c4b3d;
            color: white;
            text-align: center;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .add-to-cart:hover {
            background-color: #5a3d32;
        }
    </style>
</head>
<body>
	<header class="header">
	    <a href="/QLCuaHangNoiThat/LoadSanPham">Quay lại</a>
	</header>

    <div class="product-detail">
        <img src="/QLCuaHangNoiThat/image/${currentProduct.hinhAnh}" alt="${currentProduct.ten}" >
        <div class="product-info">
            <h2>${currentProduct.ten}</h2>
            <p><b style="font-size: 30px">Giá: ${currentProduct.gia}đ</b></p>
            <p>Màu sắc: ${currentProduct.mauSac}</p>
            <div class="d-flex align-items-center">
			    <button type="button" class="btn btn-outline-secondary btn-sm" onclick="decreaseQuantity()" style="margin-right: 10px;">
			        <i class="bi bi-dash"></i>
			    </button>
			
			    <span id="quantity" class="px-3 border border-secondary rounded">1</span>
			
			    <button type="button" class="btn btn-outline-secondary btn-sm" onclick="increaseQuantity()" style="margin-left: 10px;">
			        <i class="bi bi-plus"></i> <!-- Icon cộng -->
			    </button>
			</div>
            <p>Mô tả: ${currentProduct.moTa}</p>
            <form action="addToCart" method="post" onsubmit="updateQuantityField()">
                <input type="hidden" name="id" value="${currentProduct.id}">
                <input type="hidden" name="ten" value="${currentProduct.ten}">
                <input type="hidden" name="hinhAnh" value="${currentProduct.hinhAnh}">
                <input type="hidden" name="gia" value="${currentProduct.gia}">
                <input type="hidden" name="soLuong" value="${currentProduct.soLuong}">
                <input type="hidden" name="soLuongMua" id="quantityField" value="1">
                <button type="submit" class="add-to-cart">Thêm vào giỏ hàng</button>
            </form>
        </div>
    </div>
    
	 <h2 style="margin-left: 30px;">Sản phẩm liên quan về : ${currentProduct.danhMuc.ten}</h2>
	<c:choose>
	    <c:when test="${not empty relatedProducts}">
	        <ul>
	            <c:forEach var="product" items="${relatedProducts}">
	                <div style="display: inline-block; margin: 30px;">
	                    <li>
	                        <img src="/QLCuaHangNoiThat/image/${product.hinhAnh}" alt="${product.ten}" style="width: 330px; height: 400px;">
	                        <p>${product.ten} - ${product.gia} VND</p>
	                        <a href="chiTietSanPham?id=${product.id}">
	                            <button type="button" class="btn btn-dark">Xem Chi Tiết</button>
	                        </a>
	                    </li>
	                </div>
	            </c:forEach>
	        </ul>
	    </c:when>
	    <c:otherwise>
	        <p>Không có sản phẩm liên quan.</p>
	    </c:otherwise>
	</c:choose>
<script>
    // Lấy số lượng hiện tại từ phần tử HTML
    let quantity =  parseInt(document.getElementById('quantity').innerText);

    function increaseQuantity() {
        quantity++;
        document.getElementById('quantity').innerText = quantity;
    }

    function decreaseQuantity() {
        if (quantity > 1) { // Không cho giảm dưới 1
            quantity--;
            document.getElementById('quantity').innerText = quantity;
        }
    }    
    function updateQuantityField() {
        document.getElementById('quantityField').value = quantity;
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>  

</body>
</html>
