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
 
 section {
     width:1000px;
     height:${he}px;
     margin-top:200px;
     margin-bottom:50px;
     margin-right:auto;
     margin-left:auto;
   }
   
   	section tr:first-child td {
     border-top:2px solid #cccccc;
     border-bottom:1px solid #cccccc;
     height:35px;
    
   }
   
   section tr:last-child td {
     border-bottom:2px solid #cccccc;
   }
   
   section #gumae_chk {
   
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
     margin-left:880px;
     margin-top:45px;
     cursor:pointer;
   }
   
 
 </style>
<script>
 
 
 </script>
<title>Insert title here</title>

</head>
<body> 
 <section>
   
   <div align="center"> <h2>주문확인</h2> </div>
   <c:set var="pvo" value="${list.get(0)}"/>

  
  <!-- 배송지 -->
  <table width="1000" align="center" id="baesong_t">
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
   <table width="1000" align="center">
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
       <td> <img src="../resources/img/${pvo.pimg}" width="80"> </td>
       <td> ${pvo.title}</td>
       <td> ${pvo.color}</td>
       <td> ${pvo.size}</td>
       <td> ${pvo.su}개 </td>
      </tr>
     </c:forEach>

   </table>
  <p>
  
  <!-- 결제정보 -->
   <c:set var="pvo" value="${list.get(0)}"/> 
   <table width="1000" align="center" id="baesong_t">
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
      <td align="right"> <fmt:formatNumber value="${pvo.chong}" pattern="#,###"/>원  </td>
    </tr>
  </table>
  <p>
  <input type="button" id="chk1" value="주문내역 확인" onclick="location='../page/myorder'">
  
 </section>
</body>
</html>