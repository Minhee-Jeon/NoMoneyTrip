<%@page import="board.model.vo.QnA"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 보라
	만든날짜 : 200210
	목적 : 답글쓰기 jsp -->
	
<% QnA oneToOne = (QnA)request.getAttribute("oneToOne"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NMT | 1:1문의 답변하기</title>
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
<body>
    <header>
        <div class="bg_img">
            <div class="title">
                <h1>Q & A</h1>
              
            </div>
        </div>
    </header>
    <section>
     <div class="title_wrap">
            <h2>Q&A</h2>
            <p>1:1 문의 답글 폼입니다.</p>
        </div>
        <form action="<%=request.getContextPath() %>/qna/qnaReplyEnd"
        	  method="GET"
        	  enctype="multipart/form-data">
            <table id="tbl_notice_write">
                <tr>
                    <td id="notice_title_wrap">
                        <div class="red_circle"></div>
                        <h2>제목</h2>
                        <input type="text" name="qnaTitle" value="<%=oneToOne.getBoardTItle()%>">
                        <input type="hidden"  name="memberCode" value="admin"/>
                        <input type="hidden" name="boardRef" value="<%=oneToOne.getBoardNo()%>" />
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
                <input type="submit" value="등록하기" id="btn_write_submit">
            </div>
        </form>
    </section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>