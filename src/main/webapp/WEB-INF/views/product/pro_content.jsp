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
section #ar2 div
{
border: 1px solid black;
 background: rgba(164, 48, 35, 0.1);
display: inline-block;
width:250px;
height: 70px;
text-align: center;
padding-top: 20px;
font-size: 20px;

}

section #ar3{ /* 상품평 */
margin-top: 20px;
}
section #ar3 .mt
{
text-align: left;
margin-left:120px;
width:110px;
background: linear-gradient(to top, #f6eae9 30%, transparent 80%);
}

section #ar4{ /* 상품문의 */
margin-top: 20px;
}
section #ar4 .mt
{
text-align: left;
margin-left:120px;
width:150px;
background: linear-gradient(to top, #f6eae9 30%, transparent 80%);
}

section #ar5{ /* 상세페이지 */
margin-top: 20px;
}

section #ar5 .mt
{
text-align: left;
margin-left: 120px;
width:300px;
background: linear-gradient(to top, #f6eae9 30%, transparent 80%);
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

#gumae_content
{
display: none;
}
.ask
{
	display: none;
	background: #f6eae9;
}
.icontent
{
display: none;
background: red;
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
                 <td>내 용</td>
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
            <p>
              <form method="post" action="pro_review_write_ok" onsubmit="return review_chk(this)">
                <input type="hidden" name="pcode" value="${pvo.pcode}">
                  <table width="950" align="center">
               <tr>
               	  <td>상품명</td>
                  <td><input type="text" name="title" size="98" value="${pvo.title}" readonly></td>
               </tr>
               <tr>
               	  <td>상품평</td>
                  <td><textarea class="cont" rows="6" cols="100" name="content"></textarea></td>
               </tr>
                <tr>
              		 <td colspan="2"><input type="submit" value="등록하기" style="width:200px;height:46px;background: #CCA39B;color:white;border: none;margin-top: 20px;"></td>
            	</tr>
            	</table>

              </form>
</article>

<article id="ar4">
            <!--상품문의 리스트  -->
             <div class="mt"><h2><b>상품문의</b></h2></div> 
            <table id="inquiry_tb" width="950" align="center">
           <tr style="background:rgba(164, 48, 35, 0.1);color:black;">
     	    <td>아이디</td>
          	<td>제 목</td>
          	<td>작성일</td>
           </tr>
            <c:forEach items="${ilist}" var="ivo">
                  <tr>
                  <td>${ivo.userid}</td>
                  <td id ="ititle" class="ititle">${ivo.title}</td>
                  <td>${ivo.writeday}</td>
                  </tr>
                  
                  <tr id="icontent" class="icontent">
                  	<td>문의 내용</td>
                  	<td>${ivo.content}</td>
                  </tr>
                  
               	<tr id="ask" class="ask">
					<td>답 변</td>               	
					<td>답변 내용</td>       
					<td>답변 날짜</td>        	
               	</tr>
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

<article id="#ar5">
            <div class="mt"><h2><b>배송/교환/반품 안내</b></h2></div>
</article>
      </section>
</body>
</html>