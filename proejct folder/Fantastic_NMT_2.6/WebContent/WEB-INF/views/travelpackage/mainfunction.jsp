<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String depart = (String)request.getAttribute("depart");
	String arrive = (String)request.getAttribute("arrive");
	String days = (String)request.getAttribute("days");
	String price = (String)request.getAttribute("price");
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

<title>Insert title here</title>

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
   
  	/*  $("#form-ul").css('display','none'); */
    /* $("#air-containter").css('display','none'); */
    /* $("#article-select-price").css('display','none'); */
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
    
    
   
    /* $("#letgo").trigger("click"); */
    
});

$(function(){ 
        $("#input-price").change(function(){
            let price = $("#input-price").val();
            $("#input-price-result").html(price);
        });
    });



$(function () {
    
	
    $('.btn-plus').click(function () {
		let day1 = Number($("#hotel-days1").text());
		let day2 = Number($("#hotel-days2").text());
		let day3 = Number($("#hotel-days3").text());
    	console.log("day1",day1);
    	console.log("day2",day2);
    	console.log("day3",day3);
    	console.log($(this));
    	
		let startdate = $("#startDate").val().substr(8);
		let enddate = $("#endDate").val().substr(8);
    	let totalday = enddate-startdate;
    	
    	
    	
        if( (day1+day2+day3) < totalday){
        
        let temp = Number($(this).prev().text())+1;
        console.log("temp",temp);
        $(this).prev().html(temp);
        
        }else if(totalday ==0){
        	alert("출발일/도착일을 선택하세요");
        	$("#startDate").focus();

        }else{
            alert(totalday+"일 이상 입력할 수 없습니다.");
        }
        console.log( day1, day2, day3);
    });
    
    $('.btn-minus').click(function () {
    	let day1 = Number($("#hotel-days1").text());
		let day2 = Number($("#hotel-days2").text());
		let day3 = Number($("#hotel-days3").text());				
		$thisVal = $(this).parent().children().eq(4).text();
		if($thisVal != 0){
			$(this).parent().children().eq(4).text($thisVal-1);
		}
       
    });
    
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
            date.setDate(date.getDate()-5);
            $("#endDate").datepicker( "option", "minDate", date.getDate());
            $("#endDate").datepicker( "option", "maxDate", date.getDate()+10);
            console.log(date.getDate());
            $("#startDateSpan").text(selectedDate);
            
            
        }    

   });

    $( "#endDate" ).datepicker({
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
                   /* console.log("현재온도 : "+ (data.main.temp- 273.15) );
                   console.log("현재습도 : "+ data.main.humidity);
                   console.log("날씨 : "+ data.weather[0].main );
                   console.log("상세날씨설명 : "+ data.weather[0].description );
                   console.log("날씨 이미지 : "+ data.weather[0].icon );
                   console.log("바람   : "+ data.wind.speed );
                   console.log("나라   : "+ data.sys.country );
                   console.log("도시이름  : "+ data.name );
                   console.log("구름  : "+ (data.clouds.all) +"%" ); */ 
                   
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
    	
    	
    })
    
    
    
});

/* 0208동준이작업 */
$(function(){
	$("i.fa-heart").click(function(){
		
		if(!$(this).parent().parent().children("input:checkbox").prop("checked")){				
			$(this).css("color","#eb4848");
		}
		else{
				$(this).css("color","#ebebeb"); 
		}
	});	
	
	/*0210 민희 - 담기 버튼 누르면 서블릿으로 선택한 name값들 보내기*/
	
	 $("#add-plan").click(function(){
		$("#addToPackageForm").submit();
	}); 
});




</script>

<style>
.select_menu {
	position: relative;
	float: left;
	width: 28%;
	height: 70%;
	margin-right: 5%;
	padding-left: 1%;
	font-size: 1em;
	background:
		url('<%=request.getContextPath()%>/images/mainfunction/optionBG.jpg')
		no-repeat;
	background-size: 100% 98%;
	cursor: pointer;
	-webkit-appearance: none;
	left: 6%;
	border: 0px;
}

