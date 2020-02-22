package board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import board.model.service.noticeService;
import board.model.vo.Review;

/**
 * @author Minhee
 * 생성날짜 0212
 * 생성목적 : 메인화면 조회수 Top3 리뷰글 찾기
 */
@WebServlet("/board/mainViewReview.do")
public class MainviewReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public MainviewReviewServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("서블릿에는 간다!!!!");
		List<Review> rList = new noticeService().selectMostViewReview();
		
		JSONArray jsonArr = new JSONArray();
		
		for(Review r : rList) {
			JSONObject jsonob = new JSONObject();
			jsonob.put("boardTItle", r.getBoardTItle());
			jsonob.put("boardContent", r.getBoardContent());
			jsonob.put("boardOrigin", r.getBoardOrigin());
			jsonob.put("boardReadcnt", r.getBoardReadcnt());
			jsonob.put("boardNo", r.getBoardNo());
			System.out.println(r.getBoardNo());
			jsonArr.add(jsonob);
		}
		
		//응답객체에 쓰기
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.write(jsonArr.toJSONString());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
