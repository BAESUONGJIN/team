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
	border: 1px solid black;
}

/* #img,#content{
display: inline-block;
} */
#gumae_content
{
display: none;
}

#inquiry_content{
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
			document.getElementById("color").value=0;
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
		//document.getElementById("size").value=0; 복수구매시
		//document.getElementById("color").value=0;
	}
	
}	


function pro_inquiry_write()
{
	document.getElementById("inquiry_content").style.display="block";
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
	

	  function wish_add() //찜목록 저장
	    {
	    	if(confirm("찜목록에 상품을 추가할까요?"))
	    	{
	    		var chk=new XMLHttpRequest();
	        	chk.onload=function()
	        	{
	        		
	        		if(chk.responseText=="0")
	        			alert("찜목록 추가");
	        		else
	        			alert("오류");
	        	}
	        	chk.open("get","wish_add?pcode=${pvo.pcode}");
	        	chk.send();
	    	}	
	    	
	    	
	    }
	    
	    
	  function cart_add() //장바구니목록 저장
	    {
	    	if(confirm("장바구니목록에 상품을 추가할까요?"))
	    	{
	    		var su=document.buy.su.value;
	    		var color=document.buy.color.value;
	    		var size=document.buy.size.value;
	    		var chk=new XMLHttpRequest();
	        	
	    			if(document.buy.color.value !=0 && document.buy.size.value != 0)
	    				{
	    		
	    				chk.onload=function()
	        			{
	        		
	        				if(chk.responseText=="0")
	        					alert("장바구니목록 추가");
	        				else
	        					alert("오류");
	      			  	 }	
	    				
	    			 	chk.open("get","cart_add?pcode=${pvo.pcode}&su="+su+"&color="+color+"&size="+size);
	    	        	chk.send();
	        	         }
	    			
	    			 
	    			else 
	    				{
	    				alert("사이즈 및 색상을 선택해주세요.");
	    				return false;
	    				}
	    		}
	    	
	    	
	    	}	
	
</script>
</head>

<body>
	<section>
	<form name="buy" method="post" action="../page/buy">
    <input type="hidden" name="pcode" value="${pvo.pcode}">
	<input type="hidden" name="gchk" value="0"> <!-- 콘텐츠에서 구매로가는지 카트에서 구매로가는지 -->
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

		<select id="size" name="size" onchange="check()">
			<option value="0">선택</option>
			<c:forEach items="${pvo.size}" var="i">
				<option value="${i}">${i}</option>
			</c:forEach>
		</select> <select id="color" name="color" onchange="check()">
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
				
														<!-- 찜 -->
		<div>
	    <c:if test="${userid != null}"> 
          <span class="btn" onclick="wish_add()"> 찜 </span>
        </c:if>
         
        <c:if test="${userid == null}"> 
          <span class="btn" onclick="alert('로그인 하세요')"> 찜 </span> 
        </c:if>  
        
        <a href="../page/wish"> 찜목록 이미지 클릭시 이동</a>
		</div>
		
		<!-- 찜 -->
		
		<!-- 장바구니 -->
	 <div>
		<c:if test="${userid != null}">
          <span class="btn" onclick="cart_add()"> 장바구니 </span>
         </c:if>
         <c:if test="${userid == null}"> 
          <span class="btn" onclick="alert('로그인을 하세요')"> 장바구니 </span> 
         </c:if>  
         <a href="../page/cart"> 장바구니 이미지 클릭시 이동</a>
     </div>
		<!-- 장바구니 -->

		<!-- 즉시구매 -->

	<input type="submit" value="즉시구매">

	</form>		
				
				
				<div id="content_list">
						<span>상세페이지</span>					
						<span>상품문의</span>					
						<span>상품평</span>					
						<span>배송/교환/반품 안내</span>		
						</div>	
		
			
				<div><img src="../resources/img/${pvo.cimg}" width="1000" height="1200"></div>  <!-- 상세페이지 이미지 -->
							
					<div><h1><b>상 품 평</b></h1></div>
				<c:forEach items="${rlist}" var="rvo">
				<div id="pro_review_list"> <!-- 상품평 -->
					<span>${rvo.userid}</span>
					<span>${rvo.content}</span>
					<span>${rvo.writeday}</span>
				</div>
				</c:forEach>
					
				<form method="post" action="pro_review_write_ok">
				<input type="hidden" name="pcode" value="${pvo.pcode}">
					<tr>
						<td><textarea rows="6" cols="100" name="content"></textarea></td>
						<td><input type="submit" value="등록하기"></td>
					</tr>
				</form>
				
				<!--상품문의 리스트  -->
				<span><h1><b>상 품 문 의</b></h1></span>  
				<span onclick="pro_inquiry_write()">문의 작성</span>
				<c:forEach items="${ilist }" var="ivo">
					<div id="pro_inquiry_list">
						<span>${ivo.userid}</span>
						<span>${ivo.content}</span>
						<span>${ivo.writeday}</span>
					</div>
				</c:forEach>
				
				<form  id="inquiry_content" method="post" action="pro_inquiry_write_ok">
				<input type="hidden" name="pcode" value="${pvo.pcode}">
				<tr>
					<td><textarea rows="6" cols="100" name="content"></textarea></td>
				</tr>
				<tr>
					<td><input type="submit" value="작성하기"></td>
				</tr>
				</form>
				
				<div><h1><b>배송/교환/반품 안내</b></h1></div>
		<section>
</body>
</html>