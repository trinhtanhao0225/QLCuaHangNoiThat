<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Giỏ hàng</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        h1 {
            text-align: center;
            margin-bottom: 20px;
        }
        table {
            width: 80%;
            margin: 0 auto;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ddd;
        }
        th {
            background-color: #f4f4f4;
        }
        img {
            max-width: 100px;
            height: auto;
        }
        .empty-cart {
            text-align: center;
            margin-top: 50px;
        }
        .btn-back {
            display: block;
            margin: 20px auto;
            text-align: center;
            background-color: #6c4b3d;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            width: 150px;
        }
        .btn-back:hover {
            background-color: #5a3d32;
        }
    </style>
</head>
<body>
    <h1>Giỏ hàng của bạn</h1>

    <!-- Kiểm tra nếu giỏ hàng trống -->
    <c:if test="${empty cart}">
        <div class="empty-cart">
            <p>Giỏ hàng trống</p>
            <a href="/QLCuaHangNoiThat/views/khachHang/shop.jsp" class="btn-back">Tiếp tục mua sắm</a>
        </div>
    </c:if>

    <!-- Hiển thị giỏ hàng nếu không trống -->
    <c:if test="${not empty cart}">
        <table>
            <thead>
                <tr>
                    <th>Hình ảnh</th>
                    <th>Sản phẩm</th>
                    <th>Giá</th>
                    <th>Số lượng</th>
                    <th>Thành tiền</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${cart}">
                    <tr>
                        <td>
                            <img src="/QLCuaHangNoiThat/image/${item.hinhAnh}" alt="${item.ten}">
                        </td>
                        <td>${item.ten}</td>
                        <td>
                            <fmt:formatNumber value="${item.gia}" type="currency" currencySymbol="đ" />
                        </td>
                        <td>${item.soLuong}</td>
                        <td>
                            <fmt:formatNumber value="${item.gia * item.soLuong}" type="currency" currencySymbol="đ" />
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div style="text-align: center; margin-top: 20px;">
            <a href="/QLCuaHangNoiThat/views/khachHang/shop.jsp" class="btn-back">Tiếp tục mua sắm</a>
        </div>
    </c:if>
</body>
</html>
