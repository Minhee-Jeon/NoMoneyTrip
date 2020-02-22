<%@page import="product.travel.model.vo.Hotel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Hotel h = (Hotel)request.getAttribute("hotel");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link rel="shortcut icon" href="#">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/member/main.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/travelpackage/hotelcontent.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap">
<script src="https://kit.fontawesome.com/226b55f414.js" crossorigin="anonymous"></script>
<title>Insert title here</title>
<script>
$(document).ready(function(){
	let htlnameWidth = $("#hotelcontent-section-text").width();
	$("#hotelcontent-text-section").width('htlnameWidth+364px');
	$(".img_big").css({"background-image":"url(<%=request.getContextPath() %>/images/hotel/<%=h.getHotelCode()%>.1.jpg)"}); 	
	
	
});
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n){
    showSlides(slideIndex += n);
}

function currenSlide(n){
    showSlides(slideIndex = n);
}

function showSlides(n){
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
    var imgs_mini = document.getElementsByClassName("mini_img")
    if(n > slides.length){slideIndex = 1}
    if(n < 1) {slideIndex = slides.length}
    for(i = 0; i<slides.length; i++){
        slides[i].style.display = "none";
    }
    for(i=0; i<dots.length; i++){
        dots[i].className = dots[i].className.replace(" active","");
    }
    for(i=0; i<imgs_mini.length; i++){
        imgs_mini[i].className = imgs_mini[i].className.replace(" active2","");
    }
    slides[slideIndex-1].style.display="block";
    dots[slideIndex-1].className += " active";
    imgs_mini[slideIndex-1].className += " active2";
}
</script>
<style>
<%-- .img_big{
	background-image : url(<%=request.getContextPath() %>/images/main/main_hotel1.jpg); 
    background-size: cover; 
    /* background-position: top center; */
    
} --%>
</style>
</head>
<body>
<header>
	<div class="hoteltitle_wrap">
		<h1>HOTEL<br>CONTENTS</h1>
		<p>We'll let you know the details of the hotel.</p>
	</div>
</header>

