<%@page import="board.model.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Notice n = (Notice)request.getAttribute("notice");
%>
<!-- 여주
	만든날짜 : 200206
	목적 : 게시판 공지사항 보기 jsp -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeView</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board/notice/noticeWrite.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/member/main.css">
<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.js"></script>
<link href="https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/226b55f414.js" crossorigin="anonymous"></script>
<style>
.bg_img{
    height: 700px;
    background-image: url('<%=request.getContextPath()%>/images/notice/semiproject_sub6_01.png');
    background-repeat: no-repeat;
    background-position: top center;
    background-size: cover;
}
#noticeContent{
	width: 865px;
    height: 300px;
    background-color: #ebebeb;
    font-size: 20px;
    opacity: .6;
    margin-top: 5px;
}
#btn_update_submit{
	margin-top : 30px;
	float: left;
}
#btn_delete_submit{
	width: 180px;
    height: 40px;
    background-color: #ed4747;
    border-radius: 10px;
    color: white;
    font-size: 16px;
    text-align: center;
    margin-top: 30px;
    float: left;
}
.btn_wrap{
    width: 420px;
    margin: 0 auto;
    margin-top:-80px;
    padding-bottom:85px;
}
</style>
</head>
<%@ include file="/WEB-INF/views/common/nav.jsp" %>
<body>
    <header>
        <div class="bg_img">
            <div class="title">
                <h1>NOTICE</h1>
                <p>불편한 점이나 개선점을 적어주세요<br>노머니 트립에게 궁금한 것을 물어봐도 좋아요</p>
            </div>
        </div>
    </header>
    <section>
        <div class="title_wrap">
            <h2>공지사항</h2>
            <p>관리자 공지사항 페이지 입니다</p>
        </div>
        <form>
            <table id="tbl_notice_write">
                <tr>
                    <td id="notice_title_wrap">
                        <div class="red_circle"></div>
                        <h2>제목</h2>
                        <input type="text" name="noticeTitle" value="<%=n.getBoardTitle()%>" readonly>
                    </td>
                </tr>
                <tr>
                    <td id="notice_content_wrap">
                        <div class="red_circle"></div>
                        <h2>내용</h2>
                        <input type="text" rows="5" cols="50" name="noticeContent" id="noticeContent" value="<%=n.getBoardContent() %>" readonly>
                    </td>
                </tr>
            </table>
        </form>
        <form action="<%=request.getContextPath()%>/board/noticeDelete"
        	name="noticeDelFrm"
	  		method="POST">
	  		<input type="hidden" name="boardNo" value="<%=n.getBoardNo()%>"/>
		</form>
		<!-- 관리자일때만 수정/삭제 버튼 보여짐 -->
		<%if(memberLoggedIn!=null && (memberLoggedIn.getMemberId().equals("admin"))){ %>
            <div class="btn_wrap">
                <input type="submit" value="수정하기" onclick="location.href='<%=request.getContextPath()%>/board/noticeUpdate?boardNo=<%=n.getBoardNo()%>'" id="btn_update_submit">
                <input type="submit" value="삭제하기" onclick="deleteNotice();" id="btn_delete_submit">
            </div>
        <%} %>
    </section>
<script>
function deleteNotice(){
	if(!confirm("정말로 삭제하시겠습니까?")) 
		return;
	
	$("[name=noticeDelFrm]").submit();
	
}
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>