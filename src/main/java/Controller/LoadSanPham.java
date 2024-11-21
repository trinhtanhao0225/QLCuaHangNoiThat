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

/**
 * Servlet implementation class LoadSanPham
 */
@WebServlet("/LoadSanPham")
public class LoadSanPham extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoadSanPham() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Gọi DAO để lấy danh sách sản phẩm
        DoNoiThatDAO donoithatDAO = new DoNoiThatDAO();
        List<DoNoiThat> donoithat = donoithatDAO.getALLDoNoiThat();

        // Đặt danh sách sản phẩm vào request
        request.setAttribute("listdonoithat", donoithat);

        // Chuyển hướng sang JSP
        request.getRequestDispatcher("../../views/shop.jsp").forward(request, response);
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
