<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <c:set var="size" value="${list.size()}"/>
 <c:if test="${size <=5}">
   <c:set var="he" value="600"/>
 </c:if>
 <c:if test="${size > 5}">
   <c:set var="he" value="${(size-5)*100+600}"/>
 </c:if>

 <style>
 @import url('https://fonts.googleapis.com/css2?family=Lora:ital@1&family=Roboto:wght@700&display=swap'); 
 
	section {
		width: 1000px;
		height: auto;
		margin: auto;
		margin-top: 40px;
		margin-bottom: 40px;
		padding-top: 120px;
	}

	section tr:first-child td {
     border-top:2px solid #cccccc;
     border-bottom:1px solid #cccccc;
     height:35px;
     background: rgba(164, 48, 35, 0.1);
     font-weight: bolder;
    
   }
   section tr td {
     border-bottom:1px solid #cccccc;
     padding: 10px;
   }
   
   section tr:last-child td {
     border-bottom:2px solid #cccccc;
   }
   section #del1 {
     width:24px;
     height:24px;
	 border:1px solid #b5b5b5;
	 color: #b5b5b5;
     font-weight:lighter;
     border-radius: 2px;
     cursor:pointer;
   }
   section #del2 {
      width:180px;
      height:35px;
      background-color:rgb(180, 180, 180);
      color:white;
      border-radius: 8px;
      border: none;
      font-size: 15px;
   }
   
<<<<<<< HEAD
    section #buy {
      width:180px;
      height:35px;
      background-color:#D1A69D;
      color:white;
      border-radius: 8px;
      border: none;
      font-size: 15px;    
    }
   
	h2 #hh2{
		margin-bottom: 30px;
		display: inline-block;
		width: auto;
		background: linear-gradient(to top, #f6eae9 30%, transparent 80%);
		font-family: 'Lora', serif;
		color: black;
	}
   
   
   }
