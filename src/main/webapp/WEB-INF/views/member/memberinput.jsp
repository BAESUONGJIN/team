<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
  <style>
   section {
     width:1000px;
     height:500px;
     margin:auto;
     text-align:center;
     padding-top: 50px;/* 폼 자체 조정 */
   }
    section input[type=text] {
      width:300px;
      height:40px;
      border:1px solid rgb(180, 180, 180);
    }
    section input[type=password] {
      width:300px;
      height:40px;
      border:1px solid rgb(180, 180, 180);
    }
    section div {
      margin-top:10px;
    }
    section #zip {
      width:140px;
      height:40px;
    }
    section #btn1 {
      width:154px;
      height:44px;
      border:1px solid rgb(180, 180, 180);
      color:gray;
    }
    section #btn2 {
      width:310px;
      height:44px;
      background-color:#D1A69D;
      color:white;
      border-radius: 10px;
      border: none;
      
    }
    
         h3 {
		margin-bottom: 30px;
		display: inline-block;
		width: 200px;
		background: linear-gradient(to top, #f6eae9 30%, transparent 80%);
		
	}
    
  </style>
  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script>
  function juso_search()  // 우편번호 버튼 클릭시 호출 함수명
  {
    new daum.Postcode({
        oncomplete: function(data) {
          if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
              addr = data.roadAddress;
          } else { // 사용자가 지번 주소를 선택했을 경우(J)
              addr = data.jibunAddress;
          }

          // 우편번호와 주소 정보를 해당 필드에 넣는다.
          document.pkc.zip.value = data.zonecode; // 우편번호
          document.pkc.juso.value = addr;  // 주소
          // 커서를 상세주소 필드로 이동한다.
          document.pkc.juso_etc.focus();
      }
    }).open();
  }
  
  var uchk=0; // 사용자가 아이디의 중복체크이 결과값을 가진다  0:불가, 1:가능
  function check_userid(userid)
  {
	  if(userid.trim().length >= 6)
	  {
	    var chk=new XMLHttpRequest();
	    chk.open("get","check_userid?userid="+userid)
	    chk.send();
	    chk.onreadystatechange=function()
	    {
	  	   if(chk.readyState==4)
	  	   {
			  //alert(chk.responseText);
			  if(chk.responseText=="0")
			  {
				  document.getElementById("msg").innerText="사용가능한 아이디 입니다";
				  document.getElementById("msg").style.color="blue";
				  uchk=1;
			  }	  
			  else
			  {
				  document.getElementById("msg").innerText="사용 불가능한 아이디 입니다";
				  document.getElementById("msg").style.color="red";
				  uchk=0;
			  }	  
		   }	  
	    }
	  } // if 종료
	  else
	  {
		  alert("사용자 아이디는 6자 이상입니다");
	  }	  
  }
  
  var pchk=0;
  function pwd_equal(pwd2)
  {
	  var pwd=document.pkc.pwd.value;
	  if(pwd==pwd2)
	  {
		  document.getElementById("msg2").innerText="비밀번호가 일치합니다";
		  document.getElementById("msg2").style.color="blue";
		  pchk=1;
	  }	  
	  else
	  {
		  document.getElementById("msg2").innerText="비밀번호가 불일치합니다";
		  document.getElementById("msg2").style.color="red";
		  pchk=0;
	  }	  
  }
  
  function check(my) 
  {
     if(uchk==0)
     {
        alert("아이디 중복조회를 하세요");
        return false;
     }     
     else if(pchk==0)
         {
            alert("비밀번호가 일치하지 않습니다");
            return false;
         }
          else if(my.name.value.trim().length==0)
              {
                   alert("이름을 입력하세요");
                   return false;
              }
               else if(my.phone.value.trim().length==0)
                   {
                      alert("전화번호를 입력하세요");
                      return false;
                   }
                    else if(my.email.value.trim().length==0)
                        {
                           alert("이메일을 입력하세요");
                           return false;
                        }
                    else if(my.pwd.value.trim().length==0)
                       {
                          alert("비밀번호를 입력하세요");
                          return false;
                       }
                    else if(my.zip.value.trim().length==0)
                       {
                         alert("우편번호를 입력하세요"); 
                         return false; 
                       }
                    else if(my.juso.value.trim().length==0)
                       {
                         alert("주소를 입력하세요");
                         return false;
                       }
                    else if(my.juso_etc.value.trim().length==0)
                       {
                         alert("상세주소를 입력해주세요");
                         return false; 
                        }
                         else
                           return true;
  }
  
</script>
</head>
<body> 
 <section>
  <form name="pkc" method="post" action="memberinput_ok" onsubmit="return check(this)">
    <caption> <h3> MEMBERSHIP </h3> </caption>
    <p>  
    <div> <input type="text" name="userid" placeholder="아이디" onblur="check_userid(this.value)"> 
          <br> <span id="msg" style="font-size:12px;">(영문소문자/숫자, 4~16자)</span>
          
    </div>
    <div> <input type="text" name="name" placeholder="이 름"> </div>
    <div> <input type="password" name="pwd" placeholder="비밀번호"> </div>
    <div> <input type="password" name="pwd2" placeholder="비밀번호 확인" onkeyup="pwd_equal(this.value)"> 
          <br> <span id="msg2" style="font-size:12px;"></span>
    </div>
    <div> <input type="text" name="zip" id="zip" readonly  placeholder="우편번호"> <input  id="btn1" type="button" onclick="juso_search()" value="주소검색"> </div>
    <div> <input type="text" name="juso" placeholder="주 소" readonly> </div>
    <div> <input type="text" name="juso_etc" placeholder="상세주소"> </div>
    <div> <input type="text" name="phone" placeholder="전화번호"> </div>
    <div> <input type="text" name="email" placeholder="이메일"> </div>
    <div> <input type="submit" value="회원가입" id="btn2" style="font-weight: bold;"> </div>
  </form>
 </section>
</body>