<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 흠 -->
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
	</table>

</section>

</body>
</html>