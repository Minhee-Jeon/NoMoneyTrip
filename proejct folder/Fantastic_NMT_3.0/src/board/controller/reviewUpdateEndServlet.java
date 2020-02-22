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
 * Servlet implementation class reviewUpdateEndServlet
 */
@WebServlet("/board/reviewUpdateEnd")
public class reviewUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public reviewUpdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//1.saveDirectory: 업로드한 파일의 절대경로
		String saveDirectory = getServletContext().getRealPath("/upload/board");
		System.out.println("saveDirectory@updateEnd="+saveDirectory);
					
		//2.maxPostSize: 업로드한 파일 최대크기 10MB 1kb*1024*10
		int maxPostSize = 1024 * 1024 * 10;
						
		//3.encoding: UTF-8
		String encoding = "utf-8";
				
		//4.fileRenamePolicy: 중복파일 리네임 정책 DefaultFileRenamePolicy a.txt, a1.txt, a2.txt,... 
		FileRenamePolicy fileRenamePolicy = new DefaultFileRenamePolicy();
				
		MultipartRequest multiReq = new MultipartRequest(request,saveDirectory,maxPostSize,encoding,fileRenamePolicy);
				
		int boardNo = Integer.parseInt(multiReq.getParameter("boardNo"));
		String boardTItle = multiReq.getParameter("reviewTitle");
		String boardContent = multiReq.getParameter("reviewContent");
		
		//사용자가 업로드한 파일명
		String boardOrigin = multiReq.getOriginalFileName("upFile");
		//실제 저장된 파일명
		String boardRename = multiReq.getFilesystemName("upFile");
				
		Review r = new Review(boardNo, 0, "B1", boardTItle, boardContent, boardOrigin, boardRename, null, 0, 1, 0);
		System.out.println("reviewUpdate:before@servlet="+r);
				
		//기존첨부파일 정보
		String oldOriginalFileName
			= multiReq.getParameter("oldOriginalFileName");
		String oldRenamedFileName
			= multiReq.getParameter("oldRenamedFileName");
		
		//기존첨부파일이 존재하고, 새로 파일을 첨부하지 않은 경우
		if(!"".equals(oldOriginalFileName)) {
			//업로드한 파일객체 
			File f = multiReq.getFile("upFile");
			if(f == null) {
				r.setBoardOrigin(boardOrigin);
				r.setBoardRename(boardRename);
			}
		}
		
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
