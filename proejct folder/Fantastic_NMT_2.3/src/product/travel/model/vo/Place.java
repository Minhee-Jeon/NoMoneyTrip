package product.travel.model.vo;

import java.sql.Date;
import java.util.Arrays;

/**
 * @author Minhee
 * 생성날짜 0210
 * 생성목적 : 관광지 객체클래스
 */
public class Place {
	private String placeCode;	  //상품코드
	private String nationCode;	  //국가코드
	private String distanceLevel; //거리정보코드
	private String placeImg;	  //이미지코드
	private String placeName;     //관광지명
	private int placePrice;       //가격 (입장료/이용권)
	private String placeAddr;     //주소
	private String placeLink;     //관광지사이트주소
	private String[] imgArr;
	
	public Place() {
		super();
	}

	

	public Place(String placeCode, String nationCode, String distanceLevel, String placeImg, String placeName,
			int placePrice, String placeAddr, String placeLink, String[] imgArr) {
		super();
		this.placeCode = placeCode;
		this.nationCode = nationCode;
		this.distanceLevel = distanceLevel;
		this.placeImg = placeImg;
		this.placeName = placeName;
		this.placePrice = placePrice;
		this.placeAddr = placeAddr;
		this.placeLink = placeLink;
		this.imgArr = imgArr;
	}



	public String getPlaceCode() {
		return placeCode;
	}

	public void setPlaceCode(String placeCode) {
		this.placeCode = placeCode;
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

	public String getPlaceImg() {
		return placeImg;
	}

	public void setPlaceImg(String placeImg) {
		this.placeImg = placeImg;
	}

	public String getPlaceName() {
		return placeName;
	}

	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}

	public int getPlacePrice() {
		return placePrice;
	}

	public void setPlacePrice(int placePrice) {
		this.placePrice = placePrice;
	}

	public String getPlaceAddr() {
		return placeAddr;
	}

	public void setPlaceAddr(String placeAddr) {
		this.placeAddr = placeAddr;
	}

	public String getPlaceLink() {
		return placeLink;
	}

	public void setPlaceLink(String placeLink) {
		this.placeLink = placeLink;
	}
	
	

	public String[] getImgArr() {
		return imgArr;
	}



	public void setImgArr(String[] imgArr) {
		this.imgArr = imgArr;
	}



	@Override
	public String toString() {
		return "Place [placeCode=" + placeCode + ", nationCode=" + nationCode + ", distanceLevel=" + distanceLevel
				+ ", placeImg=" + placeImg + ", placeName=" + placeName + ", placePrice=" + placePrice + ", placeAddr="
				+ placeAddr + ", placeLink=" + placeLink + ", imgArr=" + Arrays.toString(imgArr) + "]";
	}



	
	
	
	
}
