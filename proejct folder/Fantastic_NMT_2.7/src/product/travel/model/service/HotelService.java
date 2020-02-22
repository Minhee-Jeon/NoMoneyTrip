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

}
