<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "board.model.vo.Review"%>
<%
	Review r = (Review)request.getAttribute("r");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board/review/review_view.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/member/main.css">
<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.js"></script>
<link href="https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/226b55f414.js" crossorigin="anonymous"></script>
<title>NMT | 후기</title>
<style>
.bg_img_rv{
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
        <div class="bg_img_rv">
            <div class="title_rv">
                <h1>REVIEW</h1>
                <p>회원님의 후기를 올려주세요<br>다른 회원님과 후기를 공유할 수 있어요</p>
            </div>
        </div>
    </header>
    <section>
        <div class="title_wrap_rv">
            <h2>후기 게시판</h2>
            <p>후기 게시판 페이지 입니다</p>
        </div>
        <form class="form1">
            <div class="img_wrap_rv">
                <img src="<%=request.getContextPath() %>/upload/board/<%=r.getBoardOrigin()%>" width="415px">
            </div>
            <div class="content_right_rv">
                <table id="tbl_review_write">
                    <tr>
                        <td id="review_title_wrap">
                            <div class="red_circle_rv"></div>
                            <h2>제목</h2>
                            <input type="text" name="reviewTitle" value="<%=r.getBoardTItle()%>"readonly>
                            
                        </td>
                    </tr>
                     <tr>
                        <td id="review_content_wrap">
                            <div class="red_circle_rv"></div>
                            <h2>내용</h2>
                            <input type="text" name="reviewContent" id="reviewContent"  value="<%=r.getBoardContent()%>" readonly>
                        </td>
                    </tr>
                </table>
            </div>
        </form>
        
		<%if(memberLoggedIn!=null && (memberLoggedIn.getMcode().equals(r.getMemberCode()) || memberLoggedIn.getMemberId().equals("admin"))){ %>
               	<div class="btn_wrap">
               		 <input type="submit" value="수정하기" id="btn_update_submit" onclick="location.href='<%=request.getContextPath()%>/board/updateReview?boardNo=<%=r.getBoardNo()%>'">
                	<input type="submit" value="삭제하기" id="btn_delete_submit" onclick="deleteNotice();">
           		 </div>
        <%} %>
        
        <form action="<%=request.getContextPath()%>/board/reviewDelete"
        	name="reviewDelFrm"
	  		method="POST">
	  		<input type="hidden" name="boardNo" value="<%=r.getBoardNo()%>"/>
		</form>
    </section>
<style>
.form1::after{
	content:"";
	display:block;
	clear:both;
}
.img_wrap_rv{
	width:415px;
	float : left;
}
.img_wrap_rv::after{
	content:"";
	display:block;
	clear:both;
}
.content_right_rv{
	float : left;
}
.content_right_rv::after{
	content:"";
	display:block;
	clear:both;
}
</style>
<script>
function deleteNotice(){
	if(!confirm("정말로 삭제하시겠습니까?")) 
		return;
	$("[name=reviewDelFrm]").submit();
}
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>