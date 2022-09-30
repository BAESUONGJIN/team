<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <style>
   tr:first-child td {
     border-top:2px solid #cccccc;
     border-bottom:1px solid #cccccc;
     height:35px;
   }
   
   tr td {
     border-bottom:1px solid #cccccc;
   }
   
   tr:last-child td {
     border-bottom:2px solid #cccccc;
   }
  
  
   #left {
     width:50px;
     height:22px;
     border:1px solid rgba(164, 48, 35, 0.1);
     text-align:center;
     background:rgba(164, 48, 35, 0.1);
     color:black;
     cursor:pointer;
     
   }
   
   #right {
   	 width:50px;
     height:22px;
     border:1px solid rgba(164, 48, 35, 0.1);
     text-align:center;
     color:black;
     background:rgba(164, 48, 35, 0.1);
     cursor:pointer;
   }
   .outer {
     width:260px;
     height:130px;
     border:1px solid rgba(164, 48, 35, 0.1);
     background:white;
     padding:5px;
     margin-top:10px;
     margin-left:auto;
     margin-right:auto;
   }
   #chuga {
     width:200px;
     height:25px;
     border:1px solid rgba(164, 48, 35, 0.1);
     background:rgba(164, 48, 35, 0.1);
     text-align:center;
     margin-top:15px;
     margin-left:auto;
     margin-right:auto;
     cursor:pointer;
   }
 </style>
  <script src="http://code.jquery.com/jquery-latest.js"></script>
 
 <script>

 $(function()
		   {
			   var $ss=$(".sel");
			   $(".sel").click(function()
			   {
				   var n=$ss.index(this);
				   opener.$("#bname").text($(".name").eq(n).text());
				   opener.$("#bjuso").text($(".juso").eq(n).text());
				   opener.$("#bphone").text($(".phone").eq(n).text());
				   opener.$("#bchuga").text($(".chuga").eq(n).text());
				   
				 
			   });
		   });
 
   function edit(id)
   {
	   document.editform.id.value=id;
	   document.editform.submit();
   }
  
 </script>
</head>
<body>

 <table align="center">
       <caption style="caption-side:top"> <h3>배송지목록</h3> </caption>
       <tr align="center">
         <td> 배송지 </td>
         <td> 주소 </td>
         <td> 연락처 </td>
         <td> 수령방법 </td>
         <td> 선택  </td>
         <td> 수정 </td>
       </tr>

 <c:set var="i" value="0"/>
 <c:forEach items="${list}" var="bvo">
   <tr>
    <td><div class="name">${bvo.name}</div></td>
    <td><div class="juso">${bvo.juso} ${bvo.juso_etc}</div></td>
    <td><div class="phone">${bvo.phone}</div></td>
    <td> <c:if test="${bvo.chuga == 0}">
     	  <c:set var="chuga" value="현관입구"/>
         </c:if>
         <c:if test="${bvo.chuga == 1}">
          <c:set var="chuga" value="직접수령"/>
         </c:if>
         <c:if test="${bvo.chuga == 2}">
          <c:set var="chuga" value="경비실"/>
         </c:if>
         <c:if test="${bvo.chuga == 3}">
          <c:set var="chuga" value="택배함"/>
         </c:if>
         <div class="chuga"> ${chuga}</div>
    </td>
    <td><div id="right" class="sel"> 선택 </div> </td>
    <td><div id="left" onclick="edit(${bvo.id})"> 수정 </div></td>
    </tr>
  </c:forEach>
  </table>
  
  
  <c:set var="i" value="${i+1}"/>
 
  <div id="chuga" onclick="location='../page/juso_add'"> 주소록 추가 </div>
  
  <form name="editform" method="post" action="../page/baesong_edit">
    <input  type="hidden" name="id">
  </form>

 
</body>
</html>