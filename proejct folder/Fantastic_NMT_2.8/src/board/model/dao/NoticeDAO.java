package board.model.dao;
import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import board.model.vo.Notice;
import board.model.vo.QnA;
import board.model.vo.Review;

public class NoticeDAO {

	private Properties prop = new Properties();
	
	public NoticeDAO() {
		try {		
			String fileName = NoticeDAO.class.getResource("/sql/board/notice-query.properties").getPath();
			prop.load(new FileReader(fileName));
		}catch(FileNotFoundException e) {
			e.printStackTrace();
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	

	public List<Notice> selectNoticeList(Connection conn) {
		List<Notice> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectNoticeList");
		
		try {
			pstmt = conn.prepareStatement(query);
		
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Notice notice = new Notice();
				notice.setBoardNo(rset.getInt("board_No"));
				notice.setMcode(rset.getInt("member_code"));
				notice.setBoardCate(rset.getString("board_cate"));
				notice.setBoardTitle(rset.getString("board_title"));
				notice.setBoardContent(rset.getString("board_content"));
				notice.setBoardOrigin(rset.getString("board_origin"));
				notice.setBoardRename(rset.getString("board_renamed"));
				notice.setBoardDate(rset.getDate("board_date"));
				notice.setBoardReadcnt(rset.getInt("board_readcnt"));
				list.add(notice);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}


	public int insertNotice(Connection conn, Notice n) {
		PreparedStatement pstmt = null;
		String query = prop.getProperty("insertNotice");
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, n.getBoardTitle());
			pstmt.setString(2, n.getBoardContent());
			
			result=pstmt.executeUpdate();
			System.out.println("result@dao="+result);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}


	public Notice selectOne(Connection conn, int boardNo) {
		Notice notice = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectOne");
		try{
			//미완성쿼리문을 가지고 객체생성.
			pstmt = conn.prepareStatement(query);
			//쿼리문미완성
			pstmt.setInt(1, boardNo);
			System.out.println("dao="+boardNo);
			//쿼리문실행
			//완성된 쿼리를 가지고 있는 pstmt실행(파라미터 없음)
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				notice = new Notice();
				notice.setBoardNo(rset.getInt("board_no"));
				notice.setMcode(rset.getInt("member_code"));
				notice.setBoardCate(rset.getString("board_cate"));
				notice.setBoardTitle(rset.getString("board_title"));
				notice.setBoardContent(rset.getString("board_content"));
				notice.setBoardOrigin(rset.getString("board_origin"));
				notice.setBoardRename(rset.getString("board_renamed"));
				notice.setBoardDate(rset.getDate("board_date"));
				notice.setBoardReadcnt(rset.getInt("board_readcnt"));
				
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		return notice;
	}


	public int selectLastSeq(Connection conn) {
		int boardNo = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectLastSeq");
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				//boardNo는 properties파일에서 시퀀스's currval의 별칭으로 부여함
				boardNo = rset.getInt("boardno");
			}
			System.out.println("boardNo@dao="+boardNo);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return boardNo;
	}


	public int updateNotice(Connection conn, Notice n) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updateNotice");
		System.out.println("update="+query);
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, n.getBoardTitle());
			pstmt.setString(2, n.getBoardContent());
			pstmt.setInt(3, n.getBoardNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}		
		return result;
	}


	public int deleteNotice(Connection conn, int boardNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("deleteNotice");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, boardNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}
	
	public int insertQnA(Connection conn, QnA oneToOne) {
		PreparedStatement pstmt = null;
		String query = prop.getProperty("insertQnA");
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1,oneToOne.getMemberCode());
			pstmt.setString(2, oneToOne.getBoardTItle());
			pstmt.setString(3, oneToOne.getBoardContent());
			
