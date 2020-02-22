<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@page import="member.model.vo.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	 Member m = (Member)request.getAttribute("member");
	 List<Mile> mList = (List<Mile>)request.getAttribute("mList");
	 
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NMT | 내 마일리지</title>
<script src="<%=request.getContextPath() %>/js/jquery-3.4.1.js"></script>
<link href="https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/member/mile.css">
<script>
$(function(){
	console.log($("#mypage-usemile"));
	$("#mypage-usemile").css("display","none");
	$("#mypage-accummile").css("display","block");
	$("#btn1").css("background-color","#f9c1c1");
	
	//적립 내역 보기
	$("#btn1").click(function(){
		$(this).css("background-color","#f9c1c1");
		$("#btn2").css("background-color","white");
		$("#mypage-usemile").css("display","none");
		$("#mypage-accummile").css("display","block");
	});
	 
			
	//사용 내역 보기
	$("#btn2").click(function(){	
		$(this).css("background-color","#f9c1c1");
		$("#btn1").css("background-color","white");
		$("#mypage-accummile").css("display","none");
		$("#mypage-usemile").css("display","block");
		
	});
	
	
	
	
});
</script>
</head>
<%
	DecimalFormat priceFormat = new DecimalFormat("###,###");
%>
<body>
    <header>
        <div class="mile-title-box">
            <p class="eng">Mileage</p>
            <p>마일리지 적립 / 사용 내역</p>
            <%-- <img src="<%=request.getContextPath() %>/images/main/logo.png" width="50px" alt="" /> --%>
        </div>
    </header>
    <section>
    	<div class="member-mile">
    		<div class="member-mile-box">
    			<p>내 마일리지</p>
    			<p><span><%=priceFormat.format((int)m.getMile()) %></span> 원</p>
    		</div>
    	</div>
        <div class="btn-location">
                <button id="btn1">적립내역</button>
                <button id="btn2">사용내역</button>
        </div>
        <article id="mypage-accummile">            
            <div >
                <table class="list">
                    <tr>
                    <th>번호</th>
                    <th>적립일</th>
                    <th>포인트</th>
                    <th>누적 마일리지</th>
                    <th>적립유형</th>
                    </tr>
                    <%! int cnt = 1; %>
                    <%
                     	for(Mile mile : mList){
                     		if(mile.getMile_io() == 'I'){ //마일리지가 i일 때
                    %>
                    <tr>
                        <td><%= cnt %></td>
                        <td><%= mile.getCreateDate() %></td>
                        <td><%= mile.getMile_point() %></td>
                        <td><%= mile.getMile_total() %></td>
                        <td><%= mile.getMile_info() %></td>
                    </tr>
                    <% cnt++; 
                    		}
                    	}%>
                </table>
            </div>
            <div class="rest-div"></div>
        </article>
        <article id="mypage-usemile">
            <div >
                <table class="list">
                    <tr>
                    <th>번호</th>
                    <th>사용일</th>
                    <th>포인트</th>
                    <th>누적 마일리지</th>
                    <th>사용유형</th>
                    </tr>
                    <%
                    	cnt = 1;
                     	for(Mile mile : mList){
                     		if(mile.getMile_io() == 'o'){ //마일리지가 i일 때
                    %>
                    <tr>
                        <td><%= cnt %></td>
                        <td><%= mile.getCreateDate() %></td>
                        <td><%= mile.getMile_point() %></td>
                        <td><%= mile.getMile_total() %></td>
                        <td><%= mile.getMile_info() %></td>
                    </tr>
                    
                     <% cnt++; 
                    		}
                    	}%>
                </table>
            </div>
             <div class="rest-div"></div>
        </article>
    </section>

</body>
</html>