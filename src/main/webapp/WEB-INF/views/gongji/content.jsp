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
	
	table {
		margin-top: 20px;
		width: 100%;
		border-top: 2px solid #cccccc;
		border-collapse: collapse;
	}
	
	td {
		border-bottom: 1px solid #cccccc;
		padding: 10px;
		padding-left: 20px;
	}
	
	#last_td {
		border: none;
	}
	
	#list_btn {
		float: left;
	}
	
	#btn {
		float: right;
		display: inline-block;
		padding-right: 10px;
	}
	
	input[type=button] {
      	width:100px;
      	height:35px;
      	border:none;
      	border-radius: 10px;
      	background: gray;
      	color:white;
    }
    
    a {
    	color: black;
    	text-decoration: none;
    }
    
    a:hover {
    	color: red;
    }
</style>
</head>
<body>
<section>
	<h2 align="center"> <span id="gongji"> NOTICE </span> </h2>
	<table align="center">
		<tr>
			<td> <b> ${avo.title} </b> </td>
		</tr>
		
		<tr>
			<td> ${avo.name} &nbsp; | &nbsp; ${avo.writeday} &nbsp; | &nbsp; ${avo.readnum} </td>
		</tr>
		
		<tr>
			<td align="center"> ${avo.content} </td>
		</tr>
		
		<c:if test="${nvo.nextid != null }">
		<tr>
			<td> 이전글 △  <a href="content?id=${nvo.nextid}"> ${nvo.nexttitle} </a> </td>
		</tr>
		</c:if>
		
		<c:if test="${nvo.preid != null }">
		<tr>
			<td> 다음글 ▽  <a href="content?id=${nvo.preid}"> ${nvo.pretitle} </a>  </td>
		</tr>
		</c:if>
		
		<tr>
			<td id="last_td"> 
				<span id="list_btn"> <input type="button" value="목록" onclick="location='list'"> </span>
			<span id="btn">
			<c:if test="${userid == 'admin123'}">
				<input type="button" value="수정" onclick="location='update?id=${avo.id}'">
				<input type="button" value="삭제" onclick="location='delete?id=${avo.id}'">
			</c:if>
			</span>
			</td> 
		</tr>
	</table>
</section>
</body>
</html>