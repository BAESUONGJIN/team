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
	
	h2 #faq{
		margin-bottom: 30px;
		display: inline-block;
		width: 150px;
		background: linear-gradient(to top, #f6eae9 30%, transparent 80%);
	}
	
	table {
		margin-top: 20px;
		margin-bottom: 20px;
		border-top: 2px solid black;
		border-collapse: collapse;
		width: 100%;
	}
	
	td {
		border-bottom: 1px solid gray;
		padding: 10px;
	}
	
	#no {
		text-align: center;
		font-weight: bold;
		font-size: 20px;
	}
	
	input[type=text] {
		width: 850px;
		height: 50px;
		border: none;
		font-size: 20px;
	}
	
	textarea {
		width: 850px;
		height: 450px;
		border: none;
	}
	
	input[type=button] {
      	width:50px;
      	height:35px;
      	border:1px solid gray;
      	border-radius: 10px;
      	background:gray;
      	color:white;
      	float: left;
    }
    
	input[type=submit] {
      	width:100px;
      	height:35px;
      	border:1px solid gray;
      	border-radius: 10px;
      	background:gray;
      	color:white;
      	margin-left: 400px;
    }
</style>


<script src="http://code.jquery.com/jquery-latest.js"></script>

<c:set var="gubun" value="${fvo.gubun}"/>
<script>
	
	$(document).ready(function()
	{
		$("#gubun").val("${gubun}").prop("selected", true);
	});
	
	function back()
	{
		history.back(-1);
	}
</script>
</head>
<body>
<section>
	<h2 align="center"> <span id="faq"> FAQ 수정 </span> </h2>
	<form method="post" action="faq_update_ok">
		<input type="hidden" name="id" value="${fvo.id}">
		<table width="600" align="center">
			<tr>
				<td width="150" id="no"> 분류 </td>
				<td>
				<select name="gubun" id="gubun">
					<option value="0"> 회원정보 </option>
					<option value="1"> 상품확인 </option>
					<option value="2"> 주문/결제 </option>
					<option value="3"> 배송 </option>
					<option value="4"> 교환/취소(반품) </option>
					<option value="5"> 서비스 </option>
				</select>
				</td>
			</tr>
			
			<tr>
				<td id="no"> 질 문 </td>
				<td> <input type="text" name="question" value="${fvo.question }"> </td>
			</tr>
			
			<tr>
				<td id="no"> 답 변 </td>
				<td> <textarea name="ask">${fvo.ask }</textarea> </td>
			</tr>
			
		</table>
		<div> 
			<input type="button" value="←" onclick="back()">
			<input type="submit" value="수정하기">
		</div>
	</form>
</section>
</body>
</html>