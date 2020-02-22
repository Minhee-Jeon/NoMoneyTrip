package product.travel.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;
import java.util.Random;

import static common.JDBCTemplate.*;

import product.travel.model.vo.Hotel;
/**
 * @author Minhee
	만든날짜 : 200211
	목적 : 호텔관련DAO
 *
 */

public class HotelDAO {
	
private Properties prop = new Properties();
	
	public HotelDAO() {
		
		String fileName = HotelDAO.class.getResource("/sql/travelpackage/hotel-query.properties")
										 .getPath();
		
		try {
			
			prop.load(new FileReader(fileName));
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	//0211 민희 - 나라별 가장 싼 호텔 찾기
	public List<Hotel> selectCheapestHotel(Connection conn) {
		List<Hotel> hList = new ArrayList<Hotel>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Hotel h = null;
		String query = prop.getProperty("selectCheapestHotel");
		//System.out.println("가장싼호텔query="+query);
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				h = new Hotel();
				h.setHotelCode(rset.getString("hotel_code"));
				h.setHotelName(rset.getString("hotel_name"));
				h.setNationCode(rset.getString("nation_code"));
				h.setDistanceLevel(rset.getString("dis_city"));
				h.setHotelPrice(rset.getInt("hotel_price"));
				
				
				hList.add(h);
			}
			//System.out.println("dao최저가호텔 = "+hList); 뽑힌다!!
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return hList;
	}
	public int insertHotel(Connection conn, String packageCode, String hotelCode, String hotelArr, int a) {
		
		int hotelResult = 0;
		PreparedStatement pstmt = null;
		String newCode = hotelCode+"-"+packageCode+"-"+a;
		String query = prop.getProperty("insertHotel");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, newCode);	
			pstmt.setString(2, hotelArr);
			hotelResult = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("호텔리스트 성공");
		
		return hotelResult;
	}
	
	
	public List<Hotel> selectPackageHotelList(Connection conn, String memberCode) {
		List<Hotel> list = new ArrayList<Hotel>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Hotel h = null;
		String query = prop.getProperty("selectPackageHotelList");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%"+memberCode+"%");
			rset = pstmt.executeQuery();
			while(rset.next()) {
				h = new Hotel();
				h.setHotelCode(rset.getString("hotel_code"));
				h.setHotelName(rset.getString("hotel_name"));
				h.setNationCode(rset.getString("nation_code"));
				h.setHotelDays(rset.getInt("hotel_days"));
				h.setHotelPrice(rset.getInt("hotel_price"));
				System.out.println(h);
				list.add(h);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		System.out.println(list);
		
		return list;
	}

	//0212 민희 - 호텔코드에 해당하는 호텔 찾기
	public Hotel selectOne(Connection conn, String htlCode) {
		Hotel h = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectOne");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, htlCode);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				h = new Hotel();
				h.setHotelCode(rset.getString("hotel_code"));
				h.setHotelName(rset.getString("hotel_name"));
				h.setNationCode(rset.getString("nation_code"));
				h.setDistanceLevel(rset.getString("dis_city"));
				h.setHotelPrice(rset.getInt("hotel_price"));
				h.setHotelAddr(rset.getString("hotel_addr"));
				h.setHotelScore(rset.getDouble("hotel_score"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return h;
	}
}


