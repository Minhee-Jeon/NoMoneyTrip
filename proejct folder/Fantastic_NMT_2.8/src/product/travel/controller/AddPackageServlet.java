package product.travel.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Minhee
 * 생성날짜 200210
 * 생성목적 main jsp에서 제출한 항공/호텔/관광지 받아오기
 */
@WebServlet("/main/addPackageServlet")
public class AddPackageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPackageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//파라미터 핸들링
		//항공 파라미터 - 출발편
		String[] airName = request.getParameterValues("airName");
//		String airTime_start = request.getParameter("airTime_start");
//		String airTime_end = request.getParameter("airTime_end");
//		String airDepart = request.getParameter("airDepart");
//		String airArrival = request.getParameter("airArrival");
//		int airPrice = Integer.parseInt(request.getParameter("airPrice"));
		//항공 파라미터 - 도착편
		String airName_ = request.getParameter("airName_");
		
		System.out.println("packageServlet@air="+ Arrays.toString(airName) ); //radio의 value 세개 다 가져와버림
		System.out.println("packageServlet@air_="+ airName_ ); //뭘 선택하든 airName / airName_ 첫 value값만 출력됨
		
		
		//호텔 파라미터 
		
		//관광지 파라미터
		String[] placeArr = request.getParameterValues("packplace");
		System.out.println(Arrays.toString(placeArr)); //얘는 잘 불러와짐
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
