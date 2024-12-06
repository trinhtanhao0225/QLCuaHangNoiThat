<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách Hóa Đơn</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<style>
.container {
	max-width: 1200px;
	margin-left: 10px;
}

.table-responsive {
	margin: 0 auto;
}

.table {
	width: 100%;
}

th {
	cursor: pointer;
}

th:hover {
	background-color: #e2e2e2;
}

th.sorted-asc::after {
	content: " ↑";
}

th.sorted-desc::after {
	content: " ↓";
}

.collapse {
	display: none; /* Ẩn mặc định */
	transition: max-height 0.5s ease-out;
	max-height: 0;
}

.collapse.show {
	display: table-row;
}
</style>
</head>
<body>
	<div class="container">
		<div>
			<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
				<li class="nav-item" role="presentation">
					<form action="<%= request.getContextPath() %>/LoadKhoHang"
						method="get" style="display: inline;">
						<button class="nav-link" type="submit" role="tab">Danh
							sách sản phẩm</button>
					</form>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link "
						onclick="location.href='/QLCuaHangNoiThat/views/nhanVien/chiTietHangHoa.jsp'"
						type="button" role="tab">Chi tiết hàng hoá</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link "
						onclick="location.href='/QLCuaHangNoiThat/views/nhanVien/thongTinKhachHang.jsp'"
						type="button" role="tab">Thông tin khách hàng</button>
				</li>
				<li class="nav-item" role="presentation">
					<form action="<%= request.getContextPath() %>/LoadLSMuaHang"
						method="get" style="display: inline;">
						<button class="nav-link active" type="submit" role="tab">Danh
							sách hoá đơn</button>
					</form>
				</li>
				<li class="nav-item" role="presentation">
					<form action="<%= request.getContextPath() %>/LoadSanPham"
						method="get" style="display: inline;">
						<button class="nav-link " type="submit" role="tab">Trang
							chủ</button>
					</form>
				</li>
			</ul>
		</div>

		<div class="container mt-4">
			<h2 class="text-center mb-4">Danh sách hóa đơn</h2>

			<div class="card">
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-hover table-striped">
							<thead class="table-dark text-center">
								<tr>
									<th>Mã hóa đơn</th>
									<th>Tổng tiền</th>
									<th>Căn cước công dân</th>
									<th>Họ tên khách hàng</th>
									<th>Ngày đặt</th>
									<th>Chi tiết hóa đơn</th>
									<th>Xem thông tin khách hàng</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="hoaDon" items="${listHoaDon}">
									<tr>
										<td>${hoaDon.id}</td>
										<td><fmt:formatNumber value="${hoaDon.tongTien}"
												type="number" pattern="#,###" /></td>
										<td>${hoaDon.cccd}</td>
										<td>${hoaDon.ten}</td>
										<td>${hoaDon.thoiGianDatHang}</td>
										<td class="text-center">
											<!-- Nút hiển thị chi tiết -->
											<button class="btn btn-info btn-sm"
												onclick="toggleDropdown('items-${hoaDon.id}', '${hoaDon.id}'); location.href='/QLCuaHangNoiThat/LoadChiTietHD?idHD=${hoaDon.id}'"">
												Chi tiết</button>
										</td>

										<td class="text-center"><a
											href="/QLCuaHangNoiThat/LoadTTKhachHang?cccd=${hoaDon.cccd}"
											class="btn btn-success btn-sm">Xem thông tin</a></td>
									</tr>
									<tr class="collapse bg-light text-center"
										id="items-${hoaDon.id}">
										<td colspan="7">
											<div class="card">
												<div class="card-header text-center bg-secondary text-white">
													<strong>Chi tiết hóa đơn: ${hoaDon.id}</strong>
												</div>
												<div class="card-body">
													<div class="table-responsive">
														<table class="table table-sm table-bordered align-middle">
															<thead class="table-dark">
																<tr>
																	<th class="text-center">ID đồ nội thất</th>
																	<th class="text-center">Số lượng</th>
																	<th class="text-center">Giá</th>
																</tr>
															</thead>
															<tbody>
																<c:forEach var="cthd" items="${listCTHD}">
																	<c:if test="${cthd.id eq hoaDon.id}">
																		<tr>
																			<td>${cthd.idDoNoiThat}</td>
																			<td>${cthd.soLuong}</td>
																			<td>${cthd.gia}</td>
																		</tr>
																	</c:if>
																</c:forEach>
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
// Hàm toggle dòng phụ
// Hàm toggle dòng phụ
function toggleDropdown(id, hoaDonId) {
    const dropdownRow = document.getElementById(id);

    // Toggle trạng thái dropdown được chọn
    dropdownRow.classList.toggle('show');

    // Lưu trạng thái vào sessionStorage (hoặc localStorage)
    const isVisible = dropdownRow.classList.contains('show');
    sessionStorage.setItem(id, isVisible);

    window.location.href = `/QLCuaHangNoiThat/LoadChiTietHD?idHD=${hoaDonId}`;
}

// Khi tải trang, kiểm tra trạng thái lưu trong sessionStorage
window.onload = function() {
    const items = document.querySelectorAll('.collapse');
    items.forEach(function(item) {
        const id = item.id;
        const isVisible = sessionStorage.getItem(id) === 'true';
        if (isVisible) {
            item.classList.add('show');
        }
    });
};
window.onload = function() {
    const items = document.querySelectorAll('.collapse');
    items.forEach(function(item) {
        const id = item.id;
        const isVisible = sessionStorage.getItem(id) === 'true'; // Kiểm tra nếu trạng thái là 'true'
        if (isVisible) {
            item.classList.add('show'); // Thêm class show nếu đã lưu trạng thái là hiển thị
        }
    });
};

</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>
