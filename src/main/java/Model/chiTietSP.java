package Model;

public class chiTietSP {
	private int id;
	private String ten;
	private float gia;
	private String mauSac;
	private int soLuong;
	private String moTa;
	private String hinhAnh;
	private int maDanhMuc;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTen() {
		return ten;
	}
	public void setTen(String ten) {
		this.ten = ten;
	}
	public float getGia() {
		return gia;
	}
	public void setGia(float gia) {
		this.gia = gia;
	}
	public String getMauSac() {
		return mauSac;
	}
	public void setMauSac(String mauSac) {
		this.mauSac = mauSac;
	}
	public int getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	public String getMoTa() {
		return moTa;
	}
	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}
	public String getHinhAnh() {
		return hinhAnh;
	}
	public void setHinhAnh(String hinhAnh) {
		this.hinhAnh = hinhAnh;
	}
	public int getMaDanhMuc() {
		return maDanhMuc;
	}
	public void setMaDanhMuc(int maDanhMuc) {
		this.maDanhMuc = maDanhMuc;
	}
	
	public chiTietSP() {
		super();
		// TODO Auto-generated constructor stub
	}
	public chiTietSP(int id, String ten, float gia, String mauSac, int soLuong, String moTa, String hinhAnh,int maDanhMuc) {
		super();
		this.id = id;
		this.ten = ten;
		this.gia = gia;
		this.mauSac = mauSac;
		this.soLuong = soLuong;
		this.moTa = moTa;
		this.hinhAnh = hinhAnh;
		this.maDanhMuc = maDanhMuc;
	}

	
}
