package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
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
        DoNoiThatDAO donoithatDAO = new DoNoiThatDAO();
        List<DoNoiThat> donoithat = donoithatDAO.getALLDoNoiThat();

        // Kiểm tra nếu danh sách rỗng hoặc null
        if (donoithat == null || donoithat.isEmpty()) {
            request.setAttribute("errorMessage", "Không có sản phẩm nào được tìm thấy.");
        } else {
            request.setAttribute("listdonoithat", donoithat);
        }

        // Chuyển hướng sang JSP
        String path = request.getContextPath() + "/views/khachHang/shop.jsp";
        request.getRequestDispatcher(path).forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
