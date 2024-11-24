package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import DBConnection.Database;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/views/nhanVien/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String taikhoan = request.getParameter("taikhoan");
        String matkhau = request.getParameter("matkhau");

        try (Connection conn = Database.getConnection()) {
            String sql = "SELECT * FROM DangNhap WHERE taikhoan = ? AND matkhau = ?";
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, taikhoan);
                ps.setString(2, matkhau);

                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        // Lưu thông tin đăng nhập vào session
                        HttpSession session = request.getSession();
                        session.setAttribute("taikhoan", taikhoan);

                        // Chuyển hướng tới trang giao diện bán hàng
                        response.sendRedirect(request.getContextPath() + "/views/nhanVien/chiTietHangHoa.jsp");
                    } else {
                        // Sai thông tin đăng nhập, quay lại trang login
                        request.setAttribute("error", "Tên đăng nhập hoặc mật khẩu không đúng!");
                        request.getRequestDispatcher("/views/nhanVien/login.jsp").forward(request, response);
                    }
                }
            }
        } catch (Exception e) {
            throw new ServletException("Lỗi kết nối cơ sở dữ liệu", e);
        }
    }
}

