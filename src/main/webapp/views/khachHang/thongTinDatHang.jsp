<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thông Tin Đặt Hàng</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }

        .container {
            width: 80%;
            margin: auto;
            padding: 20px;
            background: white;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .form-section {
            display: flex;
            gap: 20px;
            margin-top: 20px;
        }

        .form-section .billing-details, .form-section .order-summary {
            flex: 1;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background: #fff;
        }

        label {
            font-weight: bold;
            margin-top: 10px;
            display: block;
        }

        input, select, textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        textarea {
            resize: none;
        }

        .order-summary table {
            width: 100%;
            border-collapse: collapse;
        }

        .order-summary table th, .order-summary table td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .order-summary .total {
            font-weight: bold;
            font-size: 16px;
        }

        .btn {
            background-color: black;
            color: white;
            padding: 10px 20px;
            text-align: center;
            display: block;
            width: 100%;
            border: none;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #444;
        }
    </style>
    <script>
        // Kiểm tra dữ liệu form trước khi thanh toán
        function validateForm() {
            const fields = ['cccd', 'name', 'dob', 'email', 'phone', 'address'];
            let valid = true;

            fields.forEach(id => {
                const field = document.getElementById(id);
                if (!field.value.trim()) {
                    alert(`Vui lòng điền thông tin: ${field.name}`);
                    valid = false;
                    return;
                }
            });

            return valid;
        }

        function processPayment() {
            if (validateForm()) {
                document.getElementById("orderForm").submit();
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <h2>Thông Tin Đặt Hàng</h2>
        <div class="form-section">
            <!-- Thông tin khách hàng -->
            <div class="billing-details">
                <h3>Thông Tin Khách Hàng</h3>
                <form id="orderForm" action="/QLCuaHangNoiThat/submitOrder" method="post">
                    <label for="cccd">CCCD *</label>
                    <input type="text" id="cccd" name="cccd" placeholder="Nhập số CCCD" required>

                    <label for="name">Họ và Tên *</label>
                    <input type="text" id="name" name="name" placeholder="Nhập họ và tên" required>

                    <label for="dob">Ngày Sinh *</label>
                    <input type="date" id="dob" name="dob" required>

                    <label for="email">Email *</label>
                    <input type="email" id="email" name="email" placeholder="example@domain.com" required>

                    <label for="phone">Số Điện Thoại *</label>
                    <input type="text" id="phone" name="phone" placeholder="Nhập số điện thoại" required>

                    <label for="address">Địa Chỉ *</label>
                    <textarea id="address" name="address" rows="3" placeholder="Nhập địa chỉ cụ thể (số nhà, đường, phường/xã, quận/huyện, tỉnh/thành phố)" required></textarea>

                    <label for="orderTime">Thời Gian Đặt Hàng *</label>
                    <input type="text" id="orderTime" name="orderTime"
                           value="<%=new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date())%>" readonly>
                </form>
            </div>

            <!-- Tóm tắt đơn hàng -->
            <div class="order-summary">
                <h3>Chi Tiết Đơn Hàng</h3>
                <table>
                    <thead>
                        <tr>
                            <th>Sản phẩm</th>
                            <th>Số lượng</th>
                            <th>Thành tiền</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:set var="tongTien" value="0" />
                        <c:forEach var="item" items="${sessionScope.cart}">
                            <tr>
                                <td>${item.ten}</td>
                                <td>${item.soLuong}</td>
                                <td><fmt:formatNumber value="${item.gia * item.soLuong}" type="currency" currencySymbol="đ" /></td>
                            </tr>
                            <c:set var="tongTien" value="${tongTien + (item.gia * item.soLuong)}" />
                        </c:forEach>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="2" style="text-align: right;"><strong>Tổng cộng:</strong></td>
                            <td><fmt:formatNumber value="${tongTien}" type="currency" currencySymbol="đ" /></td>
                        </tr>
                    </tfoot>
                </table>
                <button type="button" class="btn" onclick="processPayment()">Thanh toán</button>
            </div>
        </div>
    </div>
</body>
</html>
