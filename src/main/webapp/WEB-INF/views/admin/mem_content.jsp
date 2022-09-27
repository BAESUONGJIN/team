<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<h2 align="center" style="padding-bottom:50px;"> ${mvo.name} 회원 정보</h2>
	<table width="500" align="center">
		<tr>
			<td> 아이디 </td>
			<td> ${mvo.userid} </td>
		</tr>
		
		<tr>
			<td> 이 름 </td>
			<td> ${mvo.name} </td>
		</tr>
		
		<tr>
			<td> 주 소 </td>
			<td> ${mvo.juso} ${mvo.juso_etc} </td>
		</tr>
		
		<tr>
			<td> 전화번호 </td>
			<td> ${mvo.phone} </td>
		</tr>
		
		<tr>
			<td> 이메일 </td>
			<td> ${mvo.email} </td>
		</tr>
		
		<tr>
			<td> 가입일 </td>
			<td> ${mvo.writeday} </td>
		</tr>
		
		<tr>
			<td> 총구매금액 </td>
			<td> 임시 </td>
		</tr>
		
		<tr>
			<td colspan="2"> <input type="button" value="회원목록" onclick="location='mem_list'"> </td>
		</tr>
	</table>
</section>
</body>
</html>