package common.buy;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.service.MileService;

/**
 * Servlet implementation class memberMile
 */
@WebServlet("/buy/memberMile.do")
public class memberMile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public memberMile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("사용자 이름:"+request.getParameter("userId"));
		System.out.println("사용자 계산한 가격:"+request.getParameter("price"));
		String memberCode = request.getParameter("userId");
		int pricePackage = Integer.parseInt(request.getParameter("price"));
		
		int result = new MileService().insertMile(memberCode, pricePackage);
		
		if(result > 0 ) {
			System.out.println("적립성공");			
		}else {
			System.out.println("적립실패");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
