package product.travel.model.dao;

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

}
