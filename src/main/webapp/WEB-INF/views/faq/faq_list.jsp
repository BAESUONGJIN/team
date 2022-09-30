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
	
	.ask {
		display: none;
		background: #eaeaea;
	}
	
	.ask2 {
		display: none;
		background: #eaeaea;
	}
	
	a {
		text-decoration: none;
		color: gray;
	}
	
	#menu {
		padding-left: 50px;
	}
	
	#menu a:hover {
		color: red;
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
		padding: 10px;
		background: #eaeaea;
	}
	
	td {
		border-bottom: 1px solid gray;
		padding: 10px;
	}
	
	#paging {
		border: none;
	}
	
	#ans {
		text-align: center;
		border: none;
	}
	
	#ans2 {
		border: none;
	}
	
	#gubun {
		text-align: center;
	}
	
	#sub {
		color: black;
	}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function()
	{
		$(".question").click(function()
		{
			var index = $(".question").index(this);
			$(".ask").eq(index).show();
			$(".ask2").eq(index).show();
		});
		
		$(".ask").click(function()
		{
			var index = $(".ask").index(this);
			$(".ask").eq(index).hide();
			$(".ask2").eq(index).hide();
		});	
		
	});
	
</script>
</head>
<body>
<section>
	<h2 align="center" style="padding-botton:70px;"> FAQ </h2>
	<span id="menu">
		<a href="faq_list"> 전 체 </a>  |
		<a href="faq_list_etc?gubun=0"> 회원정보 </a>  |
		<a href="faq_list_etc?gubun=1"> 상품확인 </a>  |
		<a href="faq_list_etc?gubun=2"> 주문/결제 </a>  |
		<a href="faq_list_etc?gubun=3"> 배송 </a>  |
		<a href="faq_list_etc?gubun=4"> 교환/취소(반품) </a>  |
		<a href="faq_list_etc?gubun=5"> 서비스 </a>
	</span>
	<table width="900" align="center">
		<tr>
			<th width="170"> 구 분 </th>
			<th> 제 목 </th>
		</tr>
		
		<c:forEach items="${faq_list}" var="fvo">
		
		<tr class="question" id="question">
			<c:if test="${fvo.gubun == 0}">
				<c:set var="gubun" value="회원정보"/>
			</c:if>
			<c:if test="${fvo.gubun == 1 }">
				<c:set var="gubun" value="상품확인"/>
			</c:if>
			<c:if test="${fvo.gubun == 2 }">
				<c:set var="gubun" value="주문/결제"/>
			</c:if>
			<c:if test="${fvo.gubun == 3 }">
				<c:set var="gubun" value="배송"/>
			</c:if>
			<c:if test="${fvo.gubun == 4 }">
				<c:set var="gubun" value="교환/취소(반품)"/>
			</c:if>
			<c:if test="${fvo.gubun == 5 }">
				<c:set var="gubun" value="서비스"/>
			</c:if>
			
			<td id="gubun"> ${gubun} </td>
			<td> ${fvo.question} </td>
		</tr>
		
		<tr id="ask" class="ask">
			<td id="ans">  답 변 </td>
			<td id="ans2"> ${fvo.ask } </td>
		</tr>
		
		<c:if test="${userid == 'admin123' }" >
		<tr class="ask2">
			<td> </td>
			<td>
				<input type="button" value="수정" onclick="location='faq_update?id=${fvo.id}'"> 
				<input type="button" value="삭제" onclick="location='faq_delete?id=${fvo.id}'">
			</td>
		</tr>
		</c:if>
		
		</c:forEach> 
		
		<tr> <!-- 페이징 처리 -->
			<td colspan="3" align="center" id="paging">
			<c:if test="${pstart != 1}">
				<a href="faq_list?page=${pstart-1}" id="sub"> ◁◁ </a>
			</c:if>
			<c:if test="${pstart == 1}">
				◁◁
			</c:if>
			
			<c:if test="${page != 1}">
				<a href="faq_list?page=${page-1}" id="sub"> ◁ </a>
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
				
				<a href="faq_list?page=${i}" ${st} id="sub"> ${ i } </a>
			</c:forEach>
			
			<c:if test="${page != chong}">
				<a href="faq_list?page=${page+1}" id="sub"> ▷  </a>
			</c:if>
			<c:if test="${page == chong}">
				▷
			</c:if>
			
			<c:if test="${chong != pend}">
				<a href="faq_list?page=${pend+1}" id="sub"> ▷▷  </a>
			</c:if>
			<c:if test="${chong == pend}">
				▷▷
			</c:if>
			
			</td>
		</tr>
		</table>
		<c:if test="${userid == 'admin123' }" >
		<div> <input type="button" value="글작성" onclick="location='faq_write'"> </div>
		</c:if>
</section>
</body>
</html>