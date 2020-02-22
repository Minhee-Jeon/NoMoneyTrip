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
				h.setHotelScore(rset.getInt("HOTEL_SCORE"));
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
	
	
	
	
}
