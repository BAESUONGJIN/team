<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		/* margin-top: 40px;
		margin-bottom: 40px; */
		padding-top: 200px;
	}
	
</style>
</head>
<body>
<section>
	<form method="post" action="update_ok">
	<input type="hidden" name="id" value="${avo.id}">
	<h2 align="center" style="margin-bottom:50px;"> 글 수 정 </h2>
	<table width="500" align="center">
	<tr>
		<td> 제 목 </td>
		<td> <input type="text" name="title" size="62" value="${avo.title}"> </td>
	</tr>
	
	<tr>
		<td> 내 용 </td>
		<td> <textarea rows="6" cols="60" name="content">${avo.content} </textarea> </td>
	</tr>
	
	<tr>
		<td colspan="2" align="center"> <input type="submit" value="수정하기"> </td>
	</tr>
	</table>
	</form>
</section>
</body>
</html>