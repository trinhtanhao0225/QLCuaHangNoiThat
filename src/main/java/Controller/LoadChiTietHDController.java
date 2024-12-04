package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import Model.ChiTietHoaDon;
import Model.ChiTietHoaDonDAO;
import Model.KhachHang;
import Model.KhachHangDAO;

/**
 * Servlet implementation class LoadChiTietHD
 */
@WebServlet("/LoadChiTietHD")
public class LoadChiTietHDController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoadChiTietHDController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		

		List<ChiTietHoaDon> cthd=ChiTietHoaDonDAO.getAllChiTietHD(); 
		System.out.println(cthd.size());
        request.setAttribute("listCTHD", cthd);
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
