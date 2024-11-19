<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

<style>
.container {
  max-width: 1200px; /* Giới hạn chiều rộng của container */
  margin-left: 10px; /* Thêm một chút margin bên trái */
}

.table-responsive {
  margin: 0 auto; /* Căn giữa bảng */
}

.table {
  width: 80%; /* Điều chỉnh độ rộng của bảng */
}
</style>
</head>
<body>
<div class="container">
	<!-- Dashboard -->
	<div>
		<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
  <li class="nav-item" role="presentation">
    <button class="nav-link" onclick="location.href='danhSachSanPham.jsp'" type="button" role="tab">Danh sách sản phẩm</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link " onclick="location.href='chiTietHangHoa.jsp'" type="button" role="tab">Chi tiết hàng hoá</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link " onclick="location.href='thongTinKhachHang.jsp'" type="button" role="tab">Thông tin khách hàng</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link active" onclick="location.href='danhSachHoaDon.jsp'" type="button" role="tab">Danh sách hoá đơn</button>
  </li>
</ul>
	</div>
	<!-- Form chính -->
	<div>
		<div class="container mt-4">
        <h2 class="mb-4">Danh sách hóa đơn</h2>

        <!-- Bảng hóa đơn -->
        <table class="table table-bordered">
            <thead class="table-dark">
                <tr>
                    <th>Mã hóa đơn</th>
                    <th>Khách hàng</th>
                    <th>Ngày lập</th>
                    <th>Tổng tiền</th>
                    <th>Chi tiết</th>
                    <th>Xem thông tin khách hàng</th>
                </tr>
            </thead>
            <tbody>
                <!-- Duyệt qua danh sách hóa đơn -->
                <c:forEach var="invoice" items="${invoices}">
                    <tr>
                        <td>${invoice.id}</td>
                        <td>${invoice.customerName}</td>
                        <td>${invoice.date}</td>
                        <td>${invoice.totalAmount}</td>
                        <td>
                            <!-- Nút hiển thị chi tiết -->
                            <button class="btn btn-primary btn-sm" data-bs-toggle="collapse" data-bs-target="#items-${invoice.id}" aria-expanded="false">
                                Xem chi tiết
                            </button>
                        </td>
                        <td>
                            <a href="thongTinKhachHang.jsp?invoiceId=${invoice.id}" class="btn btn-primary btn-sm">
						        Xem chi tiết
						    </a>
                        </td>
                    </tr>

                    <!-- Chi tiết hàng hóa trong hóa đơn -->
                    <tr class="collapse" id="items-${invoice.id}">
                        <td colspan="5">
                            <div class="table-responsive">
                                <table class="table table-sm table-bordered">
                                    <thead class="table-secondary">
                                        <tr>
                                            <th>Mã hàng hóa</th>
                                            <th>Tên hàng hóa</th>
                                            <th>Số lượng</th>
                                            <th>Đơn giá</th>
                                            <th>Thành tiền</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <!-- Duyệt qua danh sách hàng hóa trong hóa đơn -->
                                        <c:forEach var="item" items="${invoice.items}">
                                            <tr>
                                                <td>${item.productCode}</td>
                                                <td>${item.productName}</td>
                                                <td>${item.quantity}</td>
                                                <td>${item.unitPrice}</td>
                                                <td>${item.totalPrice}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
  </div>
</div>
  <script>
    // Hàm toggle dòng phụ
    function toggleDropdown(row) {
      const dropdownRow = row.nextElementSibling; // Lấy dòng kế tiếp
      if (dropdownRow && dropdownRow.classList.contains('dropdown-row')) {
        // Ẩn/Hiện dòng dropdown
        if (dropdownRow.style.display === 'none' || dropdownRow.style.display === '') {
          dropdownRow.style.display = 'table-row'; // Hiển thị
        } else {
          dropdownRow.style.display = 'none'; // Ẩn
        }
      }
    }
  </script>


 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>  

</body>
</html>