#inputUser>input {
	background-image:
		url('<%=request.getContextPath()%>/images/mainfunction/manwon.png');
	background-repeat: no-repeat;
	background-position: right;
	background-size: 80px 50px;
}

nav {
	width: 100%;
}

.nav_wrap {
	z-index: 100;
}

footer {
	position: relative;
	float: right;
	width: 100%;
}

/* 2020.02.08 작업 <왼쪽 사이드메뉴 : 형철> */
.ui-datepicker-trigger{cursor: pointer;}
#startDate,#endDate{
	font-size:24px;
	width:140px;
}
.ui-datepicker-year{
	margin-left:3px;
}
.weather-container{
	width:300px;
	height:150px;
}
.weather-image{
	width:150px;
	height:150px;
	float: left;
}
.weather-information{
	width:150px;
	height:150px;
	margin-left:150px;
	text-align: center;
}
#Temperature{
	font-size:40px;
	padding-top:25px;
}
#arrive-name{
	font-size:24px;
	padding-top:0px;
	color:gray;
}

/* 0208동준이 작업 */
.card-box{
position: relative;
}
.card-box-heart {
	position: absolute;
	top: 4%;
	left: 10%;
	width: 30px;
		height: 30px;							 
	display: none;
}
.card-box-heart+label{
	position: absolute;
	top: 4%;
	left: 2%;
	width: 30px;
	height: 30px;
}

i.fa-heart{
	font-size: 30px;		
	color: #ebebeb;			
}
.card-box:not(:last-child){
	margin-right: 1.5%;
	margin-bottom : 2%;
}
		
		

