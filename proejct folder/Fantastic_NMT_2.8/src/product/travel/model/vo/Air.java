package product.travel.model.vo;

import java.sql.Date;
import java.util.Arrays;

/**
 * @author Minhee
 * 생성날짜 0210
 * 생성목적 : 비행기 객체클래스
 */
public class Air {
	private String airCode;			//상품코드
	private String nationDepart;	//출발지국가코드
	private String nationArrival;	//도착지국가코드
	private String airImgName;			//이미지코드
	private String airName;			//편명
	private int airPrice;			//가격
	private String airCom;			//항공사
	private Date airDepart;			//출발시간
	private Date airArrival;		//도착시간
	private String startTime;
	private String arriveTime;
	
	
	public Air() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Air(String airCode, String nationDepart, String nationArrival, String airImgName, String airName,
			int airPrice, String airCom, Date airDepart, Date airArrival, String startTime, String arriveTime) {
		super();
		this.airCode = airCode;
		this.nationDepart = nationDepart;
		this.nationArrival = nationArrival;
		this.airImgName = airImgName;
		this.airName = airName;
		this.airPrice = airPrice;
		this.airCom = airCom;
		this.airDepart = airDepart;
		this.airArrival = airArrival;
		this.startTime = startTime;
		this.arriveTime = arriveTime;
	}


	public String getAirCode() {
		return airCode;
	}

	public void setAirCode(String airCode) {
		this.airCode = airCode;
	}

	public String getNationDepart() {
		return nationDepart;
	}

	public void setNationDepart(String nationDepart) {
		this.nationDepart = nationDepart;
	}

	public String getNationArrival() {
		return nationArrival;
	}

	public void setNationArrival(String nationArrival) {
		this.nationArrival = nationArrival;
	}

	public String getAirImgName() {
		return airImgName;
	}

	public void setAirImgName(String airImgName) {
		this.airImgName = airImgName;
	}

	public String getAirName() {
		return airName;
	}

	public void setAirName(String airName) {
		this.airName = airName;
	}

	public int getAirPrice() {
		return airPrice;
	}

	public void setAirPrice(int airPrice) {
		this.airPrice = airPrice;
	}

	public String getAirCom() {
		return airCom;
	}

	public void setAirCom(String airCom) {
		this.airCom = airCom;
	}

	public Date getAirDepart() {
		return airDepart;
	}

	public void setAirDepart(Date airDepart) {
		this.airDepart = airDepart;
	}

	public Date getAirArrival() {
		return airArrival;
	}

	public void setAirArrival(Date airArrival) {
		this.airArrival = airArrival;
	}

	public String getStartTime() {
		return startTime;
	}


	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}


	public String getArriveTime() {
		return arriveTime;
	}


	public void setArriveTime(String arriveTime) {
		this.arriveTime = arriveTime;
	}


	@Override
	public String toString() {
		return "Air [airCode=" + airCode + ", nationDepart=" + nationDepart + ", nationArrival=" + nationArrival
				+ ", airImgName=" + airImgName + ", airName=" + airName + ", airPrice=" + airPrice + ", airCom="
				+ airCom + ", airDepart=" + airDepart + ", airArrival=" + airArrival + ", startTime=" + startTime
				+ ", arriveTime=" + arriveTime + "]";
	}


	
	
	
	
}
