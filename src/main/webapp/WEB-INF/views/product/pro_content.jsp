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
   /* border: 1px solid black; */
   text-align: center;
   padding-top: 200px;/* 폼 자체 조정 */
}

section #ar1 { /* 이미지 및 상품 설명 */
  width:1200px;
  height:700px;
  margin:auto;
  z-index: 3;
}

section #ar2{ /* 상세페이지 */
  width:1200px;
  height: 100px;
}
.incontent{
display: none;
}

#gumae_content
{
display: none;
}

#inquiry_content{
display: none;
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


function pro_inquiry_write()
{
   document.getElementById("inquiry_content").style.display="block";
   }

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
       					alert("찜목록 추가");
       				else
       					alert("오류");
     			  	 }	
   				
   			 	chk.open("get","wish_add?pcode=${pvo.pcode}&su="+su+"&color="+color+"&size="+size);
   	        	chk.send();
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
   <div id="content" style="width:500px; height:700px; float:right; margin-left:15px; text-align:left;">
      <div id="title" style="font-weight: bold;">${pvo.title}</div> <br>
      
      <c:if test="${pvo.halin == 0 }"> <!-- 할인 안하는 상품 -->
        
         <div>
            <fmt:formatNumber value="${pvo.price }" />원</div>
      </c:if>

      <c:if test="${pvo.halin !=0 }"> <!--할인 하는 상품 -->
         <div><s><fmt:formatNumber value="${pvo.price}"/></s><span>${pvo.halin}</span>%</div>
         <div><fmt:formatNumber value="${pvo.price*(1-pvo.halin/100)}" />원</div>
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
               <div id="gumae">
                  <span>사이즈</<span>
                  <span>색 상</<span>
                  <span>판매가 </<span>
                  <c:if test="${pvo.halin != 0}">   <!-- 할인 있는 경우 추가 -->
                  <span>할 인</<span>
                  </c:if>
               </div>
                  
               <div id="gumae_content">
                  <span id="gumae_size"></span>
                  <span id="gumae_color"></span>
                  <span id="gumae_price"></span>
                  <c:if test="${pvo.halin != 0}"><!-- 할인 있을 경우 추가 -->
                  <span id="gumae_halin"></span>
                  </c:if>
                  <span id="gumae_su"> <input type="text" name="su" id="spinner" value="1" readonly></span>
               </div>
               <div>최종 금액</div>
               <div id="gumae_chong"></div>
               <hr>
            
                                                <!-- 찜 -->

      <div>
	    <c:if test="${userid != null}"> 
	     <c:if test="${wishcnt == 0}">
          <span class="btn" onclick="wish_add()"> 찜목록 추가 </span>
         </c:if>
         <c:if test="${wishcnt == 1}">
          <span class="btn" onclick="location='wish_cancel?pcode=${pvo.pcode}'"> 찜목록 취소 </span>
         </c:if>
        </c:if>
                
        <c:if test="${userid == null}"> 
          <span class="btn" onclick="alert('로그인 하세요')"> 찜목록 추가 </span> 
        </c:if>  
        
        <a href="../page/wish"> 찜목록 이미지 클릭시 이동</a>
		</div>
      
      <!-- 찜 -->
      
      <!-- 장바구니 -->
     <div>
		<c:if test="${userid != null}">
          <span class="btn" onclick="cart_add()"> 장바구니 </span>
        </c:if>
        <c:if test="${userid == null}"> 
          <span class="btn" onclick="alert('로그인을 하세요')"> 장바구니 </span> 
        </c:if>  
        <a href="../page/cart"> 장바구니 이미지 클릭시 이동</a>
     </div> 
      <!-- 장바구니 -->

      <!-- 즉시구매 -->
   <input type="submit" value="BUY IT NOW" style="width:400px;height:46px;background: #CCA39B;color:white;border: none;">
   </form>      
   </div>
            
</article>
<article id="ar2"> <!-- 상세페이지 -->
            
            
            <div id="content_list">
                  <span>상세페이지</span>               
                  <span>상품문의</span>               
                  <span>상품평</span>               
                  <span>배송/교환/반품 안내</span>      
                  </div>   
</article>
      
         
            <div><img src="../resources/img/${pvo.cimg}" width="1000" height="1200"></div>  <!-- 상세페이지 이미지 -->
            
<article id="ar3">                 
               <div><h1><b>상 품 평</b></h1></div>
            <c:forEach items="${rlist}" var="rvo">
            <div id="pro_review_list"> <!-- 상품평 -->
               <span>${rvo.userid}</span>
               <span>${rvo.content}</span>
               <span>${rvo.writeday}</span>
            </div>
            </c:forEach>
               
            <form method="post" action="pro_review_write_ok">
            <input type="hidden" name="pcode" value="${pvo.pcode}">
               <tr>
                  <td><textarea rows="6" cols="100" name="content"></textarea></td>
                  <td><input type="submit" value="등록하기"></td>
               </tr>
            </form>
</article>

<article id="ar4">
            <!--상품문의 리스트  -->
            <span><h1><b>상 품 문 의</b></h1></span>  
            <span onclick="pro_inquiry_write()">문의 작성</span>
            <div>
            <span>답변상황</span>
            <span>아이디</span>
            <span>제 목</span>
            <span>작성일</span>
            </div>
            <c:forEach items="${ilist }" var="ivo">
               <div id="pro_inquiry_list">
               
               <c:if test="${ivo.content1 != null }">
                  <span>답변 완료</span>
                  <span>${ivo.userid}</span>
                  <span>${ivo.title}</span>
                  <span>${ivo.writeday}</span>
                  <p>
                 </c:if> 
                 
                 <c:if test="${ivo.content1 == null }">
                  <span>답변 준비중</span>
                  <span>${ivo.userid}</span>
                  <span>${ivo.title}</span>
                  <span>${ivo.writeday}</span>
                 <p>
                 </c:if>
            </c:forEach>
            
            <form  id="inquiry_content" method="post" action="pro_inquiry_write_ok">
            <input type="hidden" name="pcode" value="${pvo.pcode}">
              <div>
           		제 목
               <input type="text" name="title" size="98">
           </div>
           <br>
            <div>
            	내 용
               <textarea rows="6" cols="100" name="content"></textarea>
            </div>
            <div>
               <input type="submit" value="작성하기">
            </div>
            </form>
</article>


<article id="ar5">
            <div><h1><b>배송/교환/반품 안내</b></h1></div>
</article>
      </section>
</body>
</html>