package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import Model.DoNoiThat;
import Model.DoNoiThatDAO;
import Model.chiTietSP;
import Model.chiTietSPDAO;

/**
 * Servlet implementation class ChiTietSanPhamServlet
 */
@WebServlet("/chiTietSanPham")
public class ChiTietSanPhamServlet extends HttpServlet {
	private chiTietSPDAO chitietSPDAO;

    @Override
    public void init() throws ServletException {
        chitietSPDAO = new chiTietSPDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy tham số từ URL
        int productId = Integer.parseInt(request.getParameter("id"));

        // Lấy chi tiết sản phẩm hiện tại
        chiTietSP currentProduct = chitietSPDAO.getProductById(productId);

        if (currentProduct != null) {
            // Lấy danh sách sản phẩm cùng danh mục
            List<chiTietSP> relatedProducts = chitietSPDAO.getRelatedProducts(
                currentProduct.getMaDanhMuc(), currentProduct.getId()
            );

            // Gửi dữ liệu qua JSP
            request.setAttribute("currentProduct", currentProduct);
            request.setAttribute("relatedProducts", relatedProducts);
        }

        // Chuyển hướng đến trang chi tiết sản phẩm
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/khachHang/chiTietSanPham.jsp");
        dispatcher.forward(request, response);
    }
}
