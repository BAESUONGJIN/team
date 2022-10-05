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
	
	h2 #title {
		margin-bottom: 30px;
		display: inline-block;
		width: 180px;
		background: linear-gradient(to top, #f6eae9 30%, transparent 80%);
	}
	
	table {
		margin-top: 20px;
		width: 100%;
		border-top: 2px solid black;
		border-collapse: collapse;
	}
	
	td {
		border-bottom: 1px solid gray;
		padding: 15px 10px 15px 10px;
		text-align: center;
		border-right: 1px solid gray;
		border-left: 1px solid gray;
	}
	
	#button {
		border: none;
	}
	
	#gap {
		text-align: left;
	}
	
	textarea {
		width: 800px;
		height: 400px;
		border: none;
	}
	input[type=button] {
      	width:100px;
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
      	margin-left: -100px;
    }
</style>
</head>
<body>
<section>
	<h2 align="center"> <span id="title"> 상 품 문 의 </span> </h2>
	<table align="center">
		<tr>
			<td width="250"> 상품명(코드번호)</td>
			<td id="gap"> ${ivo.pro_title} (${ivo.pcode}) </td>
			<td> 작성자 </td>
			<td id="gap"> ${ivo.userid} </td>
		</tr>
		
		<tr>
			<td> 상품문의 </td>
			<td colspan="3" id="gap"> ${ivo.content} </td>
		</tr>
		
		<c:if test="${empty answer_content}">
		<form method="post" action="inquiry_answer">
		<input type="hidden" name="cid" value="${ivo.id}">
			<tr id="answer">
				<td> 답변 </td>
				<td colspan="3"> <textarea rows="6" cols="40" name="content"></textarea> </td> 
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
				<td colspan="3"> <textarea rows="6" cols="40" name="content">${ivo.answer_content}</textarea> </td> 
			</tr>
			
			<tr>
				<td colspan="4" id="button"> 
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