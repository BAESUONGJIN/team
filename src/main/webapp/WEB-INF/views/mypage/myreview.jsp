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
     width:1000px;
     height:500px;
     margin:auto;
     text-align: center;
     padding-top: 150px;/* 폼 자체 조정 */
     flex: 1;
   }
   
   section table caption {
     text-align:left;
   }
   section table th {
     border-top:2px solid #cccccc;
     border-bottom:1px solid #cccccc;
   }
   section table td {
     border-bottom:1px solid #cccccc;
   }
   section table tr:last-child td {
     border-bottom:2px solid #cccccc;
   }
 </style>
 
</head>
<body>
  <section>
        <caption> <h2> 상품평 </h2> </caption>
    <table width="800" align="center" cellspacing="0">
        <tr>
          <th> 상품 </th>
          <th> 나의 후기 </th>
          <th> 작성일 </th>
          <th> 수정/삭제 </th>
        </tr>
     <c:forEach items="${rlist}" var="rvo">
       <tr align="center" height="70">
          <td><a href="../product/pro_content?pcode=${rvo.pcode}">${rvo.ptitle}</a> <br>
           <img src="../resources/img/${rvo.pimg}" width="50" height="50">
          </td>
          <td> ${rvo.content} </td>
          <td> ${rvo.writeday} </td>
          <td>
            <input type="button" value="수정" onclick="location='myreview_update?id=${rvo.id}'">
            <input type="button" value="삭제" onclick="location='myreview_del?id=${rvo.id}'">
            
          </td>
       </tr>
     </c:forEach>
    </table>
  </section>
</body>
</html>