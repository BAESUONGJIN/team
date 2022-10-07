<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<head>
<script src="https://kit.fontawesome.com/c96178233f.js" crossorigin="anonymous"></script> <!-- font -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
@import url('https://fonts.googleapis.com/css2?family=Song+Myung&display=swap');
/* 검색창 만들기 끝 */
#image {
    width: 100%;
    height: 500px;
    background: white;
    margin-top: 105px;
}

#image #outer {
    width: 100%;
    height: 500px;
    overflow: hidden;
    z-index: 8;
}

#image #inner {
    width: 100%;
    height: 500px;
}

section {
    /* section 기본  */
    width: 1400px;
    height: 100%;
    margin: auto;
    text-align: center;
}

section #ar2 {
    /* 사분할 BEST ITEM | NEW ITEM | ACC | REVIEW EVENT */
    width: 100%;
    height: 300px;
    margin-top: 30px;
    background: white;
}

.scroll-image {
    margin-top: 30px;
    display: inline-block;
    justify-content: center;
    padding: 20px;
    margin-left: 10px;
}

section #ar3 {
    /* 사진 3장씩 */
    height: 1000px;
    background: white;
    margin-top: 200px;
    text-align: center;
    margin-left: 60px;
}

section #ar3 a {
    text-decoration: none;
    color: #555555;
    text-align: center;
}


section #ar4 {
    /* 사진 3장씩 */
    height: 1200px;
    background: white;
    margin-top: 200px;
    text-align: center;
    margin-left: 60px;
}

section #ar4 a {
    text-decoration: none;
    color: #555555;
    text-align: center;
}

section div {
    margin-left: 30px;
}

h1 {
    /* 글자 hover */
    color: #000;
    display: inline-block;
    font-size: 15px;
    margin: 0;
    text-transform: uppercase;
}

h1:after {
    display: block;
    content: '';
    border-bottom: solid 3px #ea2129;
    transform: scaleX(0);
    transition: transform 250ms ease-in-out;
}

h1:hover:after {
    transform: scaleX(1);
}


/* 퀵 메뉴 */
div, ul, li {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
    padding: 0;
    margin: 0
}

a {
    text-decoration: none;
}

.quickmenu {
    position: absolute;
    width: 100px;
    height: 300px;
    top: 50%;
    margin-top: -20px;
    right: 10px;
}

.quickmenu ul {
    position: relative;
    float: left;
    width: 100%;
}

.quickmenu ul li {
    float: left;
    width: 100%;
    text-align: center;
    display: inline-block;
}

.quickmenu ul li a {
    position: relative;
    float: left;
    width: 100%;
    height: 20px;
    line-height: 20px;
    color: #999;
    font-size: 7pt;
}

.quickmenu ul li a:hover {
    color: #BDBDBD;
}

.quickmenu ul li:last-child {
    border-bottom: 0;
}

.content {
    position: relative;
    min-height: 1000px;
}

/* 이미지 hover */
.my_img {
    filter: brightness(1);
}

.my_img:hover {
    filter: brightness(0.5);
}
</style>

