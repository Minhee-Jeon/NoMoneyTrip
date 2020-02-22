<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.model.vo.Member"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fantastic_NMT</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.js"></script>
<link href="https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/member/main.css">
<script src="https://kit.fontawesome.com/226b55f414.js" crossorigin="anonymous"></script>

<style>
.main_img{
    height: 980px;
    background-image: url(<%=request.getContextPath() %>/images/main/semiproject_main_crop_01.png);
    background-repeat: no-repeat;
    background-position: top center;
    background-size: cover;
    
    background-attachment: fixed;
    border: 1px solid rgba(0,0, 0, 0);
}
.img_big{
	background-image : url(<%=request.getContextPath() %>/images/main/main_hotel1.jpg); 
    /* background-size: cover; */
    /* background-position: top center; */
}
.mini_img img{width:180px; height:125px;
}

</style> 
<script>
$(document).ready(function () {
    $('.btn_wrap input[type=button]').click(function () {
        $('.btn_wrap input[type=button]').css('color', 'white').css('background', '#ed4848');
        $(this).css('color', '#ed4848').css('background', 'white');
    });
    
    //0211 민희 - 인덱스에 최저가호텔 n초마다 갱신해서 보여주기
    let cnt = 0;
		
    $.ajax({
    	url:"<%=request.getContextPath()%>/product/travel/controller/mainViewHotel.do",
    	dataType:"json",
    	success: data=>{
    		setInterval(() => {
	    		
    			let $curHtl = data[cnt]; //현재화면에 보여질 최저가호텔 객체
    			
	    		/* console.log(data[0]); //영국 최저가호텔 객체
	    		console.log(data[1]); //프랑스 최저가호텔 객체
	    		console.log(data[2]); //스위스 최저가호텔 객체   */
			    		 
			   //console.log($curHtl.hotelName);
			  
			   /* $(".cheapest-htlImg1".css({"background":"url(images/hotel/"+$curHtl.hotelCode+".1.jpg)"})); */
			   $(".cheapest-htlImg1").attr("src", "images/hotel/"+$curHtl.hotelCode+".1.jpg");
			   $(".cheapest-htlImg2").attr("src", "images/hotel/"+$curHtl.hotelCode+".2.jpg");
			   $(".cheapest-htlImg3").attr("src", "images/hotel/"+$curHtl.hotelCode+".3.jpg");
			   $(".cheapest-htlImg4").attr("src", "images/hotel/"+$curHtl.hotelCode+".4.jpg");
			  
			   $("#cheapest-htlName").html($curHtl.hotelName);
			   $("#cheapest-htlPrice").html($curHtl.hotelPrice+" ￦");
			   $("#cheapest-htlNation").html($curHtl.nationCode);
			   $("#cheapest-htlCity").html($curHtl.distanceLevel);
	    		
	    		
	    		cnt = cnt +1;
	    		
	    		if(cnt>=3){
	    			cnt = 0;
	    		}
			}, 5000); //5초에 한번 갱신
    	},
    	error:(x,s,e)=>{
    		console.log(x,s,e);
    	}
    })

    
});/* 온로드함수 끝 */

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
</head>
<body>
<%@ include file="/WEB-INF/views/common/nav.jsp" %>
    <header>
        <div class="main_img">
            <div class="main_title">
                <h1>NO MONEY ?<br>GO TRIP !</h1>
                <p>Lorem Ipsum is simply dummy text of the<br>
                printing and typesetting industry. Lorem<br>
                Ipsum has been the industry's</p>
            </div>
            <form action="<%=request.getContextPath() %>/main/mainfunction" method="get">
            <div class="main_skil1">
                <div class="select_1">
                    <select name="depart" id="select_nation">
                        <option value="" selected>출발지</option>
						<option value="incheon">인천</option>
						<option value="busan">부산</option>
                    </select>
                </div>
                <div class="select_1_1">
                    <select name="arrive" id="select_city">
                        <option value="" selected>도착지</option>
							<option value="france">프랑스</option>
							<option value="swiss">스위스</option>
							<option value="englind">영국</option>
                    </select>
                </div>  
                <!-- 일수 선택 날리기
                <div class="select_2">
                    <select name="days" id="select_days">
                       <option value="" selected >일수선택</option>
							<option value="5" >5일</option>
							<option value="10">10일</option>
							<option value="15">15일</option>
                    </select>
                </div>
                 -->
            </div>
            <div class="main_skil2">
                <div class="btn_wrap">
                    <input type="button" id="btn_air" value="항공권">
                    <input type="button" id="btn_hotel" value="호텔/숙박">
                    <input type="button" id="btn_place" value="관광명소">    
                </div>    
                <div class="price_wrap">
                    <input type="text" id="price" name="price" placeholder="원하는 가격을 입력하세요">
                    <input type="submit" id="btn_letgo" value="LET'S GO">
                </div>
            </div>
         </form>
    </header>
    <section class="sec1">
            <div class="sub_title">
                <h2>여기는 어때요?</h2>
                <p>Lorem Ipsum is simply dummy text of the printing<br>
                    Ipsum has been the industry's</p>
            </div>
            <div class="recomand_list">
                <div class="re_col1">
                    <img src="<%=request.getContextPath() %>/images/main/semiproject_main_crop_04.png" width="380px" height="295px">
