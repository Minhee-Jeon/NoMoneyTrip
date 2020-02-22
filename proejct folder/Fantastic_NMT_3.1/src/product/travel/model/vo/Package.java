package product.travel.model.vo;

import java.io.Serializable;

public class Package implements Serializable{

	@Override
	public String toString() {
		return "Package [packageCode=" + packageCode + ", airCodeDepart=" + airCodeDepart + ", airCodeArrive="
				+ airCodeArrive + ", hotelCode=" + hotelCode + ", placeCode=" + placeCode + "]";
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String packageCode;
	private String airCodeDepart;
	private String airCodeArrive;
	private String hotelCode;
	private String placeCode;
	
	
	public String getPackageCode() {
		return packageCode;
	}

	public void setPackageCode(String packageCode) {
		this.packageCode = packageCode;
	}

	public String getAirCodeDepart() {
		return airCodeDepart;
	}

	public void setAirCodeDepart(String airCodeDepart) {
		this.airCodeDepart = airCodeDepart;
	}

	public String getAirCodeArrive() {
		return airCodeArrive;
	}

	public void setAirCodeArrive(String airCodeArrive) {
		this.airCodeArrive = airCodeArrive;
	}

	public String getHotelCode() {
		return hotelCode;
	}

	public void setHotelCode(String hotelCode) {
		this.hotelCode = hotelCode;
	}

	public String getPlaceCode() {
		return placeCode;
	}

	public void setPlaceCode(String placeCode) {
		this.placeCode = placeCode;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Package(String packageCode, String airCodeDepart, String airCodeArrive, String hotelCode, String placeCode) {
		super();
		this.packageCode = packageCode;
		this.airCodeDepart = airCodeDepart;
		this.airCodeArrive = airCodeArrive;
		this.hotelCode = hotelCode;
		this.placeCode = placeCode;
	}

	public Package() {
		super();
		// TODO Auto-generated constructor stub
	} 
	
	

}
