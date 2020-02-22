package product.travel.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.travel.model.service.HotelService;
import product.travel.model.vo.Hotel;

/**
 * @author Minhee
 * 생성날짜 0211
 * 생성목적 호텔 보러가기 클릭하면 해당 호텔코드에 해당하는 호텔 상세정보페이지 보러가기
 */
@WebServlet("/travelpackage/hotelContentView")
public class HotelContentViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HotelContentViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//파라미터핸들링
		String htlCode = request.getParameter("hotelCode");
		//System.out.println("서블릿에서의 hotelCode="+htlCode);
		//업무처리
		Hotel h = new HotelService().selectOne(htlCode);
		//view단으로
		String view = "";
		
		if(h != null) {
			view = "/WEB-INF/views/travelpackage/hotelContentPage.jsp";
			request.setAttribute("hotel", h);
			System.out.println("hotel@servlet="+h);
		}
		else {
			view = "/WEB-INF/views/common/msg.jsp";
			String loc = "/";
			String msg = "해당 호텔은 존재하지 않습니다.";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
		}
		
		request.getRequestDispatcher(view)
			   .forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
