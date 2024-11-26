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

import Model.DoNoiThat;
import Model.DoNoiThatDAO;
@WebServlet("/addToCart")
public class AddToCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String ten = request.getParameter("ten");
        String hinhAnh = request.getParameter("hinhAnh");
        float gia = Float.parseFloat(request.getParameter("gia"));
        int soLuong = Integer.parseInt(request.getParameter("soLuong"));
        int soLuongMua = Integer.parseInt(request.getParameter("soLuongMua"));

        HttpSession session = request.getSession();
        List<DoNoiThat> cartList = (List<DoNoiThat>) session.getAttribute("cartProduct");

        // Kiểm tra giỏ hàng trong session
        if (cartList == null) {
            cartList = new ArrayList<>(); // Nếu giỏ hàng chưa có, khởi tạo giỏ hàng mới
        }

        try {
            boolean productExists = false;

            // Duyệt qua giỏ hàng và kiểm tra nếu sản phẩm đã tồn tại
            for (DoNoiThat item : cartList) {
                if (item.getId() == id) {
                    // Kiểm tra nếu số lượng trong giỏ + số lượng mua không vượt quá số lượng tồn kho
                    if (item.getSoLuong() + soLuongMua > soLuong) {
                        throw new IllegalArgumentException("Số lượng sản phẩm không đủ.");
                    } else {
                        item.setSoLuong(item.getSoLuong() + soLuongMua); // Cập nhật số lượng nếu đã có trong giỏ hàng
                    }
                    productExists = true;
                    break;
                }
            }

            // Nếu sản phẩm chưa có trong giỏ, thêm mới vào giỏ hàng
            if (!productExists) {
                if (soLuongMua <= soLuong) {
                    cartList.add(new DoNoiThat(id, ten, gia, soLuongMua, hinhAnh));
                } else {
                    throw new IllegalArgumentException("Số lượng sản phẩm không đủ.");
                }
            }

            // Lưu giỏ hàng và số lượng vào session
            session.setAttribute("cartProduct", cartList);
            session.setAttribute("cartSize", countProduct(cartList));

            // Chuyển hướng đến trang sản phẩm
            response.sendRedirect("LoadSanPham");

        } catch (IllegalArgumentException e) {
            // Nếu có lỗi, thông báo cho người dùng và chuyển hướng về trang shop.jsp
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("views/khachHang/shop.jsp").forward(request, response);
        }
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
