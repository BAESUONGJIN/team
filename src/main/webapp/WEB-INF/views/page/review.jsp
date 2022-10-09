<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <style>
   section {
     width:1000px;
     height:auto;
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
   
   #btn {
     width:100px;
     height:30px;
     border:1px solid rgba(164, 48, 35, 0.1);
     text-align:center;
     color:black;
     background:rgba(164, 48, 35, 0.1);
     cursor:pointer;
     margin-top:50px;
     margin-left:900px;
   }
   
  </style>
  
</head>
<body>
  <section>
   <form name="review" method="post" action="review_ok"> 
    <input type="hidden" name="pcode" value="${bvo.pcode}">
    <input type="hidden" name="bid" value="${bid}"> 
    <table width="1000" align="center" >
     <caption style="caption-side:top"> <h3> 상품평 쓰기 </h3></caption>
     
     
     <tr height="100">
       <td> <img src="../resources/img/${bvo.pimg}" width="70" height="70"></td>
       <td> ${bvo.title}</td>
       <td> color: ${bvo.color} </td>
       <td> size: ${bvo.size} </td>
     </tr>     
  
     <tr height="150">
       <td> 한줄평 </td>
       <td colspan="4"> <textarea name="content" cols="70" rows="2"></textarea> </td>
     </tr>
     </table>
     <div><input id="btn" type="submit" value="리뷰작성"></div>
     
   </form>
  </section>
</body>
</html>