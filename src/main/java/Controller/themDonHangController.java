package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.apache.tomcat.jakartaee.Converter;

import Model.DoNoiThat;
import Model.HoaDon;
import Model.HoaDonDAO;
import Model.KhachHang;
import Model.KhachHangDAO;

@WebServlet("/submitOrder")
public class themDonHangController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cccd = request.getParameter("cccd");
        String ten = request.getParameter("name");
        
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date ngaySinh = null;
        try {
            // Chuyển đổi từ String sang java.util.Date
            java.util.Date utilNgaySinh = sdf.parse(request.getParameter("dob"));
            // Chuyển đổi sang java.sql.Date
            ngaySinh = new java.sql.Date(utilNgaySinh.getTime());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        
        String email = request.getParameter("email");
        String soDienThoai = request.getParameter("phone");
        String diaChi = request.getParameter("address");
        Date thoiGian = null;
        try {
            // Chuyển đổi từ String sang java.util.Date
            java.util.Date utilThoiGian = sdf.parse(request.getParameter("orderTime"));
            // Chuyển đổi sang java.sql.Date
            thoiGian = new java.sql.Date(utilThoiGian.getTime());
        } catch (ParseException e) {
            e.printStackTrace();
        }

        // Lấy giỏ hàng từ session (danh sách CartItem)
        @SuppressWarnings("unchecked")
        List<DoNoiThat> cart = (List<DoNoiThat>) request.getSession().getAttribute("cartProduct");
        if (cart == null || cart.isEmpty()) {
            response.getWriter().write("Giỏ hàng trống!");
            return;
        }

        KhachHang khachHang = new KhachHang(cccd, ten, ngaySinh, email, soDienThoai, diaChi);
        KhachHangDAO.themHoacCapNhatKhachHang(khachHang);
        
        BigDecimal tongTien = cart.stream()
        	    .map(DoNoiThat::getTotalPrice)  // Chuyển mỗi đối tượng thành BigDecimal
        	    .reduce(BigDecimal.ZERO, BigDecimal::add);      
        // Tạo hóa đơn và lưu vào cơ sở dữ liệu
        HoaDon hDon = new HoaDon( tongTien, cccd, ten, thoiGian);
        HoaDonDAO.themHoaDon(hDon, cart);

        // Xóa giỏ hàng trong session sau khi thanh toán
        request.getSession().setAttribute("cartProduct", null);
        request.getSession().setAttribute("cartSize", 0);
        
        // Chuyển hướng đến trang thanh toán thành công
        response.sendRedirect("/QLCuaHangNoiThat/views/khachHang/thanhToanThanhCong.jsp");
    }
}
