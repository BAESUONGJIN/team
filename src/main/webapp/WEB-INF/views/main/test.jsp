<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <style>
body {height:3000px;color:#fff;text-align:center; margin:0; padding:0;}
nav { width:100%;height:50px; background:blue;color:white; text-align:center;top:0;left:0;}
.all {display:flex; flex-flow: row wrap; min-width:280px;}
header {flex:1 1 100%; height:100px; background:blue;}
main {flex: 1 1 70%;height:500px; background:gray;}
aside{flex: 1 1 30%;height:500px;background:purple;}
footer{flex: 1 1 100%;height:100px;text-align:center;background:black;}
.fix {
  position:fixed;
  animation: down 0.5s ease
}

@keyframes down {
  0%{
    transform: translateY(-50px)
  }
  100%{
    transform: translateY(0px)
  }
}
 </style>
  <script src="http://code.jquery.com/jquery-latest.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script> 
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script>
  function navigo (){
	  const header = document.querySelector('header'); //헤더부분획득
	  const headerheight = header.clientHeight;//헤더높이
	document.addEventListener('scroll', onScroll, { passive: true });//스크롤 이벤트
	 function onScroll () {
	     const scrollposition = pageYOffset;//스크롤 위치
	   const nav = document.querySelector('nav');//네비게이션
	   if (headerheight<=scrollposition){//만약 헤더높이<=스크롤위치라면
	     nav.classList.add('fix')//fix클래스를 네비에 추가
	   }
	   else {//그 외의 경우
	     nav.classList.remove('fix');//fix클래스를 네비에서 제거
	   }
	 } 
	  
	}
	navigo()
  </script>
</head>
<body>
<nav>네비게이션 메뉴</nav>
<div class="all">
<header>대충 상단</header>
<main>대충 본문</main>
<aside>대충 사이드바</aside>
<footer>대충 푸터</footer>
</div>
</body>
</html>