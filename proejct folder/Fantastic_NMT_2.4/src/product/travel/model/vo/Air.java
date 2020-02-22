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
	private String airImg;			//이미지코드
	private String airName;			//편명
	private int airPrice;			//가격
	private String airCom;			//항공사
	private Date airDepart;			//출발시간
	private Date airArrival;		//도착시간
	private String[] imgArr;
	
	public Air() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Air(String airCode, String nationDepart, String nationArrival, String airImg, String airName, int airPrice,
			String airCom, Date airDepart, Date airArrival, String[] imgArr) {
		super();
		this.airCode = airCode;
		this.nationDepart = nationDepart;
		this.nationArrival = nationArrival;
		this.airImg = airImg;
		this.airName = airName;
		this.airPrice = airPrice;
		this.airCom = airCom;
		this.airDepart = airDepart;
		this.airArrival = airArrival;
		this.imgArr = imgArr;
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

	public String getAirImg() {
		return airImg;
	}

	public void setAirImg(String airImg) {
		this.airImg = airImg;
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

	public String[] getImgArr() {
		return imgArr;
	}

	public void setImgArr(String[] imgArr) {
		this.imgArr = imgArr;
	}

	@Override
	public String toString() {
		return "Air [airCode=" + airCode + ", nationDepart=" + nationDepart + ", nationArrival=" + nationArrival
				+ ", airImg=" + airImg + ", airName=" + airName + ", airPrice=" + airPrice + ", airCom=" + airCom
				+ ", airDepart=" + airDepart + ", airArrival=" + airArrival + ", imgArr=" + Arrays.toString(imgArr)
				+ "]";
	}

	
	
	
}
