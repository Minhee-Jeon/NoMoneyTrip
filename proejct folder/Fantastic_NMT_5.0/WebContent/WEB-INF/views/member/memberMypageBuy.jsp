<%@page import="java.text.DecimalFormat"%>
<%@page import="product.travel.model.vo.Place"%>
<%@page import="java.util.List"%>
<%@page import="product.travel.model.vo.Hotel"%>
<%@page import="product.travel.model.vo.Air"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
	Member m = (Member)request.getAttribute("member");
	Air airDepart = (Air)request.getAttribute("airDepart");
	Air airArrive = (Air)request.getAttribute("airArrive");
	List<Hotel> realHotel = (List<Hotel>)request.getAttribute("realHotel");
	List<Place> placeList = (List<Place>)request.getAttribute("placeList");
	
	DecimalFormat priceFormat = new DecimalFormat("###,###");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypage</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/member/main.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/member/mypage.css">
<link href="https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/226b55f414.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<%@ include file="/WEB-INF/views/common/nav.jsp" %>
<script>
$(function(){
	$("#mypage-purchaseList").css("display","none");
	$("#mypage-wishList").css("display","block");
	/* 0217 수정 start */
	$("#btn-big2").css({"background-color":"#f9c1c1", "font-weight":"900"});
	/* 0217 수정 end */
	
	//담은 플랜 보기
	$("#btn-big1").click(function(){
		$(this).css({"background-color":"#f9c1c1", "font-weight":"900"});
		$("#btn-big2").css({"background-color":"white", "font-weight":"bold"});
		$("#mypage-purchaseList").css("display","none");
		$("#mypage-wishList").css("display","block");
	});
	
	//플랜 당 전체선택
	$(".checkAll").click(function(){
		let $allchkbx = $(this).parent().find("input[type=checkbox]"); //모든 체크박스
		console.log($allchkbx);
		$allchkbx.prop("checked",true);
	});
	//플랜 당 전체선택해제
	$(".uncheckAll").click(function(){
		let $allchkbx_ = $(this).parent().find("input[type=checkbox]"); //모든 체크박스
		console.log($allchkbx_);
		$allchkbx_.prop("checked",false);
	});
	
	/* 0217 수정 start */
	$("#btn-big1").click(function(){
		
		location.href='<%=request.getContextPath()%>/member/memberPageView?memberCode=<%=memberLoggedIn.getMcode()%>'
	});
   $("#btn-mile").click(function(){
	      
	      
	   var pop = open("<%=request.getContextPath()%>/member/viewMile?mcode=<%=m.getMcode()%>",'pop','width=720,height=1200,left=500px,top=200px, scrollbars=yes, resizable=yes');
	      
   });
	/* 0217 수정 end */
});

