<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
	uri="jakarta.tags.core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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

.table {
    width: 100%; /* Bảng chiếm toàn bộ chiều ngang */
    border-collapse: collapse; /* Loại bỏ khoảng cách giữa các ô */
}

.table th, .table td {
    border: 1px solid #ddd; /* Đường viền cho bảng */
    text-align: center; /* Căn giữa nội dung */
    padding: 8px; /* Khoảng cách nội dung và đường viền */
}

.table th {
    background-color: #f2f2f2; /* Màu nền cho tiêu đề */
    font-weight: bold; /* Chữ đậm cho tiêu đề */
}

.table-responsive {
    overflow-x: auto; /* Đảm bảo bảng cuộn được nếu quá rộng */
}
</style>
</head>

<body>
<% String message = (String) request.getAttribute("message"); %>
<% if (message != null) { %>
    <div class="alert alert-info" role="alert">
        <%= message %>
    </div>
<% } %>
<div class="container">
	<!-- Dashboard -->
	<div>
		<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
		<li class="nav-item" role="presentation">
	        <form action="<%= request.getContextPath() %>/LoadKhoHang" method="get" style="display: inline;">
	            <button class="nav-link active" type="submit" role="tab">Danh sách sản phẩm</button>
	        </form>
	    </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link " onclick="location.href='/QLCuaHangNoiThat/views/nhanVien/chiTietHangHoa.jsp'" type="button" role="tab">Chi tiết hàng hoá</button>
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
    <div class="table-responsive">
        <table class="table datanew">
            <thead>
                <tr>
                    <th>Mã sản phẩm</th>
                    <th>Tên sản phẩm</th>
                    <th>Giá</th>
                    <th>Màu sắc</th>
                    <th>Số lượng</th>
                    <th>Danh mục</th>
                </tr>
            </thead>
            <tbody>
			    <c:forEach var="dnt" items="${listDNT}">
			        <tr class="text-center" 
			            onclick="window.location.href='${pageContext.request.contextPath}/views/nhanVien/chiTietHangHoa.jsp?id=' 
			                + encodeURIComponent('${dnt.id}') 
			                + '&ten=' + encodeURIComponent('${dnt.ten}') 
			                + '&gia=' + encodeURIComponent('${dnt.gia}') 
			                + '&mauSac=' + encodeURIComponent('${dnt.mauSac}') 
			                + '&soLuong=' + encodeURIComponent('${dnt.soLuong}') 
			                + '&moTa=' + encodeURIComponent('${dnt.moTa}') 
			                + '&hinhAnh=' + encodeURIComponent('${dnt.hinhAnh}') 
			                + '&idDanhMuc=' + encodeURIComponent('${dnt.danhMuc.id}')">
			            <td>${dnt.id}</td>
			            <td>${dnt.ten}</td>
						<td><fmt:formatNumber value="${dnt.gia}" type="number" pattern="#,###" /></td>
			            <td>${dnt.mauSac}</td>
			            <td>${dnt.soLuong}</td>
			            <td>${dnt.danhMuc.ten}</td>
			        </tr>
			    </c:forEach>
			</tbody>

        </table>
    </div>
</div>

</div>


 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>  

</body>
</html>