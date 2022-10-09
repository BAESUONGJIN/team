<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#main2 {
		width: 100%;
		height: 500px;
		margin-left: 200px;
	}
	
	#main2 #sub {
		width: 100%;
		height: 500px;
		padding-left: 0px;
		margin-top: 0px;
	}
		
	#main2 #sub li {
		list-style-type: none;
		display: inline-block;
	}
	
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
$(function()
		  {
			  // 슬라이드 그림 움직이기
			  function mainmove()
			  {
			    ss=setInterval(function()
			    {
			    	$("#main2 #sub").animate(
		 		    {
		 		    	marginLeft:"-1600px"
		 		    },2000,function()
		 		           {
		 		    	      
		 		    	       $("#main2 #sub li").eq(0).insertAfter($("#main2 #sub li").eq(4));
		 		    	      $("#main2 #sub").css("margin-left","0px");
		 		           });
			    },2000);
			  }
			  mainmove();
			  
			  $("#image #outer").mouseover(function()
			  {
				  clearInterval(ss);
			  });
			  $("#image #outer").mouseout(function()
			  {
				  mainmove();
			  });
		  });
</script>
</head>
<body>
	<div id="main">
		<ul id="sub">
			<li><img src="../resources/main/pic6.png" width="100%" height="500"></li>
         	<li><img src="../resources/main/pic5.png" width="100%" height="500"></li>
          	<li><img src="../resources/main/pic4.png" width="100%" height="500"></li>
          	<li><img src="../resources/main/pic3.png" width="100%" height="500"></li>
          	<li><img src="../resources/main/pic2.png" width="100%" height="500"></li>
        
		</ul>
	</div>
</body>
</html>