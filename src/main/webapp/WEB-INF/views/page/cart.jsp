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
   section {
     width:1000px;
     height:${he}px;
     margin-top:200px;
     margin-bottom:50px;
     margin-right:auto;
     margin-left:auto;
   }

	section tr:first-child td {
     border-top:2px solid #cccccc;
     border-bottom:1px solid #cccccc;
     height:35px;
    
   }
   section tr td {
     border-bottom:1px solid #cccccc;
   }
   
   section tr:last-child td {
     border-bottom:2px solid #cccccc;
   }
   section #del1 {
     width:60px;
     height:30px;
	 border:1px;
	 background-color: rgba(164, 48, 35, 0.1);
	 color:#008080;
     font-weight:900;
     cursor:pointer;
   }
   section #del2, #move, section #buy {
     width:180px;
     height:30px;
	 border:1px;
	 background-color: rgba(164, 48, 35, 0.1);
	 color:#008080;
     font-weight:900;
     cursor:pointer;
   }
   
   }
 </style>
  <script src="http://code.jquery.com/jquery-latest.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script> 
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script>
    $(function()
    {
    	var exprice=[${str}];  
    	var $imsi=$(".spinner");
    	$(".spinner").spinner(
        {
        	min:1,
        	max:10,
        	spin:function(e,ui)  
        	{
     		    var n=$imsi.index(this); 
     		    var total=exprice[n]*s;
     		  
     		    total=new Intl.NumberFormat().format(total);
     		    total=total+"원";
     		     
     		   $(".price").eq(n).text(total);
        	     
        	}
        });
    });
  </script>
  
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
			   su=su+document.getElementsByClassName("spinner")[i].value+",";
			   color=color+document.getElementsByClassName("color")[i].value+",";
			   size=size+document.getElementsByClassName("size")[i].value+",";
			   
		   }	   
	   }
	   location="../page/buy?gchk=2&pcode="+pcode+"&su="+su+"&size="+size+"&color"+color;
   }
  </script>
</head>
<body> <!-- cart.jsp -->
   <section>
     
     <table width="1000" align="center">
       <caption style="caption-side:top"> <h3>Cart</h3> </caption>
       <tr align="center">
         <td> <input type="checkbox" onclick="maincheck(this.checked)" style="width:px;height:20px;" id="mainchk"> </td>
         <td> 상품이미지 </td>
         <td> 상품명 </td>
         <td> 상품가격 </td>
         <td> 수량 </td>
         <td> 날짜 </td>
         <td> 삭제 </td>
       </tr>
       
       
     <c:forEach items="${list}" var="cvo">
       <input type="hidden" class="pcode" value="${cvo.pcode}">
       <input type="hidden" class="size" value="${cvo.size}">
       <input type="hidden" class="color" value="${cvo.color}">
       <tr align="center">
         <td> <input type="checkbox" class="subchk" onclick="subcheck()" value="${cvo.id}"> </td>
         <td> <img src="../resources/img/${cvo.pimg}" width="70" height="70" style="border:1px solid #cccccc;padding:5px;"> </td>
         <td> ${cvo.title} <p>${cvo.color} ${cvo.size} </td>
         <td class="price"> <fmt:formatNumber value="${cvo.price*cvo.su}"/>원 </td>
         <td> <input type="text" class="spinner" value="${cvo.su}" readonly> </td>
         <td> ${cvo.writeday} </td>
         <td> <input type="button" id="del1" value="X" onclick="location='cart_del?delid=${cvo.id},'"> </td>
       </tr>
     </c:forEach>
       <tr height="80">
         <td colspan="7" align="center">
          <input type="button" id="del2" value="선택삭제" onclick="cart_del()"> 
          <input type="button" id="buy" value="선택구매" onclick="buy()">
         </td>
       </tr>
     </table>
   </section>
</body>
</html>
