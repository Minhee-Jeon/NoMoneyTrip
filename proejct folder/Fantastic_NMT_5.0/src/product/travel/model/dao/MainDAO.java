package product.travel.model.dao;

import static common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import board.model.dao.NoticeDAO;
import product.travel.model.vo.Air;
import product.travel.model.vo.Hotel;
import product.travel.model.vo.Package;
import product.travel.model.vo.Place;


public class MainDAO {

private Properties prop = new Properties();
	
	public MainDAO() {
		try {		
			String fileName = MainDAO.class.getResource("/sql/travelpackage/main-query.properties").getPath();
			prop.load(new FileReader(fileName));
		}catch(FileNotFoundException e) {
			e.printStackTrace();
		}catch(IOException e) {
			e.printStackTrace();
		}
	}

	public List<Air> selectStart(Air air, Connection conn) {
		List<Air> airlist = new ArrayList<Air>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectStart");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setDate(1, air.getAirDepart());
			pstmt.setString(2, air.getNationDepart());
			pstmt.setString(3, air.getNationArrival());
			rset = pstmt.executeQuery();
			System.out.println(query);
			System.out.println("DAO="+air.getAirArrival());
			
			while(rset.next()) {
				Air a = new Air();
				a.setAirCode(rset.getString("AIR_CODE"));
				a.setNationDepart(rset.getString("NATION_DEPART"));
				a.setNationArrival(rset.getString("NATION_ARRIVAL"));
				a.setAirName(rset.getString("AIR_NAME"));
				a.setAirPrice(rset.getInt("AIR_PRICE"));
				a.setAirDepart(rset.getDate("AIR_DEPART"));
				a.setAirArrival(rset.getDate("AIR_ARRIVAL"));
				a.setAirImgName(rset.getString("AIR_COM")+".png");
				a.setStartTime(rset.getString("str"));
				a.setArriveTime(rset.getString("end"));
				
				
				airlist.add(a);
			}
			
			System.out.println("start@DAO="+airlist);
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return airlist;
	}

