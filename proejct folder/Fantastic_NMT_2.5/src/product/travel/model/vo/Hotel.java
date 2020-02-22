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
	private String hotelImg;	  //이미지코드
	private String hotelName;     //호텔명
	private int hoelPrice;       //가격 
	private String hotelAddr;     //주소
	private String hotelLink;     //호텔사이트주소
	private int hotelScore;		  //호텔평점
	private String[] imgArr;
	
	public Hotel() {
		super();
	}

	

	public Hotel(String hotelCode, String nationCode, String distanceLevel, String hotelImg, String hotelName,
			int hoelPrice, String hotelAddr, String hotelLink, int hotelScore, String[] imgArr) {
		super();
		this.hotelCode = hotelCode;
		this.nationCode = nationCode;
		this.distanceLevel = distanceLevel;
		this.hotelImg = hotelImg;
		this.hotelName = hotelName;
		this.hoelPrice = hoelPrice;
		this.hotelAddr = hotelAddr;
		this.hotelLink = hotelLink;
		this.hotelScore = hotelScore;
		this.imgArr = imgArr;
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

	public String getHotelImg() {
		return hotelImg;
	}

	public void setHotelImg(String hotelImg) {
		this.hotelImg = hotelImg;
	}

	public String getHotelName() {
		return hotelName;
	}

	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}

	public int getHoelPrice() {
		return hoelPrice;
	}

	public void setHoelPrice(int hoelPrice) {
		this.hoelPrice = hoelPrice;
	}

	public String getHotelAddr() {
		return hotelAddr;
	}

	public void setHotelAddr(String hotelAddr) {
		this.hotelAddr = hotelAddr;
	}

	public String getHotelLink() {
		return hotelLink;
	}

	public void setHotelLink(String hotelLink) {
		this.hotelLink = hotelLink;
	}

	public int getHotelScore() {
		return hotelScore;
	}

	public void setHotelScore(int hotelScore) {
		this.hotelScore = hotelScore;
	}
	
	

	public String[] getImgArr() {
		return imgArr;
	}



	public void setImgArr(String[] imgArr) {
		this.imgArr = imgArr;
	}



	@Override
	public String toString() {
		return "Hotel [hotelCode=" + hotelCode + ", nationCode=" + nationCode + ", distanceLevel=" + distanceLevel
				+ ", hotelImg=" + hotelImg + ", hotelName=" + hotelName + ", hoelPrice=" + hoelPrice + ", hotelAddr="
				+ hotelAddr + ", hotelLink=" + hotelLink + ", hotelScore=" + hotelScore + ", imgArr="
				+ Arrays.toString(imgArr) + "]";
	}



	
	
	
	
	
}
