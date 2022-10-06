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
		background: #f6eae9;
	}
	
	.ask2 {
		display: none;
		background: #f6eae9;
	}
	
	.ask2 input[type=button] {
		width:70px;
      	height:35px;
      	border:1px solid gray;
      	border-radius: 10px;
      	background:gray;
      	color:white;
	}
	
	h2 #faq{
		margin-bottom: 30px;
		display: inline-block;
		width: auto;
		background: linear-gradient(to top, #f6eae9 30%, transparent 80%);
	}
	
	a {
		text-decoration: none;
		color: gray;
	}
	
	#menu a:hover {
		border: 2px groove gray;
		color: black;
	}
	
	#sub {
		border: 1px solid gray;
		border-radius: 10px;
		padding: 10px;
		margin-left: 10px;
		text-align: center;
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
		background: #f6eae9;
	}
	
	td {
		border-bottom: 1px solid gray;
		padding: 10px;
	}
	
	#paging {
		border: none;
		padding-top: 20px;
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
		border-top: 1px solid gray;
	}
	
	#question {
		border-top: 1px solid gray;
	}
	
	#sub_paging {
		color: black;
	}
	
	#btn {
		float: right;
	}
	
	#btn input[type=button] {
      	width:100px;
      	height:35px;
      	border:1px solid gray;
      	border-radius: 10px;
      	background:gray;
      	color:white;
    }
</style>
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
	<h2 align="center"> <span id="faq"> FAQ </span> </h2> 
	<span id="menu">
		<c:if test="${faq_gubun == 0}">
			<c:set var="st" value="style='color:white; background: gray;'"/>
		</c:if>
		<c:if test="${faq_gubun == 1}">
			<c:set var="st1" value="style='color:white; background: gray;'"/>
		</c:if>
		<c:if test="${faq_gubun == 2}">
			<c:set var="st2" value="style='color:white; background: gray;'"/>
		</c:if>
		<c:if test="${faq_gubun == 3}">
			<c:set var="st3" value="style='color:white; background: gray;'"/>
		</c:if>
		<c:if test="${faq_gubun == 4}">
			<c:set var="st4" value="style='color:white; background: gray;'"/>
		</c:if>
		<c:if test="${faq_gubun == 5}">
			<c:set var="st5" value="style='color:white; background: gray;'"/>
		</c:if>
		<a href="faq_list" id="sub"> 전 체 </a>
		<a href="faq_list_etc?gubun=0" id="sub" ${st}> 입금/결제 </a>
		<a href="faq_list_etc?gubun=1" id="sub" ${st1}> 배송 </a>
		<a href="faq_list_etc?gubun=2" id="sub" ${st2}> 반품/교환 </a>
		<a href="faq_list_etc?gubun=3" id="sub" ${st3}> 주문 </a>
		<a href="faq_list_etc?gubun=4" id="sub" ${st4}> 사이트이용 </a>
		<a href="faq_list_etc?gubun=5" id="sub" ${st5}> 기타 </a>
	</span>
	<table width="900" align="center">
		<tr>
			<th width="170"> 구 분 </th>
			<th> 제 목 </th>
		</tr>
		
		<c:forEach items="${flist}" var="fvo">
		
		<tr class="question" id="question">
			<c:if test="${fvo.gubun == 0}">
				<c:set var="gubun" value="입금/결제"/>
			</c:if>
			<c:if test="${fvo.gubun == 1 }">
				<c:set var="gubun" value="배송"/>
			</c:if>
			<c:if test="${fvo.gubun == 2 }">
				<c:set var="gubun" value="반품/교환"/>
			</c:if>
			<c:if test="${fvo.gubun == 3 }">
				<c:set var="gubun" value="주문"/>
			</c:if>
			<c:if test="${fvo.gubun == 4 }">
				<c:set var="gubun" value="사이트이용"/>
			</c:if>
			<c:if test="${fvo.gubun == 5 }">
				<c:set var="gubun" value="기타"/>
			</c:if>
			
			<td id="gubun"> ${gubun} </td>
			<td id="question"> ${fvo.question} </td>
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
				<a href="faq_list_etc?gubun=${faq_gubun}&page=${pstart-1}" id="sub_paging"> ◁◁ </a>
			</c:if>
			<c:if test="${pstart == 1}">
				◁◁
			</c:if>
			
			<c:if test="${page != 1}">
				<a href="faq_list_etc?gubun=${faq_gubun}&page=${page-1}" id="sub_paging"> ◁ </a>
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
				
				<a href="faq_list_etc?gubun=${faq_gubun}&page=${i}" ${st } id="sub_paging"> ${ i } </a>
			</c:forEach>
			
			<c:if test="${page != chong}">
				<a href="faq_list_etc?gubun=${faq_gubun}&page=${page+1}" id="sub_paging"> ▷  </a>
			</c:if>
			<c:if test="${page == chong}">
				▷
			</c:if>
			
			<c:if test="${chong != pend}">
				<a href="faq_list_etc?gubun=${faq_gubun}&page=${pend+1}" id="sub_paging"> ▷▷  </a>
			</c:if>
			<c:if test="${chong == pend}">
				▷▷
			</c:if>
			
			<c:if test="${userid == 'admin123' }" >
				<span id="btn"> <input type="button" value="글작성" onclick="location='faq_write'"> </span>
			</c:if>
			
			</td>
		</tr>
		</table>
</section>
</body>
</html>