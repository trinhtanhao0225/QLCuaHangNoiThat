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

/**
 * Servlet implementation class LoadKhoHang
 */
@WebServlet("/LoadKhoHang")
public class LoadKhoHang extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoadKhoHang() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<DoNoiThat> listDNT = DoNoiThatDAO.getALLDoNoiThat();


        // Đặt thuộc tính cho request và chuyển hướng
        request.setAttribute("listDNT", listDNT);

        // Chuyển hướng đến trang danh sách sản phẩm
        request.getRequestDispatcher("/views/nhanVien/danhSachSanPham.jsp").forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Chưa cần xử lý trong doPost
    }
}
