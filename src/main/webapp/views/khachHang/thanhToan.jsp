<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Summary - Furniture Store</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        h1, h2, h3 {
            text-align: center;
        }
        .container {
            width: 80%;
            margin: 0 auto;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
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
            max-width: 50px;
            height: auto;
        }
        .total {
            text-align: right;
            margin-top: 20px;
        }
        .btn {
            display: block;
            margin: 20px auto;
            padding: 10px 20px;
            background-color: #6c4b3d;
            color: white;
            text-decoration: none;
            text-align: center;
            border-radius: 5px;
        }
        .btn:hover {
            background-color: #5a3d32;
        }
    </style>
</head>
<body>
    <h1>Order Summary</h1>
    <div class="container">
        <!-- Kiểm tra giỏ hàng -->
        <c:if test="${not empty sessionScope.cart}">
            <h2>Products in Your Cart</h2>
            <table>
                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Subtotal</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Hiển thị từng sản phẩm -->
                    <c:set var="tongTien" value="0" />
                    <c:forEach var="item" items="${sessionScope.cart}">
                        <tr>
                            <td>
                                <img src="/QLCuaHangNoiThat/image/${item.hinhAnh}" 
                                     alt="${item.ten}">
                                <br>${item.ten}
                            </td>
                            <td>
                                <fmt:formatNumber value="${item.gia}" type="currency" currencySymbol="đ" />
                            </td>
                            <td>${item.soLuong}</td>
                            <td>
                                <fmt:formatNumber value="${item.gia * item.soLuong}" type="currency" currencySymbol="đ" />
                            </td>
                        </tr>
                        <!-- Tính tổng tiền -->
                        <c:set var="tongTien" value="${tongTien + (item.gia * item.soLuong)}" />
                    </c:forEach>
                </tbody>
            </table>

            <!-- Hiển thị tổng tiền -->
            <div class="total">
                <h3>Total Amount:</h3>
                <p>
                    <fmt:formatNumber value="${tongTien}" type="currency" currencySymbol="đ" />
                </p>
            </div>

            <!-- Form xác nhận thanh toán -->
            <form action="submitOrder.jsp" method="post">
                <button class="btn" type="submit">Thanh toán</button>
            </form>
        </c:if>

        <!-- Thông báo nếu giỏ hàng rỗng -->
        <c:if test="${empty sessionScope.cart}">
            <h2>Your cart is empty</h2>
            <a href="/QLCuaHangNoiThat/views/khachHang/shop.jsp" class="btn">Back to Shop</a>
        </c:if>
    </div>
</body>
</html>
