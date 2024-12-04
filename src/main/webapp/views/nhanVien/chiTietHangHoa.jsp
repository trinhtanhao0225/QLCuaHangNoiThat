<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <!-- CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        .container {
            max-width: 1200px;
            margin-left: 10px;
        }
    </style>
</head>
<body>
<%
    // Lấy các tham số từ URL
    String id = request.getParameter("id");
    String ten = request.getParameter("ten");
    String gia = request.getParameter("gia");
    String mauSac = request.getParameter("mauSac");
    String soLuong = request.getParameter("soLuong");
    String moTa = request.getParameter("moTa");
    String hinhAnh = request.getParameter("hinhAnh");
    String idDanhMuc =request.getParameter("idDanhMuc");
%>

<div class="container">
    <div>
		<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
		<li class="nav-item" role="presentation">
	        <form action="<%= request.getContextPath() %>/LoadKhoHang" method="get" style="display: inline;">
	            <button class="nav-link" type="submit" role="tab">Danh sách sản phẩm</button>
	        </form>
	    </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link active" onclick="location.href='/QLCuaHangNoiThat/views/nhanVien/chiTietHangHoa.jsp'" type="button" role="tab">Chi tiết hàng hoá</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link " onclick="location.href='/QLCuaHangNoiThat/views/nhanVien/thongTinKhachHang.jsp'" type="button" role="tab">Thông tin khách hàng</button>
  </li>
   	<li class="nav-item" role="presentation">
        <form action="<%= request.getContextPath() %>/LoadLSMuaHang" method="get" style="display: inline;">
            <button class="nav-link " type="submit" role="tab">Danh sách hoá đơn</button>
        </form>
    </li>
        <li class="nav-item" role="presentation">
        <form action="<%= request.getContextPath() %>/LoadSanPham" method="get" style="display: inline;">
            <button class="nav-link " type="submit" role="tab">Trang chủ</button>
        </form>
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
                        <form action="<%= request.getContextPath() %>/AddDoNoiThat" method="post" enctype="multipart/form-data">
                            <div class="row">
                                <!-- Cột 1: Mã sản phẩm -->
                                <div class="col-lg-3 col-sm-6 col-12">
                                    <div class="form-group">
                                        <label>Mã sản phẩm</label>
                                        <input type="text" name="id" class="form-control" value="<%= id %>">
                                    </div>
                                </div>

                                <!-- Cột 2: Tên sản phẩm -->
                                <div class="col-lg-3 col-sm-6 col-12">
                                    <div class="form-group">
                                        <label>Tên sản phẩm</label>
                                        <input type="text" name="ten" class="form-control" value="<%= ten %>">
                                    </div>
                                </div>

                                <!-- Cột 3: Giá -->
                                <div class="col-lg-3 col-sm-6 col-12">
                                    <div class="form-group">
                                        <label>Giá</label>
                                        <input type="text" name="gia" class="form-control" value="<%= gia %>">
                                    </div>
                                </div>

                                <!-- Cột 4: Màu sắc -->
                                <div class="col-lg-3 col-sm-6 col-12">
                                    <div class="form-group">
                                        <label>Màu sắc</label>
                                        <input type="text" name="mauSac" class="form-control" value="<%= mauSac %>">
                                    </div>
                                </div>

                                <!-- Cột 5: Số lượng -->
                                <div class="col-lg-3 col-sm-6 col-12">
                                    <div class="form-group">
                                        <label>Số lượng</label>
                                        <input type="text" name="soLuong" class="form-control" value="<%= soLuong %>">
                                    </div>
                                </div>
								<div class="col-lg-3 col-sm-6 col-12">
                                    <div class="form-group">
                                        <label>Danh mục</label>
                                        <select name="maDanhMuc" class="form-control" id="maDanhMuc">
							            <option value="1" <%= idDanhMuc == "1" ? "selected" : "" %>>Ghế</option>
							            <option value="2" <%= idDanhMuc == "2" ? "selected" : "" %>>Bàn</option>
							            <option value="3" <%= idDanhMuc == "3" ? "selected" : "" %>>Tủ</option>
							            <option value="4" <%= idDanhMuc == "4" ? "selected" : "" %>>Giường</option>
							        </select>
                                    </div>
                                </div>
                                <!-- Cột 6: Mô tả -->
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label>Mô tả</label>
                                        <textarea name="moTa" class="form-control"><%= moTa %></textarea>
                                    </div>
                                </div>

                                <!-- Ảnh sản phẩm -->
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label>Ảnh sản phẩm</label>
                                        <div class="image-upload">
                                            <input type="file" id="file-input" name="imageFile" multiple onchange="previewImage(event)">
                                        </div>
                                        <div id="uploaded-images" style="margin-top: 15px; display: flex; flex-wrap: wrap; gap: 10px;">
                                            <% if (hinhAnh != null && !hinhAnh.isEmpty()) { %>
                                                <img id="preview-img" src="<%= request.getContextPath() %>/image/<%= hinhAnh %>" alt="Ảnh sản phẩm" style="max-width: 300px; max-height: 300px;">
                                            <% } else { %>
                                                <img id="preview-img" src="#" alt="Ảnh sản phẩm" style="display:none; max-width: 300px; max-height: 300px;">
                                            <% } %>
                                        </div>
                                    </div>
                                </div>

                                <!-- Cột 7: Nút Gửi và Hủy -->
                                <div class="col-lg-12">
                                    <input type="hidden" name="imageFileName" id="imageFileName" value="<%= hinhAnh %>">

                                    <input type="hidden" name="action" value="addProduct">
                                    <input type="submit" value="Gửi" class="btn btn-submit me-2">
                                    <a href="productlist.jsp" class="btn btn-cancel">Hủy</a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
function previewImage(event) {
    const file = event.target.files[0];
    if (!file) {
        alert('Vui lòng chọn một file ảnh!');
        return;
    }

    const imageUrl = URL.createObjectURL(file);
    const previewImg = document.getElementById('preview-img');
    previewImg.src = imageUrl; // Gắn URL vào thuộc tính src
    previewImg.style.display = 'block'; // Hiển thị ảnh

    // Lưu tên file vào hidden input
    document.getElementById('imageFileName').value = file.name;
}

document.querySelector('form').addEventListener('submit', function(e) {
    const fileName = document.getElementById('imageFileName').value;
    console.log('Tên file gửi đi:', fileName); // Kiểm tra giá trị trong console
    if (!fileName) {
        e.preventDefault();
        alert('Vui lòng chọn ảnh trước khi gửi!');
    }
});
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>  

</body>
</html>