<!--  하트 삭제                  <i class="fas fa-heart" id="heart" onclick="like();"></i>  -->
                    <div class="title_star1">
                        <h3>서브타이틀</h3>
                        <div class="star_wrap1">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </div>
                    </div>
                    <p>Lorem Ipsum is simply dummy text of the printing
                        and typesetting industry. LoremIpsum has been th
                       </p>
                </div>
                <div class="re_col2">
                    <img src="<%=request.getContextPath() %>/images/main/semiproject_main_crop_06.png" width="380px" height="295px">
<!--  하트 삭제                      <i class="fas fa-heart" id="heart" onclick="like();"></i> -->
                    <div class="title_star2">
                        <h3>서브타이틀</h3>
                        <div class="star_wrap2">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </div>
                    </div>
                    <p>Lorem Ipsum is simply dummy text of the printing
                        and typesetting industry. LoremIpsum has been th
                        </p>
                </div>
                <div class="re_col3">
                    <img src="<%=request.getContextPath() %>/images/main/semiproject_main_crop_08.png" width="380px" height="295px">
<!--  하트 삭제                      <i class="fas fa-heart" id="heart" onclick="like();"></i> -->
                    <div class="title_star3">
                        <h3>서브타이틀</h3>
                        <div class="star_wrap3">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </div>
                    </div>
                    <p>Lorem Ipsum is simply dummy text of the printing
                        and typesetting industry. LoremIpsum has been th
                        </p>
                </div>
            </div>
    </section>
    <section class="sec2">
        <div class="red_bg">
            <div class="trd_title">
                <h2>최저가로 만나보세요</h2>
                <p>Lorem Ipsum is simply dummy text of the printing</p>
            </div>
            <div class="hotel_wrap">
               <div class="img_album">
			        <div class="img_big">
			            <div class="mySlides fade"><img class="cheapest-htlImg1" src="<%=request.getContextPath() %>/images/main/main_hotel1.jpg"></div>
			            <div class="mySlides fade"><img class="cheapest-htlImg2" src="<%=request.getContextPath() %>/images/main/main_hotel2.jpg"></div>
			            <div class="mySlides fade"><img class="cheapest-htlImg3" src="<%=request.getContextPath() %>/images/main/main_hotel3.jpg"></div>
			            <div class="mySlides fade"><img class="cheapest-htlImg4" src="<%=request.getContextPath() %>/images/main/main_hotel4.jpg"></div>
			        </div>
			        <div class="img_album_nav">
			            <i class="fas fa-angle-left" onclick="plusSlides(-1)" id="prev"></i>
			            <i class="fas fa-angle-right" onclick="plusSlides(1)" id="next"></i>
			        </div>
			        <br>
			        <div class="indicator">
			            <span class="dot" onclick="currenSlide(1)"></span>
			            <span class="dot" onclick="currenSlide(2)"></span>
			            <span class="dot" onclick="currenSlide(3)"></span>
			            <span class="dot" onclick="currenSlide(4)"></span>
			        </div>
			        <br>
			        <div class="img_album_mini">
			            <div class="mini_img" onclick="currenSlide(1)"><img class="cheapest-htlImg1" src="<%=request.getContextPath() %>/images/main/main_hotel1.jpg" width="180px"></div>
			            <div class="mini_img" onclick="currenSlide(2)"><img class="cheapest-htlImg2" src="<%=request.getContextPath() %>/images/main/main_hotel2.jpg" width="180px"></div>
			            <div class="mini_img" onclick="currenSlide(3)"><img class="cheapest-htlImg3" src="<%=request.getContextPath() %>/images/main/main_hotel3.jpg" width="180px"></div>
			            <div class="mini_img" onclick="currenSlide(4)"><img class="cheapest-htlImg4" src="<%=request.getContextPath() %>/images/main/main_hotel4.jpg" width="180px"></div>
			        </div>
   				</div>
                <div class="hotel_content1">
                    <div class="hotel_title_wrap">
                        <h3>최저가</h3>
                        <h2 id="cheapest-htlPrice">90,494 ₩</h2>
                        <h4 id="cheapest-htlName">오요 뉴 돔 호텔</h4>
                    </div>
                    <div class="hotel_p_wrap">
                        <div class="location_wrap">
                            <p><span id="cheapest-htlNation">영국</span>, <span id="cheapest-htlCity">런던</span></p>
                            <i class="fas fa-map-marker-alt"></i>
                        </div>
                        <div class="days_wrap">
                        <p>1박 기준</p>
                        <i class="fas fa-calendar-alt"></i>
                        </div>
                    </div>
                </div>
                <div class="hotel_content2">
                    <input type="button" id="btn_go" value="상품보러가기">
                </div>
            </div>
        </div>
    </section>
<script type="text/javascript">
	$('.img_big').slick();
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>