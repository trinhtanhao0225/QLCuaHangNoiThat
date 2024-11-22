package Controller;

import java.io.IOException;
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
public class AddDoNoiThat extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AddDoNoiThat() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Không cần xử lý trong doGet
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy thông tin từ form
    	int id = Integer.MAX_VALUE;
    	String getID=request.getParameter("id");
    	if(getID != null && !getID.equals("null")) {
    		id=Integer.parseInt(getID);
    	}
        String ten = request.getParameter("ten");
        Float gia = Float.parseFloat(request.getParameter("gia"));
        String mauSac = request.getParameter("mauSac");
        int soLuong = Integer.parseInt(request.getParameter("soLuong"));
        String moTa = request.getParameter("moTa");
        String hinhAnh = request.getParameter("imageFileName");
        int maDanhMuc = Integer.parseInt(request.getParameter("maDanhMuc"));
        
        
        // Tạo đối tượng DoNoiThat và gọi DAO để thêm vào cơ sở dữ liệu
        DoNoiThat dnt = new DoNoiThat(id, ten, gia, mauSac, soLuong, moTa, hinhAnh,new DanhMuc(maDanhMuc));
        DoNoiThatDAO.themCapNhatDoNoiThat(dnt);
        
     // Đặt thông báo và cập nhật danh sách
        HttpSession session = request.getSession();

        // Lấy lại danh sách sản phẩm mới từ database sau khi thêm sản phẩm
        List<DoNoiThat> listDNT = DoNoiThatDAO.getALLDoNoiThat();

        // Cập nhật lại session với danh sách mới
        session.setAttribute("listDNT", listDNT);

        // Đặt thuộc tính cho request và chuyển hướng
        request.setAttribute("listDNT", listDNT);
        request.setAttribute("message", "Thêm sản phẩm thành công!");

        // Chuyển hướng đến trang danh sách sản phẩm
        request.getRequestDispatcher("/views/nhanVien/danhSachSanPham.jsp").forward(request, response);
    }
}
