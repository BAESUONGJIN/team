<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//Ddiv HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.ddiv">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>

section {
   width: 1200px;
   height: 100%;
   margin:auto;
   text-align: center;
   padding-top: 200px;/* 폼 자체 조정 */
}
section #ar1 { /* 이미지 및 상품 설명 */
  width:1200px;
  height:700px;
  margin:auto;
  z-index: 3;
}
section #ar1 #gumae
{
display: inline-block;
width:400px;
margin-top: 10px;
}
section #ar1 .gumae_m
{
margin-left: 30px;

}
section #ar1 .gumae_m:first-child
{
margin-left: 0px;
}

section #ar1 #gumae_content
{
 display: none; 
width:400px;

}
section #ar1 #gumae_content_r
{
line-height: 45px;
}

section #ar1 #hla
{
font-size:7px;
display: inline-block;
color:white;
-webkit-animation:hh 1s infinite;
margin-left: 10px;
}

@-webkit-keyframes hh
{
from{top:0px;}
to {top 0px; color:red;}
}


section #ar2{ /* 상세페이지 */
  width:1200px;
  height: 100px;
}


section #ar2 div
{
border-radius: 20px;
display: inline-block;
width:250px;
height: 70px;
text-align: center;
padding-top: 20px;
font-size: 20px;
/*  background: linear-gradient(to top, #f6eae9 30%, transparent 80%);  */
-webkit-animation:cc 1s	infinite;
}

