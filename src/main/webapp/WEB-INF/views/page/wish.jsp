<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <c:set var="size" value="${list.size() }"/>
 <c:if test="${size <=5}">
   <c:set var="he" value="600"/>
 </c:if>
 <c:if test="${size > 5}">
   <c:set var="he" value="${(size-5)*100+600}"/>
 </c:if>

 <style>
   section {
     width:1200px;
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
 </style>
 <script>
 
//체크박스 함수!!
   function maincheck(ck) 
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
   function subcheck()
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
   
   
   //선택삭제 함수!!
   function select_del()
   {
	  
	   var len=document.getElementsByClassName("subchk").length;
	   var str="";
	   for(i=0;i<len;i++)
	   {
		   if(document.getElementsByClassName("subchk")[i].checked)
		      str=str+document.getElementsByClassName("subchk")[i].value+",";
	   }
	  
	   location="select_del?delid="+str; 
   }
   
   //장바구니로 옮기기
   function move_cart()
   {
	   var pcode="";
	   var color="";
	   var size="";
	   var su="";
	   var len=document.getElementsByClassName("subchk").length;
	   for(i=0;i<len;i++)
	   {
		   if(document.getElementsByClassName("subchk")[i].checked)
			  pcode=pcode+document.getElementsByClassName("pcode")[i].value+",";
		      size=size+document.getElementsByClassName("size")[i].value+",";
		      color=color+document.getElementsByClassName("color")[i].value+",";
		      su=su+document.getElementsByClassName("su")[i].value+",";
	   }	    
	   location="move_cart?pcode="+pcode+"&su="+su+"&size="+size+"&color="+color;
   }
   
 </script>
</head>
<body> <!-- wish.jsp -->
   
   <section>
   
     
     <table width="1200" align="center">
     <caption style="caption-side:top"> <h3>Wish</h3> </caption>
       <tr align="center">
         <td> <input type="checkbox" onclick="maincheck(this.checked)" style="width:15px;height:15px;" id="mainchk"> </td>
         <td> 상품이미지 </td>
         <td> 상품명 </td>
         <td> 상품가격 </td>
         <td> 날짜 </td>
         <td> 삭제 </td>
       </tr>
       
     <c:forEach items="${list}" var="wvo">
       <input type="hidden" class="pcode" value="${wvo.pcode}">
       <input type="hidden" class="size" value="${wvo.size}">
       <input type="hidden" class="color" value="${wvo.color}">
       <input type="hidden" class="su" value="${wvo.su}">
       <tr align="center">
         <td> <input type="checkbox" class="subchk" onclick="subcheck()" value="${wvo.id}"> </td>
         <td> <img src="../resources/img/${wvo.pimg}"  width="70" height="70" style="border:1px solid #cccccc;padding:5px;"> </td>
         <td> ${wvo.title} </td>
         <td> <fmt:formatNumber value="${wvo.price}"/>원 </td>
         <td> ${wvo.writeday} </td>
         <td> <input type="button" id="del1" value="X" onclick="location='wish_del?id=${wvo.id}'"> </td>
       </tr>
     </c:forEach>
       <tr height="80">
         <td colspan="6" align="center">
          <input type="button" id="del2" value="선택삭제" onclick="select_del()"> 
          <input type="button" id="move" value="장바구니이동" onclick="move_cart()">
         </td>
       </tr>
     </table>
   </section>
</body>
</html>