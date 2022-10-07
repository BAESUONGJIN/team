<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
   
    section #buy {
      width:180px;
      height:35px;
      background-color:#D1A69D;
      color:white;
      border-radius: 8px;
      border: none;
      font-size: 15px;    
    }
   
   h2 #hh2 {
	 margin-bottom: 30px;
	 font-family: 'Lora', serif;
	 display: inline-block;
	 background: linear-gradient(to top, #f6eae9 30%, transparent 80%);
	 color: black;
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
     <table width="1000" align="center">
     <caption style="caption-side:top"> <h2 align="center"> <span id="hh2"> WISH LIST </span> </h2> </caption>
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
          <input type="button" id="buy" value="장바구니이동" onclick="move_cart()">
         </td>
       </tr>
     </table>
   </section>
</body>
</html>