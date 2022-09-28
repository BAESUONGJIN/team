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
</style>
</head>
<body>
<section>
	<table width="900" align="center">
		<tr>
			<td> 상품명(코드번호) </td>
			<td> 상품문의 </td>
			<td> 작성자  </td>
			<td> 답변여부 </td>
		</tr>
		
		<c:forEach items="${ilist}" var="ivo">
		<tr>
			<td> <a href="inquiry_content?id=${ivo.id}"> ${ivo.title}(${ivo.pcode}) </a> </td>
			<td> ${ivo.content} </td>
			<td> ${ivo.userid} </td>
			<c:if test="${ivo.cnt == 0 }">
				<td> 미작성  </td>
			</c:if>
			<c:if test="${ivo.cnt ==1}">
				<td> 작성 </td>
			</c:if>
		</tr>
		</c:forEach>
	</table>
</section>
</body>
</html>