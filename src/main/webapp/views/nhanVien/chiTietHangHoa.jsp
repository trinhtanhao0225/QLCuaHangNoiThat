<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chi tiết sản phẩm hàng hóa</title>
    <!-- CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
          rel="stylesheet" 
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
          crossorigin="anonymous">
    <style>
        .container {
            max-width: 1200px;
            margin: auto;
        }
    </style>
</head>
<body>
    <%
        // Lấy các tham số từ URL hoặc gán giá trị mặc định nếu null
        String id = request.getParameter("id") != null ? request.getParameter("id") : "";
        String ten = request.getParameter("ten") != null ? request.getParameter("ten") : "";
        String gia = request.getParameter("gia") != null ? request.getParameter("gia") : "";
        String mauSac = request.getParameter("mauSac") != null ? request.getParameter("mauSac") : "";
        String soLuong = request.getParameter("soLuong") != null ? request.getParameter("soLuong") : "";
        String moTa = request.getParameter("moTa") != null ? request.getParameter("moTa") : "";
        String hinhAnh = request.getParameter("hinhAnh") != null ? request.getParameter("hinhAnh") : "";
        String idDanhMuc = request.getParameter("idDanhMuc") != null ? request.getParameter("idDanhMuc") : "";
    %>

    <div class="container">
        <!-- Thanh điều hướng -->
        <ul class="nav nav-pills mb-3">
            <li class="nav-item">
                <form action="<%=request.getContextPath()%>/LoadKhoHang" method="get" style="display: inline;">
                    <button class="nav-link" type="submit">Danh sách sản phẩm</button>
                </form>
            </li>
            <li class="nav-item">
                <button class="nav-link active" onclick="location.href='/QLCuaHangNoiThat/views/nhanVien/chiTietHangHoa.jsp'" type="button">
                    Chi tiết hàng hoá
                </button>
            </li>
            <li class="nav-item">
                <button class="nav-link" onclick="location.href='/QLCuaHangNoiThat/views/nhanVien/thongTinKhachHang.jsp'" type="button">
                    Thông tin khách hàng
                </button>
            </li>
            <li class="nav-item">
                <form action="<%=request.getContextPath()%>/LoadLSMuaHang" method="get" style="display: inline;">
                    <button class="nav-link" type="submit">Danh sách hoá đơn</button>
                </form>
            </li>
            <li class="nav-item">
                <form action="<%=request.getContextPath()%>/LoadSanPham" method="get" style="display: inline;">
                    <button class="nav-link" type="submit">Trang chủ</button>
                </form>
            </li>
        </ul>

        <!-- Form chi tiết sản phẩm -->
        <div class="card">
            <div class="card-body">
                <h4 class="mb-4">Chi tiết sản phẩm hàng hoá</h4>
                <form action="<%=request.getContextPath()%>/AddDoNoiThat" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
                    <div class="row">
                        <!-- Mã sản phẩm -->
                        <div class="col-lg-3 col-sm-6 col-12">
                            <div class="form-group">
                                <label>Mã sản phẩm</label>
                                <input type="text" name="id" class="form-control" value="<%=id%>" readonly>
                            </div>
                        </div>

                        <!-- Tên sản phẩm -->
                        <div class="col-lg-3 col-sm-6 col-12">
                            <div class="form-group">
                                <label>Tên sản phẩm</label>
                                <input type="text" name="ten" class="form-control" value="<%=ten%>" required>
                            </div>
                        </div>

                        <!-- Giá -->
                        <div class="col-lg-3 col-sm-6 col-12">
                            <div class="form-group">
                                <label>Giá</label>
                                <input type="text" name="gia" class="form-control" value="<%=gia%>" required>
                            </div>
                        </div>

                        <!-- Màu sắc -->
                        <div class="col-lg-3 col-sm-6 col-12">
                            <div class="form-group">
                                <label>Màu sắc</label>
                                <input type="text" name="mauSac" class="form-control" value="<%=mauSac%>" required>
                            </div>
                        </div>

                        <!-- Số lượng -->
                        <div class="col-lg-3 col-sm-6 col-12">
                            <div class="form-group">
                                <label>Số lượng</label>
                                <input type="text" name="soLuong" class="form-control" value="<%=soLuong%>" required>
                            </div>
                        </div>

                        <!-- Danh mục -->
                        <div class="col-lg-3 col-sm-6 col-12">
                            <div class="form-group">
                                <label>Danh mục</label>
                                <select name="maDanhMuc" class="form-control" required>
                                    <option value="1" <%= "1".equals(idDanhMuc) ? "selected" : "" %>>Ghế</option>
                                    <option value="2" <%= "2".equals(idDanhMuc) ? "selected" : "" %>>Bàn</option>
                                    <option value="3" <%= "3".equals(idDanhMuc) ? "selected" : "" %>>Tủ</option>
                                    <option value="4" <%= "4".equals(idDanhMuc) ? "selected" : "" %>>Giường</option>
                                </select>
                            </div>
                        </div>

                        <!-- Mô tả -->
                        <div class="col-lg-12">
                            <div class="form-group">
                                <label>Mô tả</label>
                                <textarea name="moTa" class="form-control" required><%=moTa%></textarea>
                            </div>
                        </div>

                        <!-- Ảnh sản phẩm -->
                        <div class="col-lg-12">
                            <div class="form-group">
                                <label>Ảnh sản phẩm</label>
                                <input type="file" id="file-input" name="imageFile" class="form-control" onchange="previewImage(event)">
                                <div id="uploaded-images" style="margin-top: 15px;">
                                    <%
                                        if (hinhAnh != null && !hinhAnh.isEmpty()) {
                                    %>
                                    <img id="preview-img" src="<%=request.getContextPath()%>/image/<%=hinhAnh%>" 
                                         alt="Ảnh sản phẩm" style="max-width: 300px; max-height: 300px;">
                                    <%
                                        } else {
                                    %>
                                    <img id="preview-img" src="#" alt="Ảnh sản phẩm" style="display: none; max-width: 300px; max-height: 300px;">
                                    <%
                                        }
                                    %>
                                </div>
                            </div>
                        </div>

                        <!-- Nút Gửi và Hủy -->
                        <div class="col-lg-12">
                            <input type="hidden" name="imageFileName" id="imageFileName" value="<%=hinhAnh%>">
                            <input type="submit" value="Gửi" class="btn btn-primary me-2">
                            <a href="<%=request.getContextPath()%>/views/nhanVien/danhSachSanPham.jsp" class="btn btn-secondary">Hủy</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        function previewImage(event) {
            const file = event.target.files[0];
            if (file) {
                const previewImg = document.getElementById('preview-img');
                previewImg.src = URL.createObjectURL(file);
                previewImg.style.display = 'block';
                document.getElementById('imageFileName').value = file.name;
            }
        }

        function validateForm() {
            const requiredFields = ['ten', 'gia', 'mauSac', 'soLuong', 'moTa'];
            for (let field of requiredFields) {
                const value = document.querySelector(`input[name='${field}']`) || 
                              document.querySelector(`textarea[name='${field}']`);
                if (!value.value.trim()) {
                    alert(`Trường ${field} không được để trống!`);
                    return false;
                }
            }
            return true;
        }
    </script>
</body>
</html>
