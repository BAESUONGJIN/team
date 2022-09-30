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
</head>
<body>
<section>
	<table width="1000" align="center">
	<tr>
		<td> 구매자 아이디 </td>
		<td> 구매 상품(코드번호) </td>
		<td> 수량 </td>
		<td> 결제수단 </td>
		<td> 구입날짜 </td>
		<td> 상태 </td>
		<td> 상태변경 </td>
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