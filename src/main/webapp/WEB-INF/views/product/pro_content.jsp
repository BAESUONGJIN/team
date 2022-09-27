<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//Ddiv HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.ddiv">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
section {
	width: 1200px;
	height: 1500px;
	margin-top: 150px;
	text-align: center;
}

/* #img,#content{
display: inline-block;
} */
#gumae_content
{
display: none;
}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script>
function check()
{
	
	var size=document.getElementById("size").value;
	var color=document.getElementById("color").value;
	var halin=${pvo.halin};
	var price=Number(${pvo.price}).toFixed(0).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	var chong=Number(${pvo.price*(1-pvo.halin/100)}).toFixed(0).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	
	if(color !=0)
	{
		if(size == 0){
			alert("사이즈를 선택해주세요")
			color.value=0;
		}
		else{
			
		if(halin == 0)
			{
			document.getElementById("gumae_size").innerText=size;
			document.getElementById("gumae_color").innerText=color;
			document.getElementById("gumae_price").innerText=price+"원";
			document.getElementById("gumae_chong").innerText=chong+"원";
			document.getElementById("gumae_content").style.display="block";
			}
		
		else
			{
			document.getElementById("gumae_size").innerText=size;
			document.getElementById("gumae_color").innerText=color;
			document.getElementById("gumae_price").innerText=price+"원";
			document.getElementById("gumae_halin").innerText=halin+"%";
			document.getElementById("gumae_chong").innerText=chong+"원"; 
			document.getElementById("gumae_content").style.display="block";
			}
		}
		document.getElementById("size").value=0;
		document.getElementById("color").value=0;
	}
	
}	

	$(function()
	{
		$("#spinner").spinner(
		{
			min:1,
			max:100,
			spin:function(e,ui)
			{
				var chong=Number(${pvo.price*(1-pvo.halin/100)}*ui.value);
				chong=new Intl.NumberFormat().format(chong);
				document.getElementById("gumae_chong").innerText=chong+"원";
			}
		});
	});
	
</script>
</head>

<body>
	<section>
	<div id="img">
		<img src="../resources/img/${pvo.pimg}" width="430" height="450">
	</div>
	<div id="content" align="center">
		<div id="title">${pvo.title}</div>
		
		<c:if test="${pvo.halin == 0 }"> <!-- 할인 안하는 상품 -->
			
			<div>
				<fmt:formatNumber value="${pvo.price }" />원</div>
		</c:if>

		<c:if test="${pvo.halin !=0 }"> <!--할인 하는 상품 -->
			<div><s><fmt:formatNumber value="${pvo.price}"/></s><span>${pvo.halin}</span>%</div>
			<div><fmt:formatNumber value="${pvo.price*(1-pvo.halin/100)}" />원</div>
		</c:if>

		<select id="size" onchange="check()">
			<option value="0">선택</option>
			<c:forEach items="${pvo.size}" var="i">
				<option value="${i}">${i}</option>
			</c:forEach>
		</select> <select id="color" onchange="check()">
			<option value="0">선택</option>
			<c:forEach items="${pvo.color}" var="j">
				<option value="${j}">${j}</option>
			</c:forEach>
		</select>
					<div id="gumae">
						<span>사이즈</<span>
						<span>색 상</<span>
						<span>금 액</<span>
						<c:if test="${pvo.halin != 0}">   <!-- 할인 있는 경우 추가 -->
						<span>할 인</<span>
						</c:if>
						<span>최종 금액</<span>
					</div>
						
					<div id="gumae_content">
						<span id="gumae_size"></span>
						<span id="gumae_color"></span>
						<span id="gumae_price"></span>
						<c:if test="${pvo.halin != 0}"><!-- 할인 있을 경우 추가 -->
						<span id="gumae_halin"></span>
						</c:if>
						<span id="gumae_su"> <input type="text" name="su" id="spinner" value="1" readonly></span>
						<span id="gumae_chong"></span>
					</div>
		</div>
		
							<div id="content_list">
						<span>상세페이지</span>					
						<span>상품문의</span>					
						<span>상품평</span>					
						<span>배송/교환/반품 안내</span>					
					</div>
					
				<div><img src="../resources/img/${pvo.cimg}" width="1000" height="1200"></div>  <!-- 상세페이지 이미지 -->
				<c:forEach items="${rlist}" var="rvo">
				<div id="pro_review_list"> <!-- 상품평 -->
					<span>${rvo.userid}</span>
					<span>${rvo.content}</span>
					<span>${rvo.writeday}</span>
				</div>
				</c:forEach>
				<form method="post" action="pro_review_write_ok">
					<tr>
						<td>상품평</td>
						<td><textarea rows="6" cols="100" name="content"></textarea></td>
						<td><input type="submit" value="등록하기"></td>
					</tr>
				</form>
				</div>  <!-- /상품평  -->
				<div>배송/교환/반품 안내</div>
				
		
		<section>
</body>
</html>