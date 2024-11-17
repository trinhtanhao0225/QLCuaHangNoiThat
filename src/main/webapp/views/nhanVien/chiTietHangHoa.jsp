<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<!-- JS -->
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
    <button class="nav-link active " onclick="location.href='chiTietHangHoa.jsp'" type="button" role="tab">Chi tiết hàng hoá</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link " onclick="location.href='thongTinKhachHang.jsp'" type="button" role="tab">Thông tin khách hàng</button>
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
                    <h4>Chi tiết sản phẩm hàng hoá</h4>
                    
                </div>
            </div>
			<div class="card">
    <div class="card-body">
        <div class="row">
            <!-- Cột 1: Mã sản phẩm -->
            <div class="col-lg-3 col-sm-6 col-12">
                <div class="form-group">
                    <label>Mã sản phẩm</label>
                    <input type="text" class="form-control">
                </div>
            </div>

            <!-- Cột 2: Tên sản phẩm -->
            <div class="col-lg-3 col-sm-6 col-12">
                <div class="form-group">
                    <label>Tên sản phẩm</label>
                    <input type="text" class="form-control">
                </div>
            </div>

            <!-- Cột 3: Giá -->
            <div class="col-lg-3 col-sm-6 col-12">
                <div class="form-group">
                    <label>Giá</label>
                    <input type="text" class="form-control">
                </div>
            </div>

            <!-- Cột 4: Giá thêm -->
            <div class="col-lg-3 col-sm-6 col-12">
                <div class="form-group">
                    <label>Màu sắc</label>
                    <input type="text" class="form-control">
                </div>
            </div>
            
            <!-- Cột 5: Giá thêm -->
            <div class="col-lg-3 col-sm-6 col-12">
                <div class="form-group">
                    <label>Số lượng</label>
                    <input type="text" class="form-control">
                </div>
            </div>
			<div class="col-lg-12">
                            <div class="form-group">
                                <label>Mô tả</label>
                                <textarea class="form-control"></textarea>
                            </div>
                        </div>
            <!-- Cột 6: Ảnh sản phẩm -->
            <div class="col-lg-12">
                <div class="form-group">
                    <label>Ảnh sản phẩm</label>
                    <div class="image-upload">
                        <input type="file" id="file-input" multiple onchange="previewImage(event)">
                    </div>
                    <div id="uploaded-images" style="margin-top: 15px; display: flex; flex-wrap: wrap; gap: 10px;">
                        <!-- Hiển thị các ảnh đã tải lên tại đây -->
                    </div>
                </div>
            </div>

            <!-- Cột 7: Nút Gửi và Hủy -->
            <div class="col-lg-12">
                <form action="" method="post">
                    <input type="hidden" name="action" value="addProduct">
                    <input type="submit" value="Gửi" class="btn btn-submit me-2">
                    <a href="productlist.jsp" class="btn btn-cancel">Hủy</a>
                </form>
            </div>
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