=======
      /* 퀵 메뉴 */
    div, ul, li {
    -webkit-box-sizing: border-box;-moz-box-sizing: border-box;box-sizing: border-box;padding:0;margin:0
    }
    a {
    text-decoration:none;
    color:black;
    }

	.quickmenu {position:absolute;width:100px; height:300px;  top:50%;margin-top:-20px;right:10px; }
	.quickmenu ul {position:relative;float:left;width:100%; /* display:block; display:none; */ /* border:1px solid #ddd; */}
	.quickmenu ul li {float:left;width:100%;/* border-bottom:1px solid #ddd; */text-align:center;display:inline-block;}
	.quickmenu ul li a {position:relative;float:left;width:100%;height:20px;line-height:20px;/* text-align:center; */color:#999;font-size:7pt;}
	.quickmenu ul li a:hover {color:#BDBDBD;}
	.quickmenu ul li:last-child {border-bottom:0;}

>>>>>>> branch 'master' of https://github.com/BAESUONGJIN/team.git
 </style>
  <script src="http://code.jquery.com/jquery-latest.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script> 
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  
 <script>
   function maincheck(ck) //체크박스 선택부분
   {
	   
	   var len=document.getElementsByClassName("subchk").length;
	   if(ck) 
	   {  
		   for(i=0;i<len;i++)
		   {
			   document.getElementsByClassName("subchk")[i].checked=true;
		   }	   
	   }	 
	   else
	   {
		   for(i=0;i<len;i++)
		   {
			   document.getElementsByClassName("subchk")[i].checked=false;
		   }
	   }	    
   }
   function subcheck()  //체크박스 선택부분
   {
	   var chk=0;
	   
	   var len=document.getElementsByClassName("subchk").length;
	   
	   for(i=0;i<len;i++)
	   {
		   if(document.getElementsByClassName("subchk")[i].checked)
			   chk++;
	   }	
	   
	   if(chk==len)
	   {
		   document.getElementById("mainchk").checked=true;
	   }	
	   else
	   {
		   document.getElementById("mainchk").checked=false;
	   }	   
   }
   
   function cart_del() //장바구니 삭제
   {
	  
	   var len=document.getElementsByClassName("subchk").length;
	   var str="";
	   for(i=0;i<len;i++)
	   {
		   if(document.getElementsByClassName("subchk")[i].checked)
		      str=str+document.getElementsByClassName("subchk")[i].value+",";
	   }
	   
	   location="cart_del?delid="+str;   
   }
   function buy()
   {
	   var pcode="";
	   var su="";
	   var size="";
	   var color="";
	   
	   var subchk=document.getElementsByClassName("subchk");  
	   var len=subchk.length; 
	   
	   for(i=0;i<len;i++)
	   {
		   if(subchk[i].checked)
		   {
			   pcode=pcode+document.getElementsByClassName("pcode")[i].value+",";
			   su=su+document.getElementsByClassName("su")[i].value+",";
			   color=color+document.getElementsByClassName("color")[i].value+",";
			   size=size+document.getElementsByClassName("size")[i].value+",";
			   
		   }	   
	   }
	   location="../page/buy?gchk=2&pcode="+pcode+"&su="+su+"&size="+size+"&color="+color;
   }
   
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
<body>
 <!-- 퀵 메뉴  -->
 <div class="quickmenu">
  <ul>
    <li> <i class="fa-solid fa-angles-up" style="cursor: pointer; color: #616161;" onclick="window.scrollTo(0,0);"> </i></li><br> <br>
    <li> <a href="../page/cart"> <i class="fa-solid fa-cart-shopping fa-3x" style="color: #616161;"></i></a></li> <br> <br>
    <li> <a href="../page/wish"> <i class="fa-regular fa-heart fa-3x" style="color: #616161;"></i> </a></li> <br> <br>
    <li> <a href="../faq/faq_list"><i class="fa-regular fa-face-smile fa-3x" style="color: #616161;"></i></a> </li> <br> <br>

  </ul>
 </div>

   <section>
     
     <table width="1000" align="center">
       <caption style="caption-side:top"> <h2 align="center"> <span id="hh2"> CART </span> </h2> </caption>
       <tr align="center">
         <td> <input type="checkbox" onclick="maincheck(this.checked)" style="width:px;height:20px;" id="mainchk"> </td>
         <td> 상품이미지 </td>
         <td> 상품명 </td>
         <td> 색상 </td>
         <td> 사이즈 </td>
         <td> 상품가격 </td>
         <td> 수량 </td>
         <td> 날짜 </td>
         <td> 삭제 </td>
       </tr>       
     <c:forEach items="${list}" var="cvo">
       <input type="hidden" class="pcode" value="${cvo.pcode}">
       <input type="hidden" class="size" value="${cvo.size}">
       <input type="hidden" class="color" value="${cvo.color}">
       <input type="hidden" class="su" value="${cvo.su}">
       
       <tr align="center">
         <td> <input type="checkbox" class="subchk" onclick="subcheck()" value="${cvo.id}"> </td>
         <td> <a href="../product/pro_content?pcode=${cvo.pcode}"> <img src="../resources/img/${cvo.pimg}" width="70" height="70" style="border:1px solid #cccccc;padding:5px;"></a> </td>
         <td> <a href="../product/pro_content?pcode=${cvo.pcode}"> ${cvo.title} </a> </td>
         <td> ${cvo.color}</td>
         <td> ${cvo.size}</td>
         <td class="price"> <fmt:formatNumber value="${cvo.price*cvo.su}"/>원 </td>
         <td> ${cvo.su}</td>
         <td> ${cvo.writeday} </td>
         <td> <input type="button" id="del1" value="X" onclick="location='cart_del?delid=${cvo.id},'"> </td>
       </tr>
     </c:forEach>
     
     
       <tr height="80">
         <td colspan="9" align="center">
          <input type="button" id="del2" value="선택삭제" onclick="cart_del()"> 
          <input type="button" id="buy" value="선택구매" onclick="buy()">
         </td>
       </tr>
       
     </table>
   </section>
</body>
</html>
