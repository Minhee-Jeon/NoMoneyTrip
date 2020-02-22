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
 * Servlet implementation class QnADeleteServlet
 */
@WebServlet("/qna/qnaDelete")
public class QnADeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnADeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qnaBoardNo = Integer.parseInt(request.getParameter("boardNo"));
		System.out.println("qnaBoardNo = "+qnaBoardNo);
		
		int result = new noticeService().deleteQnA(qnaBoardNo);
		
		String view = "/WEB-INF/views/common/msg.jsp";
		String msg = "";

		String loc = "/qna/qnaList";

		if(result>0)
			msg = "게시글 삭제 성공하였습니다";
			
		else 
			msg = "게시글 삭제 실패";	
		
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
