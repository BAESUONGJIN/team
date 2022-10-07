<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <c:set var="size" value="${list.size()}"/>
 <c:if test="${size <=1}">
   <c:set var="he" value="400"/>
 </c:if>
 <c:if test="${size > 1}">
   <c:set var="he" value="${(size-1)*100+400}"/>
 </c:if>

 <style>
   section {
     width:1200px;
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
   section tr td {
     border-bottom:1px solid #cccccc;
   }
   
   section tr:last-child td {
     border-bottom:2px solid #cccccc;
   } 
   
   #btn1 {
     width:100px;
     height:30px;
     border:1px solid rgba(164, 48, 35, 0.1);
     text-align:center;
     color:black;
     background:rgba(164, 48, 35, 0.1);
     cursor:pointer;
   }
   
   #btn2 {
     width:100px;
     height:30px;
     border:1px solid rgba(164, 48, 35, 0.1);
     text-align:center;
     color:black;
     background:rgba(164, 48, 35, 0.1);
     cursor:pointer;
   }
 
 
 </style>
</head>
<body> <!-- myjumun.jsp -->
  <section>
    <table width="1200" align="center" cellspacing="0">
      <caption style="caption-side:top"> <h3> 주 문 내 역</h3> </caption>
      <tr align="center">
        <td> 주문 일자 </td>
        <td> 상품 </td>
        <td> 상품 제목 </td>
        <td> 색상 </td>
        <td> 사이즈 </td>
        <td> 수량 </td>
        <td> 결제 금액 </td>
        <td> 상 태 </td>
        <td> 변 경 </td>
        <td> 상품평 </td>
      </tr>
      
     <c:forEach items="${list}" var="bvo">
      <tr align="center">
        <td> ${bvo.writeday} </td>
        <td> <img src="../resources/img/${bvo.pimg}" width="70" height="70"> </td>
        <td> ${bvo.title} </td>
        <td> ${bvo.color} </td>
        <td> ${bvo.size } </td>
        <td> ${bvo.su}개 </td>
        <td> <fmt:formatNumber value="${bvo.chong}" pattern="#,###"/>원 </td>
        <!-- state관련 if -->
        <c:if test="${bvo.state==0}">
         <c:set var="state" value="결제완료"/>
        </c:if>
        <c:if test="${bvo.state==1}">
         <c:set var="state" value="취소신청"/>
        </c:if>
        <c:if test="${bvo.state==2}">
         <c:set var="state" value="취소완료"/>
        </c:if>
        <c:if test="${bvo.state==3}">
         <c:set var="state" value="배송중"/>
        </c:if>
        <c:if test="${bvo.state==4}">
         <c:set var="state" value="배송완료"/>
        </c:if>
        <c:if test="${bvo.state==5}">
         <c:set var="state" value="반품신청"/>
        </c:if>
        <c:if test="${bvo.state==6}">
         <c:set var="state" value="반품완료"/>
        </c:if>
        <c:if test="${bvo.state==7}">
         <c:set var="state" value="교환신청"/>
        </c:if>
        <c:if test="${bvo.state==8}">
         <c:set var="state" value="교환완료"/>
        </c:if>
        <td> ${state} </td>
        <td> 
          <!-- 취소신청버튼 -->
         <c:if test="${bvo.state==0}">  
          <input id="btn1" type="button" value="취소신청" onclick="location='change_state?state=1&id=${bvo.id}'"> <br>  <!-- state를 1로 변경 -->
         </c:if>
          <!-- 취소철회버튼 -->
         <c:if test="${bvo.state==1}">
          <input id="btn1" type="button" value="취소철회" onclick="location='change_state?state=0&id=${bvo.id}'"> <br>  <!-- state를 0로 변경 -->
         </c:if>
          <!-- 반품신청버튼 -->
         <c:if test="${bvo.state==3 || bvo.state==4}"> 
          <input id="btn1" type="button" value="반품신청" onclick="location='change_state?state=5&id=${bvo.id}'"> <br>   <!-- state를 5로 변경 -->
         </c:if>
          <!-- 교환신청버튼 -->
         <c:if test="${bvo.state==0 || bvo.state==1 || bvo.state==3 || bvo.state==4}">
          <input id="btn1" type="button" value="교환신청"  onclick="location='change_state?state=7&id=${bvo.id}'"> <br>    <!-- state를 7로 변경 -->
         </c:if>
        </td>
        <td>
          <c:if test="${bvo.state==4}"> 
             <c:if test="${bvo.hugi==0}">
               <input id="btn2" type="button" value="상품평 작성" onclick="location='review?pcode=${bvo.pcode}&bid=${bvo.id}'">
             </c:if>
             <c:if test="${bvo.hugi==1}">
               <input id="btn2" type="button" value="상품평 확인" onclick="location='myreview'">
             </c:if>
          </c:if> 
          <c:if test="${bvo.state!=4}"> 
           <div> </div>
          </c:if> 
        </td>
      </tr>
     </c:forEach> 
      
    </table>
  </section>
</body>
</html>