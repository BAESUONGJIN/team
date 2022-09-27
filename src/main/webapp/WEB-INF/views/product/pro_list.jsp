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
div{
margin-left: 20px;
}
s
{
color: gray;
}
b{
color: red;
}
#aa{
border: 1px solid red;
}

</style>
<script>

</script>
</head>
<body>
<section>
<form method="post" action="pro_list">
	<table width="1200" height="1300" align="center">
	<!-- <div id="orbySelect" align="right"><select>
		<option>기 본</option>
		<option>최신순</option>
		<option>조회순</option>
		</select></div> -->
		<tr>
			<c:forEach items="${list}" var="pvo">
				<td><a href="pro_content?pcode=${pvo.pcode }">
				<div id="pimg"><img src="../resources/img/${pvo.pimg}" width="300" height="350" onmouseover="content()"></div>
				<div id="title">${pvo.title }</div>
				<div id="price">
				 <c:if test="${pvo.halin ==0 }">   <!-- 할인 0인 경우 -->
				  <fmt:formatNumber value="${pvo.price}"/>
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
		   <a href="pro_list?dcode=${dcode}&page=${startpage-1}&pcnt=${pcnt}">◁◁</a>
		 </c:if>
		 <c:if test="${startpage ==1 }"> <!-- 첫번째 그룹일때 (1~10)는 이전 10페이지 이동 불가  -->
		   ◁◁
		 </c:if>
		 
		 <!-- 1페이지 단위로 이전으로 가기 -->
		 <c:if test="${page != 1 }"> <!-- 현재페이지가 1이 아닌경우 -->
		   <a href="pro_list?dcode=${dcode}&page=${page-1}&pcnt=${pcnt}">◁</a>
		 </c:if>
		 <c:if test="${page == 1 }">  <!-- 현재페이지가 1인경우 -->
		  ◁
		 </c:if>
		 
		  <!--페이지 출력-->
		 <c:forEach begin="${startpage}" end="${endpage }" var="i">
		 <a href="pro_list?dcode=${dcode}&page=${i}&pcnt=${pcnt}">${i}</a>
		 </c:forEach>
		
		
		<!-- 1페이지씩 다음으로 이동하기 -->
		<c:if test="${page != chongpage }"> <!-- 현재페이지가 마지막이 아니라면-->		
		  <a href="pro_list?dcode=${dcode}&page=${page+1}&pcnt=${pcnt}">▷</a>
		</c:if>
		<c:if test="${page == chongpage }"> <!-- 현재페이지가 마지막이라면  -->
		▷
		</c:if>
		
		<!-- 10페이지씩 다음으로 이동하기  -->
		<c:if test="${chongpage != endpage }">   <!-- 출력되는 페이지가 마지막 그룹이 아니라면 -->
		  <a href="pro_list?dcode=${dcode}&page=${endpage+1}&pcnt=${pcnt}">▷▷</a>
		</c:if>
		<c:if test="${chongpage == endpage }"> <!-- 출력되는 페이지가 마지막 그룹이라면 -->
		▷▷
		</c:if>
		 </td>
		</tr>
	</table>
	</form>
	</section>
</body>
</html>