package member.model.vo;

import java.sql.Date;

/**
/**
* 작성자: 전민희
* 작성일자: 200213
* 작성목표 : 마일리지객체 생성
* 
*/
public class Mile {
	private String mcode;
	private Date createDate;
	private int mile_point;
	private char mile_io;
	private int mile_total;
	private String mile_info;
	
	public Mile() {
		super();
	}

	public Mile(String mcode, Date createDate, int mile_point, char mile_io, int mile_total, String mile_info) {
		super();
		this.mcode = mcode;
		this.createDate = createDate;
		this.mile_point = mile_point;
		this.mile_io = mile_io;
		this.mile_total = mile_total;
		this.mile_info = mile_info;
	}

	public String getMcode() {
		return mcode;
	}

	public void setMcode(String mcode) {
		this.mcode = mcode;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public int getMile_point() {
		return mile_point;
	}

	public void setMile_point(int mile_point) {
		this.mile_point = mile_point;
	}

	public char getMile_io() {
		return mile_io;
	}

	public void setMile_io(char mile_io) {
		this.mile_io = mile_io;
	}

	public int getMile_total() {
		return mile_total;
	}

	public void setMile_total(int mile_total) {
		this.mile_total = mile_total;
	}

	public String getMile_info() {
		return mile_info;
	}

	public void setMile_info(String mile_info) {
		this.mile_info = mile_info;
	}

	@Override
	public String toString() {
		return "Mile [mcode=" + mcode + ", createDate=" + createDate + ", mile_point=" + mile_point + ", mile_io="
				+ mile_io + ", mile_total=" + mile_total + ", mile_info=" + mile_info + "]";
	}
	
	
}


