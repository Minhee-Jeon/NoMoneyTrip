<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.model.vo.QnA"%>
<% QnA q = (QnA)request.getAttribute("qna"); %>
<!--보라 
	만든날짜 : 200208
	목적 : 1:1문의  수정하기 jsp -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NMT | 1:1문의 수정</title>
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

</style>
</head>
<%@ include file="/WEB-INF/views/common/nav.jsp" %>

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
            <p>1:1 문의 글쓰기 수정폼입니다.</p>
        </div>
        <form action="<%=request.getContextPath()%>/board/qnaUpdateEnd"
        	  method="GET"
        	  enctype="multipart/form-data">
        	<input type="hidden" name="boardNo" value="" />
            <table id="tbl_notice_write">
                <tr>
                    <td id="notice_title_wrap">
                        <div class="red_circle"></div>
                        <h2>제목</h2>
                        <input type="text" name="qnaTitle" value="<%=q.getBoardTItle()%>">
                        <input type="hidden"  name="memberCode" value="<%=memberLoggedIn.getMcode()%>"/>
                        <input type="hidden" name="qnaBoardNo" value=<%=q.getBoardNo() %> />
                    </td>
                </tr>
                <tr>
                    <td id="notice_content_wrap">
                        <div class="red_circle"></div>
                        <h2>내용</h2>
                        <input type="text" rows="5" cols="50" name="qnaContent" id="noticeContent" value="<%=q.getBoardContent()%>">
                    </td>
                </tr>
            </table>
	            <div class="btn_wrap">
	                <input type="submit" value="수정하기"  id="btn_write_submit">
	            </div>
        </form>
    </section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>