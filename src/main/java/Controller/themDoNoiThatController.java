package Controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

import org.apache.taglibs.standard.tag.common.fmt.RequestEncodingSupport;

import Model.DanhMuc;
import Model.DoNoiThat;
import Model.DoNoiThatDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/AddDoNoiThat")
@MultipartConfig  // Cần có để servlet xử lý multipart form data
public class themDoNoiThatController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public themDoNoiThatController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Không cần xử lý trong doGet
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.MAX_VALUE;
            String getID = request.getParameter("id");
            if (!getID.equals("")) {
                id = Integer.parseInt(getID);
            }
            String ten = request.getParameter("ten");
            BigDecimal gia = BigDecimal.valueOf(Float.parseFloat(request.getParameter("gia")));
            String mauSac = request.getParameter("mauSac");
            int soLuong = Integer.parseInt(request.getParameter("soLuong"));
            String moTa = request.getParameter("moTa");
            String hinhAnh = request.getParameter("imageFileName");
            int maDanhMuc = Integer.parseInt(request.getParameter("maDanhMuc"));

            DoNoiThat dnt = new DoNoiThat(id, ten, gia, mauSac, soLuong, moTa, hinhAnh, new DanhMuc(maDanhMuc));
            DoNoiThatDAO.themCapNhatDoNoiThat(dnt);

            List<DoNoiThat> listDNT = DoNoiThatDAO.getALLDoNoiThat();

            // Cập nhật lại session với danh sách mới
            HttpSession session = request.getSession();
            session.setAttribute("listDNT", listDNT);

            // Đặt thông báo thành công
            request.setAttribute("message", "Cập nhật thay đổi thành công!");

        } catch (Exception e) {
            // Nếu có lỗi, đặt thông báo lỗi
            request.setAttribute("message", "Cập nhật thay đổi thất bại : " + e.getMessage());
        }

        request.getRequestDispatcher("/views/nhanVien/danhSachSanPham.jsp").forward(request, response);
    }

}
