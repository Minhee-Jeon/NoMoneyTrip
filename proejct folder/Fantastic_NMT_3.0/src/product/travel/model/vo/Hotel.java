package product.travel.model.vo;

import java.util.Arrays;

/**
 * @author Minhee
 * 생성날짜 0210
 * 생성목적 : 호텔 객체클래스
 */
public class Hotel {
	private String hotelCode;	  //상품코드
	private String nationCode;	  //국가코드
	private String distanceLevel; //거리정보코드
	private String hotelName;     //호텔명
	private int hotelPrice;       //가격 
	private String hotelAddr;     //주소
	private double hotelScore;		  //호텔평점
	private String hotelImg;
	
	public Hotel() {
		super();
	}

	

	public Hotel(String hotelCode, String nationCode, String distanceLevel, String hotelName,
			int hotelPrice, String hotelAddr, double hotelScore, String hotelImg) {
		super();
		this.hotelCode = hotelCode;
		this.nationCode = nationCode;
		this.distanceLevel = distanceLevel;
		this.hotelName = hotelName;
		this.hotelPrice = hotelPrice;
		this.hotelAddr = hotelAddr;
		this.hotelScore = hotelScore;
		this.hotelImg = hotelImg;
	}



	public String getHotelCode() {
		return hotelCode;
	}

	public void setHotelCode(String hotelCode) {
		this.hotelCode = hotelCode;
	}

	public String getNationCode() {
		return nationCode;
	}

	public void setNationCode(String nationCode) {
		this.nationCode = nationCode;
	}

	public String getDistanceLevel() {
		return distanceLevel;
	}

	public void setDistanceLevel(String distanceLevel) {
		this.distanceLevel = distanceLevel;
	}
	public String getHotelName() {
		return hotelName;
	}

	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}
	public String getHotelAddr() {
		return hotelAddr;
	}

	public void setHotelAddr(String hotelAddr) {
		this.hotelAddr = hotelAddr;
	}

	public double getHotelScore() {
		return hotelScore;
	}

	public void setHotelScore(double hotelScore) {
		this.hotelScore = hotelScore;
	}
	
	
	public int getHotelPrice() {
		return hotelPrice;
	}



	public void setHotelPrice(int hotelPrice) {
		this.hotelPrice = hotelPrice;
	}



	public String getHotelImg() {
		return hotelImg;
	}



	public void setHotelImg(String hotelImg) {
		this.hotelImg = hotelImg;
	}



	@Override
	public String toString() {
		return "Hotel [hotelCode=" + hotelCode + ", nationCode=" + nationCode + ", distanceLevel=" + distanceLevel
				+ ", hotelName=" + hotelName + ", hoelPrice=" + hotelPrice + ", hotelAddr="
				+ hotelAddr + ", hotelScore=" + hotelScore + ", hotelImg="
				+ hotelImg + "]";
	}



	
	
	
	
	
}
