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
 * Servlet implementation class noticeViewServlet
 * 
 * 만든이 : 여주
 * 만든날짜 : 200208
 * 만든 목적 : 공지사항 해당 페이지로 보여지는 서블릿
 */
@WebServlet("/board/noticeView")
public class noticeViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public noticeViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1.파라미터 핸들링
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		
		//System.out.println("boardNo="+boardNo);
		
		//2.뷰단처리
		Notice notice = new noticeService().selectOne(boardNo);
		String content = notice.getBoardContent();
		System.out.println("content+++"+content);
		String[] contents = content.split("å");
		request.setAttribute("contents", contents);
		
		//3.view단 처리:
		String view = "";
		if(notice == null){
			request.setAttribute("msg", "조회한 게시글이 존재하지 않습니다.");
			request.setAttribute("loc", "/board/noticeList");
			view = "/WEB-INF/views/common/msg.jsp";
		}
		else {
			view = "/WEB-INF/views/board/notice/noticeView.jsp";			
		}
		request.setAttribute("notice", notice);
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
