<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypage</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/member/main.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/member/mypage.css">
<link href="https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/226b55f414.js" crossorigin="anonymous"></script>
<style>
.nav_wrap{
	z-index:10;
}
</style>
<script>
function deleteMember(){
	
}
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/common/nav.jsp" %>
<%
	Member m = (Member)request.getAttribute("member");
	//System.out.println(m);
	
	//패키지 리스트 작성 시 참고
	//String[] hobby = member.getHobby().split(",");
	//List<String> hobbyList = null;
	//if(hobby != null) hobbyList = Arrays.asList(hobby);
%>
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
                            <td>관심여행지</td>
                            <td>멤버관심여행지</td>
                        </tr>
                    </table>
                </div>
                <div class="myinfo-box bggray myinfo-box-div">
                
                    <h3>사용가능한 마일리지</h3>
                    <span><%=(int)m.getMile() %></span><span>마일</span>
                    <button class="btn-all">마일리지 사용내역</button>
                </div>            
            </div>
        </div>
        <div name="mypage-section-title">
            <h1 id="mypage-section-text">구매리스트</h1>
        </div>
        <div class="mypage-wrap mypage-select-title">
            <span class="margin-bottom">항공권</span>
            <table id="mypage-table-list-air">
                <tr>
                    <th>번호</th>
                    <th>코드</th>
                    <th>시간</th>
                    <th>in</th>
                    <th>out</th>
                    <th>가격</th>
                </tr>
            
                <tr>
                    <td>1</td>
                    <td>A100239</td>
                    <td>07:45</td>
                    <td>대한민국/인천</td>
                    <td>프랑스/파리</td>
                    <td>750,999 원</td>
                </tr>
            
                <tr>
                    <td>1</td>
                    <td>A100239</td>
                    <td>07:45</td>
                    <td>대한민국/인천</td>
                    <td>프랑스/파리</td>
                    <td>750,999 원</td>
                </tr>
            
                <tr>
                    <td>1</td>
                    <td>A100239</td>
                    <td>07:45</td>
                    <td>대한민국/인천</td>
                    <td>프랑스/파리</td>
                    <td>750,999 원</td>
                </tr>
            </table>
        </div>
        <div class="mypage-wrap mypage-select-title">
            <span class="margin-bottom">호텔/숙박</span>
            <table id="mypage-table-list-hotel">
                <tr>
                    <th>번호</th>
                    <th>코드</th>
                    <th>인원</th>
                    <th>기간</th>
                    <th>위치</th>
                    <th>가격</th>
                </tr>
                <tr>
                    <td>1</td>
                    <td>HO11202</td>
                    <td>3</td>
                    <td>2020.2.6~2.7</td>
                    <td>프랑스/파리</td>
                    <td>690,000 원</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>HO11202</td>
                    <td>3</td>
                    <td>2020.2.6~2.7</td>
                    <td>프랑스/파리</td>
                    <td>690,000 원</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>HO11202</td>
                    <td>3</td>
                    <td>2020.2.6~2.7</td>
                    <td>프랑스/파리</td>
                    <td>690,000 원</td>
                </tr>
            </table>
        </div>
        <div class="mypage-wrap mypage-select-title">
            <span class="margin-bottom">관광지 / 관광티켓</span>
            <table id="mypage-table-list-place">
                    <tr>
                        <th>번호</th>
                        <th>코드</th>
                        <th>관광티켓명</th>
                        <th>가격</th>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>HO11202</td>
                        <td></td>
                        <td>690,000 원</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>HO11202</td>
                        <td></td>
                        <td>690,000 원</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>HO11202</td>
                        <td></td>
                        <td>690,000 원</td>
                    </tr>
                </table>
        </div>
        <div class="mypage-wrap mypage-select-result" id="mypage-result-box">            
                <div><span class="center">총합</span></div>
                <div><span class="center">예상 금액 123,456원 절약</span></div>
                <div><span class="center"><p class="mypage-totalmoney">2,345,567원</p></span></div>            
        </div>
        <div style="width: 100%; height: 250px; text-align: center;">
        </div>

    </section>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

