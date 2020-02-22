package board.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import board.model.service.noticeService;
import board.model.vo.Review;

/**
 * Servlet implementation class ReviewUpdateEndServlet
 */
@WebServlet("/board/reviewUpdateEnd")
public class ReviewUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewUpdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String saveDirectory = getServletContext().getRealPath("/upload/board");
		System.out.println("saveDirectory@updateEnd="+saveDirectory);
					
		int maxPostSize = 1024 * 1024 * 10;
						
		String encoding = "utf-8";
		FileRenamePolicy fileRenamePolicy = new DefaultFileRenamePolicy();
				
		MultipartRequest multiReq = new MultipartRequest(request,saveDirectory,maxPostSize,encoding,fileRenamePolicy);
				
		int boardNo = Integer.parseInt(multiReq.getParameter("boardNo"));
		String boardTItle = multiReq.getParameter("reviewTitle");
		String boardContent = multiReq.getParameter("reviewContent");
		String memberCode = multiReq.getParameter("memberCode");
		System.out.println(memberCode+"dgffsdgdsgsdfg");
	
		//XSS 공격 대비 태그기호 치환
		boardContent = boardContent.replaceAll("<", "&lt;")
								   .replaceAll(">", "&gt;")
								   .replaceAll("\\n", "<br>");
		
		
		
		String boardOrigin = multiReq.getOriginalFileName("upFile");
		String boardRename = multiReq.getFilesystemName("upFile");
				
		Review r = new Review(boardNo, memberCode, "b1", boardTItle, boardContent, boardOrigin, boardRename, null, 0, 1, 0);
		System.out.println("reviewUpdate:before@servlet="+r);
				
		
		String oldOriginalFileName
			= multiReq.getParameter("oldOriginalFileName");
		String oldRenamedFileName
			= multiReq.getParameter("oldRenamedFileName");
		
	
		if(!"".equals(oldOriginalFileName)) {
			File f = multiReq.getFile("upFile");
			if(f == null) {
				r.setBoardOrigin(oldOriginalFileName);
				r.setBoardRename(oldRenamedFileName);
			}
		}
		
		System.out.println("r="+r);
		int result = new noticeService().updateReview(r);
		
		System.out.println("updateEnd@servlet="+result);
		
		String msg = result>0?"게시글 수정 성공":"게시글 수정 실패!";
		String loc = "/board/reviewView?boardNo="+r.getBoardNo();
		
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
