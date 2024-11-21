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
        // Lấy session
        HttpSession session = request.getSession();

        // Kiểm tra xem danh sách đã có trong session chưa
        List<DoNoiThat> listDNT = (List<DoNoiThat>) session.getAttribute("listDNT");

        if (listDNT == null) {
            listDNT = DoNoiThatDAO.getALLDoNoiThat();

            session.setAttribute("listDNT", listDNT);
        }

        request.setAttribute("listDNT", listDNT);

        request.getRequestDispatcher("/views/nhanVien/danhSachSanPham.jsp").forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Chưa cần xử lý trong doPost
    }
}
