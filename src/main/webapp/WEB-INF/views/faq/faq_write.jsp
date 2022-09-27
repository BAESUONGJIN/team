<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 흠 -->
<style>
	section {
		width: 1000px;
		height: auto;
		margin: auto;
		margin-top: 40px;
		margin-bottom: 40px;
		padding-top: 120px;
	}
</style>
</head>
<body>
<section>
<form method="post" action="faq_write_ok">
<table width="600" align="center">
	<tr>
		<td colspan="2">
		<select name="gubun">
			<option value="0"> 회원정보 </option>
			<option value="1"> 상품확인 </option>
			<option value="2"> 주문/결제 </option>
			<option value="3"> 배송 </option>
			<option value="4"> 교환/취소(반품) </option>
			<option value="5"> 서비스 </option>
		</select>
		</td>
	</tr>
	
	<tr>
		<td> 질 문 </td>
		<td> <input type="text" name="question"> </td>
	</tr>
	
	<tr>
		<td> 답 변 </td>
		<td> <textarea rows="6" cols="40" name="ask"></textarea> </td>
	</tr>
	
	<tr>
		<td colspan="2"> <input type="submit" value="저장"> </td>
	</tr>
</table>
</form>
</section>
</body>
</html>