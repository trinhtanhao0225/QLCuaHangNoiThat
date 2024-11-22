<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thông Tin Khách Hàng</title>
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
                <button class="nav-link" onclick="location.href='/QLCuaHangNoiThat/views/nhanVien/danhSachSanPham.jsp'" type="button" role="tab">Danh sách sản phẩm</button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" onclick="location.href='/QLCuaHangNoiThat/views/nhanVien/chiTietHangHoa.jsp'" type="button" role="tab">Chi tiết hàng hoá</button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link active" onclick="location.href='/QLCuaHangNoiThat/views/nhanVien/thongTinKhachHang.jsp'" type="button" role="tab">Thông tin khách hàng</button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" onclick="location.href='/QLCuaHangNoiThat/views/nhanVien/danhSachHoaDon.jsp'" type="button" role="tab">Danh sách hoá đơn</button>
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
                            <!-- Cột 1: CCCD -->
                            <div class="col-lg-3 col-sm-6 col-12">
                                <div class="form-group">
                                    <label>Căn cước công dân</label>
                                    <input type="text" class="form-control" readonly value="${khachHang.cccd}">
                                </div>
                            </div>

                            <!-- Cột 2: Tên -->
                            <div class="col-lg-3 col-sm-6 col-12">
                                <div class="form-group">
                                    <label>Tên khách hàng</label>
                                    <input type="text" class="form-control" readonly value="${khachHang.ten}">
                                </div>
                            </div>

                            <!-- Cột 3: Ngày sinh -->
                            <div class="col-lg-3 col-sm-6 col-12">
                                <div class="form-group">
                                    <label>Ngày sinh</label>
                                    <input type="text" class="form-control" readonly value="${khachHang.ngaySinh}">
                                </div>
                            </div>

                            <!-- Cột 4: Email -->
                            <div class="col-lg-3 col-sm-6 col-12">
                                <div class="form-group">
                                    <label>Email</label>
                                    <input type="text" class="form-control" readonly value="${khachHang.email}">
                                </div>
                            </div>

                            <!-- Cột 5: Số điện thoại -->
                            <div class="col-lg-3 col-sm-6 col-12">
                                <div class="form-group">
                                    <label>Số điện thoại</label>
                                    <input type="text" class="form-control" readonly value="${khachHang.sdt}">
                                </div>
                            </div>

                            <!-- Cột 6: Địa chỉ -->
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label>Địa chỉ</label>
                                    <textarea class="form-control" readonly>${khachHang.diaChi}</textarea>
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
