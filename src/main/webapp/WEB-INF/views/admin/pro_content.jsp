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
		padding-top: 120px;
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

</script>

</head>

<body>
<section>
	<form name="write_form" method="post" action="pro_update" enctype="multipart/form-data">
	<input type="hidden" name="id" value="${pvo.id}">
		<h1 align="center"><b>상 품 수 정</b></h1>
		<table width="700" align="center">
		
		<tr>
				<td>대표이미지</td>
				<td><input type="file" name="pimg"></td>
			</tr>
			<tr>
				<td>카테고리</td>
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
				<td> ${dcode} </td>
			</tr>
			<tr>
			<td>상품 코드</td>
			   <td> ${pvo.pcode} </td>
			</tr>
			
			<tr>
				<td>제 목</td>
				<td><input type="text" name="title" size="50" value="${pvo.title}"></td>
			</tr>
			<tr>
			<td>옵션</td>
				<td id="option_td">		
				<p class="option">
				사이즈  <input type="text" name="size" size="5" value="${pvo.size}">
				색 상<input type="text" name="color" size="5" value="${pvo.color}">
				재고<input type="text" name="stock" size="5" value="${pvo.stock}">
				</td>
				</p>
			</tr>
			<tr>
				<td>상세페이지</td>
				<td>
				  <input type="file" name="cimg">
				</td>
			</tr>
			<tr>
				<td>가 격</td>
				<td><input id="price" type="text" name="price" value="${pvo.price}" oninput="this.value=this.value.replace(/[^0-9]/g,'').replace(/(\..*)\./g,'$1');" onkeyup="chong_pay()">원</td>
			</tr>
			<tr>
				<td>할 인</td>
				<td><input id="halin" type="text" name="halin" value="${pvo.halin}" oninput="this.value=this.value.replace(/[^0-9]/g,'').replace(/(\..*)\./g,'$1');" onkeyup="chong_pay()">%</td>
			</tr>
			<tr>
				<td>총 결제금액</td>
				<td><span id='chong' value="0">0원</span></td>
			</tr>
			<tr>
			 <td colspan="2"><input type="submit" value="수정하기"></td>
			</tr>

		</table>
	</form>
</section>
</body>
</html>