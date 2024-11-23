<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chi tiết sản phẩm</title>
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

        .product-detail {
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 30px;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .product-detail img {
            max-width: 400px;
            max-height: 300px;
            margin-right: 30px;
            border-radius: 8px;
        }

        .product-info {
            max-width: 500px;
        }

        .product-info h2 {
            font-size: 24px;
            margin-bottom: 20px;
        }

        .product-info p {
            font-size: 16px;
            margin: 10px 0;
        }

        .add-to-cart {
            display: block;
            margin: 20px auto;
            padding: 10px 20px;
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
        <a href="/QLCuaHangNoiThat/LoadSanPham" style="color: white; text-decoration: none;">Quay lại</a>
    </header>
    <div class="product-detail">
        <img src="/QLCuaHangNoiThat/image/${currentProduct.hinhAnh}" alt="${currentProduct.ten}">
        <div class="product-info">
            <h2>${currentProduct.ten}</h2>
            <p>Giá: ${currentProduct.gia}đ</p>
            <p>Màu sắc: ${currentProduct.mauSac}</p>
            <p>Số lượng: ${currentProduct.soLuong}</p>
            <p>Mô tả: ${currentProduct.moTa}</p>
            <form action="addToCart" method="post">
                <input type="hidden" name="id" value="${currentProduct.id}">
                <input type="hidden" name="ten" value="${currentProduct.ten}">
                <input type="hidden" name="hinhAnh" value="${currentProduct.hinhAnh}">
                <input type="hidden" name="gia" value="${currentProduct.gia}">
                <button type="submit" class="add-to-cart">Thêm vào giỏ hàng</button>
            </form>
        </div>
    </div>
    
   <h2>Sản phẩm liên quan</h2>
    <c:if test="${not empty relatedProducts}">
        <ul>
            <c:forEach var="product" items="${relatedProducts}">
                <li>
                    <a href="chiTietSanPham?id=${product.id}">
                        <img src="/QLCuaHangNoiThat/image/${product.hinhAnh}" alt="${product.ten}" style="width: 100px; height: 100px;">
                        <p>${product.ten} - ${product.gia} VND</p>
                    </a>
                </li>
            </c:forEach>
        </ul>
    </c:if>
    <c:if test="${empty relatedProducts}">
        <p>Không có sản phẩm liên quan.</p>
    </c:if>
</body>
</html>
