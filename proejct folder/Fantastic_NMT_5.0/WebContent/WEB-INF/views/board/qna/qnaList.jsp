<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.util.*" %>
<%@page import = "board.model.vo.Notice, board.model.vo.QnA"%>
<%
	List<QnA> oneToOne = (List<QnA>)request.getAttribute("oneToOne");
	String pageBar = (String)request.getAttribute("pageBar");
	List<QnA> reply = (List<QnA>)request.getAttribute("reply");
%>
<!-- 
	보라 
	만든날짜 200210 
	목적: qna 글쓰기, 수정, 삭제, 답글달기 
-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="#">
<title>NMT | 1:1문의</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board/notice/notice.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/member/main.css">
<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.js"></script>
<link href="https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/226b55f414.js" crossorigin="anonymous"></script>
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
            <h2>1:1 문의</h2>
        </div>
       
        <div class="qna_wrap">
            <div class="qna_bar">
                <div class="qna_title">
                    <h3>1:1 문의 게시판</h3>
                </div>
                
                <div class="red_border_2"></div>
            </div>
             <table class="qna_table">
             <tr class="qna_q">
             <%for (QnA q:oneToOne){ %>
             <tr class="qna_q">
             <td onclick="location.href='<%=request.getContextPath()%>/qna/qnaListView?boardNo=<%=q.getBoardNo()%>'"><%=q.getBoardTItle() %></td>
             <td class="readCnt"><%=q.getBoardReadcnt() %>
             <!-- if 답글의 답글은 허용하지않는다 -->
             <%if(memberLoggedIn!=null && (q.getBoardRef() == 0 && memberLoggedIn.getMemberId().equals("admin"))){ %>
             <span onclick="location.href='<%=request.getContextPath()%>/qna/qnaReply?boardRef=<%=q.getBoardNo()%>'">➥</span>
             <%} %>
             </td>
             </tr>
             <%}%>
             </table>
             <%if(memberLoggedIn != null){ %>
   		<input type="button" id="write_btn" value="글쓰기" onclick="location.href='<%=request.getContextPath()%>/board/qnaWrite'" style="cursor:pointer;"/>
   		<%} %>
        </div> 
        <br>
        <div id='pageBar' style="margin-bottom: 85px;"><span><%=pageBar %></span></div>
    </section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>