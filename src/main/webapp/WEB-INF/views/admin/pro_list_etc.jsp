<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	section {
		width: 1000px;
		height: auto;
		margin: auto;
		margin-bottom: 40px;
		padding-top: 120px;
	}
	
	#list_menu {
		padding-left: 50px;
	}
</style>
</head>
<body>
<section>
	<span id="list_menu">
		<a href="pro_list"> ALL </a> |
		<a href="pro_list_etc?pdae=p01"> OUTER </a> |
		<a href="pro_list_etc?pdae=p02"> TOP </a> |
		<a href="pro_list_etc?pdae=p03"> PANTS </a> |
		<a href="pro_list_etc?pdae=p04"> SKIRT </a> |
		<a href="pro_list_etc?pdae=p05"> DRESS </a>
	</span>
	<table width="900" align="center" style="margin-top:10px;">
		<tr height="60">
			<td> 코드번호 </td>
			<td> 상품이미지 </td>
			<td> 상품명 </td>
			<td> 가격 </td>
			<td> 등록일 </td>
			<td> 삭제 </td>
		</tr>
		
		<c:forEach items="${plist}" var="pvo">
		<tr>
			<td> ${pvo.pcode} </td>
			<td> <img src="../resources/img/${pvo.pimg}" width="40" height="40"> </td>
			<td onclick="location='pro_content?id=${pvo.id}'"> ${pvo.title} </td>
			<td> ${pvo.price} </td>
			<td> ${pvo.writeday} </td>
			<td> <input type="button" value="삭제" onclick="location='pro_delete?id=${pvo.id}'"> </td>
		</tr>
		</c:forEach>
		
		<tr> <!-- 페이징 처리 -->
			<td colspan="6" align="center">
			<c:if test="${pstart != 1}">
				<a href="pro_list_etc?pdae=${pdae}&page=${pstart-1}"> ◁◁ </a>
			</c:if>
			<c:if test="${pstart == 1}">
				◁◁
			</c:if>
			
			<c:if test="${page != 1}">
				<a href="pro_list_etc?pdae=${pdae}&page=${page-1}"> ◁ </a>
			</c:if>
			<c:if test="${page == 1}">
				◁
			</c:if>
			
			
			<c:forEach begin="${pstart}" end="${pend}" var="i">
				<c:if test="${page == i}">
					<c:set var="st" value="style='color:red;'"/>
				</c:if>
				<c:if test="${page != i}">
					<c:set var="st" value=""/>
				</c:if>
				
				<a href="pro_list_etc?pdae=${pdae}&page=${i}" ${st}> ${ i } </a>
			</c:forEach>
			
			<c:if test="${page != chong}">
				<a href="pro_list_etc?pdae=${pdae}&page=${page+1}"> ▷  </a>
			</c:if>
			<c:if test="${page == chong && page == null}">
				▷
			</c:if>
			
			<c:if test="${chong != pend}">
				<a href="pro_list_etc?pdae=${pdae}&page=${pend+1}"> ▷▷  </a>
			</c:if>
			<c:if test="${chong == pend}">
				▷▷
			</c:if>
			
			</td>
	</table>
</section>

</body>
</html>