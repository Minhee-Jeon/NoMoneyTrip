package product.travel.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import product.travel.model.service.HotelService;
import product.travel.model.vo.Hotel;

/**
 * @author Minhee
 * 생성날짜 : 0211
 * 생성목적 : index화면에서 n초에 한번 나라별 최저가호텔 볼수 있게 json객체로 주기
 */
@WebServlet("/product/travel/controller/mainViewHotel.do")
public class MainViewHotelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public MainViewHotelServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Hotel> hList = new HotelService().selectCheapestHotel();
		
		JSONArray jsonArr = new JSONArray();
		
		for(Hotel h : hList) {
			JSONObject jsonob = new JSONObject();
			jsonob.put("hotelCode", h.getHotelCode());
			jsonob.put("hotelName", h.getHotelName());
			jsonob.put("nationCode", h.getNationCode());
			jsonob.put("distanceLevel", h.getDistanceLevel());
			jsonob.put("hotelPrice", h.getHotelPrice());
			
			jsonArr.add(jsonob);
		}
		
		//응답객체에 쓰기
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.write(jsonArr.toJSONString());
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
