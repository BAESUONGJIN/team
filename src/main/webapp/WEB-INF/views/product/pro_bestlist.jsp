<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	section {
		width: 1200px;
		height: 100%;
	  	margin:auto;
	   	text-align: center;
	   	padding-top:150px;/* 폼 자체 조정 */
	}
	
	div{
		margin-left: 20px;
	}
	
	a{
		text-decoration: none;
		color: black;
	}
	
	.my_img {
   		filter: brightness(1);
   	} 
 	.my_img:hover {
   		filter: grayscale(100%);
   	}
   
	/* 퀵 메뉴 */
    div, ul, li {
    -webkit-box-sizing: border-box;-moz-box-sizing: border-box;box-sizing: border-box;padding:0;margin:0
    }
    a {
    text-decoration:none;
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
<section>
	<div class="quickmenu">
  		<ul>
		    <li> <i class="fa-solid fa-angles-up " style="cursor: pointer; color: #616161;" onclick="window.scrollTo(0,0);"> </i></li><br> <br>
		    <li> <a href="../page/cart"> <i class="fa-solid fa-cart-shopping fa-3x" style="color: #616161;"></i> </a></li> <br> <br>
		    <li> <a href="../page/wish"> <i class="fa-regular fa-heart fa-3x" style="color: #616161;"></i> </a></li> <br> <br>
		    <li> <a href="../faq/faq_list"><i class="fa-regular fa-face-smile fa-3x" style="color: #616161;"></i></a> </li> <br> <br>
  		</ul>
 	</div>
	<table width="1200" height="1300" align="center">
		<tr>
			<c:forEach items="${plist}" var="pvo">
				<td><a href="pro_readnum?pcode=${pvo.pcode }">
				<div id="pimg"><img src="../resources/img/${pvo.pimg}" width="300" height="350" onmouseover="content()" class="my_img"></div>
				<div id="title">${pvo.title }</div>
				<div id="price">
				 <c:if test="${pvo.halin ==0 }">   <!-- 할인 0인 경우 -->
				  <fmt:formatNumber value="${pvo.price}"/>원
				 </c:if>
				 <c:if test="${pvo.halin != 0 }">   <!-- 할인 0이 아닌 경우 -->
				  <s><fmt:formatNumber value="${pvo.price}"/>원<br></s>
				  <b><fmt:formatNumber value="${pvo.price*(1-pvo.halin/100)+pvo.baesong}"/>원</b>
				 </c:if>
				</div></a>
				<div><a>찜</a></div>
				</td>
				<c:set var="i" value="${i+1 }"/>
				<c:if test="${i%3==0 }">  <!-- 3칸 후 다음줄로 이동 -->
				</tr>
				<tr>
				</c:if>
			</c:forEach>
		</tr>
		
		<tr>   <!--페이징 처리  -->
		
		 <td colspan="3" align="center">
		  <!-- 10페이지 이전으로 이동 -->
		 <c:if test="${startpage !=1 }"> <!--첫번째 그룹이 아닐때  -->
		   <a href="pro_bestlist?page=${startpage-1}&pcnt=${pcnt}">◁◁</a>
		 </c:if>
		 <c:if test="${startpage ==1 }"> <!-- 첫번째 그룹일때 (1~10)는 이전 10페이지 이동 불가  -->
		   ◁◁
		 </c:if>
		 
		 <!-- 1페이지 단위로 이전으로 가기 -->
		 <c:if test="${page != 1 }"> <!-- 현재페이지가 1이 아닌경우 -->
		   <a href="pro_bestlist?page=${page-1}&pcnt=${pcnt}">◁</a>
		 </c:if>
		 <c:if test="${page == 1 }">  <!-- 현재페이지가 1인경우 -->
		  ◁
		 </c:if>
		 
		  <!--페이지 출력-->
		 <c:forEach begin="${startpage}" end="${endpage }" var="i">
		 <a href="pro_bestlist?page=${i}&pcnt=${pcnt}">${i}</a>
		 </c:forEach>
		
		
		<!-- 1페이지씩 다음으로 이동하기 -->
		<c:if test="${page != chongpage }"> <!-- 현재페이지가 마지막이 아니라면-->		
		  <a href="pro_bestlist?page=${page+1}&pcnt=${pcnt}">▷</a>
		</c:if>
		<c:if test="${page == chongpage }"> <!-- 현재페이지가 마지막이라면  -->
		▷
		</c:if>
		
		<!-- 10페이지씩 다음으로 이동하기  -->
		<c:if test="${chongpage != endpage }">   <!-- 출력되는 페이지가 마지막 그룹이 아니라면 -->
		  <a href="pro_bestlist?page=${endpage+1}&pcnt=${pcnt}">▷▷</a>
		</c:if>
		<c:if test="${chongpage == endpage }"> <!-- 출력되는 페이지가 마지막 그룹이라면 -->
		▷▷
		</c:if>
		 </td>
		</tr>
 
	</table>
</section>
</body>
</html>