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
		width: auto;
		background: linear-gradient(to top, #f6eae9 30%, transparent 80%);
	}
	
	table {
		margin-top: 20px;
		width: 100%;
		border-top: 2px solid black;
		border-collapse: collapse;
	}
	
	th {
		text-align: center;
		border-bottom: 1px solid gray;
		border-right: 1px solid gray;
		padding: 15px 10px 15px 10px;
		background: #f6eae9;
	}
	
	th:last-child {
		border-right: none;
	}
	
	td {
		border-bottom: 1px solid gray;
		padding: 15px 10px 15px 10px;
		text-align: center;
	}
	
	#write input[type=button] {
      	width:100px;
      	height:35px;
      	border:1px solid gray;
      	border-radius: 10px;
      	background:gray;
      	color:white;
      	margin-top: 7px;
    }
    
    #delete input[type=button] {
    	width:100px;
      	height:35px;
      	border:1px solid gray;
      	border-radius: 10px;
      	background:gray;
      	color:white;
      	margin-top: 30px;
    }
</style>
</head>
<body>
<section>
	<h2 align="center"> <span id="title"> 상 품 문 의 </span> </h2>
	<table align="center">
		<tr>
			<th width="300"> 상품명(코드번호) </th>
			<th width="300"> 상품문의제목 </th>
			<th width="150"> 작성자  </th>
			<th width="100"> 답변여부 </th>
			<th width="100"> 작성/수정</th>
		</tr>
		
		<c:forEach items="${ilist}" var="ivo">
		<tr>
			<td> ${ivo.pro_title}<br>(${ivo.pcode}) </td>
			<td> ${ivo.title} </td>
			<td> ${ivo.userid} </td>
			<c:if test="${ivo.cnt == 0 }">
				<td id="write"> 미작성  <br> <input type="button" onclick="location='inquiry_content?id=${ivo.id}'" value="작성하기"> </td>
				<td> </td>
			</c:if>
			<c:if test="${ivo.cnt ==1}">
				<td id="write"> 작성완료 <br> <input type="button" onclick="location='inquiry_content?id=${ivo.id}'" value="수정하기"> </td>
				<td id="delete"> <input type="button" onclick="location='answer_delete?cid=${ivo.id}'" value="답변삭제"> </td>
			</c:if>
			
		</tr>
		</c:forEach>
	</table>
</section>
</body>
</html>