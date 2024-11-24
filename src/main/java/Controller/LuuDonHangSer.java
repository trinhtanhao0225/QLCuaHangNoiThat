package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.*;
import java.util.List;

import Model.CartItem;
import Model.DoNoiThat;

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

        // Lấy giỏ hàng từ session (danh sách CartItem)
        @SuppressWarnings("unchecked")
        List<CartItem> cart = (List<CartItem>) request.getSession().getAttribute("cart");
        if (cart == null || cart.isEmpty()) {
            response.getWriter().write("Giỏ hàng trống!");
            return;
        }

        Connection conn = null;

        try {
            conn = DBConnection.Database.getConnection();
            conn.setAutoCommit(false);

            // 1. Thêm hoặc cập nhật thông tin khách hàng
            String insertKhachHang = "INSERT INTO KhachHang (cccd, ten, ngaySinh, email, soDienThoai, diaChi) " +
                    "SELECT ?, ?, ?, ?, ?, ? ";

            try (PreparedStatement stmt = conn.prepareStatement(insertKhachHang)) {
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
         // 2. Thêm hóa đơn (cập nhật câu lệnh SQL để thêm tên)
            String insertHoaDon = "INSERT INTO HoaDon (cccd, ten, ngayDatHang, tongTien) VALUES (?, ?, ?, ?)";
            int idHoaDon = 0;

            // Tính tổng tiền dựa trên CartItem
            double tongTien = cart.stream().mapToDouble(CartItem::getTotalPrice).sum();

            try (PreparedStatement stmt = conn.prepareStatement(insertHoaDon, Statement.RETURN_GENERATED_KEYS)) {
                stmt.setString(1, cccd);
                stmt.setString(2, ten);  // Thêm tên khách hàng vào đây
                stmt.setTimestamp(3, timestamp);
                stmt.setDouble(4, tongTien);

                stmt.executeUpdate();

                try (ResultSet rs = stmt.getGeneratedKeys()) {
                    if (rs.next()) {
                        idHoaDon = rs.getInt(1);
                    } else {
                        throw new SQLException("Không thể lấy ID hóa đơn.");
                    }
                }
            }


            // 3. Thêm chi tiết hóa đơn
            String insertChiTietHoaDon = "INSERT INTO ChiTietHoaDon (idHoaDon, idDoNoiThat, soLuong, gia) " +
                    "VALUES (?, ?, ?, ?)";

            try (PreparedStatement stmt = conn.prepareStatement(insertChiTietHoaDon)) {
                for (CartItem item : cart) {
                    stmt.setInt(1, idHoaDon);
                    stmt.setInt(2, item.getId());  // Lấy id của sản phẩm từ CartItem
                    stmt.setInt(3, item.getSoLuong());  // Lấy số lượng từ CartItem
                    stmt.setFloat(4, item.getGia());  // Lấy giá từ CartItem
                    stmt.addBatch();
                }
                stmt.executeBatch();
            }

            conn.commit();
            response.sendRedirect("/QLCuaHangNoiThat/views/khachHang/thanhToanThanhCong.jsp");

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
