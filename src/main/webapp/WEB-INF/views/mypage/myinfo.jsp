<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
  <style>
  @import url('https://fonts.googleapis.com/css2?family=Lora:ital@1&family=Roboto:wght@700&display=swap'); 
  
    section {
     width:1000px;
     height:700px;
     margin:auto;
     text-align:center;
     padding-top:200px; /* 폼 자체 조정 */
     padding-bottom:50px;
     position:relative;
    }

    section div { /* margin값  */
      font-size:20px;
      margin-top:17px;
    }
    
    section #pwdform {
      position:absolute;
      right:200px;
      width:700px;
      background:white;
      text-align:center;
      display:none;
    }
   
	  section #btn4 {
      width:158px;
      height:46px;
      background-color:rgb(180, 180, 180);
      color:white;
      border-radius: 8px;
      border: none;
      font-size: 20px;
      }
      
      section #btn5 {
      width:158px;
      height:46px;
      background-color:#D1A69D;
      color:white;
      border-radius: 8px;
      border: none;
      font-size: 20px;
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
  <h3 align="center" style=" font-size: 25px; font-family: 'Lora', serif; margin-bottom: 30px;"> My Information </h3> 
   <table align="center">
      <tr height="50">
        <td style="text-align: left; font-weight: bold;"> 아이디 </td>
        <td style="text-align: left;"> &nbsp ${mvo.userid }</td>
      </tr>
      <tr height="50">
        <td style="text-align: left; font-weight: bold;"> 이름 </td>
        <td style="text-align: left;"> &nbsp ${mvo.name }</td>
      </tr>
      <tr height="50">
        <td style="text-align: left; font-weight: bold;"> 우편번호 </td>
        <td style="text-align: left;"> &nbsp ${mvo.zip }</td>
      </tr>
      <tr height="50">
        <td style="text-align: left; font-weight: bold;"> 주소 </td>
        <td style="text-align: left;"> &nbsp ${mvo.juso} ${mvo.juso_etc} </td>
      </tr>
      <tr height="50">
        <td style="text-align: left; font-weight: bold;"> 전화번호 </td>
        <td style="text-align: left;"> &nbsp ${mvo.phone }</td>
      </tr>
      <tr height="50">
        <td style="text-align: left; font-weight: bold;"> 이메일 </td>
        <td style="text-align: left;"> &nbsp ${mvo.email }</td>
      </tr>
   </table>
   <div align="center"> 
     <input type="button" id="btn5" value="정보수정" style="font-size: 16px;" onclick="location='myinfo_change'"> 
     <input type="button" id="btn4" value="비밀번호변경" style="font-size: 16px;" onclick="change_pwd()">
   </div>
</form>
  <form name="pchg" method="post" action="change_pwd" onsubmit="return check(this)">
   <div id="pwdform"> <!-- 비밀번호 변경  폼 -->
    <h3 style="font-family: 'Lora', serif;">  Change Password </h3> <br>
     <div> <input type="password" name="prepwd" placeholder="현재 비밀번호" style="width: 240px; height: 50px; border-top:none; border-left: none; border-right:none; border-bottom: 2px solid #cccccc; font-size: 15px;"> </div>
     <div> <input type="password" name="pwd" placeholder="새 비밀번호" style="width: 240px; height: 50px; border-top:none; border-left: none; border-right:none; border-bottom: 2px solid #cccccc; font-size: 15px;"> </div>
     <div> <input type="password" name="pwd2" placeholder="비밀번호 확인" style="width: 240px; height: 50px; border-top:none; border-left: none; border-right:none; border-bottom: 2px solid #cccccc; font-size: 15px;" onkeyup="check_pwd(this.value)"> </div>
     <div id="pmsg" style="font-size:15px;"></div>
     <div> <input type="submit" value="확인" style="width:200px;height:46px; background: #CCA39B; color:white; border: none; margin-top: 20px; border-radius: 10px; font-size: 20px;"> </div>
   </div>
  </form>
  </section>
</body>
 
</html>