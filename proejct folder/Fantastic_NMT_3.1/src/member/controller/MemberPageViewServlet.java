package member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import member.model.service.MemberService;
import member.model.vo.Member;
import product.travel.model.service.HotelService;
import product.travel.model.service.MainService;
import product.travel.model.vo.Air;
import product.travel.model.vo.Hotel;
import product.travel.model.vo.Package;
import product.travel.model.vo.Place;

/**
 * @author Minhee
 * 생성날짜 : 202005
 * 생성목적 : nav의 mypage버튼 클릭시 내정보보기창으로 이동
 */
@WebServlet(urlPatterns = "/member/memberPageView", name = "MemberPageViewServlet")
public class MemberPageViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberPageViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//파라미터핸들링
		String memberCode = request.getParameter("memberCode");
		
		System.out.println("memberId@servlet="+memberCode);
		//업무처리
		Member m = new MemberService().selectOne(memberCode);
		
		Air airDepart = new MainService().selectPackageAirDepart(memberCode);//출발비행기
		Air airArrive = new MainService().selectPackageAirArrive(memberCode);//도착비행기 
		List<Hotel> hotelList = new HotelService().selectPackageHotelList(memberCode);//호텔리스트
		List<Place> placeList = new MainService().selectPackagePlaceList(memberCode);
		
		System.out.println(airDepart+" , "+airArrive+", "+hotelList +", "+placeList);
		//view단으로 ~
		String view = "";
	
		view = "/WEB-INF/views/member/memberMypage.jsp";
		request.setAttribute("member", m);
		System.out.println("member@sevlet="+m);
		
		System.out.println(hotelList);
		
		for(int i=0;i<3;i++) {
			for(int n=3;n<6;n++) {
				if(hotelList.get(i).getHotelCode().substring(0, 7).equals(hotelList.get(n).getHotelCode().substring(0, 7))) {
					int hotelDay = hotelList.get(n).getHotelDays();
					System.out.println(hotelDay);
					hotelList.get(i).setHotelDays(hotelDay);
					System.out.println(hotelList.get(i).getHotelDays());
					System.out.println(hotelList.get(i));
				}				
			}
		}

		
		request.setAttribute("airDepart", airDepart);
		request.setAttribute("airArrive", airArrive);
		request.setAttribute("hotelList", hotelList);
		request.setAttribute("placeList", placeList);
		request.getRequestDispatcher(view).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
