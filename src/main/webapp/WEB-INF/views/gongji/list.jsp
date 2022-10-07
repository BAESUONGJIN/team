<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Lora:ital@1&family=Roboto:wght@700&display=swap');

	section {
		width: 1000px;
		height: auto;
		margin: auto;
		margin-top: 40px;
		margin-bottom: 40px;
		padding-top: 120px;
	}
	
	h2 #gongji {
		margin-bottom: 30px;
		display: inline-block;
		width: auto;
		background: linear-gradient(to top, #f6eae9 30%, transparent 80%);
		font-family: 'Lora', serif;
	}
	
	a {
		text-decoration: none;
		color: black;
	}
	
	table {
		margin-top: 20px;
		width: 100%;
		border-top: 2px solid #cccccc;
		border-collapse: collapse;
	}
	
	th {
		text-align: center;
		border-bottom: 1px solid #cccccc;
		padding: 10px;
		background: #f6eae9;
	}
	
	td {
		border-bottom: 1px solid #cccccc;
		padding: 10px;
		text-align: center;
	}
	
	#import_list {
		background: #fcf3f2;
	}
	
	#paging {
		border: none;
		padding-top: 20px;
		float: left;
	}
	
	#btn {
		float: right;
		padding-top: 20px;
	}
	
	#btn input[type=button] {
      	width:100px;
      	height:35px;
      	border:1px rgb(180, 180, 180);
      	border-radius: 10px;
      	background:gray;
      	color:white;
    }
</style>
</head>
<body>
<section>
	<h2 align="center"> <span id="gongji"> NOTICE </span> </h2>
	<table align="center">
	<tr>
		<th> 제 목 </th>
		<th> 작성자 </th>
		<th> 작성일 </th>
		<th> 조회수 </th>
	</tr>
	
	
	<c:forEach items="${import_list}" var="avo">
	<tr id="import_list">
		<td onclick="location='readnum?id=${avo.id}'"> ★ ${avo.title} ★ </td>
		<td> ${avo.name} </td>
		<td> ${avo.writeday} </td>
		<td> ${avo.readnum} </td>
	</tr>
	</c:forEach>
	
	<c:forEach items="${list}" var="avo">
	<tr>
		<td width="700" onclick="location='readnum?id=${avo.id}'"> ${avo.title} </td>
		<td width="100"> ${avo.name} </td>
		<td> ${avo.writeday} </td>
		<td> ${avo.readnum} </td>
	</tr>
	</c:forEach>
	
	<tr> <!-- 페이징 처리 -->
		<td colspan="5" align="center" style="border-bottom:none;">
		<span id="paging">
		<c:if test="${pstart != 1}">
			<a href="list?page=${pstart-1}"> ◁◁ </a>
		</c:if>
		<c:if test="${pstart == 1}">
			◁◁
		</c:if>
			
		<c:if test="${page != 1}">
			<a href="list?page=${page-1}"> ◁ </a>
		</c:if>
		<c:if test="${page == 1}">
			◁
		</c:if>
			
		<c:forEach begin="${pstart}" end="${pend}" var="i">
			<c:if test="${page == i}">
				<c:set var="st" value="style='color:red;'"/>
			</c:if>
			<c:if test="${page != i}">
				<c:set var="st" value=""/>
			</c:if>
				
			<a href="list?page=${i}" ${st}> ${ i } </a>
		</c:forEach>
			
		<c:if test="${page != chong}">
			<a href="list?page=${page+1}"> ▷  </a>
		</c:if>
		<c:if test="${page == chong}">
			▷
		</c:if>
			
		<c:if test="${chong != pend}">
			<a href="list?page=${pend+1}"> ▷▷  </a>
		</c:if>
		<c:if test="${chong == pend}">
			▷▷
		</c:if>
		</span>
		<c:if test="${userid == 'admin123'}">
			<span id="btn"> <input type="button" value="글작성" onclick="location='write'"> </span>
		</c:if>
		</td>
		
	</table>
</section>
</body>
</html>