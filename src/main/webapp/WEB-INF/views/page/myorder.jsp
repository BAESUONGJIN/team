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
   
	h2 #hh2 {
		margin-bottom: 30px;
		display: inline-block;
		font-family: 'Lora', serif;
		background: linear-gradient(to top, #f6eae9 30%, transparent 80%);
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
    <table width="1000" align="center" cellspacing="0">
     <caption style="caption-side:top"> 
        <h2 align="center"> <span id="hh2"> My Order </span> </h2> 
     </caption>
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
        <td> <a href="../product/pro_content?pcode=${bvo.pcode}"> <img src="../resources/img/${bvo.pimg}" width="70" height="70"></a> </td>
        <td> <a href="../product/pro_content?pcode=${cvo.pcode}"> ${bvo.title}</a> </td>
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