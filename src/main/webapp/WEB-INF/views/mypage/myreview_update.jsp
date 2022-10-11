<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <style>
   @import url('https://fonts.googleapis.com/css2?family=Lora:ital@1&family=Roboto:wght@700&display=swap'); 
   section {
     width:1000px;
     height:800;
     margin:auto;
     text-align: center;
     padding-top: 150px;/* 폼 자체 조정 */
     flex: 1;
   }
   
   section table caption {
     text-align:left;
   }
   section table tr {
     border-top:1px solid #cccccc;
   }
   section table td {
     border-bottom:1px solid #cccccc;
   }
   
   	h2 #hh2{
		margin-bottom: 30px;
		display: inline-block;
		width: auto;
		background: linear-gradient(to top, #f6eae9 30%, transparent 80%);
		font-family: 'Lora', serif;
		color: black;
	}
   
 </style>
</head>
<body>
 <section>
   <h2> <span id="hh2"> Review Update </span></h2>
    <form method="post" name="review" action="myreview_update_ok">
      <input type="hidden" name="id" value="${rvo.id }">
       <table width="600" align="center" cellspacing="0">
        <tr> 
          <td> 나의 글 </td>
          <td> <textarea name="content" cols="60" rows="4">${rvo.content} </textarea> </td>
        </tr>
        <tr>
          <td colspan="3" align="center">
            <input type="submit" value="수정" style="width:100px;height:46px; background: #CCA39B; color:white; border: none;margin-top: 20px; border-radius: 10px;">
          </td>
        </tr>
       </table>
    </form>
 </section>
</body>
</html>