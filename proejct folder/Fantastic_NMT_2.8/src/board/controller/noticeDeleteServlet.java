package board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.noticeService;

/**
 * Servlet implementation class noticeDeleteServlet
 * 
 * 만든이 : 여주
 * 만든날짜 : 200209
 * 만든 목적 : 공지사항 삭제 서블릿
 */
@WebServlet("/board/noticeDelete")
public class noticeDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public noticeDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1.파라미터 핸들링
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		//2.업무로직
		int result = new noticeService().deleteNotice(boardNo);
		
		//3.뷰단 처리
		String view = "/WEB-INF/views/common/msg.jsp";
		String msg = "";

		String loc = "/board/noticeList";

		if(result>0)
			msg = "게시글 삭제 성공하였습니다";
			
		else 
			msg = "게시글 삭제 실패";	
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		
		RequestDispatcher reqDispatcher = request.getRequestDispatcher(view);
		reqDispatcher.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
