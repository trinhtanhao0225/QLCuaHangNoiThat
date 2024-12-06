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
public class LoadMuaHangController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LoadMuaHangController() {
        super();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession();

        List<DoNoiThat> listDNT = DoNoiThatDAO.getALLDoNoiThat();

        session.setAttribute("listDNT", listDNT);

        request.setAttribute("listDNT", listDNT);
        request.setAttribute("message", "Thêm sản phẩm thành công!");

        request.getRequestDispatcher("/views/khachHang/shop.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
