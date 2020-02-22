<%@page import="java.text.DecimalFormat"%>
<%@page import="product.travel.model.vo.Place"%>
<%@page import="product.travel.model.vo.Hotel"%>
<%@page import="product.travel.model.vo.Air"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String depart = (String)request.getAttribute("depart");
	String arrive = (String)request.getAttribute("arrive");
	String days = (String)request.getAttribute("days");
	String price = (String)request.getAttribute("price");
	String startDate = (String)request.getAttribute("startDate");
	String endDate = (String)request.getAttribute("endDate");
	
	List<Air> startList = (List<Air>)request.getAttribute("startAir");
	List<Air> endList = (List<Air>)request.getAttribute("endAir");
	List<Hotel> hotelList = (List<Hotel>)request.getAttribute("hotellist");
	List<Place> placeList = (List<Place>)request.getAttribute("placelist");
	
	System.out.println("startList@jsp="+startList);
	System.out.println("endList@jsp="+endList);
	System.out.println("hotelList@jsp="+hotelList);
	System.out.println("placeList@jsp="+placeList);
	
	
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
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/member/main.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/travelpackage/mainfunction.css">
<link
	href="https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/226b55f414.js"
	crossorigin="anonymous"></script>
<title>NMT | 검색</title>

<script>
$(document).ready(function () {
	
    $('#form-ul .li-style').click(function () {
        $('#form-ul .li-style').css('color', 'white').css('background', '#ed4848');
        $(this).css('color', '#ed4848').css('background', 'white');
    });
   $("#hotel").css('display','none');
   $("#place").css('display','none');

   $("select[name=depart]").val("<%=depart==null?"":depart%>").prop("selected",true);
   $("select[name=arrive]").val("<%=arrive==null?"":arrive%>").prop("selected",true);
   $("select[name=days]").val("<%=days==null?"":days%>").prop("selected",true);
   $("#startDate").val("<%=startDate==null?"":startDate%>");
   $("#endDate").val("<%=endDate==null?"":endDate%>");
   
   
<%if(depart==null){%>
	   $(".air-card").css('display','none');
	   $(".airplane").css('display','none');
	   $("#air-containter").css('display','none');
	   $("#article-select-price").css('display','none');
	   $("#form-ul").css('display','none');
	   $(".next-button").css('display','none');
   <%}%> 
   
});

$(function(){
    $("#letgo").click(function(){
        $("#article-select-price").css('display','block');
        $("#form-ul").css('display','block');
        $("#air-containter").css('display','block');
        let val = $("select[name=select-days]").val();
        console.log(val);
        
        console.log($("select[name=select-continent").val());
        console.log($("select[name=select-country").val());
        console.log($("select[name=select-days").val());
    }); 
});

$(function(){ 
        $("#input-price").change(function(){
            let price = $("#input-price").val();
            $("#input-price-result").html(price);
        });
    });



