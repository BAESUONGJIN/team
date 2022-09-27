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
	<h2 align="center" style="padding-bottom:50px;"> 회 원 정 보 </h2>
	<table width="400" align="center">
		<tr>
			<td width="130"> 아이디 </td>
			<td> 이 름 </td>
			<td> 가입일 </td>
			<td> 상태 </td>
		</tr>
	
		<c:forEach items="${mlist}" var="mvo">
		<c:if test="${mvo.userid != 'admin123' }">
		<tr onclick="location='mem_content?userid=${mvo.userid}'">
			<td> ${mvo.userid} </td>
			<td> ${mvo.name} </td>
			<td> ${mvo.writeday} </td>
			<c:if test="${mvo.state==0}">
				<c:set var="state" value="정상회원"/>
			</c:if>
			<c:if test="${mvo.state==1}">
				<c:set var="state" value="탈퇴회원"/>
			</c:if>
			<td> ${state} </td>
		</tr>
		</c:if>
		</c:forEach>
		
		<tr> <!-- 페이징 처리 -->
			<td colspan="3" align="center">
			<c:if test="${pstart != 1}">
				<a href="mem_list?page=${pstart-1}"> ◁◁ </a>
			</c:if>
			<c:if test="${pstart == 1}">
				◁◁
			</c:if>
			
			<c:if test="${page != 1}">
				<a href="mem_list?page=${page-1}"> ◁ </a>
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
				
				<a href="mem_list?page=${i}" ${st}> ${ i } </a>
			</c:forEach>
			
			<c:if test="${page != chong}">
				<a href="mem_list?page=${page+1}"> ▷  </a>
			</c:if>
			<c:if test="${page == chong}">
				▷
			</c:if>
			
			<c:if test="${chong != pend}">
				<a href="mem_list?page=${pend+1}"> ▷▷  </a>
			</c:if>
			<c:if test="${chong == pend}">
				▷▷
			</c:if>
		
			</td>
		</tr>
	</table>	
</section>

</body>
</html>