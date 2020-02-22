package board.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import board.model.dao.NoticeDAO;
import board.model.vo.Notice;
import board.model.vo.QnA;
import board.model.vo.Review;

public class noticeService {

	public List<Notice> selectNoticeList() {
		Connection conn = getConnection();
		List<Notice> list = new NoticeDAO().selectNoticeList(conn);
		close(conn);
		return list;
	}

	public int insertNotice(Notice n) {
		Connection conn = getConnection();

		int result = new NoticeDAO().insertNotice(conn, n);

		int boardNo = new NoticeDAO().selectLastSeq(conn);
		n.setBoardNo(boardNo);

		if (result > 0)
			commit(conn);
		else
			rollback(conn);

		close(conn);

		return result;
	}

	public Notice selectOne(int boardNo) {

		Connection conn = getConnection();

		Notice notice = new NoticeDAO().selectOne(conn, boardNo);

		close(conn);

		return notice;

	}

	public int updateNotice(Notice n) {

		Connection conn = getConnection();

		int result = new NoticeDAO().updateNotice(conn, n);

		System.out.println("updateservice@=" + result);

		if (result > 0)
			commit(conn);
		else
			rollback(conn);

		close(conn);

		return result;
	}

	public int deleteNotice(int boardNo) {
		Connection conn = getConnection();
		int result = new NoticeDAO().deleteNotice(conn, boardNo);

		if (result > 0)
			commit(conn);
		else
			rollback(conn);

		close(conn);

		return result;

	}

	public int insertQnA(QnA oneToOne) {
		Connection conn = getConnection();
		int result = new NoticeDAO().insertQnA(conn, oneToOne);

		if (result > 0)
			commit(conn);
		else
			rollback(conn);

		close(conn);

		System.out.println("QNAresult@Service" + result);
		return result;

	}

	public List<QnA> selectQnAList(int cPage, int numPage) {
		Connection conn = getConnection();
		List<QnA> qnaList = new NoticeDAO().selectQnAList(conn, cPage, numPage);
		close(conn);

		return qnaList;
	}

	public int selectQnACount() {
		Connection conn = getConnection();
		int cnt = new NoticeDAO().selectCnt(conn);
		close(conn);

		return cnt;
	}

	public QnA selectQnA(int qnaBoardNo) {
		Connection conn = getConnection();

		QnA qna = new NoticeDAO().selectQnA(conn, qnaBoardNo);

		close(conn);

		return qna;
	}

	public int updateQnA(QnA q) {

		Connection conn = getConnection();

		int result = new NoticeDAO().updateQnA(conn, q);
		System.out.println("updateservice@=" + result);

		if (result > 0)
			commit(conn);
		else
			rollback(conn);

		close(conn);

		return result;
	}

	public int deleteQnA(int qnaBoardNo) {
		Connection conn = getConnection();
		int result = new NoticeDAO().deleteQnA(conn, qnaBoardNo);

		if (result > 0)
			commit(conn);
		else
			rollback(conn);

		close(conn);

		return result;
	}

	public List<QnA> selectOneToOneList(int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<QnA> oneToOne = new NoticeDAO().selectOneToOneList(conn, cPage, numPerPage);
		close(conn);

		return oneToOne;
	}

	public QnA selectOneToOne(int boardNo) {
		Connection conn = getConnection();

		QnA oneToOne = new NoticeDAO().selectQnA(conn, boardNo);
		close(conn);

		return oneToOne;

	}

	public int insertQnAReply(QnA qnaReply) {
		Connection conn = getConnection();
		int result = new NoticeDAO().insertQnAReply(conn, qnaReply);
		close(conn);

		return result;
	}

	public List<QnA> selectQnAReply() {
		Connection conn = getConnection();
		List<QnA> reply = new NoticeDAO().selectQnAReply(conn);
		close(conn);
		
		return reply;
	}

	public List<Review> selectReviewList(int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<Review> list = new NoticeDAO().selectReviewList(conn, cPage, numPerPage);
		close(conn);
		return list;
	}

	public int selectReviewCount() {
		Connection conn = getConnection();
		int cnt = new NoticeDAO().selectReviewCount(conn);
		close(conn);

		return cnt;
	}

	public Review selectReview(int boardNo) {
		Connection conn =getConnection();
		Review r = new NoticeDAO().selectReview(conn, boardNo);
		close(conn);
		return r;
	}

	public int insertReview(Review r) {
		Connection conn = getConnection();
		int result = new NoticeDAO().insertReview(conn,r);
		
		if(result>0)commit(conn);
		else rollback(conn);
		
		close(conn);
		return result;
	}
	
	public Review selectOneReview(int boardNo) {		
		Connection conn = getConnection();
		
		int result = 0;
		result = new NoticeDAO().increaseReadCount(conn,boardNo);
		
		Review review = new NoticeDAO().selectOneReview(conn, boardNo);

		close(conn);

		return review;
		
	}

	public int updateReview(Review r) {
		Connection conn = getConnection();
		int result = new NoticeDAO().updateReview(conn, r);
		if (result > 0)
			commit(conn);
		else
			rollback(conn);

		close(conn);

		return result;
	}

	public int deleteReview(int boardNo) {
		Connection conn = getConnection();
		int result = new NoticeDAO().deleteReview(conn, boardNo);
		if (result > 0)
			commit(conn);
		else
			rollback(conn);

		close(conn);

		return result;
	}
	
	public List<Review> selectMostViewReview() {
		Connection conn = getConnection();
		List<Review> rList = new NoticeDAO().selectMostViewReview(conn);
		close(conn);
		return rList;
	}
	



}
