<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập</title>
    <style>
        /* Tổng thể cho toàn trang */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('/QLCuaHangNoiThat/image/background.jpg'); /* Đường dẫn đến hình ảnh nền */
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            color: #333;
        }

        /* Container trung tâm */
        .login-container {
            max-width: 400px;
            margin: 100px auto;
            background-color: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        /* Tiêu đề */
        .login-container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #444;
        }

        /* Nhãn và ô nhập liệu */
        .login-container label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .login-container input {
		    width: 100%;
		    padding: 10px;
		    margin-bottom: 15px;
		    border: 1px solid #ccc;
		    border-radius: 5px;
		    font-size: 16px;
		    box-sizing: border-box; /* Đảm bảo mọi phần tử vừa đúng kích thước */
		}

		.login-container input:hover {
		    border-color: #007bff;
		    box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
		}


        /* Nút bấm */
        .login-container button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

       
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Đăng nhập</h2>
        <form action="LoginServlet" method="post">
            <label for="taikhoan">Tên đăng nhập:</label>
            <input type="text" id="taikhoan" name="taikhoan" required>
            <label for="matkhau">Mật khẩu:</label>
            <input type="password" id="matkhau" name="matkhau" required>
            <button type="submit">Đăng nhập</button>
        </form>
    </div>
</body>
</html>
