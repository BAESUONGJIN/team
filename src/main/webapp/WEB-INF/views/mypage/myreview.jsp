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
     width:900px;
     margin:auto;
     text-align: center;
     padding-top: 200px;/* 폼 자체 조정 */
     flex: 1;
   }
   
   a {
     color: black;
     text-decoration: none;
   }
   
   
   section #ar1{
     
   }
   
   section #ar2{
     margin-top: 50px;
   }
   
   	table {
		margin-top: 20px;
		width: 100%;
		border-top: 1px solid black;
		border-collapse: collapse;
		border-collapse:separate;
	}
	
	th {
		text-align: center;
		border-bottom: 1px solid gray;
		padding: 10px;
		background: rgba(164, 48, 35, 0.1);
	}
	
	td {
		border-bottom: 1px solid gray;
		
	}
	
     h5 {
		display: inline-block;
		background: linear-gradient(to top, #f6eae9 30%, transparent 80%);
		
	}
	
	
 </style>

</head>
<body>
  <section>
  
   <article id="ar1">
        <caption> <h5 align="left" style="font-weight: bolder;"> 내가 작성한 리뷰 </h5> </caption>
    <table align="center" cellspacing="0">
        <tr>
          <th> 상품 </th>
          <th> 나의 후기 </th>
          <th> 작성일 </th>
          <th> 수정/삭제 </th>
        </tr>
     <c:forEach items="${rlist}" var="rvo">
       <tr align="center" height="70">
          <td><a href="../product/pro_content?pcode=${rvo.pcode}" style="font-size: 13px">${rvo.ptitle}</a> <br>
           <img src="../resources/img/${rvo.pimg}" width="50" height="50">
          </td> 
          <td height="70"> ${rvo.content} </td>
          <td> ${rvo.writeday} </td>
          <td>
            <input type="button" value="수정" onclick="location='myreview_update?id=${rvo.id}'">
            <input type="button" value="X" onclick="location='myreview_del?id=${rvo.id}'">
          </td>
       </tr>
     </c:forEach>
    </table>
    </article>
    
  <article id="ar2">  
        <caption> <h5 align="left" style="font-weight: bolder;"> 상품 Q＆A </h5> </caption>
    <!-- 구분하기  -->
	<table align="center" cellspacing="0">
		<tr>
			<th> 상품 </th>
			<th> 상품문의 </th>
			<th> 작성자  </th>
			<th> 답변여부 </th>
		</tr>
		
		<c:forEach items="${ilist}" var="ivo">
       <tr align="center" height="70">
          <td><a href="../product/pro_content?pcode=${ivo.pcode}" style="font-size: 13px">${ivo.ptitle}</a> <br>
           <img src="../resources/img/${ivo.pimg}" width="50" height="50">
          </td> 
			<td> ${ivo.title} </td>
			<td> ${ivo.userid} </td>
			<c:if test="${ivo.cnt == 0 }">
				<td> 답변 대기  </td>
			</c:if>
			<c:if test="${ivo.cnt == 1}">
				<td> 답변 완료 </td>
			</c:if>
		</tr>
		</c:forEach>
		
		<tr> <!-- 페이징 처리 -->
			<td colspan="5" align="center" id="paging" style="border: none;">
			<c:if test="${pstart != 1}">
				<a href="myreview?page=${pstart-1}"> ◁◁ </a>
			</c:if>
			<c:if test="${pstart == 1}">
				◁◁
			</c:if>
			
			<c:if test="${page != 1}">
				<a href="myreview?page=${page-1}"> ◁ </a>
			</c:if>
			<c:if test="${page == 1}">
				◁
			</c:if>
			
			
			<c:forEach begin="${pstart}" end="${pend}" var="i">
				<c:if test="${page == i}">
					<c:set var="st" value="style='color:red;'"/>
				</c:if>
				<c:if test="${page != i}">
					<c:set var="st" value=""/>
				</c:if>
				
				<a href="myreview?page=${i}" ${st}> ${ i } </a>
			</c:forEach>
			
			<c:if test="${page != chong}">
				<a href="myreview?page=${page+1}"> ▷  </a>
			</c:if>
			<c:if test="${page == chong}">
				▷
			</c:if>
			
			<c:if test="${chong != pend}">
				<a href="myreview?page=${pend+1}"> ▷▷  </a>
			</c:if>
			<c:if test="${chong == pend}">
				▷▷
			</c:if>
			</td>
		</tr>
		</table>
  </article>
  </section>
</body>
</html>