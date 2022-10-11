<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <c:set var="size" value="${list.size()}"/>
 <c:if test="${size <=1}">
   <c:set var="he" value="800"/>
 </c:if>
 <c:if test="${size > 3}">
   <c:set var="he" value="${(size-3)*100+800}"/>
 </c:if>
 <style>
  @import url('https://fonts.googleapis.com/css2?family=Lora:ital@1&family=Roboto:wght@700&display=swap'); 
  
 section {
	width: 1000px;
	height: auto;
	margin: auto;
	margin-top: 40px;
	margin-bottom: 40px;
	padding-top: 120px;
   }

	section tr:first-child td {
     border-top:2px solid #cccccc;
     border-bottom:1px solid #cccccc;
     height:35px;
     background: rgba(164, 48, 35, 0.1);
     font-weight: bolder;
    
   }
   section tr td {
     border-bottom:1px solid #cccccc;
     padding: 10px;
   }
   
   section tr:last-child td {
     border-bottom:2px solid #cccccc;
   }
   
   
   section #baesong_t .bb {
     font-size:12px;
     font-weight:100;
     display:inline-block;
     width:80px;
     height:20px;
	 border:1px;
	 background-color: rgba(164, 48, 35, 0.1);
	 color:#008080;
     padding-top:2px;
     text-align:center;
     cursor:pointer;
   }
   section #chk1 {
     width:120px;
     height:40px;
	 border:1px;
	 background-color: rgba(164, 48, 35, 0.1);
	 color:#008080;
     font-weight:900;
     margin-left:1000px;
     margin-top:45px;
     cursor:pointer;
   }
   
         /* 퀵 메뉴 */
    div, ul, li {
    -webkit-box-sizing: border-box;-moz-box-sizing: border-box;box-sizing: border-box;padding:0;margin:0
    }
    a {
    text-decoration:none;
    color:black;
    }

	.quickmenu {position:absolute;width:100px; height:300px;  top:50%;margin-top:-20px;right:10px; }
	.quickmenu ul {position:relative;float:left;width:100%; /* display:block; display:none; */ /* border:1px solid #ddd; */}
	.quickmenu ul li {float:left;width:100%;/* border-bottom:1px solid #ddd; */text-align:center;display:inline-block;}
	.quickmenu ul li a {position:relative;float:left;width:100%;height:20px;line-height:20px;/* text-align:center; */color:#999;font-size:7pt;}
	.quickmenu ul li a:hover {color:#BDBDBD;}
	.quickmenu ul li:last-child {border-bottom:0;}
   
 
 </style>
<script>

$(document).ready(function(){
	  var currentPosition = parseInt($(".quickmenu").css("top"));
	  $(window).scroll(function() {
	    var position = $(window).scrollTop(); 
	    $(".quickmenu").stop().animate({"top":position+currentPosition+"px"},1000);
	  });
	}); 
 
 </script>
<title>Insert title here</title>

</head>
<body> 
 <!-- 퀵 메뉴  -->
 <div class="quickmenu">
  <ul>
    <li> <i class="fa-solid fa-angles-up" style="cursor: pointer; color: #616161;" onclick="window.scrollTo(0,0);"> </i></li><br> <br>
    <li> <a href="../page/cart"> <i class="fa-solid fa-cart-shopping fa-3x" style="color: #616161;"></i></a></li> <br> <br>
    <li> <a href="../page/wish"> <i class="fa-regular fa-heart fa-3x" style="color: #616161;"></i> </a></li> <br> <br>
    <li> <a href="../faq/faq_list"><i class="fa-regular fa-face-smile fa-3x" style="color: #616161;"></i></a> </li> <br> <br>

  </ul>
 </div>
 <section>
   
   <div align="center"> <h2>주문확인</h2> </div>
   <c:set var="pvo" value="${list.get(0)}"/>

  
  <!-- 배송지 -->
  <table width="1100" align="center" id="baesong_t">
   <caption style="caption-side:top"> <h4> 받는사람 정보  </h4></caption>
        
    <tr>
      <td width="150"> 받는사람 </td>
      <td> <div> ${pvo.name} </div> </td>
    </tr>
    <tr>
      <td> 배송주소 </td>
      <td><div>${pvo.juso} ${pvo.juso_etc}</div> </td>
    </tr>
    <tr>
      <td> 연락처 </td>
      <td><div>${pvo.hphone}</div></td>
    </tr>
    <c:if test="${pvo.chuga == 0}">
      <c:set var="chuga" value="현관입구"/>
    </c:if>
    <c:if test="${pvo.chuga == 1}">
      <c:set var="chuga" value="직접수령"/>
    </c:if>
    <c:if test="${pvo.chuga == 2}">
      <c:set var="chuga" value="경비실"/>
    </c:if>
    <c:if test="${pvo.chuga == 3}">
      <c:set var="chuga" value="택배함"/>
    </c:if>
    <tr>
      <td> 요청사항 </td>
      <td> <div>${chuga}</div></td>
    </tr>
  </table>
  <p>
  
  <!-- 상품 -->
   <table width="1100" align="center">
    <caption style="caption-side:top"> <h4> 상품내역 </h4></caption>
      <tr align="center">
       <td> 상품 </td>
       <td> 상품명 </td>
       <td> 색상 </td>
       <td> 사이즈 </td>
       <td> 구매수량 </td>
     </tr>
    
    <c:set var="chong" value="0"/>
    <c:forEach items="${list}" var="pvo">     
      <tr align="center"> 
       <td> <a href="../product/pro_content?pcode=${pvo.pcode}"> <img src="../resources/img/${pvo.pimg}" width="80"> </a> </td>
       <td> <a href="../product/pro_content?pcode=${cvo.pcode}"> ${pvo.title} </a></td>
       <td> ${pvo.color}</td>
       <td> ${pvo.size}</td>
       <td> ${pvo.su}개 </td>
      </tr>
     </c:forEach>

   </table>
  <p>
  
  <!-- 결제정보 -->
   <c:set var="pvo" value="${list.get(0)}"/> 
   <table width="1100" align="center" id="baesong_t">
   <caption style="caption-side:top"> <h4> 결제정보 </h4> </caption>
     <c:if test="${pvo.sudan==0}">
      <c:set var="sudan" value="계좌이체"/>
     </c:if>
     <c:if test="${pvo.sudan==1}">
      <c:set var="sudan" value="신용/체크카드"/>
     </c:if>
     <c:if test="${pvo.sudan==2}">
      <c:set var="sudan" value="휴대폰결제"/>
     </c:if>
    <tr>
      <td> 결제방법 </td>
      <td align="right"> ${sudan}</td>
    </tr>
    <tr>
      <td> 구매 총금액 </td>
      <td align="right"> <fmt:formatNumber value="${chongpay}" pattern="#,###"/> 원  </td>
    </tr>
  </table>
  <p>
  <input type="button" id="chk1" value="주문내역 확인" onclick="location='../page/myorder'">
  
 </section>
</body>
</html>