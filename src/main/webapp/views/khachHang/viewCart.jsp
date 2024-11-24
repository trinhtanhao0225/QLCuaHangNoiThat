<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Giỏ Hàng</title>
<style>
    body { font-family: Arial, sans-serif; }
    h1 { text-align: center; margin-bottom: 20px; }
    table { width: 80%; margin: 0 auto; border-collapse: collapse; }
    th, td { padding: 10px; text-align: center; border: 1px solid #ddd; }
    th { background-color: #f4f4f4; }
    img { max-width: 100px; height: auto; }
    .empty-cart { text-align: center; margin-top: 50px; }
    .btn { padding: 10px 20px; background-color: #6c4b3d; color: white; border: none; border-radius: 5px; text-decoration: none; cursor: pointer; }
    .btn:hover { background-color: #5a3d32; }
    .total { margin-top: 20px; text-align: right; width: 80%; margin: 20px auto; font-size: 1.2em; }
</style>
</head>
<body>
    <h1>Giỏ hàng của bạn</h1>

    <!-- Kiểm tra nếu giỏ hàng trống -->
    <c:if test="${empty sessionScope.cart}">
        <div class="empty-cart">
            <p>Giỏ hàng trống</p>
            <a href="/QLCuaHangNoiThat/views/khachHang/shop.jsp" class="btn">Tiếp tục mua sắm</a>
        </div>
    </c:if>

    <!-- Hiển thị giỏ hàng nếu không trống -->
    <c:if test="${not empty sessionScope.cart}">
        <c:set var="tongTien" value="0" />
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
                <c:forEach var="item" items="${sessionScope.cart}">
                    <tr>
                        <td><img src="/QLCuaHangNoiThat/image/${item.hinhAnh}" alt="${item.ten}"></td>
                        <td>${item.ten}</td>
                        <td><fmt:formatNumber value="${item.gia}" type="currency" currencySymbol="đ" /></td>
                        <td>${item.soLuong}</td>
                        <td><fmt:formatNumber value="${item.gia * item.soLuong}" type="currency" currencySymbol="đ" /></td>
                    </tr>
                    <c:set var="tongTien" value="${tongTien + (item.gia * item.soLuong)}" />
                </c:forEach>
            </tbody>
        </table>

        <!-- Hiển thị tổng tiền -->
        <div class="total">
            <p><strong>Tổng tiền:</strong> 
                <fmt:formatNumber value="${tongTien}" type="currency" currencySymbol="đ" />
            </p>
        </div>

        <div style="text-align: center; margin-top: 20px;">
            <a href="/QLCuaHangNoiThat/views/khachHang/shop.jsp" class="btn">Tiếp tục mua sắm</a>
            <form action="/QLCuaHangNoiThat/views/khachHang/thongTinDatHang.jsp" method="post" style="display: inline;">
                <input type="hidden" name="tongTien" value="${tongTien}" />
                <button type="submit" class="btn">Mua</button>
            </form>
        </div>
    </c:if>
</body>
</html>
