package board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.noticeService;
import board.model.vo.Notice;
import board.model.vo.QnA;

/**
 * Servlet implementation class noticeViewServlet
 * 만든이 : 여주
 * 만든날짜 : 200206
 * 만든 목적 : 공지사항 메인 페이지 보여지기 서블릿
 * 
 *수정 : 보라
 *목적: 페이지바 생성, 1:1문의 게시판 보여지기
 */
@WebServlet("/board/noticeList")
public class noticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public noticeListServlet() {
    	super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//1.파라미터 핸들링
		final int numPerPage = 5;//qna5개씩보이기  
		int cPage = 1;
		try{
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch(NumberFormatException e){
		
		}
		
		//2.업무로직
		List<Notice> list = new noticeService().selectNoticeList();
		List<QnA> qnaList = new noticeService().selectQnAList(cPage, numPerPage);
//		System.out.println("list@servlet="+list);
		
		final int totalQnACount = new noticeService().selectQnACount();
		final int totalPage = (int)Math.ceil((double)totalQnACount/numPerPage);
		
		String pageBar = "";
		final int pageBarSize = 5;
		int pageStart = ((cPage - 1)/pageBarSize) * pageBarSize +1;
		int pageEnd = pageStart+pageBarSize-1;
		int pageNo = pageStart;
		if(pageNo == 1 ){
			pageBar += "<span>[이전]</span>"; 
		}
		else {
			pageBar += "<a href='"+request.getContextPath()+"/board/noticeList?cPage="+(pageNo-1)+"'>[이전]</a> ";
		}
			
		// pageNo section
		while(!(pageNo>pageEnd || pageNo > totalPage)){
			
			if(cPage == pageNo ){
				pageBar += "<span class='cPage'>"+pageNo+"</span> ";
			} 
			else {
				pageBar += "<a href='"+request.getContextPath()+"/board/noticeList?cPage="+pageNo+"'>"+pageNo+"</a> ";
			}
			pageNo++;
		}
		
		//[다음] section
		if(pageNo > totalPage){
			pageBar += "<span>[다음]</span>";
		} else {
			pageBar += "<a href='"+request.getContextPath()+"/board/noticeList?cPage="+pageNo+"'>[다음]</a>";
		}
		//view단 처리
		request.setAttribute("list", list);
		request.setAttribute("qnaList", qnaList);
		request.setAttribute("pageBar", pageBar);
		request.getRequestDispatcher("/WEB-INF/views/board/notice/noticeList.jsp")
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
