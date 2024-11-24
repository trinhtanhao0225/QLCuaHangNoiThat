<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Đăng nhập</title>
</head>
<body>
    <h2>Đăng nhập</h2>
    <form action="LoginServlet" method="post">
        <label for="taikhoan">Tên đăng nhập:</label>
        <input type="text" id="taikhoan" name="taikhoan" required><br><br>
        <label for="matkhau">Mật khẩu:</label>
        <input type="password" id="matkhau" name="matkhau" required>
        <button type="submit">Đăng nhập</button>
    </form>
</body>
</html>
