<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberUpdate</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.js"></script>
<link href="https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/member/main.css">
<script src="https://kit.fontawesome.com/226b55f414.js" crossorigin="anonymous"></script>
<style>
.outer{
  background: #ED4848;
  background-size: 100%;
  height:425px;
  position: relative;
}
.maintitle{
  width: 610px;
  text-align: center;
  color: white;
  font-family: 'Josefin Sans',sans-serif;
  /* margin:0 auto; */
  position: relative;
  left:50%;
  top:60%;
  transform:translateX(-50%) translateY(-50%);
}
.maintitle h1{
  font-size:87px;
}
.maintitle p{
  font-size: 20px;
}  
section{
  font-family:'Noto Sans KR',sans-serif ;
}
.outsection{
  max-width: 100%;
  font-family:'Noto Sans KR',sans-serif ;
  margin:0 auto;
}
input[type]::placeholder { color: #3B3B3B; font-size: 18px; opacity: 0.8; left: 20px;}
.insection{
  /* position: absolute; */
  /* left:34%;
  bottom: 10%; */
 width:630px;
 margin: 0 auto;
}
.insection input{
  width:580px;
  height:85px;
  background-color: #EBEBEB;
  border:none;
  font-size:25px;
  padding-left: 30px;
}
.formtitle{
  text-align: center;
  margin-top: 30px;
}
.servetitle{
  /* margin-left: 12%; */
  margin-top:15px;
  font-size: 16px;
}
p.title{
  /* margin-left: 17%; */
  font-size: 30px;
  margin-top:60px;
  font-weight:bold;
 }
.pclass{
  	margin-top:10px;
  	margin-bottom:10px;
}
select::-ms-expand{
  display:none;
}
#genderspan{
  margin-left: 260px;
}
input[id=birthday1],input[id=birthday2],input[id=birthday3]{
  width:170px;
}
input[id=birthday2],input[id=birthday3]{
  /* margin-left: 10px; */
}
.outendtitle{
  width:584px;
  text-align: center;
  margin-bottom:100px;
}
.outendtitle input{
  /* padding-top: 25px; */
  color: white;
  font-size: 30px;
  cursor: pointer;
  background-color: #ED4848;
}
p.checkmsg{
  color:red;
}
/* footer{
	margin-top:1300px;
} */
nav{
	width:100%;
	height:100px;
	z-index:100;
	position: absolute;
}
#update{
width:610px;
}
.update-gray-text{ color: rgb(180,180,180); }
span { margin-left : 30px;}
input {margin-bottom: 20px;}
input[type=submit]{
	padding-left:0;
}
</style>
</head>
<body>
	<header>
<%@ include file="/WEB-INF/views/common/nav.jsp" %>
<%
	Member m = (Member)request.getAttribute("member");
%>
    <div class="outer">
      <div class="maintitle">
        <h1>EDIT PROFILE</h1>
        <p>Please update your information if there's changed.</p>
      </div>
    </div>
  </header>
  <section>
    <div class="outsection">
          <div class="formtitle">
            <p class="title">회원정보 수정</p>
            <p class="servetitle">바뀐 정보가 있다면, 고객님의 정보를 수정해주세요.</p><br>
          </div>
      <div class="insection">
        <form id="memberUpdateFrm" method="post" onsubmit="return updateValidate();" action= "<%=request.getContextPath()%>/member/updateMemberEnd">
          <p class="pclass">아이디<span class="pclass update-gray-text">아이디는 변경하실 수 없습니다.</span></p>
          
          <input type="text" name="memberId" id="memberId_" value="<%=m.getMemberId()%>" readonly>
          <!-- <p class="checkmsg">대소문자 포함 8~12자리</p>
          <p class="pclass">비밀번호 확인</p>
          <input type="password" name="passwordChk" id="passwordChk" placeholder="비밀번호를 입력하세요">
          <p class="checkmsg"></p> -->
          <p class="pclass">이름</p>
          <input type="text" name="memberName" id="memberName" value="<%=m.getMemberName()%>" required>
          <p class="checkmsg"></p>
          <p class="pclass">주소</p>
          <input type="text" name="address" id="address" value="<%=m.getAddress()%>">
          <p class="checkmsg"></p>
          <p class="pclass">생년월일</p>
          <input type="text" name="birthday1" id="birthday1" value="<%=m.getBirthDay().toString().substring(0,4)%>" required>
          <input type="text" name="birthday2" id="birthday2" value="<%=m.getBirthDay().toString().substring(5,7)%>" required>
          <input type="text" name="birthday3" id="birthday3" value="<%=m.getBirthDay().toString().substring(8,10)%>" required>
          <p class="pclass">이메일</p>
          <input type="email" name="email" id="email" value="<%=m.getEmail()%>" required>
          <p class="checkmsg"></p>
          <p class="pclass">전화번호 <span class="update-gray-text">- 없이 숫자만 입력해주세요.</span></p>
          <input type="text" name="phone" id="phone" value="<%=m.getPhone()%>" required>
          <p class="pclass">비밀번호</p>
          <input type="password" name="password" id="password_" placeholder="정보수정을 하시려면 비밀번호를 입력하세요">
          <p class="checkmsg"></p>
          <div class="outendtitle">
          <br>
            <input type="submit" value="정보수정" id="update" onclick="updateMember();">
             
          </div>
        </form>
      </div>
    </div>
  </section> 
  <br />
<script>
function updateValidate(){
	return true;
}
function updateMember(){
	 let $password = $("#password_").val();
	 //비밀번호를 입력하지 않았을 때
	 if($password.trim().length == 0)
		alert("정보수정을 하시려면 비밀번호를 입력해주세요.");
	 	$("#password_").select();
	 	return false;
	 	
	 //입력한 비밀번호가 틀렸을 때	------ 왜 안되는고양
     <%-- if($password != <%=m.getPassword()%>){
         alert("비밀번호가 틀렸습니다.");
	 	 $("#password_").select();
         return false;
     }     --%>
	<%-- $("#memberUpdateFrm").attr("action", "<%=request.getContextPath()%>/member/updateMemberEnd")
						 .submit(); --%>
	
	<%-- <%=System.out.println("바뀌는건지 jsp에서 확인"+m.getMemberName())%> --%>
}



</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>