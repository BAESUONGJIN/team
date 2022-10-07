<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <style>
   section {
     width:1200px;
     height:600px;
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
     width:60px;
     height:30px;
     border:1px solid rgba(164, 48, 35, 0.1);
     text-align:center;
     color:black;
     background:rgba(164, 48, 35, 0.1);
     cursor:pointer;
   }
 </style>
</head>
<body>
   <section>
     <table width="1200" align="center">
       <caption style="caption-side:top"> <h3> 나의 상품평 </h3> </caption>
       <tr height="60">
        <td align="center" width="400"> 상 품 </td>
        <td align="center" width="500"> 한줄 평 </td>
        <td align="center" > 작성일자 </td>  
        <td align="center" > 수정/삭제 </td>
       </tr>
      <c:forEach items="${rlist}" var="rvo">
       <tr align="center" height="70">
        <td align="center" width="400">  
           <img src="../resources/img/${rvo.pimg}" width="80" height="80"> ${rvo.ptitle} 
        </td>
        <td align="center" width="500"> ${rvo.content} </td>
        <td align="center" > ${rvo.writeday} </td>
        <td align="center" >
          <input id="btn" type="button" value="수정" onclick="location='review_update?id=${rvo.id}&bid=${rvo.bid}'">
          <input id="btn" type="button" value="삭제" onclick="location='review_del?id=${rvo.id}&bid=${rvo.bid}'">
        </td> 
       </tr>      
      </c:forEach>
     </table>
   </section>
</body>
</html>







