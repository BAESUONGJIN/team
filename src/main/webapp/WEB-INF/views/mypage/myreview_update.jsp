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
     margin:auto;
     text-align: center;
     padding-top: 150px;/* 폼 자체 조정 */
     flex: 1;
   }
   
   table{
     border: 2px solid #cccccc;
   }
   
   
   section table caption {
     text-align:left;
   }
   section table th {
     border-top:1px solid #cccccc;
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
        <caption> <h2> 상품평 수정 </h2> </caption>
    <form method="post" name="review" action="myreview_update_ok">
      <input type="hidden" name="id" value="${rvo.id }">
    <table width="1000" align="center" cellspacing="0">
        <tr>
          <td> 한줄 요약 </td>
          <td> <input type="text" name="title" value="${rvo.title}"></td>
          <td> 상세 리뷰 </td>
          <td> <textarea name="content" cols="30" rows="4"> ${rvo.content } </textarea></td>
        </tr>
        <tr>
          <td colspan="2" align="center">
            <input type="submit" value="수정">
          </td>
        </tr>
    </table>
  </form>
  </section>
</body>
</html>