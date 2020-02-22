package board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.noticeService;
import board.model.vo.Notice;
import board.model.vo.QnA;

/***
 * 
 * @author bora
 * Q & A 게시판 글 insert를 위한 Servlet 
 * 
 */

/**
 * Servlet implementation class QnAWriteEndServlet
 */
@WebServlet("/board/qnaWriteEnd")
public class QnAWriteEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnAWriteEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String qnaTitle = request.getParameter("qnaTitle");		
		String qnaContent = request.getParameter("qnaContent");
		int mCode = Integer.parseUnsignedInt(request.getParameter("memberCode")); 
		
		System.out.println("qnaContent= "+qnaContent+"/ qnaTItle= "+qnaTitle+"/ mCode = "+mCode);
		
		QnA q = new QnA(0, mCode, "c1", qnaTitle, qnaContent, null, null, null, 0, 0, 0);
		
		int result = new noticeService().insertQnA(q);
		System.out.println("result@QnAServlet@"+result);
		
		String msg = result>0?"게시글 등록 성공":"게시글 등록 실패";
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