</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/nav.jsp"%>
	<header>
		<img src="<%=request.getContextPath()%>/images/mainfunction/0001.jpg"
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
			<div id="article-selectinfo">
				<ul>
					<li id="li_map"><i class="fas fa-map-marker-alt"></i> <span>국가명,
							도시명</span></li>
					<li id="li_departure"><i class="fas fa-plane-departure"></i>&nbsp;출발&nbsp;<input type="text" id="startDate" readonly/></li>
					<li id="li_arrival"><i class="fas fa-plane-arrival"></i>&nbsp;도착&nbsp;<input type="text" id="endDate" readonly/></li>
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
				<!-- <form action="" method="GET"> -->
					<br> <br>
					<div id="choose">
						<select class="select_menu" name="depart">
							<option value="" selected>출발지</option>
							<option value="incheon">인천</option>
							<option value="busan">부산</option>
						</select> 
						<select class="select_menu" name="arrive" id="arriveselect">
							<option value="" selected>도착지</option>
							<option value="france">프랑스</option>
							<option value="swiss">스위스</option>
							<option value="England, gb">영국</option>
						</select> 
					</div>
					<div id="inputUser">
						<input type="text" id="input-price" value="<%=price==null?"":price%>">
						<button type="button" id="letgo">LET'S GO</button>
					</div>
				<!-- </form> -->
			</div>
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
						<tr>
							<td><img
								src="<%=request.getContextPath()%>/images/mainfunction/semiimg_01.png"
								alt="대힌항공"></td>
							<td><input type="text" value="KE159" name="airName" readonly/></td>
							<td><input type="text" value="12:00" name="airTime_start" readonly/></td>
							<td><input type="text" value="00:00" name="airTime_end" readonly/></td>
							<td><input type="text" value="인천" name="airDepart" readonly/></td>
							<td><input type="text" value="파리" name="airArrival" readonly/></td>
							<td><input type="text" value="896300" name="airPrice" readonly/></td>
							<td><input type="radio" value="KE159" name="plane-check" id=""></td>
						</tr>
						<tr>
							<td><img
								src="<%=request.getContextPath()%>/images/mainfunction/semiimg_02.png"
								alt="아시아나항공"></td>
							<td><input type="text" value="OZ339" name="airName" readonly/></td>
							<td><input type="text" value="12:20" name="airTime_start" readonly/></td>
							<td><input type="text" value="00:40" name="airTime_end" readonly/></td>
							<td><input type="text" value="인천" name="airDepart" readonly/></td>
							<td><input type="text" value="파리" name="airArrival" readonly/></td>
							<td><input type="text" value="905120" name="airPrice" readonly/></td>
							<td><input type="radio" value="OZ339" name="plane-check" id=""></td>
						</tr>
						<tr>
							<td><img
								src="<%=request.getContextPath()%>/images/mainfunction/semiimg_03.png"
								alt="중국동방항공"></td>
							<td><input type="text" value="MU550" name="airName" readonly/></td>
							<td><input type="text" value="12:40" name="airTime_start" readonly/></td>
							<td><input type="text" value="00:30" name="airTime_end" readonly/></td>
							<td><input type="text" value="인천" name="airDepart" readonly/></td>
							<td><input type="text" value="파리" name="airArrival" readonly/></td>
							<td><input type="text" value="678240" name="airPrice" readonly/></td>
							<td><input type="radio" value="MU550" name="plane-check" id=""></td>
						</tr>
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
						<tr>
							<td><img
								src="<%=request.getContextPath()%>/images/mainfunction/semiimg_01.png"
								alt="대힌항공"></td>
							<td><input type="text" value="KE159" name="airName_" readonly/></td>
							<td><input type="text" value="12:00" name="airTime_start_" readonly/></td>
							<td><input type="text" value="00:00" name="airTime_end_" readonly/></td>
							<td><input type="text" value="인천" name="airDepart_" readonly/></td>
							<td><input type="text" value="파리" name="airArrival_" readonly/></td>
							<td><input type="text" value="896300" name="airPrice_" readonly/></td>
							<td><input type="radio" value="KE159" name="plane-check_" id="" ></td>
						</tr>
						<tr>
							<td><img
								src="<%=request.getContextPath()%>/images/mainfunction/semiimg_02.png"
								alt="아시아나항공"></td>
							<td><input type="text" value="OZ339" name="airName_" readonly/></td>
							<td><input type="text" value="12:20" name="airTime_start_" readonly/></td>
							<td><input type="text" value="00:40" name="airTime_end_" readonly/></td>
							<td><input type="text" value="인천" name="airDepart_" readonly/></td>
							<td><input type="text" value="파리" name="airArrival_" readonly/></td>
							<td><input type="text" value="905120" name="airPrice_" readonly/></td>
							<td><input type="radio" value="OZ339" name="plane-check_" id="" ></td>
						</tr>
						<tr>
							<td><img
								src="<%=request.getContextPath()%>/images/mainfunction/semiimg_03.png"
								alt="중국동방항공"></td>
							<td><input type="text" value="MU550" name="airName_" readonly/></td>
							<td><input type="text" value="12:40" name="airTime_start_" readonly/></td>
							<td><input type="text" value="00:30" name="airTime_end_" readonly/></td>
							<td><input type="text" value="인천" name="airDepart_" readonly/></td>
							<td><input type="text" value="파리" name="airArrival_" readonly/></td>
							<td><input type="text" value="678240" name="airPrice_" readonly/></td>
							<td><input type="radio" value="MU550" name="plane-check_" id=""></td>
						</tr>
					</tbody>
				</table>
			</div>
