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
import Model.HoaDon;
import Model.HoaDonDAO;

/**
 * Servlet implementation class LoadLSMuaHang
 */
@WebServlet("/LoadLSMuaHang")
public class LoadLSMuaHangController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoadLSMuaHangController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
        HttpSession session = request.getSession();

        // Lấy lại danh sách sản phẩm mới từ database sau khi thêm sản phẩm
        List<HoaDon> listHoaDon = HoaDonDAO.getALLHoaDon();
        // Cập nhật lại session với danh sách mới
        session.setAttribute("listHoaDon", listHoaDon);

        // Đặt thuộc tính cho request và chuyển hướng
        request.setAttribute("listHoaDon", listHoaDon);

        // Chuyển hướng đến trang danh sách sản phẩm
        request.getRequestDispatcher("/views/nhanVien/danhSachHoaDon.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
