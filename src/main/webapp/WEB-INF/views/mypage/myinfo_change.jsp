<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
  <style>
  @import url('https://fonts.googleapis.com/css2?family=Lora:ital@1&family=Roboto:wght@700&display=swap'); 
    section {
     width:1000px;
     height:600px;
     margin:auto;
     text-align:center;
     padding-top: 160px;/* 폼 자체 조정 */
     padding-bottom:50px;
     flex: 1;
     
    }
    body {
    display: flex;
    flex-direction: column;
    }
    
    section input[type=text] {
      width:300px;
      height:40px;
      border:1px solid rgb(180, 180, 180);
    }
    section input[type=password] {
      width:300px;
      height:40px;
      border:1px solid #D941C5;
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
    section #btn3 {
      width:150px;
      height:44px;
      background-color:#D1A69D;
      color:white;
      border-radius: 10px;
      border: none;
    }
     section #btn2 {
      width:306px;
      height:44px;
      background-color:#D1A69D;
      color:white;
      border-radius: 10px;
      border: none;
    }
     section #btntt {
      width:306px;
      height:44px;
      background-color:gray;
      color: white;
      border-radius: 10px;
      border: none;
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

  
  function check(my)   
  {
	 if(my.name.value.trim().length==0)
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
	           }
	           else
	               return true;
  }
  
</script>
</head>
<body> 
 <section>
  <form name="pkc" method="post" action="myinfo_change_ok">
   <caption> 
     <h2 style="font-size:25px; font-family: 'Lora', serif; display: inline-block; background: linear-gradient(to top, #f6eae9 30%, transparent 80%);"> Modify Profile </h2> </caption> <br>
  <br>
    <div> <input type="text" readonly value= ${mvo.userid}> </div>
    <div> <input type="text" name="name" placeholder="이 름" value="${mvo.name}"> </div>
    <div> <input type="text" name="zip" id="zip" readonly  placeholder="우편번호" value="${mvo.zip}"> <input  id="btn1" type="button" onclick="juso_search()" value="주소검색"> </div>
    <div> <input type="text" name="juso" placeholder="주 소" readonly value="${mvo.juso}"> </div>
    <div> <input type="text" name="juso_etc" placeholder="상세주소" value="${mvo.juso_etc}"> </div>
    <div> <input type="text" name="phone" placeholder="전화번호" value="${mvo.phone}"> </div>
    <div> <input type="text" name="email" placeholder="이메일" value="${mvo.email}"> </div><p>
    <div> <input type="submit" value="회원정보 수정" id="btn2"> </div>
   </form> 
    <div> <input type="button" value="회원 탈퇴 " id="btntt" onclick="location='mem_del?userid=${mvo.userid}'"> </div> <!-- 회원탈퇴  -->
 </section>
</body>