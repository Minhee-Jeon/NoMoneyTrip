package board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.noticeService;
import board.model.vo.QnA;
/*
 * 보라
 * qna 보여지는 서블릿*/

/**
 * Servlet implementation class QnAViewServlet
 */
@WebServlet("/qna/qnaListView")
public class QnAViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnAViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		System.out.println("DoGet+boardNo = "+boardNo);
		
		QnA oneToOne = new noticeService().selectOneToOne(boardNo);
		System.out.println("oneToOne = " + oneToOne);
		String view = "";
		if(oneToOne == null){
			request.setAttribute("msg", "조회한 게시글이 존재하지 않습니다.");
			request.setAttribute("loc", "/qna/qnaList");
			view = "/WEB-INF/views/common/msg.jsp";
		}
		else {
			view = "/WEB-INF/views/board/qna/qnaView.jsp";			
		}
		request.setAttribute("oneToOne", oneToOne);
		request.getRequestDispatcher(view)
			   .forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
