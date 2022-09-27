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
		height: 1500PX;
		margin: auto;
		/* margin-top: 40px;
		margin-bottom: 40px; */
		padding-top: 120px;
	}
</style>
</head>
<body>
<section>
	<table width="600" align="center">
	<caption> <h2> ${av }</h2></caption>
		<tr>
			<td> 제 목 </td>
			<td colspan="5"> ${avo.title} </td>
		</tr>
		
		<tr>
			<td> 작성자 </td>
			<td> ${avo.userid} </td>
			<td> 작성일 </td>
			<td> ${avo.writeday} </td>
			<td> 조회수 </td>
			<td> ${avo.readnum} </td>
		</tr>
		
		<tr>
			<td> 내 용 </td>
			<td colspan="5"> ${avo.content} </td>
		</tr>
		
		<tr>
			<td colspan="4"> <input type="button" value="목록" onclick="location='list'"> </td>
			<c:if test="${userid == 'admin123' }">
			<td colspan="2" align="right">
				<input type="button" value="수정" onclick="location='update?id=${avo.id}'"> 
				<input type="button" value="삭제" onclick="location='delete?id=${avo.id}'">
			</td> 
			</c:if>
		</tr>
	</table>
</section>
</body>
</html>