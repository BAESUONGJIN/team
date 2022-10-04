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
	
	h2 #title {
		margin-bottom: 30px;
		display: inline-block;
		width: 180px;
		background: linear-gradient(to top, #f6eae9 30%, transparent 80%);
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
		border-right: 1px solid gray;
		padding: 15px 10px 15px 10px;
		background: #f6eae9;		
	}
	
	th:last-child {
		border-right: none;
	}
	
	td {
		border-bottom: 1px solid gray;
		padding: 15px 10px 15px 10px;
		text-align: center;
	}
	
	input[type=button] {
      	width:100px;
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
	<h2 align="center"> <span id="title"> 주 문 내 역 </span> </h2>
	<table align="center">
	<tr>
		<th width="150"> 구매자 아이디 </th>
		<th width="250"> 구매 상품(코드번호) </th>
		<th width="70"> 수량 </th>
		<th width="130"> 결제수단 </th>
		<th width="150"> 구입날짜 </th>
		<th width="130"> 상태 </th>
		<th> 상태변경 </th>
	</tr>
	
	<c:forEach items="${blist}" var="bvo">
	<tr>
		<td> ${bvo.userid} </td>
		<td> ${bvo.title}(${bvo.pcode}) </td>
		<td> ${bvo.su} </td>
		
		<c:if test="${bvo.sudan == 0}">
			<c:set var="sudan" value="계좌이체"/>
		</c:if>
		<c:if test="${bvo.sudan == 1}">
			<c:set var="sudan" value="신용/체크카드"/>
		</c:if>
		<c:if test="${bvo.sudan == 2}">
			<c:set var="sudan" value="휴대폰"/>
		</c:if>
		
		<td> ${sudan} </td>
		<td> ${bvo.writeday} </td>
		
		<c:if test="${bvo.state==0}">
         	<c:set var="state" value="결제완료"/>
        </c:if>
        <c:if test="${bvo.state==1}">
         	<c:set var="state" value="취소신청"/>
        </c:if>
        <c:if test="${bvo.state==2}">
         	<c:set var="state" value="취소완료"/>
        </c:if>
        <c:if test="${bvo.state==3}">
         	<c:set var="state" value="배송중"/>
        </c:if>
        <c:if test="${bvo.state==4}">
         	<c:set var="state" value="배송완료"/>
        </c:if>
        <c:if test="${bvo.state==5}">
         	<c:set var="state" value="반품신청"/>
        </c:if>
        <c:if test="${bvo.state==6}">
         	<c:set var="state" value="반품완료"/>
        </c:if>
        <c:if test="${bvo.state==7}">
         	<c:set var="state" value="교환신청"/>
        </c:if>
        <c:if test="${bvo.state==8}">
         	<c:set var="state" value="교환완료"/>
        </c:if>
        
        <td> ${state} </td>
        
        <td>
           <c:if test="${bvo.state==0}"> <!-- 결제완료 -->
            	<input type="button" value="배송중" onclick="location='change_state?id=${bvo.id}&state=3'">
           </c:if>
           <c:if test="${bvo.state==1}"> <!-- 취소신청 -->
            	<input type="button" value="취소완료" onclick="location='change_state?id=${bvo.id}&state=2'">
           </c:if>
           <c:if test="${bvo.state==3}"> <!-- 배송중 -->
            	<input type="button" value="배송완료" onclick="location='change_state?id=${bvo.id}&state=4'">
           </c:if>
           <c:if test="${bvo.state==5}"> <!-- 반품신청 -->
            	<input type="button" value="반품완료" onclick="location='change_state?id=${bvo.id}&state=6'">
           </c:if>
           <c:if test="${bvo.state==7}"> <!-- 교환신청 -->
            	<input type="button" value="교환완료" onclick="location='change_state?id=${bvo.id}&state=8'">
           </c:if>
         </td>
	</tr>
	</c:forEach>
	</table>
</section>
</body>
</html>