<script>
  $(function()
  {
	  // 슬라이드 그림 움직이기
	  function mainmove()
	  {
	    ss=setInterval(function()
	    {
	    	$("#image #inner").animate(
 		    {
 		    	marginLeft:"-1600px"
 		    },2000,function()
 		           {
 		    	       $("#image #inner").css("margin-left","0px");
 		    	       $("#image #inner img").eq(0).insertAfter($("#image #inner img").eq(4));
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
  
  /* 퀵메뉴 */
  $(document).ready(function(){
	  var currentPosition = parseInt($(".quickmenu").css("top"));
	  $(window).scroll(function() {
	    var position = $(window).scrollTop(); 
	    $(".quickmenu").stop().animate({"top":position+currentPosition+"px"},1000);
	  });
	}); 
  
</script>  
</head> 
    <div id="image"><!-- 그림슬라이드홈 -->
      <div id="outer">
        <div id="inner">
          <img src="../resources/main/pic6.png" width="100%" height="500"><img src="../resources/main/pic5.png" width="100%" height="500"><img src="../resources/main/pic4.png" width="100%" height="500"><img src="../resources/main/pic3.png" width="100%" height="500"><img src="../resources/main/pic2.png" width="100%" height="500">
        </div>
      </div>
    </div> 
 
    <section>           <!-- 현재페이지의 필요한 내용 -->  <!-- article는 section내의 하나의 항목 -->
    
    
      <article id="ar2"> 
        
 <!-- 퀵 메뉴  -->
 <div class="quickmenu">
  <ul>
    <li> <i class="fa-solid fa-angles-up " style="cursor: pointer; color: #616161;" onclick="window.scrollTo(0,0);"> </i></li><br> <br>
    <li> <a href="../page/cart"> <i class="fa-solid fa-cart-shopping fa-3x" style="color: #616161;"></i></a></li> <br> <br>
    <li> <a href="../page/wish"> <i class="fa-regular fa-heart fa-3x" style="color: #616161;"></i> </a></li> <br> <br>
    <li> <a href="../faq/faq_list"><i class="fa-regular fa-face-smile fa-3x" style="color: #616161;"></i></a> </li> <br> <br>
  </ul>
 </div>
 
 <!-- 움직이는 이미지  -->           
   <div class="scroll-image">
    <img src="../resources/main/best5.png" width="300" height="300" style="margin-right: 20px;">&nbsp;
    <img src="../resources/main/best2.png" width="300" height="300" style="margin-right: 20px;">&nbsp;
    <a href="../mypage/myreview"><img src="../resources/main/best7.png" width="300" height="300" style="margin-right: 20px;"></a>&nbsp;
    <a href="../gongji/list"><img src="../resources/main/best4.png" width="300" height="300" style="margin-right: 20px;"></a>&nbsp;
  </div>
      </article>
      
      
      <article id="ar3"> 
      <h1 class="fromcenter" style="font-size: 20px; font-weight: bolder; margin-bottom: 50px;cursor: pointer; "> BEST ITEM </h1> <p>
  <table align="center">
     		<tr>
			<c:forEach items="${list}" var="pvo">
				<td><a href="../product/pro_content?pcode=${pvo.pcode}">
				<div id="pimg"><img src="../resources/img/${pvo.pimg}" width="350" height="400" class="my_img"></div>
				<div id="title" style="font-weight: bold; ">${pvo.title }</div>
				<div id="price">
				 <c:if test="${pvo.halin ==0 }">   <!-- 할인 0인 경우 -->
				  <fmt:formatNumber value="${pvo.price}"/> 원
				 </c:if>
				 <c:if test="${pvo.halin != 0 }">   <!-- 할인 0이 아닌 경우 -->
				  <s><fmt:formatNumber value="${pvo.price}"/>원<br></s>
				  <b><fmt:formatNumber value="${pvo.price*(1-pvo.halin/100)+pvo.baesong}"/>원</b>
				 </c:if>
				</div></a>
				</td>
				<c:set var="i" value="${i+1 }"/>
				<c:if test="${i%3==0 }">  <!-- 3칸 후 다음줄로 이동 -->
				</tr>
				<tr>
				</c:if>
			</c:forEach>
		</tr> 
	</table>
      </article> <!-- 인기 상품 -->
      
      <article id="ar4"> 
      <h1 class="fromcenter" style="font-size: 20px; font-weight: bolder; margin-bottom: 50px;cursor: pointer;"> NEW ITEM </h1> <p>
  <table align="center">
     		<tr>
			<c:forEach items="${list2}" var="pvo">
				<td><a href="../product/pro_content?pcode=${pvo.pcode}">
				<div id="pimg"><img src="../resources/img/${pvo.pimg}" width="350" height="400" class="my_img" style="text-align: center;"></div>
				<div id="title">${pvo.title }</div>
				<div id="price">
				 <c:if test="${pvo.halin ==0 }">   <!-- 할인 0인 경우 -->
				  <fmt:formatNumber value="${pvo.price}"/> 원
				 </c:if>
				 <c:if test="${pvo.halin != 0 }">   <!-- 할인 0이 아닌 경우 -->
				  <s><fmt:formatNumber value="${pvo.price}"/>원<br></s>
				  <b><fmt:formatNumber value="${pvo.price*(1-pvo.halin/100)+pvo.baesong}"/>원</b>
				 </c:if>
				</div></a>
				</td>
				<c:set var="i" value="${i+1 }"/>
				<c:if test="${i%3==0 }">  <!-- 3칸 후 다음줄로 이동 -->
				<tr>
				</c:if>
			</c:forEach>
		</tr> 
	</table>
</article>

    </section>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
    </html>
  