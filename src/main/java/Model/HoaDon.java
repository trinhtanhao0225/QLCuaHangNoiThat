package Model;

import java.sql.Date;
import java.time.DateTimeException;

public class HoaDon {
	private int id;
	private float tongTien;
	private String cccd;
	private String ten;
	private Date thoiGianDatHang;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public float getTongTien() {
		return tongTien;
	}
	public void setTongTien(float tongTien) {
		this.tongTien = tongTien;
	}
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
	public Date getThoiGianDatHang() {
		return thoiGianDatHang;
	}
	public void setThoiGianDatHang(Date thoiGianDatHang) {
		this.thoiGianDatHang = thoiGianDatHang;
	}
	public HoaDon(int id, float tongTien, String cccd, String ten, Date thoiGianDatHang) {
		super();
		this.id = id;
		this.tongTien = tongTien;
		this.cccd = cccd;
		this.ten = ten;
		this.thoiGianDatHang = thoiGianDatHang;
	}
	public HoaDon() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
