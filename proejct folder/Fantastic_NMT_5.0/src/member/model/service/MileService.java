package member.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import member.model.dao.MemberDAO;
import member.model.dao.MileDAO;
import member.model.vo.Mile;

/**
 * @author Minhee
	만든날짜 : 200213
	목적 : 서비스단
 *
 */
public class MileService {

	public Mile selectOne(String mcode) {
		Connection conn = getConnection();
		Mile m = new MileDAO().selectOne(conn, mcode);
		close(conn);
		return m;
	}

	public List<Mile> selectListWithMcode(String mcode) {
		Connection conn = getConnection();
		List<Mile> mList = new MileDAO().selectListWithMcode(conn, mcode);
		System.out.println("service의 마일리지리스트="+mList);
		close(conn);
		return mList;
	}
	
	//0217 수정 start
	public int insertMile(String memberCode, int pricePackage) {
		Connection conn = getConnection();		
		int result = new MileDAO().insertMile(conn, memberCode, pricePackage);
		
		if(result > 0) 
			result = new MileDAO().inputMile(conn, memberCode, pricePackage);
		
		close(conn);
		return result;
	}
	//0217 수정 end

}
