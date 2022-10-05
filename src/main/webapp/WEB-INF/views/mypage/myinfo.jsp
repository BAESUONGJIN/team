<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<head>
  <style>
  @import url('https://fonts.googleapis.com/css2?family=Lora:ital@1&family=Roboto:wght@700&display=swap'); 
  
    section {
     width:600px;
     height:600px;
     margin:auto;
     text-align:center;
     padding-top:200px; /* 폼 자체 조정 */
     padding-bottom:50px;
     position:relative;
    }
    section h2 {
      margin-top:90px;
    }
    section #aa {
      width:120px;
      height:30px;
      display:inline-block;
    }
    section div {
      font-size:20px;
      margin-top:17px;
    }
    section input[type=button] {
      width:158px;
      height:46px;
      background-color:#D1A69D;
      color:white;
      border-radius: 10px;
      border: none;
      font-size:20px;
    }
    section #pwdform {
      position:absolute;
      right:150px;
      width:1000px;
      height:250px;
      background:white;
      text-align:center;
      display:none;
    }
    
    h3 {
		display: inline-block;
		background: linear-gradient(to top, #f6eae9 30%, transparent 80%);
	}
    

  </style>
  <script>
   function change_pwd()
   {
	   document.getElementById("pwdform").style.display="block";
	   document.getElementById("info_change1").style.display="none";
   }
   
   var pchk=0;
   function check_pwd(pwd2) 
   {
	   var pwd=document.pchg.pwd.value;
	   if(pwd==pwd2)
	   {
		   document.getElementById("pmsg").innerText="비밀번호 일치";
		   document.getElementById("pmsg").style.color="blue";
		   pchk=1;
	   }	
	   else
	   {
		   document.getElementById("pmsg").innerText="비밀번호 불일치";
		   document.getElementById("pmsg").style.color="red";
		   pchk=0;
	   }	   
   }
   function check(my)
   {
	   if(my.prepwd.value.trim().length == 0)
	   {
		   alert("기존 비밀번호를 입력하세요");
		   return false;
	   }	   
	   else if(my.pwd.value.trim().length == 0)
		    {
		       alert("새 비밀번호를 입력하세요");
		       return false;
		    }
	        else if(pchk == 0)
	        	 {
	        	    alert("비밀번호는 일치하여야 합니다");
	        	    return false;
	        	 }
	             else
	            	return true;
   }
   
  </script>
</head>
<body> 
  <section>
<form method="post" name="info_change1" id="info_change1">
   <h3 align="center" style="font-family: 'Lora', serif;"> My Information </h3> 
   <br>
   <div> <span id="aa">아이디</span>  ${mvo.userid}</div>
   <div> <span id="aa">이 름</span>   ${mvo.name}</div>
   <div> <span id="aa">우편번호</span>   ${mvo.zip}</div>
   <div> <span id="aa">주 소</span>  ${mvo.juso} ${mvo.juso_etc}</div>
   <div> <span id="aa">전 화</span>  ${mvo.phone}</div>
   <div> <span id="aa">이메일</span>    ${mvo.email}</div>
   <div align="center"> 
     <input type="button" value="정보수정" onclick="location='myinfo_change'"> 
     <input type="button" value="비밀번호변경" onclick="change_pwd()">
   </div>
</form>

   <div id="pwdform"> <!-- 비밀번호 변경  폼 -->
    <form name="pchg" method="post" action="change_pwd" onsubmit="return check(this)">
     <h3 style="font-family: 'Lora', serif;">  Change Password </h3>
     <div> <input type="password" name="prepwd" placeholder="현재 비밀번호"> </div>
     <div> <input type="password" name="pwd" placeholder="새 비밀번호"> </div>
     <div> <input type="password" name="pwd2" placeholder="비밀번호 확인" onkeyup="check_pwd(this.value)"> </div>
     <div id="pmsg" style="font-size:15px;"></div>
     <div> <input type="submit" value="확인"> </div>
    </form>
   </div>
  </section>
</body>
 