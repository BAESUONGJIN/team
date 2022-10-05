<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
   tr:first-child td {
     border-top:2px solid #cccccc;
     border-bottom:1px solid #cccccc;
     height:35px;
   }
   
   tr td {
     height:35px;
     border-bottom:1px solid #cccccc;
   }
   
    tr:last-child td {
     border-bottom:2px solid #cccccc;
   }
   
   #btn1 {
     width:70px;
     height:22px;
     border:1px solid rgba(164, 48, 35, 0.1);
     text-align:center;
     background:rgba(164, 48, 35, 0.1);
     color:black;
     cursor:pointer;
     margin-left:20px;
   }
   
   #chk {
     width:70px;
     height:22px;
     border:1px solid rgba(164, 48, 35, 0.1);
     text-align:center;
     background:rgba(164, 48, 35, 0.1);
     color:black;
     cursor:pointer;
   }
   
</style>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script>
  function juso_search()  
  {
    new daum.Postcode({
        oncomplete: function(data) {
          if (data.userSelectedType === 'R') { 
              addr = data.roadAddress;
          } else { 
              addr = data.jibunAddress;
          }

          
          document.add.zip.value = data.zonecode;
          document.add.juso.value = addr;  
          document.add.juso_etc.focus();
      }
    }).open();
  }
 </script>
</head>
<body>

  <form name="add" method="post" action="juso_add_ok">
    <table align="center">
    <caption style="caption-side:top"> <h3>배송지추가</h3> </caption>
      <tr>
        <td align="center"> 이름 </td>
        <td> <input type="text" name="name" placeholder="이 름"> </td> 
      </tr> 
      
      <tr>
        <td> 우편번호 </td>
        <td> <input style="width:70px" type="text" name="zip" id="zip" readonly  placeholder="우편번호"> <input  id="btn1" type="button" onclick="juso_search()" value="주소검색"> </td>
      </tr>
      
      <tr>  
        <td align="center"> 주소 </td>
        <td> <input type="text" name="juso" placeholder="주 소" readonly> </td> 
      </tr>
    
      <tr>
         <td> 상세주소 </td>
         <td> <input type="text" name="juso_etc" placeholder="상세주소"></td> 
      </tr>
      
      <tr>
         <td> 전화번호 </td>
         <td> <input type="text" name="phone" placeholder="전화번호"> </td> 
      </tr>
      </table>
      <p>
        <div style="margin-left:490px"><input id="chk" type="submit" value="추가하기"></div>
     </form>

</body>
</html>