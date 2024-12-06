package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;


import Model.DoNoiThat;
import Model.DoNoiThatDAO;

@WebServlet("/addToCart")
public class themDoNoiThatGHController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy dữ liệu từ request
        int id = Integer.parseInt(request.getParameter("id"));
        String ten = request.getParameter("ten");
        String hinhAnh = request.getParameter("hinhAnh");
        BigDecimal gia = BigDecimal.valueOf(Float.parseFloat(request.getParameter("gia")));
        int soLuong = Integer.parseInt(request.getParameter("soLuong"));
        int soLuongMua = Integer.parseInt(request.getParameter("soLuongMua"));

        // Lấy session và giỏ hàng hiện tại
        HttpSession session = request.getSession();
        List<DoNoiThat> cartList = (List<DoNoiThat>) session.getAttribute("cartProduct");

        if (cartList == null) {
            cartList = new ArrayList<>();
        }

        try {
            boolean productExists = false;

            for (DoNoiThat item : cartList) {
                if (item.getId() == id) {
                    if (item.getSoLuong() + soLuongMua <= soLuong) {
                        item.setSoLuong(item.getSoLuong() + soLuongMua); // Cập nhật số lượng sản phẩm
                    } 
                    productExists = true;
                    break;
                }
            }
            
            if (!productExists) {
                if (soLuongMua <= soLuong) {
                    cartList.add(new DoNoiThat(id, ten, gia, soLuongMua, hinhAnh));
                } 
            }

            // Cập nhật giỏ hàng và thông báo
            session.setAttribute("cartProduct", cartList);
            session.setAttribute("cartSize", countProduct(cartList));

            // Chuyển hướng tới trang sản phẩm
            response.sendRedirect("LoadSanPham");

        } catch (IllegalArgumentException e) {
            // Đặt thông báo lỗi
            request.getRequestDispatcher("views/khachHang/shop.jsp").forward(request, response);
        }
    }

    private int countProduct(List<DoNoiThat> cartList) {
        int cnt = 0;
        for (DoNoiThat item : cartList) {
            cnt += item.getSoLuong();
        }
        return cnt;
    }
}

