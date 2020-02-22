package product.travel.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.travel.model.service.HotelService;
import product.travel.model.service.MainService;

/**
 * @author Minhee
 * 생성날짜 200210
 * 생성목적 main jsp에서 제출한 항공/호텔/관광지 받아오기
 * @author 보라보라보라
 * 수정날짜 20200212
 * 수정목적 : 서블릿 완성
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
		//멤버코드
		String memberCode = request.getParameter("memberCode");
		System.out.println("memberCode = "+memberCode );
		//항공 파라미터 - 출발편
		String departAirCode = request.getParameter("airCode");
		String arriveAirCode = request.getParameter("airCode_");
		
		System.out.println(departAirCode);
		System.out.println(arriveAirCode);
		String[] airArr = {departAirCode, arriveAirCode};	
		
		//호텔 파라미터 
		String[] hotelCode = request.getParameterValues("hotelCode");
		System.out.println("hotelCode = "+Arrays.toString(hotelCode));
		String[] hoteldays = (request.getParameterValues("hoteldays"));
		System.out.println(Arrays.toString(hoteldays));
		
		String hotel1 =hotelCode[0]+","+hoteldays[0]+",";
		System.out.println(hotel1);
		
		String hotel2 = hotelCode[1]+","+hoteldays[1]+",";
		System.out.println(hotel2);
		
		String hotel3 = hotelCode[2]+","+hoteldays[2];
		System.out.println(hotel3);
		
		int a[] = new int[3];
		
		Random r = new Random(); 
		for(int i=0;i<3;i++) {
			a[i] = r.nextInt(3)+1; 
			for(int j=0;j<i;j++) {
				if(a[i]==a[j]) { 
					i--; 
					}
				} 
			}
		String hotel = hotel1+hotel2+hotel3;
		System.out.println(hotel);
		String[] hotelArr = hotel.split(",");
		System.out.println(Arrays.toString(hotelArr));
		
		
		//관광지 파라미터
		String[] placeCode = request.getParameterValues("packplace");
		System.out.println(Arrays.toString(placeCode));
		
		SimpleDateFormat format1 = new SimpleDateFormat ("yyyyMMddHHmmss");
		String packageCode = memberCode+"-"+format1.format(new Date());
		System.out.println("memberCode = "+memberCode);
		int packageResult = new MainService().insertPackage(memberCode,packageCode); //o
		int hotelResult1 = new HotelService().insertHotel(packageCode, hotelCode[0],hotelArr[1], a[0]);//o
		int hotelResult2 = new HotelService().insertHotel(packageCode, hotelCode[1],hotelArr[3], a[1]);//o
		int hotelResult3 = new HotelService().insertHotel(packageCode, hotelCode[2],hotelArr[5], a[2]);//o
		//패키지리스트 
		int insertAirDepart = new MainService().insertPackageListAirDepart(packageCode,departAirCode);//o
		int insertAirArrive = new MainService().insertPackageListAirArrive(packageCode,arriveAirCode);
		for(int i=0;i<hotelCode.length;i++) {
			int insertHotel = new MainService().insertPackageListHotel(packageCode, hotelCode[i]);
		}
		for(int i=0; i<placeCode.length;i++) {
			int insertPlace = new MainService().insertPackageListPlace(packageCode, placeCode[i]);
		}
		
		String msg = "패키지가 담겼습니다.";
		String loc = "/";
		request.setAttribute("msg",msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
