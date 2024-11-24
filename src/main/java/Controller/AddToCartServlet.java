package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import Model.CartItem;
import Model.DoNoiThat;
import Model.DoNoiThatDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class add_to_cart
 */
@WebServlet("/addToCart")
public class AddToCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy thông tin sản phẩm từ request
        int id = Integer.parseInt(request.getParameter("id"));
        String ten = request.getParameter("ten");
        String hinhAnh = request.getParameter("hinhAnh");
        float gia = Float.parseFloat(request.getParameter("gia"));

        // Lấy giỏ hàng từ session
        HttpSession session = request.getSession();
        List<CartItem> cartList = (List<CartItem>) session.getAttribute("cart");

        if (cartList == null) {
            cartList = new ArrayList<>();
        }

        // Kiểm tra nếu sản phẩm đã tồn tại trong giỏ hàng
        boolean productExists = false;
        for (CartItem item : cartList) {
            if (item.getId() == id) {
                item.setSoLuong(item.getSoLuong() + 1); // Tăng số lượng
                productExists = true;
                break;
            }
        }

        // Nếu sản phẩm chưa tồn tại, thêm mới
        if (!productExists) {
            cartList.add(new CartItem(id, ten, hinhAnh, gia, 1));
        }

        // Cập nhật giỏ hàng trong session
        session.setAttribute("cart", cartList);

        // Cập nhật badge (số lượng sản phẩm)
        session.setAttribute("cartSize", cartList.size());

        // Giảm số lượng sản phẩm trong kho
        boolean isStockUpdated = DoNoiThatDAO.reduceQuantity(id, 1); // Giảm số lượng kho xuống 1
        if (!isStockUpdated) {
            // Nếu không đủ số lượng, hiển thị thông báo lỗi
            session.setAttribute("errorMessage", "Không đủ số lượng sản phẩm trong kho.");
            response.sendRedirect("LoadSanPham"); // Điều hướng lại trang sản phẩm
            return;
        }

        // Chuyển hướng về trang sản phẩm hoặc giỏ hàng
        response.sendRedirect("LoadSanPham"); // Hoặc điều hướng sang trang giỏ hàng
    }
}



