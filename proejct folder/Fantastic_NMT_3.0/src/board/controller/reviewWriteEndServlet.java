package board.controller;

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
 * Servlet implementation class reviewWriteEndServlet
 */
@WebServlet("/board/reviewWriteEnd")
public class reviewWriteEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public reviewWriteEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1.saveDirectory: 업로드한 파일의 절대경로
		String saveDirectory = getServletContext().getRealPath("/upload/board");
		System.out.println("saveDirectory="+saveDirectory);
			
		//2.maxPostSize: 업로드한 파일 최대크기 10MB 1kb*1024*10
		int maxPostSize = 1024 * 1024 * 10;
				
		//3.encoding: UTF-8
		String encoding = "utf-8";
		
		//4.fileRenamePolicy: 중복파일 리네임 정책 DefaultFileRenamePolicy a.txt, a1.txt, a2.txt,... 
		FileRenamePolicy fileRenamePolicy = new DefaultFileRenamePolicy();
		
		MultipartRequest multiReq = new MultipartRequest(request,saveDirectory,maxPostSize,encoding,fileRenamePolicy);
		
		
		//1.파라미터 핸들링
		String boardTItle = multiReq.getParameter("reviewTitle");
		String boardContent = multiReq.getParameter("reviewContent");
		
		//사용자가 업로드한 파일명
		String boardOrigin = multiReq.getOriginalFileName("upFile");
		//실제 저장된 파일명
		String boardRename = multiReq.getFilesystemName("upFile");
		
		Review r = new Review(0, 0, "B1", boardTItle, boardContent, boardOrigin, boardRename, null, 0, 1, 0);
		System.out.println("review:before@servlet="+r);
		
		//2.업무로직
		int result = new noticeService().insertReview(r);
		System.out.println("review:after@servlet="+r);
		
		//3.뷰단 처리
		String msg = result>0?"게시글 등록 성공":"게시글 등록 실패";
		String loc = "/board/reviewList";
		
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
