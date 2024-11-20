package Model;

import java.sql.Date;

public class KhachHang {
	private String cccd;
	private String ten;
	private Date ngaySinh;
	private String email;
	private String sdt;
	private String diaChi;
	public String getCccd() {
		return cccd;
	}
	public void setCccd(String cccd) {
		this.cccd = cccd;
	}
	public String getTen() {
		return ten;
	}
	public void setTen(String ten) {
		this.ten = ten;
	}
	public Date getNgaySinh() {
		return ngaySinh;
	}
	public void setNgaySinh(Date ngaySinh) {
		this.ngaySinh = ngaySinh;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSdt() {
		return sdt;
	}
	public void setSdt(String sdt) {
		this.sdt = sdt;
	}
	public String getDiaChi() {
		return diaChi;
	}
	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}
	public KhachHang(String cccd, String ten, Date ngaySinh, String email, String sdt, String diaChi) {
		super();
		this.cccd = cccd;
		this.ten = ten;
		this.ngaySinh = ngaySinh;
		this.email = email;
		this.sdt = sdt;
		this.diaChi = diaChi;
	}
	public KhachHang() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