<section>
	<div class="hotelcontent_wrap1">
			<div class="star_wrap">
				<%  double hotelStar = h.getHotelScore();
					if(9 <= hotelStar && hotelStar < 10){ 
				%>
					<i class='fas fa-star' style='font-size:30px;color:#ed4848'></i>
					<i class='fas fa-star' style='font-size:30px;color:#ed4848'></i>
					<i class='fas fa-star' style='font-size:30px;color:#ed4848'></i>
					<i class='fas fa-star' style='font-size:30px;color:#ed4848'></i>
					<i class='fas fa-star-half-alt' style='font-size:30px;color:#ed4848'></i>
				<%	} else if(8 <= hotelStar && hotelStar < 9){ %>
					<i class='fas fa-star' style='font-size:30px;color:#ed4848'></i>
					<i class='fas fa-star' style='font-size:30px;color:#ed4848'></i>
					<i class='fas fa-star' style='font-size:30px;color:#ed4848'></i>
					<i class='fas fa-star' style='font-size:30px;color:#ed4848'></i>
					<i class="fa fa-star-o" style="font-size:30px;color:#ed4848"></i>
				<%	} else if(7 <= hotelStar && hotelStar < 8){ %>
					<i class='fas fa-star' style='font-size:30px;color:#ed4848'></i>
					<i class='fas fa-star' style='font-size:30px;color:#ed4848'></i>
					<i class='fas fa-star' style='font-size:30px;color:#ed4848'></i>
					<i class='fas fa-star-half-alt' style='font-size:30px;color:#ed4848'></i>
					<i class="fa fa-star-o" style="font-size:30px;color:#ed4848"></i>
				<%	} else if(6 <= hotelStar && hotelStar < 7){ %>
					<i class='fas fa-star' style='font-size:30px;color:#ed4848'></i>
					<i class='fas fa-star' style='font-size:30px;color:#ed4848'></i>
					<i class='fas fa-star' style='font-size:30px;color:#ed4848'></i>
					<i class="fa fa-star-o" style="font-size:30px;color:#ed4848"></i>
					<i class="fa fa-star-o" style="font-size:30px;color:#ed4848"></i>
				<%	} else if(5 <= hotelStar && hotelStar < 6){ %>
					<i class='fas fa-star' style='font-size:30px;color:#ed4848'></i>
					<i class='fas fa-star' style='font-size:30px;color:#ed4848'></i>
					<i class='fas fa-star-half-alt' style='font-size:30px;color:#ed4848'></i>
					<i class="fa fa-star-o" style="font-size:30px;color:#ed4848"></i>
					<i class="fa fa-star-o" style="font-size:30px;color:#ed4848"></i>
				<%	} else { %>
					<i class='fas fa-star' style='font-size:30px;color:#ed4848'></i>
					<i class='fas fa-star' style='font-size:30px;color:#ed4848'></i>
					<i class="fa fa-star-o" style="font-size:30px;color:#ed4848"></i>
					<i class="fa fa-star-o" style="font-size:30px;color:#ed4848"></i>
					<i class="fa fa-star-o" style="font-size:30px;color:#ed4848"></i>
				<%  } %>
				</div> 
			<div class="title_wrap_h">
				<h2><%=h.getHotelName() %></h2>
				<p><%=h.getNationCode() %>&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;&nbsp;<%=h.getDistanceLevel() %></h2>
			</div>
	</div>
	
		<div class="address">
			<p><%=h.getHotelAddr() %></p>
		</div>
	
	<div class="red-border"></div>
	
	<div class="hotelcontent_wrap2">
		 <div class="img_album">
			  <img src="<%=request.getContextPath() %>/images/hotelContent/fleg.png" class="fleg">
			  <div class="content_wrap_h">
				<h2><%=h.getHotelScore() %></h2>
				<p>
				<%  double hotelScore = h.getHotelScore();
		 			if(hotelScore >= 9){
				%>
				최고
				<% 	} else if(hotelScore >= 8.5){ %>
				우수
				<%  } else if(hotelScore >= 8){ %>
				매우 좋음
				<%	} else{ %>
				양호
				<% 	} %>
				</p>
			</div>
			  <div class="img_big">
			      <div class="mySlides fade"><img class="cheapest-htlImg1" src="<%=request.getContextPath() %>/images/hotel/<%=h.getHotelCode() %>.1.jpg"></div>
			      <div class="mySlides fade"><img class="cheapest-htlImg2" src="<%=request.getContextPath() %>/images/hotel/<%=h.getHotelCode() %>.2.jpg"></div>
			      <div class="mySlides fade"><img class="cheapest-htlImg3" src="<%=request.getContextPath() %>/images/hotel/<%=h.getHotelCode() %>.3.jpg"></div>
			      <div class="mySlides fade"><img class="cheapest-htlImg4" src="<%=request.getContextPath() %>/images/hotel/<%=h.getHotelCode() %>.4.jpg"></div>
			      <div class="mySlides fade"><img class="cheapest-htlImg5" src="<%=request.getContextPath() %>/images/hotel/<%=h.getHotelCode() %>.5.jpg"></div>
			  </div>
			  <div class="img_album_nav">
			      <i class="fas fa-angle-left" onclick="plusSlides(-1)" id="prev"></i>
			      <i class="fas fa-angle-right" onclick="plusSlides(1)" id="next"></i>
			  </div>
			  <div class="indicator">
			      <span class="dot" onclick="currenSlide(1)"></span>
			      <span class="dot" onclick="currenSlide(2)"></span>
			      <span class="dot" onclick="currenSlide(3)"></span>
			      <span class="dot" onclick="currenSlide(4)"></span>
			      <span class="dot" onclick="currenSlide(5)"></span>
			  </div>
			  <div class="img_album_mini">
			      <div class="mini_img" onclick="currenSlide(1)"><img class="cheapest-htlImg1" src="<%=request.getContextPath() %>/images/hotel/<%=h.getHotelCode() %>.1.jpg" width="180px" height="125px"></div>
			      <div class="mini_img" onclick="currenSlide(2)"><img class="cheapest-htlImg2" src="<%=request.getContextPath() %>/images/hotel/<%=h.getHotelCode() %>.2.jpg" width="180px" height="125px"></div>
			      <div class="mini_img" onclick="currenSlide(3)"><img class="cheapest-htlImg3" src="<%=request.getContextPath() %>/images/hotel/<%=h.getHotelCode() %>.3.jpg" width="180px" height="125px"></div>
			      <div class="mini_img" onclick="currenSlide(4)"><img class="cheapest-htlImg4" src="<%=request.getContextPath() %>/images/hotel/<%=h.getHotelCode() %>.4.jpg" width="180px" height="125px"></div>
			      <div class="mini_img" onclick="currenSlide(5)"><img class="cheapest-htlImg4" src="<%=request.getContextPath() %>/images/hotel/<%=h.getHotelCode() %>.5.jpg" width="180px" height="125px"></div>
			  </div>
   		</div>
   </div>

</section>
<%@ include file="/WEB-INF/views/common/nav.jsp"%>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>