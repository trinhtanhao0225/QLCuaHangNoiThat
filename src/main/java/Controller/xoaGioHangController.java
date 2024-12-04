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

/**
 * Servlet implementation class DeleteFromCart
 */
@WebServlet("/DeleteFromCart")
public class xoaGioHangController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public xoaGioHangController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		String productId = request.getParameter("productId");

        // Lấy giỏ hàng từ session
        HttpSession session = request.getSession();
        List<DoNoiThat> cartProduct = (List<DoNoiThat>) session.getAttribute("cartProduct");

        // Tìm và xóa sản phẩm khỏi giỏ hàng
        if (cartProduct != null && productId != null) {
            cartProduct.removeIf(item -> item.getId() == Integer.parseInt(productId));
            session.setAttribute("cartProduct", cartProduct); // Cập nhật lại giỏ hàng
        }
        session.setAttribute("cartSize", countProduct(cartProduct));
        // Quay lại trang giỏ hàng
        response.sendRedirect("/QLCuaHangNoiThat/views/khachHang/viewCart.jsp");
	}
    
    // Hàm tính tổng số lượng sản phẩm trong giỏ hàng
    private int countProduct(List<DoNoiThat> cartList) {
        int cnt = 0;
        for (DoNoiThat item : cartList) {
            cnt += item.getSoLuong();
        }
        return cnt;
    }

}
