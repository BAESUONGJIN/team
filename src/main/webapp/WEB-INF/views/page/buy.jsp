<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

   caption {
    color: black;
    font-weight: bolder;
   }
   
   	section tr:first-child td {
     border-top:2px solid #cccccc;
     border-bottom:1px solid #cccccc;
     height:35px;
     background: rgba(164, 48, 35, 0.1);
     font-weight: bolder;
    
   }
   
   .sub td {
   	border-bottom: 2px solid #cccccc;
   }
   
   
   section #baesong_t .bb {
     font-size:12px;
     font-weight:100;
     display:inline-block;
     width:90px;
     height:20px;
	 border:1px;
	 background-color: #D1A69D;
	 color:white;
     padding-top:2px;
     text-align:center;
     cursor:pointer;
   }
   
   #btn2{
     width:180px;
     height:39px;
     border:none;
     text-align:center;
     color:white;
     background: #606060;
     cursor:pointer;
     border-radius: 8px;
   }
   
   	h2 #hh2{
		margin-bottom: 30px;
		display: inline-block;
		width: auto;
		background: linear-gradient(to top, #f6eae9 30%, transparent 80%);
		font-family: 'Lora', serif;
		color: black;
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
  function bae_add() //배송지 추가!!@
  {
	  
	  var chk=new XMLHttpRequest();
	  chk.onload=function()
	  {
		 var bb=chk.responseText.split(",");
		 document.getElementById("bname").innerText=decodeURI(bb[0]);
		 document.getElementById("bjuso").innerText=decodeURI(bb[1]);
		 document.getElementById("bphone").innerText=bb[2];
		 document.getElementById("bchuga").innerText="현관입구";
		 document.getElementById("user").style.display="none";
		 
		 str="배송지 정보 <span class='bb' onclick='bae_change()'> 배송지 변경 </span>";
		 document.getElementById("bh3").innerHTML=str;
	  }
	  chk.open("get","bae_add");
	  chk.send();
	  
	  window.location.reload();
  }
  
  
  function bae_change() //배송지 변경!!@
  {
	  open("baesong_list","","width=900,height=500");
  }
  
  function change_sub(n)
  {
	  var sub=document.getElementsByClassName("sub");
	  var len=sub.length;
	  for(i=0;i<len;i++)
	  {
		  sub[i].style.display="none";
	  }
	  
	  sub[n].style.display="table-row";
  }
  
  
  function change_sub(n) //결제쪽
  {
	  var sub=document.getElementsByClassName("sub");
	  var len=sub.length;
	  for(i=0;i<len;i++)
	  {
		  sub[i].style.display="none";
	  }
	  
	  sub[n].style.display="table-row";
  }
  
  /* 퀵메뉴 */
  $(document).ready(function(){
	  var currentPosition = parseInt($(".quickmenu").css("top"));
	  $(window).scroll(function() {
	    var position = $(window).scrollTop(); 
	    $(".quickmenu").stop().animate({"top":position+currentPosition+"px"},1000);
	  });
	}); 
 </script>

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
 
  <form method="post" action="buy_ok">
  
  
   
   <div align="center"> <h2> <span id="hh2"> ORDER </span> </h2> </div>
   
   <!-- 구매자 -->
   <table width="1000" align="center">
    <caption style="caption-side:top"> <h4> 주문정보  </h4> </caption>
    <tr>
      <td width="150"> 이름 </td>
      <td> ${mvo.name} </td>
    </tr>
    <tr>
      <td> 이메일 </td>
      <td> ${mvo.email}</td>
    </tr>
    <tr>
      <td> 휴대전화 </td>
      <td> ${mvo.phone} </td>
    </tr>
   </table>
    <p>
  
  <!-- 배송지 -->
  <table width="1000" align="center" id="baesong_t">
   <caption style="caption-side:top"> <h4> 배송지  
     <c:if test="${empty bvo}">
      <span class="bb" onclick="bae_add()" id="user"> 기본배송지 </span>
     </c:if>
     
     <c:if test="${!empty bvo}">
       <span class="bb" onclick="bae_change()"> 신규배송지 </span>
     </c:if>
     </h4></caption>
     
     
    <tr>
      <td width="150"> 받는사람 </td>
      <td> <div id="bname"> ${bvo.name} </div> </td>
    </tr>
    <tr>
      <td> 배송주소 </td>
      <td><div id="bjuso">${bvo.juso} ${bvo.juso_etc}</div> </td>
    </tr>
    <tr>
      <td> 연락처 </td>
      <td><div id="bphone">${bvo.phone}</div></td>
    </tr>
    <c:if test="${bvo.chuga == 0}">
      <c:set var="chuga" value="현관입구"/>
    </c:if>
    <c:if test="${bvo.chuga == 1}">
      <c:set var="chuga" value="직접수령"/>
    </c:if>
    <c:if test="${bvo.chuga == 2}">
      <c:set var="chuga" value="경비실"/>
    </c:if>
    <c:if test="${bvo.chuga == 3}">
      <c:set var="chuga" value="택배함"/>
    </c:if>
    <tr>
      <td> 요청사항 </td>
      <td> <div id=chuga>${chuga}</div></td>
    </tr>
  </table>
  <p>
  
  <!-- 상품 -->
   <table width="1000" align="center">
    <caption style="caption-side:top"> <h4> 상품내역 </h4></caption>
      <tr align="center">
       <td> 상품 </td>
       <td> 상품명 </td>
       <td> 색상 </td>
       <td> 사이즈 </td>
       <td> 금액 </td>
       <td> 구매수량 </td>
       <!--  <td> 적립금 </td>  적립금 -->
       <td> 할인액 </td>
       <td> 결제금액 </td>
     </tr>
    
    
     <c:set var="chongprice" value="0"/>
     <c:set var="chonghalin" value="0"/>
     <c:set var="chongbaesong" value="0"/>
     <c:set var="chongjuk" value="0"/>
     <c:set var="cpcode" value=""/>
     <c:set var="csu" value=""/>
     <c:set var="cchong" value=""/>
     <c:set var="color" value=""/>
     <c:set var="size" value=""/>
     
    <c:forEach items="${list}" var="pvo">
     <tr align="center">
       <td> <a href="../product/pro_content?pcode=${pvo.pcode}"><img src="../resources/img/${pvo.pimg}" width="70" height="70"></a></td>
       <td> <a href="../product/pro_content?pcode=${pvo.pcode}">${pvo.title}</a></td>
       <td> ${pvo.color} </td>
       <td> ${pvo.size} </td>
       <td> <fmt:formatNumber value="${pvo.price}"/>원 </td>
       <td> ${pvo.su} </td>
       <!-- <td> <fmt:formatNumber value="${pvo.juk*pvo.su}"/>원 </td> 적립금-->
       <td> <fmt:formatNumber value="${pvo.price*(pvo.halin/100)*pvo.su}" pattern="#,###"/>원 </td>
       <td> <fmt:formatNumber value="${(pvo.price*pvo.su)-(pvo.price*(pvo.halin/100)*pvo.su)}" pattern="#,###"/>원 </td>
     </tr>
     <c:set var="chongprice" value="${chongprice+(pvo.price*pvo.su)}"/>
     <c:set var="chonghalin" value="${chonghalin+(pvo.price*(pvo.halin/100)*pvo.su)}"/>
     
     <c:if test="${chongprice<50000}">
      <c:set var="chongbaesong" value="2500"/>
     </c:if>
     
     <c:if test="${chongprice>=500000 }">
      <c:set var="chongbaesong" value="0"/>
     </c:if>
     
     <c:set var="chongjuk" value="${chongjuk+(pvo.juk*su)}"/>
     
     <c:set var="cimsi" value="${Integer((pvo.price*pvo.su)-(pvo.price*(pvo.halin/100)*pvo.su)+pvo.baesong)}"/>
     <c:set var="cpcode" value="${cpcode+=pvo.pcode+=','}"/>  
     <c:set var="csu" value="${csu+=pvo.su+=','}"/>
     <c:set var="cchong" value="${cchong+=cimsi+=','}"/>
     <c:set var="ccolor" value="${ccolor+=pvo.color+=','}"/>
     <c:set var="csize" value="${csize+=pvo.size+=','}"/>
     <c:set var="chalin" value="${chalin+=pvo.halin+=','}"/>
     
    </c:forEach>
   <input type="hidden" name="pcode" value="${cpcode}">
   <input type="hidden" name="su_imsi" value="${csu}">
   <input type="hidden" name="bae_id" value="${bvo.id}">
   <input type="hidden" name="chong_imsi" value="${cchong}">
   <input type="hidden" name="color_imsi" value="${ccolor}">
   <input type="hidden" name="size_imsi" value="${csize}">
  
   
     <c:set var="chongpay" value="${chongprice-chonghalin+chongbaesong}"/>
   </table>
  <p>
  

  
  <!-- 결제 -->
  <table width="1000" align="center">
    <caption style="caption-side:top"> <h4> 구매금액 </h4> </caption>
    <tr>
      <td width="150"> 구매금액 </td>
      <td> <fmt:formatNumber value="${chongprice}"/>원</td>
    </tr>
    <tr>
      <td> 할인금액 </td>
      <td><fmt:formatNumber value="${chonghalin}" pattern="#,###"/>원 </td>
    </tr>
    <tr>
      <td> 배송비 </td>
      <td> <fmt:formatNumber value="${chongbaesong}"/>원 </td>
    </tr>
   <!--  <tr>
      <td> 적립금 </td>
      <td> <fmt:formatNumber value="${chongjuk}"/>원 </td>
    </tr>
    -->
    <tr>
      <td> 총 결제금액 </td>
      <td> <fmt:formatNumber value="${chongpay}" pattern="#,###"/>원 </td>
    </tr>

   </table>
   <p>
    <input type="hidden" name="chongpay" value="${chongpay }">
   <table width="1000" align="center" id=gumae_chk>
     <caption style="caption-side:top"> <h4> 결제방법 </h4> </caption>
    <tr>
      
      <td rowspan="2"> 결제방법 </td>
      <td> 
         <input type="radio" name="sudan" value="0" checked onclick="change_sub(0)">계좌이체
         <input type="radio" name="sudan" value="1" onclick="change_sub(1)">신용/체크카드
         <input type="radio" name="sudan" value="2" onclick="change_sub(2)">휴대폰
      </td>
    </tr>
    
    <tr class="sub" style="display:table-row;"> 
      <td>
         *은행선택 
         <select name="bank">
           <option value="-1"> 선택 </option>
           <option value="0"> 신한은행 </option>
           <option value="1"> 우리은행 </option>
           <option value="2"> 국민은행 </option>
           <option value="3"> 하나은행 </option>
           <option value="4"> 농협은행 </option>
         </select>
      </td>
    </tr>
    <tr class="sub" style="display:none;">
      <td> 
        * 카드선택 
        <select name="card">
          <option value="-1"> 선택 </option>
           <option value="0"> 국민카드 </option>
           <option value="1"> 신한카드 </option>
           <option value="2"> 우리카드 </option>
           <option value="3"> 농협카드 </option>
        </select> <br>
        * 할부기간 
         <select name="gigan">
          <option value="-1"> 선택 </option>
           <option value="0"> 일시불 </option>
           <option value="1"> 2개월 무이자 </option>
           <option value="2"> 4개월 무이자 </option>
        </select>
      </td>
    </tr>
    <tr class="sub" style="display:none;">
      <td> 
       * 통신사 종류
         <select name="phone">
           <option value="-1"> 선택 </option>
           <option value="0"> SKT </option>
           <option value="1"> KT </option>
           <option value="2"> LG </option>
         </select>
      </td>
    </tr>
    
    
    
    
  </table>
  <p>
  <p>
  <div align="center"> 
  <input id="btn2" type="submit" value="결제하기"> </div>
  
 

  </form>
 </section>
</body>
</html>










