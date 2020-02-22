<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.util.*" %>
<%@page import = "board.model.vo.Notice, board.model.vo.QnA"%>
<%
	List<Notice> list = (List<Notice>)request.getAttribute("list");
	Member m = (Member)request.getAttribute("member");
	List<QnA> qnaList = (List<QnA>)request.getAttribute("qnaList");
	String pageBar = (String)request.getAttribute("pageBar");

%>
<!-- 여주
	만든날짜 : 200205
	목적 : 게시판 메인 페이지 jsp 
	보라 
	만든날짜 200208
	목적: qna 글쓰기, 수정, 삭제, 답글달기 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeView</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board/notice/notice.css">
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
.notice_table h3{
	cursor: pointer;
}
.notice_table h3:hover{
    color: #ed4747;
    font-weight: bolder;
    
}
<!--공지사항 css 끝-->
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
            <h2>게시판</h2>
            <p>노머니트립에 궁금한 점을 물어보세요</p>
        </div>
        <div class="first_wrap">
            <div class="call_wrap">
                <div class="gray_bg2">
                    <div class="call_content_wrap">
                        <i class="fas fa-circle"></i>
                        <br>
                        <h3>문의전화</h3>
                        <h2>1688-0898</h2>
                        <p>평일 9:00 - 18:00</p>
                        <p>주말 10:00 - 13:00 공휴일 휴무</p>
                    </div>
                </div>
            </div>
            <div class="notice_wrap">
                <div class="notice_bar">
                    <div class="notice_title">
                        <h3>공지사항</h3>
                    </div>
                    <!-- +아이콘 삭제 -->
<!--                     <i class="fas fa-plus" onclick="more();"></i>  -->
                    <div class="red_border"></div>
                </div>
                <table class="notice_table">
                	<% for(Notice n : list){ %>
                    <tr>
                    <td>
	                    <span><%=n.getBoardNo() %></span>
	                    <h3 onclick="location.href='<%=request.getContextPath()%>/board/noticeView?boardNo=<%=n.getBoardNo()%>'"><%= n.getBoardTitle() %></h3>
	                    <p><%=n.getBoardDate() %></p>
                    </td>
                    </tr>
                    <%} %>
                </table>
            </div>
            <!-- 관리자일때만 글쓰기 버튼 보여짐 -->
            <%if(memberLoggedIn!=null && (memberLoggedIn.getMemberId().equals("admin"))){ %>
            <input type="button" id="write_btn" value="글쓰기" onclick="location.href='<%=request.getContextPath()%>/board/noticeWrite'"/>
        	<%} %>
        </div>
        <!-- 공지사항 구현 끝 -->
        
        
        <!-- 1:1문의  -->
        <div class="qna_wrap">
            <div class="qna_bar">
                <div class="qna_title">
                    <h3>자주 묻는 질문</h3>
                </div>
                
                <div class="red_border_2"></div>
            </div>
            <%for(QnA q:qnaList){ %>
           <%--  <table class="qna_table">
                 <%for(QnA q:qnaList){ %>
                <tr>
                    <td>
                        <div class="qna_q">
                            <h2>Q.</h2>
                            <p><%=q.getBoardTItle() %></p>
                            <i class="fas fa-angle-down" id="scroll_bnt"></i>
                            <i class="fas fa-angle-up" id="scroll_up_bnt"></i>
                        </div>
                        <span id="bg_scroll">
                            <p>답글있는 부분  <i class="far fa-edit"></i> <i class="far fa-trash-alt"></i></p>
                        </span>
                    </td>
                </tr>
                <%} %>
                </table> --%>
             <table class="qna_table">
             <tr class="qna_q">
             	<td style="margin-left:10px;"><h2>Q.</h2><%=q.getBoardTItle() %><i class="fas fa-angle-down scroll_bnt"></i><i class="fas fa-angle-up scroll_up_bnt"></i></td>
             </tr>
            <tr class="bg_scroll">
            	<td ><h3>A.</h3><%=q.getBoardContent() %></td>
            </tr>
             </table>
             <%} %>
        </div>
        
         <div id='pageBar'><span><%=pageBar %></span></div>
         <script>
        $(document).ready(function(){
        	$(".scroll_up_bnt").css('display','none');
        });
     $(".scroll_bnt").on('click',function(){
    	 let obj = $(this);
    	 
    	 obj.hide(); 
    	 obj.next().css('display','block');
    	 obj.parent().parent().next().show();
     });
     
     $(".scroll_up_bnt").on('click',function(){
    	 let obj = $(this);
    	 
    	 obj.hide();
    	 obj.prev().css('display','block');
    	 obj.parent().parent().next().hide();
     });
    
     function deleteQnA(){
    	 if(!confirm('정말 삭제하시겠습니까?')) return;
    	 $("[name=QnaDelFrm]").submit();
     }
    </script>
         <style>
        #pageBar{
        	/* padding-top:10px; */
        	width:1200px;
        	margin: 0 auto;
        	text-align: center;
        }
     .contentIcon{
     		float:right;margin:10px;
     }
        </style>
    </section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>