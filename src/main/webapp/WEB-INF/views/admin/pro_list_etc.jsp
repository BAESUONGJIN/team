<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		width: 180px;
		background: linear-gradient(to top, #f6eae9 30%, transparent 80%);
	}
	
	a {
		color: gray;
		text-decoration: none;
	}

	#list_menu a:hover {
		border: 2px groove gray;
		color: black;
	}
	
	#menu {
		border: 1px solid gray;
		border-radius: 10px;
		padding: 10px;
		margin-left: 10px;
		text-align: center;
	}
	
	#count {
		float: right;
		margin-right: 10px;
		font-weight: bold;
		color: gray;
	}
	
	table {
		margin-top: 30px;
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
	
	th:last-child {
		border-right: none;
	}
	
	td {
		border-bottom: 1px solid gray;
		padding: 10px;
		text-align: center;
	}
	
	#pro_title {
		text-align: left;
		padding-left: 20px;
	}
	#paging {
		border: none;
		padding-top: 20px;
	}
	
	#sub_paging {
		color: black;
	}
	
	input[type=button] {
      	width:60px;
      	height:35px;
      	border:1px solid gray;
      	border-radius: 10px;
      	background:gray;
      	color:white;
    }
</style>
</head>
<body>
<section>
	<h2 align="center"> <span id="title"> 상 품 관 리 </span> </h2>
	<span id="list_menu">
		<c:if test="${pdae == 'p01' }">
			<c:set var="st" value="style='color:white; background: gray;'"/>
		</c:if>
		<c:if test="${pdae == 'p02' }">
			<c:set var="st1" value="style='color:white; background: gray;'"/>
		</c:if>
		<c:if test="${pdae == 'p03' }">
			<c:set var="st2" value="style='color:white; background: gray;'"/>
		</c:if>
		<c:if test="${pdae == 'p04' }">
			<c:set var="st3" value="style='color:white; background: gray;'"/>
		</c:if>
		<c:if test="${pdae == 'p05' }">
			<c:set var="st4" value="style='color:white; background: gray;'"/>
		</c:if>
		<a href="pro_list" id="menu"> ALL </a>
		<a href="pro_list_etc?pdae=p01" id="menu" ${st}> OUTER </a>
		<a href="pro_list_etc?pdae=p02" id="menu" ${st1}> TOP </a>
		<a href="pro_list_etc?pdae=p03" id="menu" ${st2}> PANTS </a>
		<a href="pro_list_etc?pdae=p04" id="menu" ${st3}> SKIRT </a>
		<a href="pro_list_etc?pdae=p05" id="menu" ${st4}> DRESS </a>
	</span>
	<span id="count"> 총 ${pro_list_etc_count}개 </span>
	
	<table align="center">
		<tr height="60">
			<th width="100"> 코드번호 </th>
			<th width="60"> 이미지 </th>
			<th width="550"> 상품명 </th>
			<th width="80"> 가격 </th>
			<th width="130"> 등록일 </th>
			<th> 삭제 </th>
		</tr>
		
		<c:forEach items="${plist}" var="pvo">
		<tr>
			<td> ${pvo.pcode} </td>
			<td> <img src="../resources/img/${pvo.pimg}" width="60" height="60"> </td>
			<td onclick="location='pro_update?id=${pvo.id}'"> ${pvo.title} </td>
			<td> <fmt:formatNumber value="${pvo.price}" pattern="#,###"/> </td>
			<td> ${pvo.writeday} </td>
			<td> <input type="button" value="삭제" onclick="location='pro_delete?id=${pvo.id}'"> </td>
		</tr>
		</c:forEach>
		
		<tr> <!-- 페이징 처리 -->
			<td colspan="6" align="center" id="paging">
			<c:if test="${pstart != 1}">
				<a href="pro_list_etc?pdae=${pdae}&page=${pstart-1}" id="sub_paging"> ◁◁ </a>
			</c:if>
			<c:if test="${pstart == 1}">
				◁◁
			</c:if>
			
			<c:if test="${page != 1}">
				<a href="pro_list_etc?pdae=${pdae}&page=${page-1}" id="sub_paging"> ◁ </a>
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
				
				<a href="pro_list_etc?pdae=${pdae}&page=${i}" ${st} id="sub_paging"> ${ i } </a>
			</c:forEach>
			
			<c:if test="${page != chong}">
				<a href="pro_list_etc?pdae=${pdae}&page=${page+1}" id="sub_paging"> ▷  </a>
			</c:if>
			<c:if test="${page == chong}">
				▷
			</c:if>
			
			<c:if test="${chong != pend}">
				<a href="pro_list_etc?pdae=${pdae}&page=${pend+1}" id="sub_paging"> ▷▷  </a>
			</c:if>
			<c:if test="${chong == pend}">
				▷▷
			</c:if>
			
			</td>
	</table>
</section>

</body>
</html>