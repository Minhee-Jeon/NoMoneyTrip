package product.travel.model.service;

import java.sql.Connection;
import java.util.List;

import static common.JDBCTemplate.*;

import product.travel.model.dao.HotelDAO;
import product.travel.model.vo.Hotel;
/**
 * @author Minhee
	만든날짜 : 200211
	목적 : 호텔관련서비스단
	
	보라
	메인기능: 사용자가 선택한호텔 insert
	
 *
 */
public class HotelService {
	//0211 민희 - 나라별 가장 싼 호텔 찾기
	public List<Hotel> selectCheapestHotel() {
		Connection conn = getConnection();
		List<Hotel> hList = new HotelDAO().selectCheapestHotel(conn);
		close(conn);
		return hList;
	}

	public int insertHotel(String packageCode, String hotelCode, String hotelArr, int a) {
		Connection conn = getConnection();
		int hotelResult = new HotelDAO().insertHotel(conn,packageCode, hotelCode,hotelArr, a);
		if(hotelResult>0)commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return hotelResult;
	}

	public List<Hotel> selectPackageHotelList(String memberCode) {
		Connection conn = getConnection();
		List<Hotel> list = new HotelDAO().selectPackageHotelList(conn, memberCode);
		close(conn);
		return list;
	}
	
	public Hotel selectOne(String htlCode) {
		Connection conn = getConnection();
		Hotel h = new HotelDAO().selectOne(conn, htlCode);
		close(conn);
		return h;
	}



}
