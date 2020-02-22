package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.noticeService;
import board.model.vo.Notice;

/**
 * Servlet implementation class noticeUpdateServlet
 * 만든이 : 여주
 * 만든날짜 : 200209
 * 만든 목적 : 공지사항 수정 페이지로 넘어가는 서블릿
 */
@WebServlet("/board/noticeUpdate")
public class noticeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public noticeUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1.파라미터 핸들링
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
//		System.out.println("notice@servlet="+boardNo);
		
		//2.업무로직
		Notice notice = new noticeService().selectOne(boardNo);

		//3.뷰단처리
		request.setAttribute("notice", notice);
		request.getRequestDispatcher("/WEB-INF/views/board/notice/noticeUpdate.jsp").forward(request, response);;
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
