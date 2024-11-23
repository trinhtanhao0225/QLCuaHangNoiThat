
package Model;

public class DanhMuc {
	private int id;
	private String ten;
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
	public DanhMuc(int id, String ten) {
		super();
		this.id = id;
		this.ten = ten;
	}
	public DanhMuc() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DanhMuc(int id) {
		super();
		this.id = id;
	}
	
}

