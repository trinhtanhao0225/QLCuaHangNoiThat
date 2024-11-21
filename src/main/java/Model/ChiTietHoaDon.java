package Model;

public class ChiTietHoaDon {
	private int id;
	private int idDoNoiThat;
	private int soLuong;
	private float gia;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getIdDoNoiThat() {
		return idDoNoiThat;
	}
	public void setIdDoNoiThat(int idDoNoiThat) {
		this.idDoNoiThat = idDoNoiThat;
	}
	public int getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	public float getGia() {
		return gia;
	}
	public void setGia(float gia) {
		this.gia = gia;
	}
	public ChiTietHoaDon(int id, int idDoNoiThat, int soLuong, float gia) {
		super();
		this.id = id;
		this.idDoNoiThat = idDoNoiThat;
		this.soLuong = soLuong;
		this.gia = gia;
	}
	public ChiTietHoaDon() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
