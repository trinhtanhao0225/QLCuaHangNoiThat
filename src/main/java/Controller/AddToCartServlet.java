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

@WebServlet("/addToCart")
public class AddToCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
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
                item.setSoLuong(item.getSoLuong() + 1); // Tăng số lượng trong giỏ hàng
                productExists = true;
                break;
            }
        }

        // Nếu sản phẩm chưa tồn tại, thêm mới vào giỏ hàng
        if (!productExists) {
            cartList.add(new CartItem(id, ten, hinhAnh, gia, 1));
        }

        // Cập nhật giỏ hàng trong session
        session.setAttribute("cart", cartList);

        // Cập nhật badge (số lượng sản phẩm trong giỏ hàng)
        session.setAttribute("cartSize", cartList.size());

        // Chuyển hướng về trang sản phẩm
        response.sendRedirect("LoadSanPham");
    }
}
