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
<script type="text/javascript">
	function search() {
		var tb = document.getElementById("TB_CORP_CD");
		var tbIndex = document.getElementById("TB_CORP_CD").options.selectedIndex;
		
		console.log("tb value : " + tb.options[tbIndex].value);
	}
</script>
</head>
<body>
<section>
	<form>
		<div>
			<select id="TB_CORP_CD">
				<option value="CJ">CJ대한통운</option>
				<option value="Lottee">롯데택배</option>
			</select>
			<input type="button" value="검색" onclick="search();">
		</div>
	</form>
</section>
</body>
</html>