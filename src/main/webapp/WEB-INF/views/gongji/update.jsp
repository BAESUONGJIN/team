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
		margin-top: 40px;
		margin-bottom: 40px;
		padding-top: 120px;
	}
	
	h2 #gongji_update {
		margin-bottom: 30px;
		display: inline-block;
		width: 230px;
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
		padding: 20px 10px 20px 10px;
		
	}
	
	#title {
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
<script>
	function back()
	{
		history.back(-1);
	}
</script>
</head>
<body>
<section>
	<form method="post" action="update_ok">
		<input type="hidden" name="id" value="${avo.id}">
		<h2 align="center"> <span id="gongji_update"> 공지사항 수정 </span> </h2>
		<table width="500" align="center">
		<tr>
			<td id="title" width="250"> 제 목 </td>
			<td> <input type="text" name="title" value="${avo.title}"> </td>
		</tr>
		
		<tr>
			<td id="title"> 내 용 </td>
			<td> <textarea name="content">${avo.content} </textarea> </td>
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