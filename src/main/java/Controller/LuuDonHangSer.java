package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;

@WebServlet("/submitOrder")
public class LuuDonHangSer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String cccd = request.getParameter("cccd");
		String ten = request.getParameter("name");
		String ngaySinh = request.getParameter("dob");
		String email = request.getParameter("email");
		String soDienThoai = request.getParameter("phone");
		String diaChi = request.getParameter("address");
		String thoiGian = request.getParameter("orderTime"); // Lấy thời gian từ JSP

		// Lấy thông tin sản phẩm từ form
		double product1Price = Double.parseDouble(request.getParameter("product1Price"));
		double product2Price = Double.parseDouble(request.getParameter("product2Price"));
		int quantity1 = Integer.parseInt(request.getParameter("quantity1"));
		int quantity2 = Integer.parseInt(request.getParameter("quantity2"));
		double tongTien = product1Price * quantity1 + product2Price * quantity2;

		Connection conn = null;

		try {
			conn = DBConnection.Database.getConnection();
			if (conn == null) {
				throw new SQLException("Không thể kết nối đến cơ sở dữ liệu.");
			}
			conn.setAutoCommit(false);

			// 1. Thêm hoặc cập nhật thông tin khách hàng
			String checkKhachHang = "INSERT INTO KhachHang (cccd, ten, ngaySinh, email, soDienThoai, diaChi) VALUES (?, ?, ?, ?, ?, ?)";
			try (PreparedStatement stmt = conn.prepareStatement(checkKhachHang)) {
				// Kiểm tra và cập nhật/insert thông tin khách hàng
				stmt.setString(1, cccd);
				stmt.setString(2, ten);
				stmt.setDate(3, Date.valueOf(ngaySinh));
				stmt.setString(4, email);
				stmt.setString(5, soDienThoai);
				stmt.setString(6, diaChi);

				stmt.executeUpdate();
			}

			// 2. Thêm hóa đơn
			Timestamp timestamp = Timestamp.valueOf(thoiGian + " 00:00:00"); // Đảm bảo thời gian có định dạng hợp lệ
			String insertHoaDon = "INSERT INTO HoaDon (cccd, ten, ngayDatHang, tongTien) VALUES (?, ?, ?, ?)";
			int idHoaDon = 0;
			try (PreparedStatement stmt = conn.prepareStatement(insertHoaDon, Statement.RETURN_GENERATED_KEYS)) {
				stmt.setString(1, cccd);
				stmt.setString(2, ten); // Lưu tên vào hóa đơn
				stmt.setTimestamp(3, timestamp); // Sử dụng Timestamp để lưu thời gian
				stmt.setDouble(4, tongTien);
				stmt.executeUpdate();

				// Lấy ID của hóa đơn vừa thêm
				try (ResultSet rs = stmt.getGeneratedKeys()) {
					if (rs.next()) {
						idHoaDon = rs.getInt(1);
					} else {
						throw new SQLException("Không thể lấy ID hóa đơn.");
					}
				}
			}

			// 3. Thêm chi tiết hóa đơn
			String insertChiTietHoaDon = "INSERT INTO ChiTietHoaDon (idHoaDon, idDoNoiThat, soLuong, gia) "
					+ "VALUES (?, ?, ?, ?)";

			try (PreparedStatement stmt = conn.prepareStatement(insertChiTietHoaDon)) {
				// Thêm sản phẩm 1
				stmt.setInt(1, idHoaDon); // Dùng ID hóa đơn đã chèn
				stmt.setInt(2, 1); // Giả sử idDoNoiThat của sản phẩm 1 là 1
				stmt.setInt(3, quantity1);
				stmt.setDouble(4, product1Price);
				stmt.executeUpdate();

				// Thêm sản phẩm 2
				stmt.setInt(1, idHoaDon); // Dùng ID hóa đơn đã chèn
				stmt.setInt(2, 2); // Giả sử idDoNoiThat của sản phẩm 2 là 2
				stmt.setInt(3, quantity2);
				stmt.setDouble(4, product2Price);
				stmt.executeUpdate();
			}

			conn.commit();
			response.getWriter().write("Đơn hàng đã được lưu thành công!");

		} catch (SQLException e) {
			if (conn != null) {
				try {
					conn.rollback();
				} catch (SQLException rollbackEx) {
					rollbackEx.printStackTrace();
				}
			}
			response.getWriter().write("Lỗi: " + e.getMessage());
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException closeEx) {
					closeEx.printStackTrace();
				}
			}
		}
	}
}
