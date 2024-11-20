package Model;

import java.sql.Date;
import java.time.DateTimeException;

public class GioHang {
	private int id;
	private int idDoNoiThat;
	private int soLuong;
	private int gia;
	private String cccd;
	private Date thoiGianDatHang;
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
	public int getGia() {
		return gia;
	}
	public void setGia(int gia) {
		this.gia = gia;
	}
	public String getCccd() {
		return cccd;
	}
	public void setCccd(String cccd) {
		this.cccd = cccd;
	}
	public Date getThoiGianDatHang() {
		return thoiGianDatHang;
	}
	public void setThoiGianDatHang(Date thoiGianDatHang) {
		this.thoiGianDatHang = thoiGianDatHang;
	}
	public GioHang(int id, int idDoNoiThat, int soLuong, int gia, String cccd, Date thoiGianDatHang) {
		super();
		this.id = id;
		this.idDoNoiThat = idDoNoiThat;
		this.soLuong = soLuong;
		this.gia = gia;
		this.cccd = cccd;
		this.thoiGianDatHang = thoiGianDatHang;
	}
	public GioHang() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
