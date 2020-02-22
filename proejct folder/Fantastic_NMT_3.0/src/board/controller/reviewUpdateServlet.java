package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import board.model.service.noticeService;
import board.model.vo.Review;

/**
 * Servlet implementation class reviewUpdateServlet
 */
@WebServlet("/board/reviewUpdate")
public class reviewUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public reviewUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//1.파라미터 핸들링
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		System.out.println("boardNo@update="+boardNo);
		
		//2.업무로직
		Review review = new noticeService().selectOneReview(boardNo);
		
		//3.뷰단처리
		request.setAttribute("review", review);
		request.getRequestDispatcher("/WEB-INF/views/board/review/reviewUpdate.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