</div>			
<div id="main-div-hotel">
			<div class="card-container" id="hotel">
				<div id="hotel-cards">
					<div class="card-box">
						<img
							src="<%=request.getContextPath()%>/images/mainfunction/semiimg_04.jpg"
							alt="호텔사진1">
						<div id="lower-price">
							<p>최저가</p>
						</div>
						<br>
						<div class="card-box-1-info">
							<!-- <span>므제브호텔</span> -->
							<p class="hotel-name">므제브호텔</p>
							<span class="price">190,494 <i class="fas fa-won-sign"></i></span><br>

							<button class="btn-minus" type="button">-</button>
							<span name="hotel-days" id="hotel-days1">0</span>
							<button class="btn-plus" type="button">+</button>

						</div>
					</div>
					<div class="card-box">
						<img
							src="<%=request.getContextPath()%>/images/mainfunction/semiimg_06.jpg"
							alt="호텔사진1" width="300px">
						<div id="lower-price">
							<p>최저가</p>
						</div>
						<br>
						<div class="card-box-1-info">
							<!-- <span>주네브아에로포트페르니볼</span> -->
							<p class="hotel-name">주네브아에로포트페르니볼</p>
							<span class="price">190,494 <i class="fas fa-won-sign"></i></span><br>
							<!-- <i class="fas fa-plus"></i><span>value</span><i class="fas fa-minus"></i> -->
							<button class="btn-minus" type="button">-</button>
							<span name="hotel-days" id="hotel-days2">0</span>
							<button class="btn-plus" type="button">+</button>
						</div>
					</div>
					<div class="card-box">
						<img
							src="<%=request.getContextPath()%>/images/mainfunction/semiimg_05.jpg"
							alt="호텔사진1">
						<div id="lower-price">
							<p>최저가</p>
						</div>
						<br>
						<div class="card-box-1-info">
							<!-- <span>다이아몬드베이터레이스</span> -->
							<p class="hotel-name">다이아몬드베이터레이스</p>
							<span class="price">190,494 <i class="fas fa-won-sign"></i></span><br>
							<button class="btn-minus" type="button">-</button>
							<span name="hotel-days" id="hotel-days3">0</span>
							<button class="btn-plus" type="button">+</button>
						</div>
					</div>
				</div>
			</div>
	</div>