			result = pstmt.executeUpdate();
			System.out.println("QnAresult@"+result);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public List<QnA> selectQnAList(Connection conn,int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<QnA> qnaList = new ArrayList<QnA>();
		String query = prop.getProperty("selectQnAList");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			int startRownum = (cPage*numPerPage)-(numPerPage-1);
			int endRownum = (cPage*numPerPage);
			pstmt.setInt(1, startRownum);
			pstmt.setInt(2, endRownum);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				QnA q = new QnA();
				q.setBoardNo(rset.getInt("board_No"));
				q.setMemberCode(rset.getInt("member_code"));
				q.setBoardCate(rset.getString("board_cate"));
				q.setBoardTItle(rset.getString("board_title"));
				q.setBoardContent(rset.getString("board_content"));
				q.setBoardOrigin(rset.getString("board_origin"));
				q.setBoardRename(rset.getString("board_renamed"));
				q.setBoardDate(rset.getDate("board_date"));
				q.setBoardReadcnt(rset.getInt("board_readcnt"));
				q.setBoardLevel(rset.getInt("board_level"));
				q.setBoardRef(rset.getInt("board_ref"));
				
				qnaList.add(q);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);close(pstmt);
		}
		System.out.println("qnaList = "+qnaList);
		return qnaList;
	}


	public int selectCnt(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int cnt = 0;
		String query = prop.getProperty("selectCnt");
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				cnt = rset.getInt("cnt");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return cnt;
	}


	public QnA selectQnA(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		QnA q = null;
		String query = prop.getProperty("selectQnA");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardNo);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				q = new QnA();
				q.setBoardNo(rset.getInt("board_No"));
				q.setMemberCode(rset.getInt("member_code"));
				q.setBoardCate(rset.getString("board_cate"));
				q.setBoardTItle(rset.getString("board_title"));
				q.setBoardContent(rset.getString("board_content"));
				q.setBoardOrigin(rset.getString("board_origin"));
				q.setBoardRename(rset.getString("board_renamed"));
				q.setBoardDate(rset.getDate("board_date"));
				q.setBoardReadcnt(rset.getInt("board_readcnt"));
				q.setBoardLevel(rset.getInt("board_level"));
				q.setBoardRef(rset.getInt("board_ref"));
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return q;
	}


	public int deleteQnA(Connection conn, int qnaBoardNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("deleteQnA");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, qnaBoardNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}


	public int updateQnA(Connection conn, QnA q) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updateQnA");
		System.out.println("update="+query);
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, q.getBoardTItle());
			pstmt.setString(2, q.getBoardContent());
			pstmt.setInt(3, q.getBoardNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}		
		return result;
	}


	public List<QnA> selectOneToOneList(Connection conn, int cPage, int numPerPage) {
		List<QnA> oneToOne = new ArrayList<QnA>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectOneToOneList");
		
		
		try {
			pstmt = conn.prepareStatement(query);
			
			int startRownum = (cPage*numPerPage)-(numPerPage-1);
			int endRownum = (cPage*numPerPage);
			pstmt.setInt(1, startRownum);
			pstmt.setInt(2, endRownum);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				QnA q = new QnA();
				q.setBoardNo(rset.getInt("board_No"));
				q.setMemberCode(rset.getInt("member_code"));
				q.setBoardCate(rset.getString("board_cate"));
				q.setBoardTItle(rset.getString("board_title"));
				q.setBoardContent(rset.getString("board_content"));
				q.setBoardOrigin(rset.getString("board_origin"));
				q.setBoardRename(rset.getString("board_renamed"));
				q.setBoardDate(rset.getDate("board_date"));
				q.setBoardReadcnt(rset.getInt("board_readcnt"));
				q.setBoardLevel(rset.getInt("board_level"));
				q.setBoardRef(rset.getInt("board_ref"));
				
				oneToOne.add(q);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);close(pstmt);
		}
		System.out.println("qnaList = "+oneToOne);
		return oneToOne;
	
	}


	public int insertQnAReply(Connection conn, QnA qnaReply) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertQnAReply");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, qnaReply.getBoardTItle());
			pstmt.setString(2, qnaReply.getBoardContent());
			pstmt.setInt(3, qnaReply.getBoardRef());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}


	public List<QnA> selectQnAReply(Connection conn) {
		PreparedStatement pstmt = null;
		List<QnA> reply = new ArrayList<QnA>();
		String query = prop.getProperty("selectQnAReply");
		ResultSet rset = null;
		
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				QnA q = new QnA();
				q.setBoardNo(rset.getInt("board_No"));
				q.setMemberCode(rset.getInt("member_code"));
				q.setBoardCate(rset.getString("board_cate"));
				q.setBoardTItle(rset.getString("board_title"));
				q.setBoardContent(rset.getString("board_content"));
				q.setBoardOrigin(rset.getString("board_origin"));
				q.setBoardRename(rset.getString("board_renamed"));
				q.setBoardDate(rset.getDate("board_date"));
				q.setBoardReadcnt(rset.getInt("board_readcnt"));
				q.setBoardLevel(rset.getInt("board_level"));
				q.setBoardRef(rset.getInt("board_ref"));
				
				reply.add(q);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return reply;
	}

	public List<Review> selectReviewList(Connection conn,int cPage, int numPerPage) {
		List<Review> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectReviewList");
		
		try {
			pstmt = conn.prepareStatement(query);
			int startRownum = (cPage*numPerPage)-(numPerPage-1);
			int endRownum = (cPage*numPerPage);
			pstmt.setInt(1, startRownum);
			pstmt.setInt(2, endRownum);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Review review = new Review();
				review.setBoardNo(rset.getInt("board_No"));
				review.setMemberCode(rset.getInt("member_code"));
				review.setBoardCate(rset.getString("board_cate"));
				review.setBoardTItle(rset.getString("board_title"));
				review.setBoardContent(rset.getString("board_content"));
				review.setBoardOrigin(rset.getString("board_origin"));
				review.setBoardRename(rset.getString("board_renamed"));
				review.setBoardDate(rset.getDate("board_date"));
				review.setBoardReadcnt(rset.getInt("board_readcnt"));
				review.setBoardLevel(rset.getInt("board_level"));
				review.setBoardRef(rset.getInt("board_ref"));
				list.add(review);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
}
