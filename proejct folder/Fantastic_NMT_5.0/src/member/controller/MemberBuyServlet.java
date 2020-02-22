package member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;
import product.travel.model.service.HotelService;
import product.travel.model.service.MainService;
import product.travel.model.vo.Air;
import product.travel.model.vo.Hotel;
import product.travel.model.vo.Place;

/**
 * Servlet implementation class MemberBuyServlet
 */
@WebServlet("/member/packagebuy")
public class MemberBuyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberBuyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberCode = request.getParameter("memberCode");

		System.out.println("memberId@servlet=" + memberCode);
		// 업무처리
		Member m = new MemberService().selectOne(memberCode);

		Air airDepart = new MainService().selectPackageAirDepart(memberCode);// 출발비행기
		Air airArrive = new MainService().selectPackageAirArrive(memberCode);// 도착비행기
		List<Hotel> hotelList = new HotelService().selectPackageHotelList(memberCode);// 호텔리스트
		List<Place> placeList = new MainService().selectPackagePlaceList(memberCode);
		List<Hotel> realHotel = new ArrayList<>();

		if (hotelList.size() != 0) {
			for (int i = 0; i < 6; i+=2 ) {
				if (hotelList.get(i).getHotelCode().substring(0, 7).equals(hotelList.get(i+1).getHotelCode().substring(0, 7))) {
					int hotelDay = hotelList.get(i+1).getHotelDays();
					hotelList.get(i).setHotelDays(hotelDay);
					realHotel.add(hotelList.get(i));
				}
			}
		}

		System.out.println(realHotel);
		request.setAttribute("member", m);
		request.setAttribute("airDepart", airDepart);
		request.setAttribute("airArrive", airArrive);
		request.setAttribute("realHotel", realHotel);
		request.setAttribute("placeList", placeList);
		request.getRequestDispatcher("/WEB-INF/views/member/memberMypageBuy.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
