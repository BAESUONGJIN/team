<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  <style>
   section {
     width:1200px;
     height:1000px;
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
    
  </style>
  
</head>
<body>
  <section>
   <form name="review" method="post" action="review_ok"> 
    <input type="hidden" name="pcode" value="${pcode}">
    <input type="hidden" name="bid" value="${bid}">
    
    <table width="600" align="center" >
     <caption style="caption-side:top"> <h3> 상품평 쓰기 </h3></caption>
     
     
     <tr>
       <td> <img src="../resources/img/${bvo.pimg}" width="70" height="70"></td>
       <td> ${bvo.title}</td>
       <td> ${bvo.color} </td>
       <td> ${bvo.size} </td>
     </tr>     
     
     
     <tr> 
       <td> 한줄요약 </td>
       <td> <input type="text" name="title"> </td>
     </tr>
     <tr>
       <td> 상세리뷰 </td>
       <td> <textarea name="content" cols="50" rows="4"></textarea> </td>
     </tr>
     <tr>
       <td colspan="2" align="center"> <input type="submit" value="리뷰쓰기"> </td>
     </tr>
    </table>
   </form>
  </section>
</body>
</html>