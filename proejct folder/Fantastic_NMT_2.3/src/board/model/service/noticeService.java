package board.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import board.model.dao.NoticeDAO;
import board.model.vo.Notice;
import board.model.vo.QnA;

public class noticeService {

	public List<Notice> selectNoticeList() {
		Connection conn = getConnection();
		List<Notice> list = new NoticeDAO().selectNoticeList(conn);
		close(conn);
		return list;
	}

	public int insertNotice(Notice n) {
		Connection conn = getConnection();
		
		int result = new NoticeDAO().insertNotice(conn,n);

		int boardNo = new NoticeDAO().selectLastSeq(conn);
		n.setBoardNo(boardNo);
		
		if(result>0) commit(conn);
		else rollback(conn);
		
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
		
		int boardNo = new NoticeDAO().selectLastSeq(conn);
		n.setBoardNo(boardNo);
		
		System.out.println("updateservice@="+result);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;
	}

	public int deleteNotice(int boardNo) {
		Connection conn = getConnection();
		int result = new NoticeDAO().deleteNotice(conn,boardNo);
		
		if(result>0)commit(conn);
		else rollback(conn);
	
		close(conn);
		
		return result;
		
	}
	
	public int insertQnA(QnA q) {
		Connection conn = getConnection();
		int result = new NoticeDAO().insertQnA(conn,q);
		
		if(result>0)commit(conn);
		else rollback(conn);
		
		close(conn);
		
		System.out.println("QNAresult@Service"+result);
		return result;
		
	}
	
	public List<QnA> selectQnAList(int cPage, int numPage) {
		Connection conn = getConnection();
		List<QnA> qnaList = new NoticeDAO().selectQnAList(conn,cPage, numPage);
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
		System.out.println("updateservice@="+result);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;
	}

	public int deleteQnA(int qnaBoardNo) {
		Connection conn = getConnection();
		int result = new NoticeDAO().deleteQnA(conn,qnaBoardNo);
		
		if(result>0)commit(conn);
		else rollback(conn);
	
		close(conn);
		
		return result;
	}


}