$(function () {
    /* 02 12 plus minus button fix */
		
    $('.btn-plus').click(function () {

    	console.log($(".card-box-1-info").parent().children("div").eq(1).children("input").eq(0).val());
    	let day1 = Number($(".card-box-1-info").parent().children("div").eq(1).children("input").eq(0).val());
    	let day2 = Number($(".card-box-1-info").parent().children("div").eq(3).children("input").eq(0).val());
    	let day3 = Number($(".card-box-1-info").parent().children("div").eq(5).children("input").eq(0).val());
    	
    	console.log(day1,day2,day3);
    	
		let startdate = $("#startDate").val().substr(8);
		let enddate = $("#endDate").val().substr(8);
    	let totalday = enddate-startdate;
    	
    	console.log('사용자가 선택한 최대 숙박 일 수' ,totalday);
    	
        if( (day1+day2+day3) < totalday){
        
       		let temp = Number($(this).prev().val())+1;
       	 
        	console.log("temp",temp);
        	$(this).prev().val(temp);
        
        }else if(totalday ==0){
        	alert("출발일/도착일을 선택하세요");
        	$("#startDate").focus();

        }else{
            alert(totalday+"일 이상 입력할 수 없습니다.");
        }
        
    });
    
    $('.btn-minus').click(function () {
    	let day1 = Number($("#hotel-days1").text());
		let day2 = Number($("#hotel-days2").text());
		let day3 = Number($("#hotel-days3").text());				
		$thisVal = $(this).parent().children().eq(4).val();
		if($thisVal != 0){
			$(this).parent().children().eq(4).val($thisVal-1);
		}
       
    });
    /* 02 12 plus minus button fix end */
    //2020.02.08 작업 <왼쪽 사이드메뉴 : 형철>
      $("#startDate").datepicker({
    	showOn:"button",
    	buttonImage:"<%=request.getContextPath()%>/images/mainfunction/calendar.PNG",
    	buttonImageOnly: true,
        changeMonth: true, 
        changeYear: true,
        nextText: '다음 달',
        prevText: '이전 달', 
        dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
        monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        dateFormat: "yy-mm-dd",
        minDate: 0,                  
        onClose: function( selectedDate ) {    
             //시작일(startDate) datepicker가 닫힐때
             //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
             
            var date = $(this).datepicker('getDate');
            date.setDate(date.getDate()-8);

            $("#endDate").datepicker( "option", "minDate", date.getDate());
            $("#endDate").datepicker( "option", "maxDate", date.getDate()+10);
            console.log(date.getDate());
            $("#startDateSpan").text(selectedDate);
            
            
        }    

   });
    
    $( "#endDate" ).datepicker({
    	showOn:"button",
    	buttonImage:'<%=request.getContextPath()%>/images/mainfunction/calendar.PNG',
    	buttonImageOnly: true,
        changeMonth: true, 
        changeYear: true,
        nextText: '다음 달',
        prevText: '이전 달', 
        dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
        monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        dateFormat: "yy-mm-dd",
        onClose: function( selectedDate ) {    
            $("#startDate").datepicker( "option", "maxDate", selectedDate );
            $("#endDateSpan").text(selectedDate);
        }    

   });
    $("#arriveselect").change(function(){
    	let city = $("#arriveselect option:selected").val();
    	$.ajax({
    		url:"http://api.openweathermap.org/data/2.5/weather?q="+city+"&appid="+"27212f51a318ad4ffe4ca09e3df93c55",
    		dataType:"json",
    		type:"GET",
    		async:"false",
    		success:function(data){
    		       console.log(data);
                   let img ="http://openweathermap.org/img/w/"+ data.weather[0].icon +".png";
                   $(".weather-image img").attr("src",img);
                   let doc = "℃";
                   $("#Temperature").text(Math.round(data.main.temp-273.15)+doc);
                   $("#arrive-name").text(data.name);
                   
    		},
    		error:function(x,s,c){
    			console.log(x);
    			console.log(s);
    			console.log(c);
    		}
    	});
    });
    
    let city = $("#arriveselect option:selected").val();
	$.ajax({
		url:"http://api.openweathermap.org/data/2.5/weather?q="+city+"&appid="+"27212f51a318ad4ffe4ca09e3df93c55",
		dataType:"json",
		type:"GET",
		async:"false",
		success:function(data){
		       console.log(data);
               let img ="http://openweathermap.org/img/w/"+ data.weather[0].icon +".png";
               $(".weather-image img").attr("src",img);
               let doc = "℃";
               $("#Temperature").text(Math.round(data.main.temp-273.15)+doc);
               $("#arrive-name").text(data.name);
               
		},
		error:function(x,s,c){
			console.log(x);
			console.log(s);
			console.log(c);
		}
	});
    
});

