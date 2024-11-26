package Model;

public class DoNoiThat {
	private int id;
	private String ten;
	private float gia;
	private String mauSac;
	private int soLuong;
	private String moTa;
	private String hinhAnh;
	private DanhMuc danhMuc;
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

	
	public DanhMuc getDanhMuc() {
		return danhMuc;
	}

	
	

	public void setDanhMuc(DanhMuc danhMuc) {
		this.danhMuc = danhMuc;
	}

	public DoNoiThat() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DoNoiThat(int id, String ten, float gia, String mauSac, int soLuong, String moTa, String hinhAnh,
			DanhMuc danhMuc) {
		super();
		this.id = id;
		this.ten = ten;
		this.gia = gia;
		this.mauSac = mauSac;
		this.soLuong = soLuong;
		this.moTa = moTa;
		this.hinhAnh = hinhAnh;
		this.danhMuc = danhMuc;
	}

	public DoNoiThat(int id, String ten, float gia, String mauSac,int soLuong, String hinhAnh) {
		super();
		this.id = id;
		this.ten = ten;
		this.gia = gia;
		this.mauSac = mauSac;
		this.soLuong = soLuong;
		this.hinhAnh = hinhAnh;
	}
	public DoNoiThat(int id, String ten, float gia, int soLuong, String hinhAnh) {
		super();
		this.id = id;
		this.ten = ten;
		this.gia = gia;
		this.soLuong = soLuong;
		this.hinhAnh = hinhAnh;
	}
	 public float getTotalPrice() {
	        return this.gia * this.soLuong;
	    }
	
}
