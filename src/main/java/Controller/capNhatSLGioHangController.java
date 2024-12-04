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
 * Servlet implementation class UpdateQuantity
 */
@WebServlet("/UpdateQuantity")
public class capNhatSLGioHangController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public capNhatSLGioHangController() {
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
        String action = request.getParameter("action");

        HttpSession session = request.getSession();
        List<DoNoiThat> cartProduct = (List<DoNoiThat>) session.getAttribute("cartProduct");

        if (cartProduct != null && productId != null && action != null) {
            for (DoNoiThat item : cartProduct) {
                if (item.getId() == Integer.parseInt(productId)) {
                    if (action.equals("increase")) {
                        item.setSoLuong(item.getSoLuong() + 1);
                    } else if (action.equals("decrease") && item.getSoLuong() > 1) {
                        item.setSoLuong(item.getSoLuong() - 1);
                    }
                    break;
                }
            }
            session.setAttribute("cartProduct", cartProduct); 
            

        }
        session.setAttribute("cartSize", countProduct(cartProduct));
        // Quay lại trang giỏ hàng
        response.sendRedirect("/QLCuaHangNoiThat/views/khachHang/viewCart.jsp");
	}
    private int countProduct(List<DoNoiThat> cartList) {
        int cnt = 0;
        for (DoNoiThat item : cartList) {
            cnt += item.getSoLuong();
        }
        return cnt;
    }


}