/* 02 12 동준이작업 */
$(function(){
	
	$("i.fa-heart").click(function(){
		/* 02 12 동준작업 */
		console.log($(this).parent().children("input").prop("checked"));
		
		$(this).parent().children("input").prop("checked", !($(this).parent().children("input").prop("checked")))
		
		if(($(this).parent().children("input").prop("checked"))){				
			$(this).css("color","#eb4848");
		}
		else{
			$(this).css("color","#ebebeb"); 
		}
		
	});	
		/* 02 12 동준작업 */
	
	
});


//0212 형철 - letsgo버튼 form 의 onsubmit 함수
function letsgoDuplicate(){
	
	if($("#startDate").val()==""){
		alert("출발날짜를 정해주세요");
		return false;
	}else if($("#endDate").val()==""){
		alert("도착날짜를 정해주세요");
		return false;
	}else if($("select[name=depart]").val()=="출발지"){
		alert("출발지를 선택해주세요");
		return false;
	}else if($("select[name=arrive]").val()=="도착지"){
		alert("도착지를 선택해주세요");
		return false;
	}else{
		return true;
	}
	
	return true;
};
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/nav.jsp"%>
	<header>
		<img src="<%=request.getContextPath()%>/images/mainfunction/semiproject_hotel_01.png"
			alt="headerIMG">
		<div id="header-container">
			<div id="header-welcome-box">
				<h2>
					MAKE <br> YOUR TRIP
				</h2>

				<p>세계로 떠나는 여행 떠나세요!</p>
				<p>NMT에서 응원합니다!</p>
			</div>
		</div>
	</header>
	<section id="section1">
		<article id="article-container">
			<form action="<%=request.getContextPath() %>/mainfunction/mainfunctionEndServlet" method="GET"
				id="letsgoform" onsubmit="return letsgoDuplicate();">
			<div id="article-selectinfo">
				<ul>
					<li id="li_map"><i class="fas fa-map-marker-alt"></i> <span>국가명,
							도시명</span></li>
					<li id="li_departure"><i class="fas fa-plane-departure"></i>&nbsp;출발&nbsp;<input type="text" id="startDate" name="startDate" readonly/></li>
					<li id="li_arrival"><i class="fas fa-plane-arrival"></i>&nbsp;도착&nbsp;<input type="text" id="endDate" name="endDate" readonly/></li>
				</ul>
					<div class="weather-container">
					<div class="weather-image"><img src="" alt="" width="150px" height="150px"/></div>
					<div class="weather-information">
					<p id="Temperature"></p>
					<p id="arrive-name"></p>					
					</div>
					</div>
			</div>
			<div id="article-select">
					<br> <br>
					<div id="choose">
						<select class="select_menu" name="depart">
							<option value="출발지" selected>출발지</option>
							<option value="incheon">인천</option>
							<option value="busan">부산</option>
						</select> 
						<select class="select_menu" name="arrive" id="arriveselect">
							<option value="도착지" selected>도착지</option>
							<option value="france">프랑스</option>
							<option value="swiss">스위스</option>
							<option value="england, gb">영국</option>
						</select> 
					</div>
					<div id="inputUser">
						<input type="text" id="input-price" name="price" value="<%=price==null?"":price%>">
						<button type="submit" id="letgo" style="cursor:pointer;">LET'S GO</button>
					</div>
			</div>
				</form>
			<div id="article-select-price">
				<h1>
					여행 경비 <span id="input-price-result"><%=price==null?"":price%></span> 만원 에 맞는
					상품들이에요!
				</h1>
			</div>

			<br> <br>

			<ul id="form-ul">
				<li id="li-airplane" class="li-style">항공권</li>
				<li><i class="fas fa-circle iconfont"></i> <i
					class="fas fa-circle iconfont"></i> <i
					class="fas fa-circle iconfont"></i> <i
					class="fas fa-circle iconfont"></i> <i
					class="fas fa-circle iconfont"></i> <i
					class="fas fa-circle iconfont"></i> <i
					class="fas fa-circle iconfont"></i></li>
				<li id="li-hotel" class="li-style">호텔/숙소</li>
				<li><i class="fas fa-circle iconfont"></i> <i
					class="fas fa-circle iconfont"></i> <i
					class="fas fa-circle iconfont"></i> <i
					class="fas fa-circle iconfont"></i> <i
					class="fas fa-circle iconfont"></i> <i
					class="fas fa-circle iconfont"></i> <i
					class="fas fa-circle iconfont"></i></li>
				<li id="li-place" class="li-style">관광지/시설</li>
			</ul>
			<br />
		<form id="addToPackageForm"  action="<%=request.getContextPath() %>/main/addPackageServlet" method="post">
		<%if(memberLoggedIn!=null){ %>
		<input type="hidden" name="memberCode" value="<%=memberLoggedIn.getMcode()%>" />
		<%} %>
		<div id="main-div-airplane">
			<div class="airplane">
				<i class="fas fa-circle"
					style="font-size: 10px; margin: 10px; color: #ed4848;"></i><span
					style="font-size: 18px; font-family: 'Noto Sans KR', sans-serif; margin-right: 10px;">출발</span>
				<span
					style="font-size: 20px; font-family: 'Noto Sans KR', sans-serif" id="startDateSpan"></span>
			</div>
			<div id="air-containter" class="air-card">
				<table>
					<thead>
						<tr>
							<th>항공사</th>
							<th>운항편명</th>
							<th>출발시간</th>
							<th>도착시간</th>
							<th>출발지</th>
							<th>도착지</th>
							<th>가격</th>
							<th>선택</th>
						</tr>
					</thead>
					<tbody>
					<% if(startList!=null){ 
						for(Air a : startList){
							String nation = "";
							if(a.getNationArrival().equals("swiss")){
								nation = "스위스";	
							}else if(a.getNationArrival().equals("england")){
								nation = "영국";
							}else{
								nation="프랑스";	
							}
							DecimalFormat priceFormat = new DecimalFormat("###,###");
							
							String airPrice = priceFormat.format(a.getAirPrice());%>
						<tr>
							<td><img
								src="<%=request.getContextPath()%>/images/mainfunction/<%=a.getAirImgName()%>"
								alt=""></td>
							<td><input type="text" value="<%=a.getAirName() %>" name="airName" readonly/></td>
							<td><input type="text" value="<%=a.getStartTime().substring(a.getStartTime().length()-5,a.getStartTime().length())%>" name="airTime_start" readonly/></td>
							<td><input type="text" value="<%=a.getArriveTime().substring(a.getArriveTime().length()-5, a.getArriveTime().length()) %>" name="airTime_end" readonly/></td>
							<td><input type="text" value="<%=a.getNationDepart().equals("busan")?"부산":"인천" %>" name="airDepart" readonly/></td>
							<td><input type="text" value="<%=nation %>" name="airArrival" readonly/></td>
							<td><input type="text" value="<%=airPrice %>" name="airPrice" readonly/></td>
							<td><input type="radio" value="<%=a.getAirName() %>" name="plane-check">
								<input type="hidden" name="airCode" value="<%=a.getAirCode()%>"/></td>
						</tr>
					<%  } 
					}	%>
					</tbody>
				</table>
			</div>
			<div class="airplane">
				<i class="fas fa-circle"
					style="font-size: 10px; margin: 10px; color: #ed4848;"></i><span
					style="font-size: 18px; font-family: 'Noto Sans KR', sans-serif; margin-right: 10px;">도착</span>
				<span
					style="font-size: 20px; font-family: 'Noto Sans KR', sans-serif" id="endDateSpan"></span>
			</div>
			<div id="air-containter" class="air-card">
				<table>
					<thead>
						<tr>
							<th>항공사</th>
							<th>운항편명</th>
							<th>출발시간</th>
							<th>도착시간</th>
							<th>출발지</th>
							<th>도착지</th>
							<th>가격</th>
							<th>선택</th>
						</tr>
					</thead>
					<tbody>
					<% if(endList!=null){
						for(Air a:endList){ 
							String nation = "";
							if(a.getNationDepart().equals("swiss")){
								nation = "스위스";	
							}else if(a.getNationDepart().equals("england")){
								nation = "영국";
							}else{
								nation="프랑스";	
							}
							DecimalFormat priceFormat = new DecimalFormat("###,###");
							
							String airPrice = priceFormat.format(a.getAirPrice())  ; %>
						<tr>
							<td><img src="<%=request.getContextPath()%>/images/mainfunction/<%=a.getAirImgName() %>" alt=""></td>
							<td><input type="text" value="<%=a.getAirName() %>" name="airName_" readonly/></td>
							<td><input type="text" value="<%=a.getStartTime().substring(a.getStartTime().length()-5,a.getStartTime().length()) %>" name="airTime_start_" readonly/></td>
							<td><input type="text" value="<%=a.getArriveTime().substring(a.getArriveTime().length()-5, a.getArriveTime().length()) %>" name="airTime_end_" readonly/></td>
							<td><input type="text" value="<%=nation %>" name="airDepart_" readonly/></td>
							<td><input type="text" value="<%=a.getNationArrival().equals("busan")?"부산":"인천"%>" name="airArrival_" readonly/></td>
							<td><input type="text" value="<%=airPrice %>" name="airPrice_" readonly/></td>
							<td><input type="radio" value="<%=a.getAirName() %>" name="plane-check_" ><input type="hidden" name="airCode_" value="<%=a.getAirCode()%>"/></td>
						</tr>
					<%  } } %>
					</tbody>
				</table>
			</div>
