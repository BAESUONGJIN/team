<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

  <style>
*{margin: 0; padding: 0;}

#header{
  width: 100%; 
  height:100px; 
  font-size: 11px; 
  line-height: 100px; 
  color:#fff; 
  background:#121212; 
  text-align: center;
}

#lnb.fixed{
  position: fixed;
  left: 0;
  top: 0;
  width: 100%;
}

#lnb ul{
  font-size:0;
  background: #ae8ae4;
}

#lnb li{
  
  display: inline-block;
  vertical-align: top;
  width: 25%;
  padding: 10px 0;
  font-size: 18px;
  font-weight:bold;
  text-align: center;
}

#container{
  width:100%;
  height:2000px;
  font-size:20px;
  background: #dcdcdc;
  text-align: center;
  font-weight:bold;
  padding-top:100px;
}
  </style>
  
<script src="http://code.jquery.com/jquery-latest.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script> 
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <script>
 $(function() {
	  var lnb = $("#lnb").offset().top;
	             /* id이름 */
	 
	  $(window).scroll(function() {
	   
	    var window = $(this).scrollTop();
	    
	    if(lnb <= window) {
	      $("#lnb").addClass("fixed");
	        
	    }else{
	      $("#lnb").removeClass("fixed");
	     
	    }
	  })
	});

 </script>

<body>
<div id="header">
   <h1>스크롤시 메뉴 고정하기</h1>
</div>

<div id="lnb">
  <ul>
    <li>메뉴1</li>
    <li>메뉴2</li>
    <li>메뉴3</li>
    <li>메뉴4</li>
  </ul>
</div>

<div id="container">
  <p>스크롤시 메뉴영역이 상단에 고정되어 노출됨</p>
  <p><br></p>
  <p>.</p>
  <p>.</p>
  <p>.</p>
  <p>.</p>
  <p>.</p>
  <p>.</p>
  <p>.</p>
  <p>.</p>
  <p>.</p>
  <p>.</p>
  <p>.</p>
  
</div>
</head>
</body>
</html>