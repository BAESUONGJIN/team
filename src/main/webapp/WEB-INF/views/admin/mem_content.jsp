<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
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
	
	h2 #title{
		margin-bottom: 30px;
		display: inline-block;
		width: 200px;
		background: linear-gradient(to top, #f6eae9 30%, transparent 80%);
	}
	
	table {
		border-top: 2px solid black;
		margin-top: 10px;
		margin-bottom: 20px;
		border-collapse: collapse;
	}
	
	td {
		border-bottom: 1px solid gray;
		padding: 10px;
		text-align: center;
	}
	
	input[type=button] {
      	width:100px;
      	height:35px;
      	border:1px solid gray;
      	border-radius: 10px;
      	background:gray;
      	color:white;
    }
</style>
</head>
<body>
<section>
	<h2 align="center"> <span id="title"> ${mvo.name} 회원 정보 </span> </h2>
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
			<td> <fmt:formatNumber value="${mvo.chong}" pattern="#,###"/>원 </td>
		</tr>
		
		<tr>
			<td colspan="2" style="border:none;"> <input type="button" value="회원목록" onclick="location='mem_list'"> </td>
		</tr>
	</table>
</section>
</body>
</html>