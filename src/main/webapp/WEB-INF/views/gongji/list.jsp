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
		margin-top: 40px;
		margin-bottom: 40px;
		padding-top: 120px;
	}
	
	a {
		text-decoration: none;
		color: black;
	}
	
	a:hover {
		text-decoration: underline;
	}
	
</style>
</head>
<body>
<section>
	<h2 align="center" style="margin-bottom:50px;"> 공 지 사 항 </h2>
	<table width="600" align="center" border="1">
	<tr>
		<td> 제 목 </td>
		<td> 작성자 </td>
		<td> 작성일 </td>
		<td> 조회수 </td>
	</tr>
	
	<c:forEach items="${list}" var="avo">
	<tr>
		<td> <a href="readnum?id=${avo.id}"> ${avo.title} </a> </td>
		<td> ${avo.userid} </td>
		<td> ${avo.writeday} </td>
		<td> ${avo.readnum} </td>
	</tr>
	</c:forEach>
	
	<tr> <!-- 페이징 처리 -->
		<td colspan="4" align="center">
		<c:if test="${pstart != 1}">
			<a href="list?page=${pstart-1}"> ◁◁ </a>
		</c:if>
		<c:if test="${pstart == 1}">
			◁◁
		</c:if>
			
		<c:if test="${page != 1}">
			<a href="list?page=${page-1}"> ◁ </a>
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
				
			<a href="list?page=${i}" ${st}> ${ i } </a>
		</c:forEach>
			
		<c:if test="${page != chong}">
			<a href="list?page=${page+1}"> ▷  </a>
		</c:if>
		<c:if test="${page == chong}">
			▷
		</c:if>
			
		<c:if test="${chong != pend}">
			<a href="list?page=${pend+1}"> ▷▷  </a>
		</c:if>
		<c:if test="${chong == pend}">
			▷▷
		</c:if>
		
		</td>
	<c:if test="${userid == 'admin123'}">
	<tr>
		<td colspan="4"> <input type="button" value="글작성" onclick="location='write'"> </td>
	</tr>
	</c:if>
	</table>
</section>
</body>
</html>