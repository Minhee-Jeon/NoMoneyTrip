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
 * Servlet implementation class noticeUpdateEndServlet
 * 만든이 : 여주
 * 만든날짜 : 200209
 * 만든 목적 : 공지사항 수정 서블릿
 */
@WebServlet("/board/noticeUpdateEnd")
public class noticeUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public noticeUpdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1.파라미터 핸들링
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		String boardTitle = request.getParameter("noticeTitle");
		String boardContent = request.getParameter("noticeContent");
		
//		System.out.println("boardNo@udpateend="+boardNo);
//		System.out.println("boardtitle@updateend="+boardTitle);
//		System.out.println("boardcontent@updateend="+boardContent);
		
		//2.업무로직
		Notice n = new Notice(boardNo, 00000001, "A1", boardTitle, boardContent, null, null, null, 0);
//		System.out.println("noticeupdate:before@servlet="+n);
		
		int result = new noticeService().updateNotice(n);
		
		//3.뷰단처리
		String msg = result>0?"게시글 수정되었습니다":"게시글 수정 실패";
		String loc = "/board/noticeList";
		
		request.setAttribute("msg", msg);
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
