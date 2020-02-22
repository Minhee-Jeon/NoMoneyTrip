package board.model.vo;

import java.io.Serializable;
import java.sql.Date;

/**
 * 
 * @author 장여주
 * review 게시판 글 모델
 */
public class Review implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private int boardNo;
	private int memberCode;
	private String boardCate;
	private String boardTItle;
	private String boardContent;
	private String boardOrigin;
	private String boardRename;
	private Date boardDate;
	private int boardReadcnt;
	private int boardLevel;
	private int boardRef;
	
	public Review() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Review(int boardNo, int memberCode, String boardCate, String boardTItle, String boardContent,
			String boardOrigin, String boardRename, Date boardDate, int boardReadcnt, int boardLevel, int boardRef) {
		super();
		this.boardNo = boardNo;
		this.memberCode = memberCode;
		this.boardCate = boardCate;
		this.boardTItle = boardTItle;
		this.boardContent = boardContent;
		this.boardOrigin = boardOrigin;
		this.boardRename = boardRename;
		this.boardDate = boardDate;
		this.boardReadcnt = boardReadcnt;
		this.boardLevel = boardLevel;
		this.boardRef = boardRef;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getMemberCode() {
		return memberCode;
	}

	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}

	public String getBoardCate() {
		return boardCate;
	}

	public void setBoardCate(String boardCate) {
		this.boardCate = boardCate;
	}

	public String getBoardTItle() {
		return boardTItle;
	}

	public void setBoardTItle(String boardTItle) {
		this.boardTItle = boardTItle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getBoardOrigin() {
		return boardOrigin;
	}

	public void setBoardOrigin(String boardOrigin) {
		this.boardOrigin = boardOrigin;
	}

	public String getBoardRename() {
		return boardRename;
	}

	public void setBoardRename(String boardRename) {
		this.boardRename = boardRename;
	}

	public Date getBoardDate() {
		return boardDate;
	}

	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}

	public int getBoardReadcnt() {
		return boardReadcnt;
	}

	public void setBoardReadcnt(int boardReadcnt) {
		this.boardReadcnt = boardReadcnt;
	}

	public int getBoardLevel() {
		return boardLevel;
	}

	public void setBoardLevel(int boardLevel) {
		this.boardLevel = boardLevel;
	}

	public int getBoardRef() {
		return boardRef;
	}

	public void setBoardRef(int boardRef) {
		this.boardRef = boardRef;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Review [boardNo=" + boardNo + ", memberCode=" + memberCode + ", boardCate=" + boardCate
				+ ", boardTItle=" + boardTItle + ", boardContent=" + boardContent + ", boardOrigin=" + boardOrigin
				+ ", boardRename=" + boardRename + ", boardDate=" + boardDate + ", boardReadcnt=" + boardReadcnt
				+ ", boardLevel=" + boardLevel + ", boardRef=" + boardRef + "]";
	}
	
	
	
	
}
