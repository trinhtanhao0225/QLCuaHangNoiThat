<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Order Information</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
}

.container {
	width: 80%;
	margin: auto;
	padding: 20px;
}

h2 {
	text-align: center;
	margin-bottom: 20px;
}

.form-section {
	display: flex;
	gap: 20px;
}

.form-section .billing-details, .form-section .order-summary {
	flex: 1;
	padding: 20px;
	border: 1px solid #ccc;
}

.form-section .order-summary {
	flex: 0.8;
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

.bank-options img {
	width: 50px;
	height: auto;
	margin: 5px;
}
</style>
<script>
	// Hàm kiểm tra các trường dữ liệu
	function validateForm() {
		const cccd = document.getElementById('cccd').value.trim();
		const name = document.getElementById('name').value.trim();
		const dob = document.getElementById('dob').value.trim();
		const email = document.getElementById('email').value.trim();
		const phone = document.getElementById('phone').value.trim();
		const address = document.getElementById('address').value.trim();

		if (!cccd || !name || !dob || !email || !phone || !address) {
			alert('Vui lòng điền đầy đủ thông tin vào tất cả các trường!');
			return false;
		}

		return true; // Form hợp lệ
	}

	// Hàm xử lý thanh toán
	function processPayment() {
		if (validateForm()) {
			document.getElementById("orderForm").submit(); // Gửi form nếu hợp lệ
		} else {
			return false; // Nếu không hợp lệ, không làm gì cả
		}
	}
</script>
</head>
<body>
	<div class="container">
		<h2>THÔNG TIN ĐẶT HÀNG</h2>
		<div class="form-section">
			<!-- Billing Details -->
			<div class="billing-details">
				<h3>Thông Tin Khách Hàng</h3>
				<!-- Form Input -->
				<form id="orderForm" action="/QLCuaHangNoiThat/submitOrder"
					method="post" onsubmit="return processPayment()">
					<label for="cccd">CCCD *</label> <input type="text" id="cccd"
						name="cccd" placeholder="Nhập số CCCD" required> <label
						for="name">Họ và Tên *</label> <input type="text" id="name"
						name="name" placeholder="Nhập họ và tên" required> <label
						for="dob">Ngày Sinh *</label> <input type="date" id="dob"
						name="dob" required> <label for="email">Email *</label> <input
						type="email" id="email" name="email"
						placeholder="example@domain.com" required> <label
						for="phone">Số Điện Thoại *</label> <input type="text" id="phone"
						name="phone" placeholder="Nhập số điện thoại" required> <label
						for="address">Địa Chỉ *</label>
					<textarea id="address" name="address" rows="3"
						placeholder="Nhập địa chỉ cụ thể (số nhà, đường, phường/xã, quận/huyện, tỉnh/thành phố)"
						required></textarea>

					<label for="orderTime">Thời Gian Đặt Hàng *</label> <input
						type="text" id="orderTime" name="orderTime"
						value="<%=new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date())%>"
						readonly>


					<!-- Hidden fields for order details -->
					<input type="hidden" id="product1Price" name="product1Price"
						value="5999000"> <input type="hidden" id="product2Price"
						name="product2Price" value="8499000"> <input type="hidden"
						id="quantity1" name="quantity1" value="1"> <input
						type="hidden" id="quantity2" name="quantity2" value="1">


				</form>

			</div>

			<!-- Order Summary -->
			<div class="order-summary">
				<h3>Chi Tiết Đơn Hàng</h3>
				<table>
					<tr>
						<th>Sản Phẩm</th>
						<th>Số Lượng</th>
						<th>Tổng</th>
					</tr>
					<tr>
						<td>Wooden Dining Table</td>
						<td>1</td>
						<td>5.999.000 đ</td>
					</tr>
					<tr>
						<td>Modern Sofa Set</td>
						<td>1</td>
						<td>8.499.000 đ</td>
					</tr>
					<tr>
						<td class="total">Tổng Cộng</td>
						<td class="total"></td>
						<td class="total">14.498.000 đ</td>
					</tr>
				</table>
				<button type="button" class="btn" onclick="return processPayment()">Thanh
					toán</button>
			</div>
		</div>
	</div>
</body>
</html>