</div>			
<div id="main-div-hotel">
			<div class="card-container" id="hotel">
				<div id="hotel-cards">
				<%if(hotelList!=null){
					DecimalFormat priceFormat = new DecimalFormat("###,###");
					for(Hotel h : hotelList){ 
					String hotelPrice = priceFormat.format(h.getHotelPrice()) ; %>
					<div class="card-box">
						<img src="<%=request.getContextPath()%>/images/hotel/<%=h.getHotelImg() %>" alt="호텔사진1">
						<div id="lower-price">
							<p><%=h.getHotelScore() %></p>
						</div>
						<br>
						<div class="card-box-1-info">
							<!-- <span>므제브호텔</span> -->
							<p class="hotel-name"><%=h.getHotelName() %></p>
							<span class="price_2"><%=hotelPrice %> <i class="fas fa-won-sign"></i></span><br>
							<button class="btn-minus" type="button">-</button>
							<input type="text" value="0" name="hoteldays" class="hoteldays"/>
							<button class="btn-plus" type="button">+</button>
							<input type="hidden" name="hotelCode" value="<%=h.getHotelCode()%>" />
						</div>
					</div>
				<%  }
				} %>	
				</div>
			</div>
	</div>
			<div class="card-container" id="place">
			<%if(placeList!=null){
				for(Place p:placeList){ %>
				<div class="card-box">
				<!-- 02 12 수정 시작 -->
					<div class="heart_wrap">
						<input type="checkbox" value="<%=p.getPlaceCode()%>" class="card-box-heart" name="packplace">
						<i class="fas fa-heart"></i>						
					</div>
					<img
						src="<%=request.getContextPath()%>/images/place/<%=p.getPlaceImg() %>"
						alt="관광지사진1" width="300px"> <br>
				<!-- 02 12 수정 시작 -->
					<div id="lower-price">
						<p>1인권</p>
					</div>
					<div class="card-box-1-info">
						<p class="price"><%=p.getPlaceName() %></p><br />
						<!-- <span class="price">190,494 <i class="fas fa-won-sign"></i></span><br> -->
						<span><%=p.getPlaceAddr() %></span><br />
					</div>
				</div>
			<%  }
			} %>
				
			</div>
			
			</form>	
			<div class="next-button">
				<button class = "btn-loc-to" id="next-to-hotel">다음</button>								
				<button class = "btn-loc-to" id="next-to-place">다음</button>
				<button class = "btn-loc-to" id="add-plan" >담기</button>
				<button class = "btn-loc-to" id="before-to-hotel">이전</button>
				<button class = "btn-loc-to" id="before-to-air">이전</button>
			</div>
			<script>
			$(function(){
				$("#li-airplane").trigger("click");
				$("#before-to-air").css("display","none");
				$("#next-to-place").css("display","none");
				$("#before-to-hotel").css("display","none");
				$("#add-plan").css("display","none");
				
				$("#li-airplane").click(function(){
					$("#before-to-air").trigger("click");
				});
				$("#li-hotel").click(function(){
					$("#next-to-hotel").trigger("click");
				})
				$("#li-place").click(function(){
					$("#next-to-place").trigger("click");
				});

				$("#next-to-hotel").click(function(){
					$("#main-div-airplane").css("display","none");
					$(this).css("display","none");
					$("#before-to-air").css("display","block");					
					$("#next-to-place").css("display","block");
					$("#hotel").css("display","block");
					$("#place").css("display","none");
					$("#before-to-hotel").css("display","none");
					$("#add-plan").css("display","none");
					/* 02 10 수정 시작 */
					$('#form-ul .li-style').css('color', 'white').css('background', '#ed4848');
					$("#li-hotel").css('color', '#ed4848').css('background', 'white');
					/* $("#li-hotel").trigger("click"); 삭제하기 */
					/* 02 10 수정 종료 */
				});
				
				$("#before-to-air").click(function(){
					$("#main-div-airplane").css("display","block");
					$("#next-to-hotel").css("display","block");
					$("#next-to-place").css("display","none");
					$("#add-plan").css("display","none");
					$(this).css("display","none");
					$("#hotel").css("display","none");
					$("#place").css("display","none");
					$("#next-to-hotel").css("display","block");
					$("#before-to-hotel").css("display","none");
					/* 02 10 수정 시작 */
					$('#form-ul .li-style').css('color', 'white').css('background', '#ed4848');
					$("#li-airplane").css('color', '#ed4848').css('background', 'white');
					/* $("#li-airplane").trigger("click"); */
					/* 02 10 수정 종료 */
					
				});
				
				$("#next-to-place").click(function(){
					$("#main-div-airplane").css("display","none");
					
					$("#hotel").css("display","none");
					$(this).css("display","none");
					$("#place").css("display","block");
					$("#before-to-air").css("display","none");
					$("#before-to-hotel").css("display","block");
					$("#next-to-hotel").css("display","none");
					$("#add-plan").css("display","block");
					/* 02 10 수정 시작   */
					$('#form-ul .li-style').css('color', 'white').css('background', '#ed4848');
					$("#li-place").css('color', '#ed4848').css('background', 'white');
					/* $("#li-place").trigger("click"); */
					/* 02 10 수정 종료  */
				});
				
				$("#before-to-hotel").click(function(){
					$("#hotel").css("display","block");
					$(this).css("display","none");
					$("#place").css("display","none");
					$("#next-to-place").css("display","block");
					$("#before-to-air").css("display","block");
					$("#add-plan").css("display","none");
					/* 02 10 수정 시작   */
					$('#form-ul .li-style').css('color', 'white').css('background', '#ed4848');
					$("#li-hotel").css('color', '#ed4848').css('background', 'white');
					/* $("#li-hotel").trigger("click"); */
					/* 02 10 수정 종료  */
				});
			});
			
			/*0210 민희 - 담기 버튼 누르면 서블릿으로 선택한 name값들 보내기
			 0212 보라 서블릿 완성					*/
			
			 $("#add-plan").click(function(){
				<%if(memberLoggedIn!=null){ %>
				$("#addToPackageForm").submit();
				<%}else{%>
				alert('담기는 로그인 후 이용해주세요!');
				<%}%>
			}); 
			</script>
		</article>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</section>