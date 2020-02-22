package member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.service.MileService;
import member.model.vo.Member;
import member.model.vo.Mile;

/**
 * @author Minhee
 * 생성날짜 0213
 * 생성목적 : 마일리지 팝업창으로 이동하는 서블릿
 */
@WebServlet(name = "ViewMileServlet", urlPatterns = { "/member/viewMile" })
public class ViewMileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ViewMileServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mcode = request.getParameter("mcode");
		System.out.println("서블릿의 mcode="+mcode);
		//업무처리
		Member m = new MemberService().selectOne(mcode);
		List<Mile> mList = new MileService().selectListWithMcode(mcode);
		System.out.println("서블릿의 마일리지리스트="+mList);
		
		if(m != null) {
		
		request.setAttribute("member", m);
		request.setAttribute("mList", mList);
		request.getRequestDispatcher("/WEB-INF/views/member/viewMile.jsp").forward(request, response);
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
