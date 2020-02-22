<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "board.model.vo.Review"%>
<%@page import = "java.util.*" %>
<%
	String pageBar = (String)request.getAttribute("pageBar");
	List<Review> list = (List<Review>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board/review/review.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/member/main.css">
<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.js"></script>
<link href="https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/226b55f414.js" crossorigin="anonymous"></script>
<title>reviewList</title>
<style>
.bg_img_r{
    height: 700px;
    background-image: url('<%=request.getContextPath()%>/images/notice/semiproject_sub6_01.png');
    background-repeat: no-repeat;
    background-position: top center;
    background-size: cover;
}
#pageBar{
    width:1200px;
    margin: 0 auto;
    text-align: center;
    padding-bottom: 85px;
}
.contentIcon{
    float:right;
    margin:10px;
}
.btn_wrap_r{
	width:1200px;
	margin: 0 auto;
	padding-right: 15px;
}
#write_review_btn{
	width:125px;
	height:40px;
    background-color: #ed4747;
    color:white;
    font-size:16px;
    float:right;
}

</style>
</head>
<%@ include file="/WEB-INF/views/common/nav.jsp" %>
<body>
  <header>
        <div class="bg_img_r">
            <div class="title_r">
                <h1>REVIEW</h1>
                <p>회원님의 후기를 올려주세요<br>다른 회원님과 후기를 공유할 수 있어요</p>
            </div>
        </div>
    </header>
    <section>
        <div class="title_wrap_r">
            <h2>후기 게시판</h2>
            <p>후기 게시판 페이지 입니다</p>
        </div>
        <%if(memberLoggedIn!=null && (memberLoggedIn.getMemberId().equals("admin"))){ %>
        <div class="btn_wrap_r">
        	<input type="button" id="write_review_btn" value="글쓰기" onclick="location.href='<%=request.getContextPath()%>/board/reviewWrite'"/>
        </div>
        <%} %>
        <div class="recomand_list_r">
        <% for(Review r : list){ %>
            <div class="re_col1_r">
                <div class="more_review" onclick="location.href='<%=request.getContextPath()%>/board/reviewView?boardNo=<%=r.getBoardNo()%>'">
                	<i class="fas fa-plus-circle"></i>
                </div>
                <img class="list_img" alt="첨부파일" src="<%=request.getContextPath() %>/upload/board/<%=r.getBoardOrigin()%>" width="380px" height="295px">
                <div class="title_star1_r">
                    <h3><%=r.getBoardTItle() %></h3>
                </div>
	            <div class="readcnt_wrap">
		            <p><i class="far fa-eye"></i><%=r.getBoardReadcnt() %></p>
		        </div>
            </div>
            <% }%>
        </div>
         <div id='pageBar'><span><%=pageBar %></span></div>
    </section>
<script>
$(".more_review").on('mouseenter', function(e){
    $(this).css("opacity","1");
}).on("mouseleave",function(){
    $(this).css("opacity","0");
});
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>