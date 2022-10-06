<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <style>
   @import url('https://fonts.googleapis.com/css2?family=Song+Myung&display=swap');
  
    section {
     width:600px;
     height:800px;
     margin:auto;
     text-align:center;
     padding-top:160px;/* 폼 자체 조정 */
     position:relative;
    }
    
      section #btn2 {
      width:200px;
      height:44px;
      background-color:#D1A69D;
      color:white;
      border-radius: 10px;
      border: none;
      
    }
    
      section #btn3 {
      width:110px;
      height:44px;
      background-color:#D1A69D;
      color:white;
      border-radius: 8px;
      border: none;
      font-size: 13px;
      }
      
      section #btn4 {
      width:110px;
      height:44px;
      background-color:rgb(180, 180, 180);
      color:white;
      border-radius: 8px;
      border: none;
      font-size: 13px;
      }
    
    #search11{
     display: none;
    }
    
input {
        border-style:none;
        border-bottom:solid 1px #cacaca;
        border-collapse:collapse;
        
}
   *:focus { /*input text focus */
    outline: 0;
}
    
  </style>
 
 <script>
    function userid_search_pwd()
   {
    	  var userid=document.userpwd_search.userid.value;
		  var name=document.userpwd_search.name.value;
		  var email=document.userpwd_search.email.value;
		  var us=new XMLHttpRequest(); 
		  us.open("get","search_pwd2?userid="+userid+"&name="+name+"&email="+email);
		  us.send();
		  us.onreadystatechange=function()
		  {
			  if(us.readyState==4)
			  {
				 // alert(us.responseText);
 			     if(us.responseText=="0")
			     {
			    	 alert("이이디,이름 혹은 이메일이 틀립니다.");
			    	 
			     }	 
			     else
			     {   
			    	 
			    	 var imsi=us.responseText.trim();
			    	 //alert(imsi);
			    	 document.getElementById("userpwd_search").style.display="none";
			    	 document.getElementById("view_userid").innerText="고객님의 비밀번호는 "+imsi+" 입니다.";
			    	 document.getElementById("search11").style.display="block";
			     }
			   
			  }
			  
		  }
		  
	  }
    
    
 </script>
</head>
<body>
  <section>
 <form method="post" name="userpwd_search" id="userpwd_search" action="search_id_ok">
 <div class="find_id" style="border: 1px solid rgb(180, 180, 180);
 padding:10px;">
 
 <pre> <!-- 띄어쓰기  -->
    <h2 style="font-family: 'Song Myung', serif;"> FIND PASSWORD </h2>
    아이디 <input type="text" name="userid" placeholder="아이디"> 
     이름 <input type="text" name="name" placeholder="이름">
    이메일&nbsp<input type="text" name="email" placeholder="이메일"> <p>
   <input type="button" value="비밀번호 찾기" id="btn2" onclick="userid_search_pwd()" style="font-weight: bold;">
 
 </pre>
 </div> 
 </form>
 
 <!-- 시작 -->
 <div id="search11">
  <form method="post" name="search" id="search2">
 <div>
 <img src="../resources/simg/check.png" width="150"> <p>
 </div>
  <span style="font-weight: bolder; font-size: 16px;"> 고객님 비밀번호 찾기가 완료되었습니다 </span> <p>
 <div class="find_id" style="border: 1px solid rgb(180, 180, 180);
 padding: 10px;">
 
 <span style="font-size: 13px;"> 저희 쇼핑몰을 이용해주셔서 감사합니다.<p>
다음정보로 가입된 패스워드가 있습니다.
</span>
<hr>
<!-- 띄어쓰기  -->
<br>
   <div id="view_name"> </div>
   <div id="view_userid" style="font-weight: bold;"> </div> <!-- id 나오기  -->
 <br>
 </div> 
 <br>
 <span style="font-size: 13px; color:rgb(120, 120, 120);"> 고객님의 비밀번호 찾기가 성공적으로 이루어졌습니다. <p>
 항상 고객님의 즐겁고 편리한 쇼핑을 위해 최선의 노력을 다하는 쇼핑몰이 되도록 하겠습니다.</span> <br>
 
<div class="find-btn">
      <input type="button" id="btn3" value="로그인" onclick="location.href='../login/login'">
      <input type="button" id="btn4" value="아이디 찾기" onclick="location.href='search_id'" >
</div>
 </form> 
 </div>           
  </section>
</body>
</html>