@-webkit-keyframes cc {
  from {top: 0px;}
  to {top: 200px; background:linear-gradient(to top, #f6eae9 30%, transparent 80%);}
}


section #ar3{ /* 상품평 */
margin-top: 20px;
}
section #ar3 .mt
{
text-align: left;
margin-left:130px;
width:110px;
background: linear-gradient(to top, #f6eae9 30%, transparent 80%);
}

section #ar4{ /* 상품문의 */
margin-top: 20px;
}
section #ar4 .mt
{
text-align: left;
margin-left:130px;
width:150px;
background: linear-gradient(to top, #f6eae9 30%, transparent 80%);
}

section #ar5{ /* 상세페이지 */
margin-top: 20px;
}

section  #ar5 .mt
{
text-align: left;
margin-left: 130px;
width:300px;
background: linear-gradient(to top, #f6eae9 30%, transparent 80%);
}

section #ar5 .mt2
{
width:100px;
 text-align:left;
 margin-left:130px;
 background: linear-gradient(to top, #f6eae9 30%, transparent 80%);
}

section #ar5 table tr{
border: 1px solid black;
font-size: 13px;
}
section #ar5 .ar5_c1
{
text-align: center;
width: 120px;
border: 1px solid black;
border-top: none;
border-left: none;
border-bottom: none;
background: #F3F3F3;
}
section #ar5 .ar5_c2
{
text-align: left;
margin-left: 10px;
}


 section #review_tb td
{
border: 1px solid black;
border-left: none;
border-right: none;
border-top-color:#CCA39B;
border-bottom-color:#CCA39B
}
 
section #inquiry_tb td
{
border: 1px solid black;
border-left: none;
border-right: none;
border-top-color:#CCA39B;
border-bottom-color:#CCA39B
}

.incontent{
display: none;
}


.ask
{
	/* display: none; */
	background: #f6eae9;
}
.icontent, .ask
{
display: none;
}

.answer_chk{
 color: blue;
 text-decoration: none;
 transition: 0.5s;
}
.answer_chk:hover { text-shadow: 0 0 .2em, 0 0 .3em; }
}


    /* 퀵 메뉴 */
    div, ul, li {
    -webkit-box-sizing: border-box;-moz-box-sizing: border-box;box-sizing: border-box;padding:0;margin:0
    }
    a {
    text-decoration:none;
    }

.quickmenu {position:absolute;width:100px; height:300px;  top:50%;margin-top:-20px;right:10px; }
.quickmenu ul {position:relative;float:left;width:100%; /* display:block; display:none; */ /* border:1px solid #ddd; */}
.quickmenu ul li {float:left;width:100%;/* border-bottom:1px solid #ddd; */text-align:center;display:inline-block;}
.quickmenu ul li a {position:relative;float:left;width:100%;height:20px;line-height:20px;/* text-align:center; */color:#999;font-size:7pt;}
.quickmenu ul li a:hover {color:#BDBDBD;}
.quickmenu ul li:last-child {border-bottom:0;}


</style>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet"
   href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script>
function check()
{
   
   var size=document.getElementById("size").value;
   var color=document.getElementById("color").value;
   var halin=${pvo.halin};
   var price=Number(${pvo.price}).toFixed(0).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
   var chong=Number(${pvo.price*(1-pvo.halin/100)}).toFixed(0).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
   
   if(color !=0)
   {
      if(size == 0){
         alert("사이즈를 선택해주세요")
         color.value=0;
      }
      else{
         
      if(halin == 0)
         {
         document.getElementById("gumae_size").innerText=size;
         document.getElementById("gumae_color").innerText=color;
         document.getElementById("gumae_price").innerText=price+"원";
         document.getElementById("gumae_chong").innerText=chong+"원";
         document.getElementById("gumae_content").style.display="block";
         }
      
      else
         {
         document.getElementById("gumae_size").innerText=size;
         document.getElementById("gumae_color").innerText=color;
         document.getElementById("gumae_price").innerText=price+"원";
         document.getElementById("gumae_halin").innerText=halin+"%";
         document.getElementById("gumae_chong").innerText=chong+"원"; 
         document.getElementById("gumae_content").style.display="block";
         }
      }
      //document.getElementById("size").value=0; 복수구매시
      //document.getElementById("color").value=0;
   }
   
}  

// 상품평 내용을 작성 했는지 유효성 검사

function review_chk(re)
{
	if(re.content.value.trim().length==0)
		{
		alert("내용을 작성해주세요");
		return false;
		}
	else
		return true;
}

//상품문의 제목 및 타이틀 유효성 검사

function inquiry_chk(iq)
{
	if(iq.title.value.trim().length==0)
		{
		alert("제목을 입력해주세요");
		return false;
		}
	else if(iq.content.value.trim().length==0)
		{
		alert("내용을 입력해주세요");
		return false;
		}
	else
		return true;
	}

//수량 관련
   $(function()
   {
      $("#spinner").spinner(
      {
         min:1,
         max:100,
         spin:function(e,ui)
         {
            var chong=Number(${pvo.price*(1-pvo.halin/100)}*ui.value);
            chong=new Intl.NumberFormat().format(chong);
            document.getElementById("gumae_chong").innerText=chong+"원";
         }
      });
      $(".ititle").click(function()
    	{
    	  var index = $(".ititle").index(this);
    	  $(".icontent").eq(index).show();
    	  $(".ask").eq(index).show();
    	  $(".ask2").eq(index).show();
      });
      
      $(".ask").click(function()
    	{
    		var index = $(".ask").index(this);
    		$(".icontent").eq(index).hide();
    		$(".ask").eq(index).hide();
    		$(".ask2").eq(index).hide();
    	});	
   });
   

   function wish_add() //찜목록 저장
   {
   	if(confirm("찜목록에 상품을 추가할까요?"))
   	{
   		var su=document.buy.su.value;
   		var color=document.buy.color.value;
   		var size=document.buy.size.value;
   		var chk=new XMLHttpRequest();
       	
   		
   			if(document.buy.color.value !=0 && document.buy.size.value != 0)
   				{
   		
   				chk.onload=function()
       			{
       		
       				if(chk.responseText=="0")
       				{	
       					alert("찜목록 추가");
       					
       				}
       					
       				else
       					alert("오류");
     			  	 }	
   				
   			 	chk.open("get","wish_add?pcode=${pvo.pcode}&su="+su+"&color="+color+"&size="+size);
   	        	chk.send();
   	        	
   	        	window.location.reload();
   	        	
       	         }
   			
   			 
   			else 
   				{
   				alert("사이즈 및 색상을 선택해주세요.");
   				return false;
   				}
   		}
   	
   	
   }
       
       
   function cart_add() //장바구니목록 저장
   {
   	if(confirm("장바구니목록에 상품을 추가할까요?"))
   	{
   		var su=document.buy.su.value;
   		var color=document.buy.color.value;
   		var size=document.buy.size.value;
   		var chk=new XMLHttpRequest();
       	
   			if(document.buy.color.value !=0 && document.buy.size.value != 0)
   				{
   		
   				chk.onload=function()
       			{
       		
       				if(chk.responseText=="0")
       					alert("장바구니목록 추가");
       				else
       					alert("오류");
     			  	 }	
   				
   			 	chk.open("get","cart_add?pcode=${pvo.pcode}&su="+su+"&color="+color+"&size="+size);
   	        	chk.send();
   	        	
   	        	
       	        }
   			
   			 
   			else 
   				{
   				alert("사이즈 및 색상을 선택해주세요.");
   				return false;
   				}
   		}
   	
   	
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
   <section>
   <form name="buy" method="post" action="../page/buy">
    <input type="hidden" name="pcode" value="${pvo.pcode}">
   <input type="hidden" name="gchk" value="0"> <!-- 콘텐츠에서 구매로가는지 카트에서 구매로가는지 -->
 <!-- 퀵 메뉴  -->
 <div class="quickmenu">
  <ul>
    <li> <i class="fa-solid fa-angles-up" style="cursor: pointer; color: #616161;" onclick="window.scrollTo(0,0);"> </i></li><br> <br>
    <li> <a href="../page/cart"> <i class="fa-solid fa-cart-shopping fa-3x" style="color: #616161;"></i></a></li> <br> <br>
    <li> <a href="../page/wish"> <i class="fa-regular fa-heart fa-3x" style="color: #616161;"></i> </a></li> <br> <br>
    <li> <a href="../faq/faq_list"><i class="fa-regular fa-face-smile fa-3x" style="color: #616161;"></i></a> </li> <br> <br>

  </ul>
 </div>

 <article id="ar1"> <!-- 상품사진 및 설명 -->

<!-- 좌측   -->
   
<div id="img" style="width:450px; height:531px; float:left;">
      <img src="../resources/img/${pvo.pimg}" width="600" height="550" >
</div>

<!-- 우측  -->
   <div id="content" style="width:500px; height:500px; float:right; margin-left:15px; text-align:left;">
      <c:if test="${pvo.halin != 0 }">
      <div id="title" style="font-weight: bold;">${pvo.title}<span id="hla">세일행사</span></div> 
      </c:if>
      <c:if test="${pvo.halin ==0 }">
       <div id="title" style="font-weight: bold;">${pvo.title}</div> 
      </c:if>
      <br>
      <div id="gumae_content_r">
      <c:if test="${pvo.halin == 0 }"> <!-- 할인 안하는 상품 -->
        
         <div>
            <fmt:formatNumber value="${pvo.price }" />원</div>
      </c:if>

      <c:if test="${pvo.halin !=0 }"> <!--할인 하는 상품 -->
         <div>PRICE:&nbsp;&nbsp;&nbsp;&nbsp;<s><fmt:formatNumber value="${pvo.price}"/></s><b><span style="color:#C72F7A;margin-left:10px;">${pvo.halin}%</span></b></div>
         <div>HALIN:&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatNumber value="${pvo.price*(1-pvo.halin/100)}" />원</div>
      </c:if>
  <span> SIZE &nbsp;&nbsp;&nbsp;</span>
      <select id="size" name="size" onchange="check()">
         <option value="0">-[필수] 옵션을 선택해 주세요-</option>
         <c:forEach items="${pvo.size}" var="i">
            <option value="${i}">${i}</option>
         </c:forEach>
      </select>
      <br>
     <span> COLOR </span>   
      <select id="color" name="color" onchange="check()">
         <option value="0"> -[필수] 옵션을 선택해 주세요- </option>
         <c:forEach items="${pvo.color}" var="j">
            <option value="${j}">${j}</option>
         </c:forEach>
      </select>
      <br>
               <div id="gumae">
                  <span class="gumae_m" style="text-align:left">SIZE</span>
                  <span class="gumae_m">COLOR</span>
                  <span class="gumae_m">PRICE </span>
                  <c:if test="${pvo.halin != 0}">   <!-- 할인 있는 경우 추가 -->
                  <span class="gumae_m">HALIN</span>
                  </c:if>
                   <span class="gumae_m">QUANTITY</span>
               </div>
                  
               <div id="gumae_content">
                  <span id="gumae_size" class="gumae_m"></span>
                  <span id="gumae_color" class="gumae_m"></span>
                  <span id="gumae_price" class="gumae_m"></span>
                  <c:if test="${pvo.halin != 0}"><!-- 할인 있을 경우 추가 -->
                  <span id="gumae_halin" class="gumae_m"></span>
                  </c:if>
                  <span id="gumae_su" class="gumae_m"> <input type="text" name="su" id="spinner" value="1" readonly size="1"></span>
               </div>
               <hr>
                <div>총 상품금액
              <b><span id="gumae_chong"></span></b> 
            </div>
            </div>
            <style>
            #gumae_chong{
            margin-left: 180px;
           	font-size: 17px;
           	color: #C72F7A;
            }
            </style>
        <div>
         <!-- 즉구 -->
        <input type="submit" value="BUY IT NOW" style="width:350px;height:46px;background: #CCA39B;color:white;border: none;">
                                                <!-- 찜 -->
	    <c:if test="${userid != null}"> 
	     <c:if test="${wishcnt == 0}">
          <span class="btn" onclick="wish_add()" style="margin-left:15px;"><img src="../resources/simg/heart.png" width="30" height="30" id="sss"> </span>
         </c:if>
         <c:if test="${wishcnt == 1}">
          <span class="btn" onclick="location='wish_cancel?pcode=${pvo.pcode}'"> <img src="../resources/simg/heart2.png" width="30" height="30"> </span>
         </c:if>
        </c:if>
                
        <c:if test="${userid == null}"> 
          <span class="btn" onclick="alert('로그인 하세요')"> <img src="../resources/simg/heart.png" width="30" height="30"> </span> 
        </c:if>  

      <!-- 찜 -->
      
      <!-- 장바구니 -->

		<c:if test="${userid != null}">
          <span class="btn" onclick="cart_add()"> <img src="../resources/simg/cart.png" width="30" height="30"> </span>
        </c:if>
        <c:if test="${userid == null}"> 
          <span class="btn" onclick="alert('로그인을 하세요')"> <img src="../resources/simg/cart.png" width="30" height="30"> </span> 
        </c:if> 
     </div> 
	
      <!-- 장바구니 -->

      <!-- 즉시구매 -->
     
   
   </form>      
            
</article>

<article id="ar2"> <!-- 상세페이지 -->
				
                  <div><a href="#cimg" style="color:black;">상세이미지</a></div>              
                  <div><a href="#ar3" style="color:black;">상품평</a></div>               
                  <div><a href="#ar4" style="color:black;">상품문의</a></div>               
                  <div><a href="#ar5" style="color:black;">배송/교환/반품 안내</a></div>      
</article>
            <div id="cimg"><img src="../resources/img/${pvo.cimg}" width="1000" height="1200"></div>  <!-- 상세페이지 이미지 -->
<article id="ar3">       
          
                <div class="mt"><h2><b>상품평</b></h2></div> 
               <table id="review_tb" width="950" align="center">
                <tr style="background:rgba(164, 48, 35, 0.1);color:black;">
                 <td>아이디</td>
                 <td>한줄평</td>
                 <td>작성일</td>
                </tr>
            <c:forEach items="${rlist}" var="rvo">
               <tr>  <!-- 상품평 -->
                 <td>${rvo.userid}</td>
                 <td>${rvo.content}</td>
                 <td>${rvo.writeday}</td>
               </tr>
            </c:forEach>
              </table>

</article>

<article id="ar4">
            <!--상품문의 리스트  -->
             <div class="mt"><h2><b>상품문의</b></h2></div> 
            <table id="inquiry_tb" width="950" align="center">
           <tr style="background:rgba(164, 48, 35, 0.1);color:black;">
     	    <td>답변 여부</td>
     	    <td>아이디</td>
          	<td>제 목</td>
          	<td>작성일</td>
           </tr>
           
            <c:forEach items="${ilist}" var="ivo">
            <c:if test="${ivo.cnt == 1}">
                  <tr>
                   <td class="answer_chk">답변완료</td>
                   <td>${ivo.userid}</td>
                   <td id ="ititle" class="ititle">${ivo.title}</td>
                   <td>${ivo.writeday}</td>
                  </tr>
                  
                  <tr id="icontent" class="icontent">
                  	<td>문의 내용</td>
                  	<td colspan="3">${ivo.content}</td>
                  </tr>
                 
               	<tr id="ask" class="ask">
					<td>답 변 </td>               	
					<td>관리자</td>       
					<td colspan="2">${ivo.content1} </td>       
               	</tr>
               	  </c:if>
            </c:forEach>
           
            
             
             <c:forEach items="${ilist}" var="ivo">
              <c:if test="${ivo.cnt ==0 }">
                 <tr>
                   <td class="answer_nchk">문의 확인중</td>
                   <td>${ivo.userid}</td>
                   <td id ="ititle" class="ititle">${ivo.title}</td>
                   <td>${ivo.writeday}</td>
                  </tr>
                  
                  <tr id="icontent" class="icontent">
                  	<td>문의 내용</td>
                  	<td colspan="3">${ivo.content}</td>
                  </tr>
                 
               	<tr id="ask" class="ask">
					<td>답 변 </td>               	
					<td>관리자</td>       
					<td colspan="2">문의 확인중입니다.</td>       
               	</tr>
              </c:if>    
              </c:forEach>
            
            </table>
            <br>
          <form  id="inquiry_content" method="post" action="pro_inquiry_write_ok" onsubmit="return inquiry_chk(this)">
            <input type="hidden" name="pcode" value="${pvo.pcode}">
            <table width="900" align="center" id="inquiry_write">
               <tr>
           		<td>상품명</td>
                <td> <input type="text" name="title1" size="98" value="${pvo.title}" readonly></td>
          	   </tr>
			
               <tr>
                 <td>제 목</td>
                 <td><input type="text" name="title" size="98"></td>
               </tr>
               <tr>
            	<td>내 용</td>
                <td> <textarea class="cont" rows="6" cols="100" name="content"></textarea></td><p>
               </tr>
               <tr>
                 <td colspan="2"> <input type="submit" value="작성하기" style="width:200px;height:46px;background: #CCA39B;color:white;border: none;margin-top: 20px;"></td>
               </tr>
            </table>
          </form>
</article>

<article id="ar5">
            <div class="mt"><h2><b>배송/교환/반품 안내</b></h2></div>
           <div class="mt2"><h5>배송정책</h5></div>
            <table width="950" align="center">
           	 <tr>
         	  	<td class="ar5_c1">배송방법</td>
        	    <td class="ar5_c2">우체국 택배 1588-1300</td>
          	 </tr>
           	 <tr>
         	  	<td class="ar5_c1">배송지역</td>
        	    <td class="ar5_c2">전국지역</td>
          	 </tr>
           	 <tr>
         	  	<td class="ar5_c1">배송기간</td>
        	    <td class="ar5_c2">결제일로부터 1일-7일 (당사 출고일 기준 / 예약 하신 제품은 입고시 순차적으로 출고 됩니다.)<br>
					-총 결제 금액 5만원 이상구매 시 무료배송, 5만원 미만일 경우 배송비 2,500원이 추가됩니다.<br>
					-주문하신 상품은 입금 확인순으로 순차 배송되기 때문에 상품준비 기간이 소요되는 점 양해 부탁드립니다.<br>
					-결제하신 후 각종 변경사항은 고객센터 1661-2811로 연락주시기 바랍니다.<br>
					-주문하신 상품이 배송 준비 중이거나 이미 배송이 완료된 경우 주문취소가 불가합니다.<br>
					-주소가 정확하지 않거나 연락이 되지 않아 반송되어 오는 제품의 택배 이용은 고객님의 부담이니 꼭 정확한 주소와 연락처를 남겨 주세요.</td>
          	 </tr>
           	 <tr>
         	  	<td class="ar5_c1">고객센터</td>
        	    <td class="ar5_c2">1661-2811 (월~금 : 10:00 - 17:00 / 점심시간 : 12:30~13:30)</td>
          	 </tr>
           	 <tr>
         	  	<td class="ar5_c1">결제방법</td>
        	    <td class="ar5_c2">-무통장 입금의 경우 주문시 입력한 입금자명과 실제 입금자가 반드시 일치하여야 하며, 입금금액을 필히 확인해 주세요.<br>
					-(입금자와 주문자 / 입금금액과 주문금액이 일치하지 않는 경우에는 꼭 고객센터에 미리 알려주셔야 원활한 입금 확인이 가능합니다.)<br>
					-주문 후 2일 이내로 입금을 하여야 하며 입금자가 동일하지 않을 경우 꼭 고객센터에 알려주셔야 입금 확인 처리가 가능합니다.<br>
					-카드결제의 경우 상품 대금결제 후 부분취소를 원하실 경우 고객센터로 연	락을 해 주셔야 처리를 할 수 있습니다.</td>
          	 </tr>
            </table>
            <br>
           	 <div class="mt2"><h5>교환/반품</h5></div>
            <table width="950" align="center">
            <tr>
            	<td class="ar5_c1">교환 및 반품이 가능한 경우</td>
            	<td class="ar5_c2">-상품 수령일로부터 7일 이내 교환 및 반품처리 해드립니다. (단, 제품하자 및 오 배송 등의 사유는 30일 이내 교환 및 반품처리 해드립니다.)<br>
					(젝시믹스에 접수되지 않은 상태에서 고객님께서 임의로 발송한 제품이 분실되거나 훼손된 경우에는 젝시믹스에서 책임지지 않습니다.)<br>
					교환이나 반품시 반품요청을 해주시고, 교환.반품 내용을 적어 상품과 함께 보내주세요.<br>
					-(교환.반품 배송비 : 5,000원 / 교환.반품시 기재사항 : 교환/반품(환불)신청서)<br>
					교환시에는 왕복 택배비 5,000원을 계좌이체 해주신 후 착불로 보내주세요.<br>
					-배송비 입금 계좌 : KB국민 431801-01-213327 (주)브랜드엑스 코퍼레이션 *입금시 고객님 성함+핸드폰번호 뒷자리를 기입하여 입금 부탁드립니다.<br>
					상품 구매하시는 금액이 5만원 이상이실 경우 고객님들께 초기 택배비를 무료로 지원해 드리며, 상품 하자가 아닌 단순변심으로 인해 반품을 요청하실 경우 초기에 지원해 드렸던 택배비 2,500원이 추가 발생 되십니다.<br>
					-제품하자 / 오배송인 경우에는 젝시믹스에서 왕복 택배비를 부담하여 교환 및 반품처리 해드립니다.<br>
					-택배비를 동봉시 분실된 경우 당사에서 책임을 지지않습니다. 가급적 계좌입금을 권장드립니다.<br>
					-클라우드 매트는 일양 택배로 별도 배송되며, 왕복 택배비 10,000원을 고객님께서 부담해 주셔야 합니다.<br>
					-미성년자가 물품을 구매하는 경우, 법정대리인이 동의하지 않으면 미성년자 본인 또는 법정대리인이 구매를 취소 할 수 있습니다.</td>
            </tr>
            <tr>
            	<td class="ar5_c1">교환 및 반품 접수방법</td>
            	<td class="ar5_c2">-고객센터 1661-2811 및 교환/반품 게시판으로 반품 접수 해주세요.<br>
					-카카오톡 플러스친구에서 간편하게 반품 접수 해주세요.<br>
					-상품은 손상되지 않게 포장해 주시고, 배송시 함께 보내드린 교환/반품(환불) 신청서를 기재해 주시면 더욱 정확하고 신속하게 도와드릴 수 있습니다.<br>
					-우체국 택배 1588-1300로 수거요청을 하시고 받으셨던 상품 그대로 포장하여 착불로 보내주시면 됩니다.<br>
					타택배로 보내주실땐 선불로 보내주셔야 하며, 착불로 발송시 추가 배송비가 발생됩니다.<br>
					타택배 접수시 교환 및 반품주소 : 경기도 의정부시 산단로98번길 65 3층 젝시믹스<br></td>
            </tr>
            <tr>
            	<td class="ar5_c1">교환 및 반품이 불가한 경우</td>
            	<td class="ar5_c2">-교환/반품(환불) 기간이 경과된 경우
					-고객이 상품을 사용하거나 고객의 책임 있는 사유로 상품이 훼손된 경우 (ex. 착용 또는 세탁 흔적, 이염, 화장품 또는 향수 냄새)<br>
					-고객이 상품의 라벨을 제거하거나, 구성품을 훼손 또는 분실하여 재판매가 곤란하거나 상품의 가치가 감소한 경우<br>
					-시간의 경과로 인하여 다시 판매하기 곤란할 정도로 상품의 가치가 현저히 감소한 경우<br>
					-코스메틱(화장품)의 경우 제품 특성상 개봉 후 교환, 반품이 불가합니다.<br>
					-이너웨어(속옷) 제품의 경우 착용시 이염 되거나 제품의 변형이 발생할 수 있으며, 이 경우 교환, 반품이 불가합니다.</td>
            </tr>
            <tr>
            	<td class="ar5_c1">환불 및 환불 지연에 따른 배상</td>
            	<td class="ar5_c2">-[대금 환불 방법] 마이페이지 내 주문내역을 통하여 환불 신청 및 확인이 가능하며, 결제 수단에 따라 환불이 진행됩니다.<br>
					-[환불 지연에 따른 배상금 지급] 환불을 지연한 때에는 그 지연기간에 대하여 「전자상거래 등에서의 소비자보호에 관한 법률 시행령」 제21조의 3에서 <br>
					정하는 지연이자율을 곱하여 산정한 지연이자를 지급합니다. 이에 대한 신청은 고객센터를 통해서 가능합니다.</td>
            </tr>
            <tr>
            	<td class="ar5_c1">기타사항</td>
            	<td class="ar5_c2">-거래에 관한 약관의 내용은 사이트 하단의 약관을 참고해주세요.<br>
					-젝시믹스는 고객이 제기하는 정당한 의견이나 불만을 반영하고, 그 피해를 보상처리 하기 위하여 노력하고 있습니다.<br>
					불만, 피해보상 요청 등의 접수는 1:1 문의게시판 및 마이페이지를 통해 가능합니다.<br>
					-전자상거래 분쟁과 관련하여 고객의 피해구제신청이 있는 경우에는 공정거래위원회 또는 시ㆍ도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다.<br>	
            	</td>
            </tr>
            </table>
            
</article>
      </section>
</body>
</html>