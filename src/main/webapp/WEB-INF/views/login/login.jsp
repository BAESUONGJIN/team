<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
 <style>
 @import url('https://fonts.googleapis.com/css2?family=Song+Myung&display=swap');

   section {
     width:1000px;
     height:700px;
     margin:auto;
     text-align:center;
     padding-top: 120px;/* 폼 자체 조정 */
   }
   body { /* footer  */
  display: flex; 
  flex-direction: column;
}
   section h2 {
     margin-top:80px;
   }
   section div {
     margin-top:15px;
   }
   section input[type=text] {
      width:400px;
      height:40px;
      border:1px solid rgb(180, 180, 180);
    }
    section input[type=password] {
      width:400px;
      height:40px;
      border:1px solid rgb(180, 180, 180);
    }
    section input[type=submit] { /* 버튼 타입 */
      width:400px;
      height:46px;
      background: #CCA39B;
      color:white;
      border-radius: 10px;
      border: none;
      
    }
    section input[type=button] {
      width:308px;
      height:46px;
      border:1px solid #CCA39B;
      background:#D941C5;
      color:white;
    }
     #userid_search,#pwd_search {
     display:none;
   }
 </style>
 
</head>
<body>
  <section>
    <form method="post" action="login_ok">
     <h2 style="font-family: 'Song Myung', serif;"> Login </h2> 
     <div> <input type="text" name="userid" value="hong123" placeholder="아이디"> </div>
     <div> <input type="password" name="pwd" value="123" placeholder="비밀번호">
       <c:if test="${err == 1}"> 
           <br> <span style="color:red;font-size:12px;">아이디 혹은 비밀번호가 맞지 않습니다. </span>
       </c:if>
     </div>
     <div> <input type="submit" value="기존 회원 로그인" style="font-weight: bold;"> </div>
     <div> <span> <a href="../login/search_id" style="text-decoration: none; color: black"> 아이디 찾기</a> | </span> <span> <a href="../login/search_pwd"style="text-decoration: none; color: black"> 비밀번호 찾기</a> </span> <a href="../member/memberinput" style="text-decoration: none; color: black"> 가입하기 </a></div>
 </form> 
<!-- 
 <hr>
 <form>
    <div class="modal_foot" style="text-align: right;">
      <div> sns 로그인 &nbsp
      <a id="btn-kakao-login" href="kakao/login">
		 <img src="//k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="200" alt="카카오 로그인 버튼"/>
	  </a>
   </div>
  </div>
  </form>
  
   -->
  </section>
  </body>    