	public List<Air> selectEnd(Air air, Connection conn) {
		List<Air> airlist = new ArrayList<Air>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectStart");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setDate(1, air.getAirArrival());
			pstmt.setString(2, air.getNationArrival());
			pstmt.setString(3, air.getNationDepart());
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Air a = new Air();
				a.setAirCode(rset.getString("AIR_CODE"));
				a.setNationDepart(rset.getString("NATION_DEPART"));
				a.setNationArrival(rset.getString("NATION_ARRIVAL"));
				a.setAirName(rset.getString("AIR_NAME"));
				a.setAirPrice(rset.getInt("AIR_PRICE"));
				a.setAirDepart(rset.getDate("AIR_DEPART"));
				a.setAirArrival(rset.getDate("AIR_ARRIVAL"));
				a.setAirImgName(rset.getString("AIR_COM")+".png");
				a.setStartTime(rset.getString("str"));
				a.setArriveTime(rset.getString("end"));
				
				airlist.add(a);
			}
			System.out.println("end@DAO="+airlist);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		return airlist;
	}

	public List<Hotel> selectHotel(String arrive, Connection conn) {
		List<Hotel> hotelList = new ArrayList<Hotel>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectHotel");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, arrive);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Hotel h = new Hotel();
				h.setHotelCode(rset.getString("HOTEL_CODE"));
				h.setNationCode(rset.getString("NATION_CODE"));
				h.setDistanceLevel(rset.getString("DISTANCE_LEVEL"));
				h.setHotelName(rset.getString("HOTEL_NAME"));
				h.setHotelPrice(rset.getInt("HOTEL_PRICE"));
				h.setHotelAddr(rset.getString("HOTEL_ADDR"));
				h.setHotelScore(rset.getDouble("HOTEL_SCORE"));
				h.setHotelImg(rset.getString("HOTEL_CODE")+".1.jpg");
				
				hotelList.add(h);
			}
			System.out.println("hotelList@DAO="+hotelList);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return hotelList;
	}

	public List<Place> selectPlace(String arrive, Connection conn) {
		List<Place> placeList = new ArrayList<Place>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectPlace");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, arrive);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Place p = new Place();
				p.setPlaceCode(rset.getString("PLACE_CODE"));
				p.setNationCode(rset.getString("NATION_CODE"));
				p.setDistanceLevel(rset.getString("DISTANCE_LEVEL"));
				p.setPlaceName(rset.getString("PLACE_NAME"));
				p.setPlacePrice(rset.getInt("PLACE_PRICE"));
				p.setPlaceAddr(rset.getString("PLACE_ADDR"));
				p.setPlaceLink(rset.getString("PLACE_LINK"));
				p.setPlaceImg(rset.getString("PLACE_CODE")+".jpg");
				
				placeList.add(p);
			}
			System.out.println("placeList@DAO="+placeList);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return placeList;
	}

	public int insertPackage(Connection conn, String memberCode, String packageCode) {
		PreparedStatement pstmt = null;
		int packageResult = 0;
		
		String query = "insert into nmt_package values (?, ?, default, 0)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, packageCode);
			pstmt.setString(2, memberCode);
			packageResult = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		System.out.println("nmt_package성공");
		return packageResult;
	}

	public int insertPackageListPlace(Connection conn, String packageCode, String placeCode) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into NMT_PACKAGELIST (package_code, place_code) values (?,?)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, packageCode);
			pstmt.setString(2, placeCode);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		System.out.println("관광지 성공");
		return result;
	}

	public int insertPackageListAirDepart(Connection conn, String packageCode, String airCode) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into NMT_PACKAGELIST (PACKAGE_CODE  ,AIR_CODE_DEPART) values (?,?)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, packageCode);
			pstmt.setString(2, airCode);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		System.out.println("비행기 성공");
		return result;
	}

	public int insertPackageListHotel(Connection conn, String packageCode, String hotelCode) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into NMT_PACKAGELIST (package_code,HOTEL_CODE ) values (?,?)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, packageCode);
			pstmt.setString(2, hotelCode);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		System.out.println("호텔 성공");
		return result;
	}

	public int insertPackageListAirArrive(Connection conn, String packageCode, String arriveAirCode) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into NMT_PACKAGELIST (PACKAGE_CODE  ,AIR_CODE_ARRIVE) values (?,?)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, packageCode);
			pstmt.setString(2, arriveAirCode);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		System.out.println("비행기 성공");
		return result;
	}

	public Air selectPackageAirDepart(Connection conn, String memberCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Air air = null;
//		String query = "select * from nmt_air where air_code (select air_code_depart from nmt_packagelist where package_code like ? and air_code_depart is not null)";
		String query = "select * from nmt_air where air_code in (select AIR_CODE_DEPART from NMT_PACKAGELIST where substr(PACKAGE_CODE,1,8) = ? and AIR_CODE_DEPART is not null)";
		System.out.println(memberCode);
//		memberCode = "'%'"+memberCode+"'%'";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberCode);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				System.out.println("실행"  + query);
				air = new Air();
				air.setAirCode(rset.getString("AIR_CODE"));
				air.setNationDepart(rset.getString("NATION_DEPART"));
				air.setNationArrival(rset.getString("NATION_ARRIVAL"));
				air.setAirName(rset.getString("AIR_NAME"));
				air.setAirPrice(rset.getInt("AIR_PRICE"));
				air.setAirDepart(rset.getDate("AIR_DEPART"));
				air.setAirArrival(rset.getDate("AIR_ARRIVAL"));
				air.setAirImgName(rset.getString("AIR_COM")+".png");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("air = "+air);
		return air;
	}

	public Air selectPackageAirArrive(Connection conn, String memberCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Air air = null;
//		String query = "select * from nmt_air where air_code =(select air_code_depart from nmt_packagelist where package_code like ? and air_code_depart is not null)";
		String query = "select * from nmt_air where air_code in (select AIR_CODE_ARRIVE from NMT_PACKAGELIST where substr(PACKAGE_CODE,1,8) = ? and AIR_CODE_ARRIVE is not null)";
		System.out.println(memberCode);
//		memberCode = "'%'"+memberCode+"'%'";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberCode);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				System.out.println("실행"  + query);
				air = new Air();
				air.setAirCode(rset.getString("AIR_CODE"));
				air.setNationDepart(rset.getString("NATION_DEPART"));
				air.setNationArrival(rset.getString("NATION_ARRIVAL"));
				air.setAirName(rset.getString("AIR_NAME"));
				air.setAirPrice(rset.getInt("AIR_PRICE"));
				air.setAirDepart(rset.getDate("AIR_DEPART"));
				air.setAirArrival(rset.getDate("AIR_ARRIVAL"));
				air.setAirImgName(rset.getString("AIR_COM")+".png");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("air = "+air);
		return air;
	}

	public List<Place> selectPackagePlaceList(Connection conn, String memberCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Place p = null;
		List<Place> list = new ArrayList<Place>();
		String query = "select * from nmt_place where place_code in (select place_code from nmt_packagelist where package_code like ? and place_code is not null)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,"%"+memberCode+"%");
			rset = pstmt.executeQuery();
			while(rset.next()) {
				p = new Place();
				p.setPlaceName(rset.getString("place_name"));
				p.setPlacePrice(rset.getInt("place_price"));
				p.setPlaceImg(rset.getString("place_code")+".jpg");
				
				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println(list);
		return list;
	}

	
	
	
	
}
