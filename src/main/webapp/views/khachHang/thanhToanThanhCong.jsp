<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thanh Toán Thành Công</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            text-align: center;
            padding: 50px;
        }

        .message {
            font-size: 24px;
            color: #4CAF50;
            margin-bottom: 20px;
        }

        .btn {
            background-color: black;
            color: white;
            padding: 10px 20px;
            text-align: center;
            border: none;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #444;
        }
    </style>
</head>
<body>
    <div class="message">
        <h2>Thanh toán thành công!</h2>
        <p>Cảm ơn bạn đã mua hàng tại cửa hàng của chúng tôi. Đơn hàng của bạn đã được xử lý thành công.</p>
    </div>
    <a href="shop.jsp">
        <button class="btn">Quay lại cửa hàng</button>
    </a>
</body>
</html>
