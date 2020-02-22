package product.travel.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import product.travel.model.dao.MainDAO;
import product.travel.model.vo.Air;
import product.travel.model.vo.Hotel;
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

	
	
	
	
	
	
	
	
	
	
	
}
