package member.model.dao;

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

import member.model.vo.Member;
import member.model.vo.Mile;

/**
 * @author Minhee
	만든날짜 : 200203
	목적 : DAO
 *
 */
public class MileDAO {
	private Properties prop = new Properties();
	
	public MileDAO() {
		
		String fileName = MemberDAO.class.getResource("/sql/member/mile-query.properties")
										 .getPath();
		
		try {
			
			prop.load(new FileReader(fileName));
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public Mile selectOne(Connection conn, String memberCode) {
		Mile m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectOne");
		System.out.println("query="+query);
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberCode);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				m = new Mile();
				m.setMcode(rset.getString("member_code"));
				m.setCreateDate(rset.getDate("mile_date"));
				m.setMile_point(rset.getInt("mile_point")); 
				m.setMile_io(rset.getString("mile_io").charAt(0));
				m.setMile_total(rset.getInt("mile_total")); 
				m.setMile_info(rset.getString("mile_info"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return m;
	}

	public List<Mile> selectListWithMcode(Connection conn, String mcode) {
		List<Mile> mList = new ArrayList<Mile>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Mile m = null;
		String query = prop.getProperty("selectOne");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, mcode);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				m = new Mile();
				m.setMcode(rset.getString("member_code"));
				m.setCreateDate(rset.getDate("mile_date"));
				m.setMile_point(rset.getInt("mile_point")); 
				m.setMile_io(rset.getString("mile_io").charAt(0));
				m.setMile_total(rset.getInt("mile_total")); 
				m.setMile_info(rset.getString("mile_info"));
				
				mList.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		System.out.println("DAO의 마일리지리스트="+mList);
		return mList;
	}
	
	//0217 수정 start
		public int insertMile(Connection conn, String memberCode, int pricePackage) {
			
			int result = 0;
			PreparedStatement pstmt= null;
			String query = "insert into nmt_mile values(?,default,?,'I',?,'패키지상품구매')";
			
			Mile m = selectOne(conn,memberCode);
			int totalMile = 0;
			if(m == null) {
				totalMile = pricePackage/100;			
			}else {
				totalMile = m.getMile_total() + pricePackage/100;
			}
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, memberCode);
				pstmt.setInt(2, pricePackage/100);
				pstmt.setInt(3, totalMile);
				result = pstmt.executeUpdate();
				System.out.println("insertMile@MileDAO="+result);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			
			return result;
		}


		public int inputMile(Connection conn, String memberCode, int pricePackage) {
			int result = 0;
			PreparedStatement pstmt= null;
			String query = "update nmt_member set member_mile = ? where member_code = ?";

			Mile m = selectOne(conn,memberCode);
			int totalMile = m.getMile_total();
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, totalMile);
				pstmt.setString(2, memberCode);
				
				result = pstmt.executeUpdate();
				System.out.println("inputMile@MileDAO="+result);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			
			return result;
			
			
		}
		//0217 수정 end
}
