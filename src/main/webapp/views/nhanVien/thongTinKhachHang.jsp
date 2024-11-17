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

</style>
</head>

<body>
<div class="container">
	<!-- Dashboard -->
	<div>
		<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
  <li class="nav-item" role="presentation">
    <button class="nav-link " onclick="location.href='danhSachSanPham.jsp'" type="button" role="tab">Danh sách sản phẩm</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link " onclick="location.href='chiTietHangHoa.jsp'" type="button" role="tab">Chi tiết hàng hoá</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link active" onclick="location.href='thongTinKhachHang.jsp'" type="button" role="tab">Thông tin khách hàng</button>
  </li>
      <li class="nav-item" role="presentation">
    <button class="nav-link" onclick="location.href='danhSachHoaDon.jsp'" type="button" role="tab">Danh sách hoá đơn</button>
  </li>
</ul>
	</div>
	<!-- Form chính -->
		<div>
		    <div class="page-wrapper">
        <div class="content">
            <div class="page-header">
                <div class="page-title">
                    <h4>Thông tin khách hàng</h4>
                    
                </div>
            </div>
			<div class="card">
    <div class="card-body">
        <div class="row">
            <!-- Cột 1: Mã sản phẩm -->
            <div class="col-lg-3 col-sm-6 col-12">
                <div class="form-group">
                    <label>Căn cước công dân</label>
                    <input type="text" class="form-control" readonly>
                </div>
            </div>

            <!-- Cột 2: Tên sản phẩm -->
            <div class="col-lg-3 col-sm-6 col-12">
                <div class="form-group">
                    <label>Tên khách hàng</label>
                    <input type="text" class="form-control" readonly>
                </div>
            </div>

            <!-- Cột 3: Giá -->
            <div class="col-lg-3 col-sm-6 col-12">
                <div class="form-group">
                    <label>Ngày sinh</label>
                    <input type="text" class="form-control" readonly>
                </div>
            </div>

            <!-- Cột 4: Giá thêm -->
            <div class="col-lg-3 col-sm-6 col-12">
                <div class="form-group">
                    <label>Email</label>
                    <input type="text" class="form-control" readonly>
                </div>
            </div>
            
            <!-- Cột 5: Giá thêm -->
            <div class="col-lg-3 col-sm-6 col-12">
                <div class="form-group">
                    <label>Số điện thoại</label>
                    <input type="text" class="form-control" readonly>
                </div>
            </div>
			<div class="col-lg-12">
                 <div class="form-group">
                     <label>Địa chỉ</label>
                     <textarea class="form-control" readonly></textarea>
                 </div>
             </div>

            <!-- Cột 7: Nút Gửi và Hủy -->

        </div>
    </div>
</div>
			
           
            </div>
        </div>
    </div>
	</div>
</div>



 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>  

</body>
</html>