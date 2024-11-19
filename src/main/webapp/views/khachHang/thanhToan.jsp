<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Checkout - Furniture Store</title>
<style>
body {
	font-family: Arial, sans-serif;
}

.cart-container {
	display: flex;
	margin: 20px;
}

.cart-items, .cart-summary {
	padding: 20px;
	border: 1px solid #ccc;
}

.cart-items {
	flex: 3;
}

.cart-summary {
	flex: 1;
	margin-left: 20px;
}

.cart-items table {
	width: 100%;
	border-collapse: collapse;
}

.cart-items table th, .cart-items table td {
	text-align: left;
	padding: 10px;
	border-bottom: 1px solid #ddd;
}

.cart-items table th {
	background-color: #f4f4f4;
}

.cart-summary h3 {
	margin-bottom: 20px;
}

.cart-summary .total, .cart-summary .subtotal {
	font-size: 18px;
	margin-bottom: 10px;
}

.cart-summary button {
	width: 100%;
	padding: 10px;
	background-color: black;
	color: white;
	border: none;
	cursor: pointer;
}

.cart-summary button:hover {
	background-color: #444;
}
</style>
</head>
<body>
	<div class="cart-container">
		<!-- Cart Items Section -->
		<div class="cart-items">
			<h2>Shopping Cart</h2>
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
					<tr>
						<td><img src="images/dining_table.jpg"
							alt="Wooden Dining Table" style="width: 50px; height: 50px;">
							Wooden Dining Table</td>
						<td>5,999,000 đ</td>
						<td>
							<form action="updateCart" method="post">
								<input type="hidden" name="productId" value="1" /> <input
									type="number" name="quantity" value="1" min="1" />
								<button type="submit">Update</button>
							</form>
						</td>
						<td>5,999,000 đ</td>
					</tr>
					<tr>
						<td><img src="images/sofa_set.jpg" alt="Modern Sofa Set"
							style="width: 50px; height: 50px;"> Modern Sofa Set</td>
						<td>8,499,000 đ</td>
						<td>
							<form action="updateCart" method="post">
								<input type="hidden" name="productId" value="2" /> <input
									type="number" name="quantity" value="1" min="1" />
								<button type="submit">Update</button>
							</form>
						</td>
						<td>8,499,000 đ</td>
					</tr>
					<tr>
						<td><img src="images/wardrobe.jpg" alt="Large Wardrobe"
							style="width: 50px; height: 50px;"> Large Wardrobe</td>
						<td>12,999,000 đ</td>
						<td>
							<form action="updateCart" method="post">
								<input type="hidden" name="productId" value="3" /> <input
									type="number" name="quantity" value="1" min="1" />
								<button type="submit">Update</button>
							</form>
						</td>
						<td>12,999,000 đ</td>
					</tr>
				</tbody>
			</table>
			<a href="continueShopping.jsp">← Continue Shopping</a>
		</div>

		<!-- Cart Summary Section -->
		<div class="cart-summary">
			<h3>Cart Totals</h3>
			<p class="subtotal">Subtotal: 27,497,000 đ</p>
			<p class="total">Total: 27,497,000 đ</p>
			<form action="thongTinDatHang.jsp" method="get">
				<button type="submit">Thanh toán</button>
			</form>
		</div>
	</div>
</body>
</html>