<style>
.hotel-name {
	padding-top: 10px;
}
</style>
			<div class="card-container" id="place">
				<div class="card-box">
				
				<!--2020 02 08 추가-시작 -->
					<input type="checkbox" value="관광지코드1" class="card-box-heart" id="card-box-1-heart" name="packplace">
					<label for="card-box-1-heart"><i class="fas fa-heart"></i></label>
				<!--2020 02 08 추가-완료 -->

					<img
						src="<%=request.getContextPath()%>/images/mainfunction/switzerland-1547270_1920.jpg"
						alt="호텔사진1" width="300px"> <br>
					<div class="card-box-1-info">
						<p>루브르 미술관</p>
						<span class="price">190,494 <i class="fas fa-won-sign"></i></span><br>
						<span>1인권</span><br />
					</div>
				</div>
				
				<div class="card-box">
				<!--2020 02 08 추가-시작 -->
					<input type="checkbox" value="관광지코드2" class="card-box-heart" id="card-box-2-heart" name="packplace">
					<label for="card-box-2-heart"><i class="fas fa-heart"></i></label>
				<!--2020 02 08 추가-완료 -->
					<img
						src="<%=request.getContextPath()%>/images/mainfunction/semiimg_07.jpg"
						alt="호텔사진1"> <br>

					<div class="card-box-1-info">
						<p>오르세 미술관</p>
						<span class="price">190,494 <i class="fas fa-won-sign"></i></span><br>
						<span>1인권</span><br />
					</div>
					
					
					
				</div>

				<div class="card-box">
					<!--2020 02 08 추가-시작 -->
						<input type="checkbox" value="관광지코드3" class="card-box-heart" id="card-box-3-heart" name="packplace">
						<label for="card-box-3-heart"><i class="fas fa-heart"></i></label>
					<!--2020 02 08 추가-완료 -->
					<img
						src="<%=request.getContextPath()%>/images/mainfunction/semiimg_08.jpg"
						alt="호텔사진1"> <br>
					<div class="card-box-1-info">
						<p>스위스 기차여행</p>
						<span class="price">190,494 <i class="fas fa-won-sign"></i></span><br>
						<span>1인권</span><br />

					</div>
				</div>
				
					<!--2020 02 08 추가-시작 -->
				<div class="card-box">
					
						<input type="checkbox" value="관광지코드4" class="card-box-heart" id="card-box-4-heart" name="packplace">
						<label for="card-box-4-heart"><i class="fas fa-heart"></i></label>
					
					<img
						src="<%=request.getContextPath()%>/images/mainfunction/semiimg_08.jpg"
						alt="호텔사진1"> <br>
					<div class="card-box-1-info">
						<p>스위스 기차여행</p>
						<span class="price">190,494 <i class="fas fa-won-sign"></i></span><br>
						<span>1인권</span><br />

					</div>
				</div>				
				<div class="card-box">
					
						<input type="checkbox" value="관광지코드5" class="card-box-heart" id="card-box-5-heart" name="packplace">
						<label for="card-box-5-heart"><i class="fas fa-heart"></i></label>
					
					<img
						src="<%=request.getContextPath()%>/images/mainfunction/semiimg_08.jpg"
						alt="호텔사진1"> <br>
					<div class="card-box-1-info">
						<p>스위스 기차여행</p>
						<span class="price">190,494 <i class="fas fa-won-sign"></i></span><br>
						<span>1인권</span><br />

					</div>
				</div>				
				<div class="card-box">
					
						<input type="checkbox" value="관광지코드6" class="card-box-heart" id="card-box-6-heart" name="packplace">
						<label for="card-box-6-heart"><i class="fas fa-heart"></i></label>
					
					<img
						src="<%=request.getContextPath()%>/images/mainfunction/semiimg_08.jpg"
						alt="호텔사진1"> <br>
					<div class="card-box-1-info">
						<p>스위스 기차여행</p>
						<span class="price">190,494 <i class="fas fa-won-sign"></i></span><br>
						<span>1인권</span><br />

					</div>
				</div>	
				
				<div class="card-box">
					
						<input type="checkbox" value="관광지코드7" class="card-box-heart" id="card-box-7-heart" name="packplace">
						<label for="card-box-7-heart"><i class="fas fa-heart"></i></label>
					
					<img
						src="<%=request.getContextPath()%>/images/mainfunction/semiimg_08.jpg"
						alt="호텔사진1"> <br>
					<div class="card-box-1-info">
						<p>스위스 기차여행</p>
						<span class="price">190,494 <i class="fas fa-won-sign"></i></span><br>
						<span>1인권</span><br />

					</div>
				</div>				
				<div class="card-box">
					
						<input type="checkbox" value="관광지코드8" class="card-box-heart" id="card-box-8-heart" name="packplace">
						<label for="card-box-8-heart"><i class="fas fa-heart"></i></label>
					
					<img
						src="<%=request.getContextPath()%>/images/mainfunction/semiimg_08.jpg"
						alt="호텔사진1"> <br>
					<div class="card-box-1-info">
						<p>스위스 기차여행</p>
						<span class="price">190,494 <i class="fas fa-won-sign"></i></span><br>
						<span>1인권</span><br />

					</div>
				</div>				
				<div class="card-box">
					
						<input type="checkbox" value="관광지코드9" class="card-box-heart" id="card-box-9-heart" name="packplace">
						<label for="card-box-9-heart"><i class="fas fa-heart"></i></label>
					
					<img
						src="<%=request.getContextPath()%>/images/mainfunction/semiimg_08.jpg"
						alt="호텔사진1"> <br>
					<div class="card-box-1-info">
						<p>스위스 기차여행</p>
						<span class="price">190,494 <i class="fas fa-won-sign"></i></span><br>
						<span>1인권</span><br />

					</div>
				</div>				
	
					<!--2020 02 08 추가-완료 -->
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
			
			</script>
			<style>
.btn-loc-to {
	width: 180px;
	height: 40px;
	background: #ed4848;
	border: 2px solid #ed4848;
	border-radius: 10px;
	margin-right : 20px;
	color: white;
	float:right;
	font-size: 18px;
}

.next-button {
	position: relative;
	bottom: 10%;
	float: right;
	width: 410px;
	margin-top : 20px;
	margin-bottom: 20px;
}
</style>

		</article>
	</section>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>