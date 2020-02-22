package board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.noticeService;
import board.model.vo.QnA;

/**
 * Servlet implementation class QnAReplyEndServlet
 */
@WebServlet("/qna/qnaReplyEnd")
public class QnAReplyEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnAReplyEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardRef = Integer.parseInt(request.getParameter("boardRef"));
		System.out.println("boardRef = "+boardRef);
		
		String qnaReplyTitle = request.getParameter("qnaTitle")+"의 답글";
		String qnaReplyContent = request.getParameter("qnaContent");
		System.out.println(boardRef+","+qnaReplyTitle+", "+qnaReplyContent);
		
		QnA qnaReply = new QnA(0, 000000001, "c1", qnaReplyTitle, qnaReplyContent, null, null, null, 0, 2, boardRef);
		System.out.println(qnaReply+"-----");
		
		int result = new noticeService().insertQnAReply(qnaReply);
		
		String msg = result>0?"답글등록성공!":"답글등록실패!";
		String loc = "/qna/qnaList";
		
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
