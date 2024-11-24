package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import Model.DoNoiThat;
import Model.DoNoiThatDAO;

@WebServlet("/LoadSanPham")
public class LoadSanPham extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LoadSanPham() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Gọi DAO để lấy danh sách sản phẩm
    	HttpSession session = request.getSession();
        //DoNoiThatDAO donoithatDAO = new DoNoiThatDAO();
        //List<DoNoiThat> donoithat = donoithatDAO.getALLDoNoiThat();

        List<DoNoiThat> listDNT = DoNoiThatDAO.getALLDoNoiThat1();

        // Cập nhật lại session với danh sách mới
        session.setAttribute("listDNT", listDNT);

        // Đặt thuộc tính cho request và chuyển hướng
        request.setAttribute("listDNT", listDNT);
        request.setAttribute("message", "Thêm sản phẩm thành công!");

        // Chuyển hướng sang JSP
        request.getRequestDispatcher("/views/khachHang/shop.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
