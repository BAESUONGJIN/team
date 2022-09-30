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
			<td> 상품명 </td>
			<td colspan="3"> ${ivo.title} </td>
		</tr>
		
		<tr>
			<td> 상품코드 </td>
			<td> ${ivo.pcode} </td>
			<td> 작성자 </td>
			<td> ${ivo.userid} </td>
		</tr>
		
		<tr>
			<td> 상품문의 </td>
			<td colspan="3"> ${ivo.content} </td>
		</tr>
		
		<c:if test="${empty answer_content}">
		<form method="post" action="inquiry_answer">
		<input type="hidden" name="cid" value="${ivo.id}">
			<tr id="answer">
				<td> 답변 </td>
				<td colspan="3"> <textarea rows="6" cols="40" name="content"> </textarea> </td> 
			</tr>
			
			<tr>
				<td colspan="4"> 
					<input type="button" value="목록" onclick="location.href='inquiry_list'">
					<input type="submit" value="답변쓰기">
				</td>
			</tr>
		</form>
		</c:if>
		
		<c:if test="${!empty answer_content}">
		<form method="post" action="inquiry_update">
		<input type="hidden" name="cid" value="${ivo.id}">
			<tr id="answer">
				<td> 답변 </td>
				<td colspan="3"> <textarea rows="6" cols="40" name="content">${ivo.answer_content} </textarea> </td> 
			</tr>
			
			<tr>
				<td colspan="4"> 
					<input type="button" value="목록" onclick="location.href='inquiry_list'">
					<input type="submit" value="답변수정">
				</td>
			</tr>
		</form>
		</c:if>
	</table>
</section>
</body>
</html>