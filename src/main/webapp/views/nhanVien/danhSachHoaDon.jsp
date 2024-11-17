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
		
           <div class="table-responsive">
    <table class="table datanew">
      <thead>
        <tr>
          <th>Mã sản phẩm</th>
          <th>Tên sản phẩm</th>
          <th>Giá</th>
          <th>Màu sắc</th>
          <th>Số lượng</th>
        </tr>
      </thead>
      <tbody>
        <tr onclick="toggleDropdown(this)">
          <td>PT001</td>
          <td>Macbook Pro</td>
          <td>1500.00</td>
          <td>Đỏ</td>
          <td>15</td>
        </tr>
        <tr class="dropdown-row" style="display: none;">
          <td colspan="5">
            <select class="form-select">
              <option value="1">Option 1</option>
              <option value="2">Option 2</option>
              <option value="3">Option 3</option>
            </select>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</div>


Share


You said:
	<div>
		
          <div class="table-responsive">
            <table class="table datanew">
              <thead>
              <tr>
                <th>Mã sản phẩm</th>
                <th>Tên sản phẩm</th>
                <th>Giá</th>
                <th>Màu sắc</th>
                <th>Số lượng</th>
              </tr>
              </thead>
              <tbody>
        		<tr onclick="window.location.href='chiTietHangHoa.jsp'">
              	<td>PT001</td>
                <td>Macbook pro</td>
                <td>1500.00</td>
                <td>Đỏ</td>
                <td>15</td>
              </tr>
              </tbody>
            </table>
          </div>
	</div>
</div>  làm sao để tạo 1 combobox khi click vào thì dữ liệu đổ xuống ngay trên mỗi dòng table

<div>
  <div class="table-responsive">
    <table class="table datanew">
      <thead>
        <tr>
          <th>Mã sản phẩm</th>
          <th>Tên sản phẩm</th>
          <th>Giá</th>
          <th>Màu sắc</th>
          <th>Số lượng</th>
        </tr>
      </thead>
      <tbody>
        <tr onclick="toggleDropdown(this)">
          <td>PT001</td>
          <td>Macbook Pro</td>
          <td>1500.00</td>
          <td>Đỏ</td>
          <td>15</td>
        </tr>
        <tr class="dropdown-row" style="display: none;">
          <td colspan="5">
            <select class="form-select">
              <option value="1">Option 1</option>
              <option value="2">Option 2</option>
              <option value="3">Option 3</option>
            </select>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</div>

<script>
  function toggleDropdown(row) {
    // Tìm dòng kế tiếp (dropdown-row)
    const dropdownRow = row.nextElementSibling;
    if (dropdownRow && dropdownRow.classList.contains('dropdown-row')) {
      // Toggle hiển thị
      dropdownRow.style.display = dropdownRow.style.display === 'none' ? 'table-row' : 'none';
    }
  }
</script>

 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>  

</body>
</html>