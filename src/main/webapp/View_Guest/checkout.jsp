<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="author" content="Untree.co">
  <link rel="shortcut icon" href="favicon.png">

  <meta name="description" content="" />
  <meta name="keywords" content="bootstrap, bootstrap4" />

		<!-- Bootstrap CSS -->
		<link href="../css/bootstrap.min.css" rel="stylesheet">
		<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
		<link href="../css/tiny-slider.css" rel="stylesheet">
		<link href="../css/style.css" rel="stylesheet">
		<link href="../css/checkout.css" rel="stylesheet">

	<title>Furni Free Bootstrap 5 Template for Furniture and Interior Design Websites by Untree.co </title>
	</head>

	<body>

		<c:import url="includes/header.jsp" />

		<!-- Start Hero Section -->
			<div class="hero">
				<div class="container">
					<div class="row justify-content-between">
						<div class="col-lg-5">
							<div class="intro-excerpt">
								<h1>Checkout</h1>
							</div>
						</div>
						<div class="col-lg-7">
							
						</div>
					</div>
				</div>
			</div>
		<!-- End Hero Section -->

		<div class="untree_co-section">
		    <div class="container">
		      <div class="row mb-5">
		        <div class="col-md-12">
		          <div class="border p-4 rounded" role="alert">
		            Returning customer? <a href="#">Click here</a> to login
		          </div>
		        </div>
		      </div>
		      <div class="row">
				
		        <div class="col-md-6 mb-5 ">
		          <h2 class="h3 mb-3 text-black">Thông tin cá nhân</h2>
		          <div class="p-3 p-lg-5 border bg-white">
		            <div class="form-group row">
		              <div class="col-md-6">
		                <label for="c_fname" class="text-black">Họ, tên đệm <span class="text-danger">*</span></label>
		                <input type="text" class="form-control" id="c_fname" name="c_fname">
		              </div>
		              <div class="col-md-6">
		                <label for="c_lname" class="text-black">Tên <span class="text-danger">*</span></label>
		                <input type="text" class="form-control" id="c_lname" name="c_lname">
		              </div>
		            </div>
		            <div class="form-group row">
		              <div class="col-md-12">
		                <label for="c_address" class="text-black">Địa chỉ <span class="text-danger">*</span></label>
		                <input type="text" class="form-control" id="c_address" name="c_address" placeholder="Địa chỉ nhà, phường">
		              </div>
		            </div>
					  <div class="form-group row">
						  <div class="col-md-12">
							  <label for="c_district" class="text-black">Quận/ Huyện <span class="text-danger">*</span></label>
							  <input type="text" class="form-control" id="c_district" name="c_district" placeholder="Quận/ Huyện">
						  </div>
					  </div>
					  <div class="form-group row mb-5">
					  	<div class="col-md-6">
		                	<label for="c_state_country" class="text-black">Tỉnh / Thành phố <span class="text-danger">*</span></label>
		                	<input type="text" class="form-control" id="c_state_country" name="c_state_country" placeholder="Tỉnh/ Thành Phố">
		              	</div>
						  <div class="col-md-6">
							  <label for="c_country" class="text-black">Quốc gia<span class="text-danger">*</span></label>
							  <input type="text" class="form-control" id="c_country" name="c_country" placeholder="Quốc gia">
						  </div>
					  </div>

		            <div class="form-group row mb-5">
		              <div class="col-md-6">
		                <label for="c_email_address" class="text-black">Địa chỉ Email <span class="text-danger">*</span></label>
		                <input type="text" class="form-control" id="c_email_address" name="c_email_address">
		              </div>
		              <div class="col-md-6">
		                <label for="c_phone" class="text-black">Số điện thoại <span class="text-danger">*</span></label>
		                <input type="text" class="form-control" id="c_phone" name="c_phone" placeholder="Phone Number">
		              </div>
		            </div>
		          </div>
		        </div>
		        <div class="col-md-6">
					<div class="row mb-5">
					  <div class="col-md-12">
						<h2 class="h3 mb-3 text-black">Đơn hàng</h2>
						<div class="p-3 p-lg-5 border bg-white">
							<table class="table site-block-order-table mb-5">
								<thead>
								<tr>
									<th>Hình ảnh</th>
									<th>Sản phẩm</th>
									<th>Số lượng</th>
									<th>Tổng tiền</th>
								</tr>
								</thead>
								<tbody>
								<tr>
									<td><img src="../images/product-1.png" alt="Top Up T-Shirt" class="img-order"></td>
									<td>Top Up T-Shirt</td>
									<td><input type="number" class="quantity" value="1" min="1" data-price="250.00" data-total="total-1" onchange="updateTotal()"></td>
									<td><span id="total-1">$250.00</span></td>
								</tr>
								<tr>
									<td><img src="../images/product-2.png" alt="Polo Shirt" class="img-order"></td>
									<td>Polo Shirt</td>
									<td><input type="number" class="quantity" value="1" min="1" data-price="100.00" data-total="total-2" onchange="updateTotal()"></td>
									<td><span id="total-2">$100.00</span></td>
								</tr>
								<tr>
									<td class="text-black font-weight-bold" colspan="3"><strong>Tổng tiền</strong></td>
									<td class="text-black"><span id="grand-total">$350.00</span></td>
								</tr>
								</tbody>
							</table>

							<h2 class="h3 mb-3 text-black" id="coupon-title">Mã giảm giá</h2>
							<select class="form-control w-100" id="c_code" aria-label="Coupon Code">
							  <option value="" disabled selected>Select Coupon Code</option>
							  <option value="DISCOUNT10">DISCOUNT10 - 10% Off</option>
							  <option value="FREESHIP">FREESHIP - Free Shipping</option>
							  <option value="SAVE20">SAVE20 - 20% Off</option>
							</select>

						  <!-- Thêm dòng tổng đơn hàng vào bảng -->
						  <div class="mt-3">
							<table class="table site-block-order-table mb-5">								
							  <tbody>
								  <tr>
									<td class="text-black font-weight-bold"><strong>Giảm giá</strong></td>
									<td class="text-black">$0</td>
								  </tr>
								  <tr>
									<td class="text-black font-weight-bold"><strong>Tổng thanh toán</strong></td>
									<td class="text-black" id = "amount">500000</td>
								  </tr>
							  </tbody>
							</table>
						  </div>
						  <!-- Kết thúc mã giảm giá -->

							<!-- Phương thức thanh toán -->
							<div class="border p-3 mb-3">
								<h3 class="h6 mb-0 payment">Phương thức thanh toán</h3>
								<div class="form-check">
									<input class="form-check-input" type="radio" name="paymentMethod" id="paymentBank" value="bank" checked>
									<label class="form-check-label payment" for="paymentBank">
										Thanh toán ngân hàng
									</label>
									<div class="collapse show" id="collapsebank">
										<div class="py-2">
											<p class="mb-0 payment content-payment">Chắn chắn rằng bạn sẽ chuyển đúng với số tiền của đơn hàng. Trong trường hợp số tiền của bạn lớn hoặc nhỏ hơn chúng tôi sẽ không chịu trách nhiệm.</p>
										</div>
									</div>
								</div>

								<div class="form-check">
									<input class="form-check-input" type="radio" name="paymentMethod" id="paymentCash" value="cash">
									<label class="form-check-label payment" for="paymentCash" >
										Thanh toán khi nhận hàng
									</label>
									<div class="collapse" id="collapsecash">
										<div class="py-2">
											<p class="mb-0 payment content-payment">Vui lòng thanh toán ngay khi bạn đã nhận được hàng. Nếu không chúng tôi sẽ cấm bạn khỏi hệ thống.</p>
										</div>
									</div>
								</div>
							</div>
							<!-- Modal thông báo -->
							<div id="paymentModal" class="modal">
								<div class="modal-content">
									<span class="close" onclick="closeModal()">&times;</span>
									<h2>Quét mã QR để thanh toán</h2>

									<!-- Bộ đếm thời gian -->
									<p id="timer" class="countdown">10:00</p>

									<!-- Mã QR của bạn sẽ được hiển thị ở đây -->
									<div id="qr-code-container">
										<img id="qr-code-img" src="" alt="QR Code" />
									</div>
								</div>
							</div>

							<div class="form-group">
							<button class="btn btn-black btn-lg py-3 btn-block" id="btn-payment" onclick="checkMethodPayment()">Thanh toán</button>
						  </div>
						</div>
					  </div>
					</div>
				  </div>											  
		      </div>
		      <!-- </form> -->
		    </div>
		  </div>

		<c:import url="includes/footer.jsp" />

		<script src="js/bootstrap.bundle.min.js"></script>
		<script src="js/tiny-slider.js"></script>
		<script src="js/custom.js"></script>
		<script src="js/PaymentMethod.js"></script>

	</body>

</html>
