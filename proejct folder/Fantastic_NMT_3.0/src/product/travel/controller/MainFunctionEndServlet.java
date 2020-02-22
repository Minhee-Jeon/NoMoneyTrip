package product.travel.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.travel.model.vo.Air;
import product.travel.model.vo.Hotel;
import product.travel.model.vo.Place;
import product.travel.model.service.MainService;
/**
 * @author 형철
 * 작성일 : 02.11
 * 내용 : 메인기능페이지에서 검색값을가져와 항공권,호텔,관광지 뿌려줄 DB다녀오기
 *
 */


@WebServlet("/mainfunction/mainfunctionEndServlet")
public class MainFunctionEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MainFunctionEndServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String depart = request.getParameter("depart");
		String arrive = request.getParameter("arrive");
		String price = request.getParameter("price");
		
		
		
		Date startD;
		Date endD;
		String updatearrive = "";
		
		if("england, gb".equals(arrive)) {
			int idx = arrive.indexOf(",");
			updatearrive = arrive.substring(0,idx);
		}else {
			updatearrive = arrive;
		}
		
		if(!"".equals(startDate)) {
			startD = Date.valueOf(startDate);
		}else {
			startD = null;
		}
		if(!"".equals(endDate)) {
			endD = Date.valueOf(endDate);
		}else {
			endD = null;
		}
		
		Air air = new Air(null, depart, updatearrive, null, null, 0, null, startD, endD,null,null); 
		//출발항공권
		List<Air> startAir = new MainService().selectStart(air);
		//도착항공권
		List<Air> endAir = new MainService().selectEnd(air);
		//호텔,숙소
		List<Hotel> hotellist = new MainService().selectHotel(updatearrive);
		//관광지
		List<Place> placelist = new MainService().selectPlace(updatearrive); 
		
		request.setAttribute("startAir", startAir);
		request.setAttribute("endAir", endAir);
		request.setAttribute("hotellist", hotellist);
		request.setAttribute("placelist", placelist);
		request.setAttribute("depart", depart);
		request.setAttribute("arrive", arrive);
		request.setAttribute("price", price);
		request.setAttribute("startDate", startDate);
		request.setAttribute("endDate", endDate);
		
		request.getRequestDispatcher("/WEB-INF/views/travelpackage/mainfunction.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
