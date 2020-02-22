<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "board.model.vo.Review"%>
<%
	Review r = (Review)request.getAttribute("r");
	System.out.println("aaa="+r);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board/notice/noticeWrite.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/member/main.css">
<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.js"></script>
<link href="https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/226b55f414.js" crossorigin="anonymous"></script>
<title>REVIEWUPDATE</title>
<style>
.bg_img{
    height: 700px;
    background-image: url('<%=request.getContextPath()%>/images/notice/semiproject_sub6_01.png');
    background-repeat: no-repeat;
    background-position: top center;
    background-size: cover;
}
#file_upload_wrap{
	padding-top : 20px;
	padding-bottom: 20px;
}
#file_upload_wrap h2{
	float: left;
    font-size: 20px;
	margin-top : 3px;
	margin-right: 50px;
}
#upFile{
	width: 800px;
	margin-top : 3px;
}
#reviewContent{
	width: 865px;
    height: 300px;
    background-color: #ebebeb;
    font-size: 20px;
    opacity: .6;
    margin-top: 5px;
}

</style>
<script>
$(function(){
	$("[name=upFile]").change(function(){
		let fname = $(this).val(); 
		//첨부파일이 있는 경우
		if(fname != ""){
			$("#fname").hide();
		}
		//첨부파일이 없는 경우
		else {
			$("#fname").show();
		}
	});
});

//input enter 막기 수정
$(function() {
	$("input:text").keydown(function(evt) { 
	console.log($(this));
	if (evt.keyCode == 13) return false; }); 
});
</script>
</head>
<%@ include file="/WEB-INF/views/common/nav.jsp" %>
<body>
	<header>
        <div class="bg_img">
            <div class="title">
                <h1>REVIEW</h1>
                <p>회원님의 후기를 올려주세요<br>다른 회원님과 후기를 공유할 수 있어요</p>
            </div>
        </div>
    </header>
    <section>
        <div class="title_wrap">
            <h2>후기</h2>
            <p>회원 후기 수정 페이지 입니다</p>
        </div>
        <form action="<%=request.getContextPath() %>/board/reviewUpdateEnd"
        	  method="POST"
        	  enctype="multipart/form-data"
      		  onsubmit="false"	
        	  >
        	<input type="hidden" name="boardNo" value="<%=r.getBoardNo()%>"/>
            <table id="tbl_notice_write">
                <tr>
                    <td id="notice_title_wrap">
                        <div class="red_circle"></div>
                        <h2>제목</h2>
                        <input type="text" name="reviewTitle" value="<%=r.getBoardTItle()%>">
                    </td>
                </tr>
                <tr>
                    <td id="notice_content_wrap">
                        <div class="red_circle"></div>
                        <h2>내용</h2>
                       <input type="text" name="reviewContent" id="reviewContent" value="<%=r.getBoardContent()%> ">
                    </td>
                </tr>
                <tr>
                	<td id="file_upload_wrap">
                		<div class="red_circle"></div>
                        <h2>파일</h2>
                        <input type="file" name="upFile" id="upFile">
                        <span id="fname"><%=r.getBoardOrigin()!=null?r.getBoardOrigin():"" %></span>
						<input type="hidden" name="oldOriginalFileName"
						       value="<%=r.getBoardOrigin()!=null?r.getBoardOrigin():"" %>" />
						<input type="hidden" name="oldRenamedFileName"
						       value="<%=r.getBoardRename()!=null?r.getBoardRename():"" %>" />
                	</td>
                </tr>
            </table>
            <div class="btn_wrap">
                <input type="submit" value="등록하기" onclick="location.href='<%=request.getContextPath()%>/board/reviewView'" id="btn_write_submit">
            </div>
        </form>
    </section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>