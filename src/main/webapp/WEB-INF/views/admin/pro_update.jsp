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
		padding-top: 150px;
	}
	
	h2 #title{
		margin-bottom: 30px;
		padding-bottom: 8px;
		display: inline-block;
		width: auto;
		background: linear-gradient(to top, #f6eae9 30%, transparent 80%);
	}
	
	table {
		margin-top: 20px;
		margin-bottom: 20px;
		width: 100%;
		border-top: 2px solid black;
		border-collapse: collapse;
	}
	
	th {
		text-align: center;
		border-bottom: 1px solid gray;
		border-right: 1px solid gray;
		padding: 10px;
		background: #f6eae9;
	}
	
	td {
		border-bottom: 1px solid gray;
		border-right: 1px solid gray;
		padding: 10px;
	}
	
	input[type=text] {
		width: 190px;
		height: 50px;
		border: none;
	}
	
	#pro_title {
		width: 800px;
		height: 50px;
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

window.onload = function()
{
	var price = Number(document.getElementById("price").value);
	var halin = Number(document.getElementById("halin").value);
	var chong = Number(price*(1-halin/100)).toFixed(0).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	document.getElementById("chong").innerText=chong+"원";
	
};

function chong_pay()
{
   
   var price = Number(document.getElementById("price").value);
   var halin = Number(document.getElementById("halin").value);
   var chong = Number(price*(1-halin/100)).toFixed(0).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
   document.getElementById("chong").innerText=chong+"원";
}

function back()
{
	history.back(-1);
}
</script>

</head>

<body>
<section>
	<form name="write_form" method="post" action="pro_update_ok" enctype="multipart/form-data">
	<input type="hidden" name="id" value="${pvo.id}">
		<h2 align="center"> <span id="title"> 상 품 수 정 </span> </h2>
		<table width="700" align="center">
		
			<tr>
				<th>대표이미지</th> 
				<td colspan="5"><input id="file" type="file" name="pimg"></td>
			</tr>
			<tr>
				<th>카테고리</th>
				<c:if test="${pvo.dcode == 'p01'}">
					<c:set var="dcode" value="OUTER"/>
				</c:if>
				<c:if test="${pvo.dcode == 'p02'}">
					<c:set var="dcode" value="TOP"/>
				</c:if>
				<c:if test="${pvo.dcode == 'p03'}">
					<c:set var="dcode" value="BOTTOM"/>
				</c:if>
				<c:if test="${pvo.dcode == 'p04'}">
					<c:set var="dcode" value="SKIRT"/>
				</c:if>
				<c:if test="${pvo.dcode == 'p05'}">
					<c:set var="dcode" value="DRESS"/>
				</c:if>
				<td colspan="2"> ${dcode} </td>
				<th>상품 코드</th>
				<td colspan="2"> ${pvo.pcode} </td>
			</tr>
			
			<tr>
				<th>상 품 명</th>
				<td colspan="5"><input type="text" name="title" id="pro_title" value="${pvo.title}"></td>
			</tr>
			<tr>
			<th> 사이즈<br>(옵션)</th>
				<td id="option_td">		
				<!-- <p class="option"> -->
				<input type="text" name="size" size="5" value="${pvo.size}"> </td>
				<th> 색상<br>(옵션) </th>
				<td> <input type="text" name="color" size="5" value="${pvo.color}"> </td>
				<th> 재고(옵션) </th>
				<td> <input type="text" name="stock" size="5" value="${pvo.stock}"> </td>
				<!-- </p> -->
				
				
			</tr>
			<tr>
				<th>상세페이지</th>
				<td colspan="5">
				  <input type="file" name="cimg">
				</td>
			</tr>
			<tr>
				<th width="150">가 격</th>
				<td width="250"><input id="price" type="text" name="price" value="${pvo.price}" oninput="this.value=this.value.replace(/[^0-9]/g,'').replace(/(\..*)\./g,'$1');" onkeyup="chong_pay()"> 원</td>
				<th width="100">할 인</th>
				<td width="250"><input id="halin" type="text" name="halin" value="${pvo.halin}" oninput="this.value=this.value.replace(/[^0-9]/g,'').replace(/(\..*)\./g,'$1');" onkeyup="chong_pay()"> %</td>
				<th width="150">총 결제금액</th>
				<td><span id='chong' value="0">0원</span></td>
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