function deleteMember(){
	let result = confirm('정말 탈퇴하시겠습니까?'); 
	if(result==true) { 
		//탈퇴할래요
		var deletePW = prompt('탈퇴를 위해 비밀번호를 입력해주세요.',''); 
		if(deletePW != null){
			if(deletePW == "<%=m.getPassword()%>"){
				//탈퇴서블릿으로
				location.href = "<%=request.getContextPath()%>/member/deleteMember?memberId=<%=memberLoggedIn.getMemberId()%>";
			}
			else{
				alert('비밀번호가 틀렸습니다.');
			}
			
		}
	} 
	else { //탈퇴하지 않을래요
	}
	
}
</script>
</head>
<body>
 <header id="mypage-header">
        <div id="mypage-header-title">
            <p id="mypage-header-text" class="eng">MY PAGE</p>
            <p id="mypage-header-subtext" class="eng">NMT 내정보 보기</p>
        </div>
    </header>
    <section id="mypage-section">
        <div name="mypage-section-title">
            <h1 id="mypage-section-text">마이페이지</h1>
            <br>
            <h3 id="mypage-section-subtext">회원님의 상세정보와 구매리스트 확인이 가능합니다</h3>
        </div>
        <div id="mypage-section-info">
            <div class="mypage-wrap wrap-height">
                <div class="myinfo-box left">
                    <h1 class="mypage-welcome-msg">안녕하세요</h1>
                    <span class="mypage-welcome-name"><%=m.getMemberName() %></span><span class="mypage-welcome-msg nim">님</span>
                    <br>
                    <button class="btn-all margin-top" onclick="location.href='<%=request.getContextPath() %>/member/memberUpdateView?memberId=<%=memberLoggedIn.getMemberId()%>'">회원정보 수정</button> <br><br>
                    <button class="btn-all" onclick="deleteMember();">회원 탈퇴</button>
                </div>
                <div class="myinfo-box bggray">
                    <table id="myinfo-table">
                        <tr>
                            <td>아이디</td>
                            <td><%=m.getMemberId() %></td>
                        </tr>
                        <tr>
                            <td>이메일</td>
                            <td><%=m.getEmail() %></td>
                        </tr>
                        <tr>
                            <td>생년월일</td>
                            <td><%=m.getBirthDay() %></td>
                        </tr>
                        <tr>
                            <td>가입일</td>
                            <td><%=m.getEnrollDate() %></td>
                        </tr>
                    </table>
                </div>
                <div class="myinfo-box bggray myinfo-box-div">
                
                    <h3>사용가능한 마일리지</h3>
                    <span><%=(int)m.getMile() %></span><span>마일</span>
                    <button type="button"  class="btn-all" id="btn-mile">마일리지 사용내역</button>
                </div>            
            </div>
        </div>
        <div class="mypage-btnsection">
        	<button id="btn-big1">담은 플랜</button>
        	<button id="btn-big2">구매 내역</button>
        	<hr class="red-border"/>
        </div>
        <section id="mypage-wishList">
        <%if(airDepart!=null){ %>	
        <div name="mypage-section-title">
            <h1 id="mypage-section-text_">구매 내역</h1>
        </div>
        <div class="mypage-wrap mypage-select-title">
            <span class="margin-bottom">플랜 1</span>
            <button class="btn-pack checkAll">전체선택</button>
            <button class="btn-pack uncheckAll">전체선택해제</button>
            <button class="btn-pack">선택삭제</button>
            <table id="mypage-table-list-air">
                <tr>
                	<th><p class="red-text">항공권</p></th>
                    <th>번호</th>
                    <th>편명</th>
                    <th>날짜</th>
                    <th>in</th>
                    <th>out</th>
                    <th>가격</th>
                </tr>
            
                <tr>
                	<td>
                		<div class="chkbx-center">
                	
		               	 	<label class="container">
							  <input type="checkbox">
							  <span class="checkmark"></span>
							</label>
						</div>
                	</td>
                    <td>1</td>
                    <%String depart = ""; int packagePrice = 0;
                    if(airDepart.getNationDepart().equals("incheon")){
                    	depart = "대한민국/인천";
                    }else{
                    	depart = "대한민국/부산";
                    }
                   packagePrice += airDepart.getAirPrice();
                   String arrive ="";
                   if(airDepart.getNationArrival().equals("swiss")){
                	   arrive = "스위스/취리히";   
                   }else if(airDepart.getNationArrival().equals("england")){
                	   arrive = "영국/런던";
                   }else{
                	   arrive = "프랑스/파리";
                   }
                   
                   
					
					String airPrice = priceFormat.format(airDepart.getAirPrice());
                    	%>
                    <td><%=airDepart.getAirName()%></td>
                    <td><%=airDepart.getAirDepart() %></td>
                    <td><%=depart %></td>
                    <td><%=arrive %></td>
                    <td><%=airPrice %> 원</td>
                </tr>
            
                <tr>
                	<td>
                		<div class="chkbx-center">
		               	 	<label class="container">
							  <input type="checkbox">
							  <span class="checkmark"></span>
							</label>
						</div>
                	</td>
                    <td>2</td>
                    <%
                  	String depart_ = "";
                    String arrive_ = "";
                    if(airArrive.getNationDepart().equals("swiss")){
                    	depart_ = "스위스/취리히";
                    }else if(airArrive.getNationDepart().equals("england")){
                    	depart_ = "영국/런던";
                    }else{
                    	depart_ = "프랑스/파리";
                    }
                    packagePrice += airArrive.getAirPrice();
                    if(airArrive.getNationArrival().equals("busan")){
                    	arrive_= "부산";
                    }else{
                    	arrive_="인천";
                    }
                    String airPrice_ = priceFormat.format(airArrive.getAirPrice());
                    	%>
                    <td><%=airArrive.getAirName()%></td>
                    <td><%=airArrive.getAirDepart() %></td>
                    <td><%=depart_ %></td>
                    <td><%=arrive_ %></td>
                    <td><%=airPrice_ %> 원</td>
                </tr>
            
                <tr>
                	<th><p class="red-text">호텔/숙박</p></th>
                    <th>번호</th>
                    <th>코드</th>
                    <th>숙박일수</th>
                    <th>위치</th>
                    <th>가격</th>
                    <th>총 가격</th>
                </tr>
                	<%
                	String location = "";
                	
                	for(int i=0;i<realHotel.size();i++){
                		if(realHotel.get(i).getNationCode().equals("swiss")){
                			location = "스위스/취리히";
                		}else if(realHotel.get(i).getNationCode().equals("england")){
                			location = "영국/런던";
                		}else{
                			location = "프랑스/파리";
                		}
                		
           				packagePrice += (realHotel.get(i).getHotelPrice()*realHotel.get(i).getHotelDays());
           				String hotelPrice = priceFormat.format(realHotel.get(i).getHotelPrice());
           				String totalPrice = priceFormat.format(realHotel.get(i).getHotelPrice()*realHotel.get(i).getHotelDays());
           				if(realHotel.get(i).getHotelDays()!=0){ %>
                <tr>
                	<td>
                		<div class="chkbx-center">
		               	 	<label class="container">
							  <input type="checkbox">
							  <span class="checkmark"></span>
							</label>
						</div>
                	</td>
                    <td><%=i+1 %></td>
                    <td><%=realHotel.get(i).getHotelCode().toUpperCase() %></td>
                    <td><%=realHotel.get(i).getHotelDays() %></td>
                    <td><%=location %></td>
                    <td><%=hotelPrice %> 원</td>
                    <td><%=totalPrice %>원</td>
                </tr>
                    <%} 
                    }%>
            </table>
             <div class="package_list">
				<%for(Place p:placeList){ %>
                <section class="pack">
                    <div class="">
		               	 	<label class="container">
							  <input type="checkbox">
							  <span class="checkmark chkbx-pic"></span>
							</label>
					</div>
                    <img src="<%=request.getContextPath()%>/images/place/<%=p.getPlaceImg()%>" width="232px" height="180px">
                    <div class="each_package_content">
                        <h3><%=p.getPlacePrice() %></h3>
                    </div>
                    <p><%=p.getPlaceName() %></p>
                    </section>
                    <%} %>

                </div>
              </div>
              <div class="mypage-wrap">
              <%int discount = 3000000-packagePrice;%>
                <div class="mypage-select-result float-left" id="mypage-result-box">            
	                <div><span class="center">총합</span></div>
	                <div><span class="center">예상 금액 <%=priceFormat.format(discount) %>절약!</span></div>
	                <div><span class="center"><p class="mypage-totalmoney"><%=priceFormat.format(packagePrice) %></p></span></div>            
       			 </div>
       		 </div>
         <div class="mypage-wrap mypage-select-title clear-both">
         <hr class="red-border" />
          <div style="width: 100%; height: 60px; text-align: center;" class="clear-both">
 		  </div>
 		  </div>
       
        </section><!-- end of purchaseList section -->
	<script>
	IMP.init('imp06795490');
	
	function buyPackage(){
		IMP.request_pay({
		    pg : 'danal', // version 1.1.0부터 지원.
		    pay_method : 'vbank',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '주문명:결제테스트',
		    amount : <%=packagePrice%>,
		    buyer_name : '<%=m.getMemberName()%>',
		    buyer_tel : <%=m.getPhone()%>,
		    buyer_email:'<%=m.getEmail()%>',
		    buyer_addr : '<%=m.getAddress()%>'
		}, function (rsp) { 
		    if (rsp.success) { 
		         jQuery.ajax({
		            url: "<%=request.getContextPath()%>/buy/packageList.do", // 가맹점 서버
		            method: "POST",
		            headers: { "Content-Type": "application/json" },
		            data: {
		                imp_uid: rsp.imp_uid,
		                merchant_uid: rsp.merchant_uid,
		                userId : <%=m.getMcode()%>
		            }
		        }).done(function (data) {
		          alert('결제에 성공했습니다!');
		        });
		      } else {
		        alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
		      }
		});
	}
	</script>
	<%} %>
    </section><!-- end of Mypage section -->

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

