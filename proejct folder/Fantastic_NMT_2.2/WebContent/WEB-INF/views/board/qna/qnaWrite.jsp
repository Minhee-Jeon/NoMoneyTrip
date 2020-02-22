<%@page import="board.model.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 여주
	만든날짜 : 200206
	목적 : 게시판 글쓰기 jsp -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeWrite</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board/notice/noticeWrite.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/member/main.css">
<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.js"></script>
<link href="https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/226b55f414.js" crossorigin="anonymous"></script>
<script>
function noticeValidate(){
	 location.href= "<%=request.getContextPath()%>/board/noticeView";
}
</script>
<style>
.bg_img{
    height: 700px;
    background-image: url('<%=request.getContextPath()%>/images/notice/semiproject_sub6_01.png');
    background-repeat: no-repeat;
    background-position: top center;
    background-size: cover;
}
</style>
</head>
<%@ include file="/WEB-INF/views/common/nav.jsp" %>
<%
	Notice n = (Notice)request.getAttribute("notice");
%>
<body>
    <header>
        <div class="bg_img">
            <div class="title">
                <h1>Q & A</h1>
                <p>불편한 점이나 개선점을 적어주세요<br>노머니 트립에게 궁금한 것을 물어봐도 좋아요</p>
            </div>
        </div>
    </header>
    <section>
     <div class="title_wrap">
            <h2>Q&A</h2>
            <p>1:1 문의 글쓰기 폼입니다.</p>
        </div>
        <form action="<%=request.getContextPath() %>/board/qnaWriteEnd"
        	  method="GET"
        	  enctype="multipart/form-data">
            <table id="tbl_notice_write">
                <tr>
                    <td id="notice_title_wrap">
                        <div class="red_circle"></div>
                        <h2>제목</h2>
                        <input type="text" name="qnaTitle" required>
                        <input type="hidden"  name="memberCode" value="<%=memberLoggedIn.getMcode()%>"/>
                    </td>
                </tr>
                <tr>
                    <td id="notice_content_wrap">
                        <div class="red_circle"></div>
                        <h2>내용</h2>
                        <textarea rows="5" cols="50" name="qnaContent"></textarea>
                    </td>
                </tr>
            </table>
            <div class="btn_wrap">
                <input type="submit" value="등록하기" onclick="location.href='<%=request.getContextPath()%>/board/noticeView'" id="btn_write_submit">
            </div>
        </form>
    </section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>