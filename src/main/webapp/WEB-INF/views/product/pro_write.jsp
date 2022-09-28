<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>

#product_code{
display: none;
} 
table tr td{
border:1px solid black;
}
table{
border-collapse: collapse;
}
</style>
<script>
function bunho()   //상품코드 1씩 증가 
{
	var dae=document.write_form.dae.value;
	var code="p"+dae;   //p01 outer
	//alert(code);
	var chk=new XMLHttpRequest();
	chk.open("get","getbunho?code="+code);
	chk.send();
	chk.onreadystatechange=function()
	{
		if(chk.readyState==4)
			{
			//alert(chk.responseText);
			//1증가 후 상품코드를 완성한후 텍스트 전달
			var bunho=parseInt(chk.responseText)+1;	
			//alert(bunho);
			bunho=bunho+"";
			if(bunho.length==1)
				{
				bunho="00"+bunho;
				}
			else if(bunho.length==2)
				{
				bunho="0"+bunho;
				}
			document.write_form.pcode.value=code+bunho;
			document.write_form.dcode.value=code;
			}
	}
}

function chong_pay()
{
	
	var price = Number(document.getElementById("price").value);
	var halin = Number(document.getElementById("halin").value);
	var baesong = Number(document.getElementById("baesong").value);
	var chong = Number(price*(1-halin/100)+baesong).toFixed(0).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	document.getElementById("chong").innerText=chong+"원";
}

</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>
	<form name="write_form" method="post" action="pro_write_ok" enctype="multipart/form-data">
		<table width="700" align="center">
		<caption><h1><b>상 품 등 록</b></h1></caption>
			<tr>
				<td>대표이미지</td>
				<td><input type="file" name="pimg"></td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td>
				<select name="dae" onchange="bunho()">
				<option>선택</option>
				  <c:forEach items="${list}" var="dvo">
				     <option value="${dvo.dcode}"> ${dvo.title }</option>
				   </c:forEach>
				</select> 
				</td>
			</tr>
			<tr id="product_code">
			<td>상품 코드</td>
			   <td>
			    <input type="text" name="pcode" readonly>
			    <input type="text" name="dcode" readonly>
			 <!--    <input type="button" onclick="bunho()" value="상품코드생성"> -->
			  </td>
			</tr>
			
			<tr>
				<td>제 목</td>
				<td><input type="text" name="title" size="50"></td>
			</tr>
			<tr>
			<td>옵션</td>
				<td id="option_td">		
				<p class="option">
				사이즈 : <input type="text" name="size" size="20"><p>
				색&nbsp;&nbsp;상 : <input class="option_d" type="text" name="color" size="20"><p>
				재&nbsp;&nbsp;고 : <input class="option_d" type="text" name="stock" size="20">
			<!--<input type="button" value="+" onclick="option_add()">
				<input type="button" value="-" onclick="option_del()">
				<input type="button" value="등록" onclick="scs()"> -->
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
				<td><input id="price" type="text" name="price" oninput="this.value=this.value.replace(/[^0-9]/g,'').replace(/(\..*)\./g,'$1');" onkeyup="chong_pay()">원</td>
			</tr>
			<tr>
				<td>할 인</td>
				<td><input id="halin" type="text" name="halin" oninput="this.value=this.value.replace(/[^0-9]/g,'').replace(/(\..*)\./g,'$1');" onkeyup="chong_pay()">%</td>
			</tr>
			<tr>
				<td>배송비</td>
				<td><input id="baesong" type="text" name="baesong" oninput="this.value=this.value.replace(/[^0-9]/g,'').replace(/(\..*)\./g,'$1');" onkeyup="chong_pay()">원</td>
			</tr>
			<tr>
				<td>총 결제금액</td>
				<td><span id='chong' value="0">0원</span></td>
			</tr>
			<tr>
			 <td colspan="2"><input type="submit" value="등록하기">
			 <a href="pro_list?pcode=p01"> 리스트 이동</a>
			 </td>

	</form>
</body>
</html>