package product.travel.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import product.travel.model.dao.HotelDAO;
import product.travel.model.dao.MainDAO;
import product.travel.model.vo.Air;
import product.travel.model.vo.Hotel;
import product.travel.model.vo.Package;
import product.travel.model.vo.Place;

public class MainService {

	public List<Air> selectStart(Air air) {
		Connection conn = getConnection();
		List<Air> startAir = new MainDAO().selectStart(air,conn);
		close(conn);
		
		return startAir;
	}

	public List<Air> selectEnd(Air air) {
		Connection conn = getConnection();
		List<Air> endAir = new MainDAO().selectEnd(air,conn);
		close(conn);
		
		return endAir;
	}

	public List<Hotel> selectHotel(String arrive) {
		Connection conn = getConnection();
		List<Hotel> list = new MainDAO().selectHotel(arrive,conn);
		close(conn);
		
		return list;
	}

	public List<Place> selectPlace(String arrive) {
		Connection conn = getConnection();
		List<Place> list = new MainDAO().selectPlace(arrive,conn);
		close(conn);
		
		return list;
	}

	public int insertPackage(String memberCode, String packageCode) {
		Connection conn = getConnection();
		int packageResult = new MainDAO().insertPackage(conn, memberCode,packageCode);
		if(packageResult > 0) commit(conn);
		else rollback(conn);
		close(conn);
		
		return packageResult;
	}

	public int insertPackageListPlace(String packageCode, String placeCode) {
		Connection conn = getConnection();
		int result = new MainDAO().insertPackageListPlace(conn, packageCode, placeCode);
		
		if(result>0)commit(conn);
		else rollback(conn);
		System.out.println("관광지지지지지");
		return result ;
	}

	public int insertPackageListAirDepart(String packageCode, String airCode) {
		Connection conn = getConnection();
		
		int result = new MainDAO().insertPackageListAirDepart(conn, packageCode,airCode);
		if(result>0)commit(conn);
		else rollback(conn);
		System.out.println("비행기기기기기");
		return result ;
	}

	public int insertPackageListHotel(String packageCode, String hotelCode) {
		Connection conn = getConnection();
		
		int result = new MainDAO().insertPackageListHotel(conn, packageCode,hotelCode);
		if(result>0)commit(conn);
		else rollback(conn);
		
		System.out.println("1111");
		return result ;
	}

	public int insertPackageListAirArrive(String packageCode, String arriveAirCode) {
		Connection conn = getConnection();
		
		int result = new MainDAO().insertPackageListAirArrive(conn, packageCode, arriveAirCode);
		if(result>0)commit(conn);
		else rollback(conn);
		System.out.println("비행기기기기기");
		return result ;
	}

	public Air selectPackageAirDepart(String memberCode) {
		Connection conn = getConnection();
		Air air = new MainDAO().selectPackageAirDepart(conn, memberCode);
		close(conn);
		
		return air;
	}

	public Air selectPackageAirArrive(String memberCode) {
		Connection conn = getConnection();
		Air air = new MainDAO().selectPackageAirArrive(conn, memberCode);
		close(conn);
		
		return air;
	}

	public List<Place> selectPackagePlaceList(String memberCode) {
		Connection conn = getConnection();
		List<Place> place = new MainDAO().selectPackagePlaceList(conn, memberCode);
		close(conn);
		return place;
	}

	
	
	
	
	
	
	
	
	
	
	
}
