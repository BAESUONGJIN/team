<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <script src="https://kit.fontawesome.com/c96178233f.js" crossorigin="anonymous"></script>
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

	a {
		text-decoration: none;
		color: black;
	}
	
	table {
		margin-top: 20px;
		width: 100%;
		border-top: 2px solid #cccccc;
		border-collapse: collapse;
	}
	
	th {
		text-align: center;
		border-bottom: 1px solid #cccccc;
		padding: 10px;
		background: #f6eae9;
	}
	
	td {
		border-bottom: 1px solid #cccccc;
		padding: 10px;
		text-align: center;
	}
	
	   section tr td {
       border-bottom:1px solid #cccccc;
       padding: 10px;
   }
                
                section #btn4 {
                    width: 50px;
                    height: 44px;
                    background-color: #D1A69D;
                    color: white;
                    border-radius: 8px;
                    border: none;
                    font-size: 13px;
                }

                section #btn5 {
                    width: 50px;
                    height: 44px;
                    background-color: rgb(180, 180, 180);
                    color: white;
                    border-radius: 8px;
                    border: none;
                    font-size: 13px;
                }
                
                   h2 #hh2 {
		           margin-bottom: 30px;
		           font-family: 'Lora', serif;
		           display: inline-block;
		           background: linear-gradient(to top, #f6eae9 30%, transparent 80%);
		      
		           } 
		           
            </style>
        </head>
        <body>
            <section>
                        <h2 align="center"> <span id="hh2"> My Review </span> </h2>
                    <table align="center">
                        <tr>
                            <th> 상품 </th>
                            <th> 나의 후기 </th>
                            <th> 작성일 </th>
                            <th> 수정/삭제 </th>
                        </tr>
                        <c:forEach items="${rlist}" var="rvo">
                            <tr align="center" height="70">
                                <td><a href="../product/pro_content?pcode=${rvo.pcode}"
                                        style="font-size: 13px ">${rvo.ptitle}</a> <br>
                                    <img src="../resources/img/${rvo.pimg}" width="50" height="50">
                                </td>
                                <td height="100"> ${rvo.content} </td>
                                <td> ${rvo.writeday} </td>
                                <td>
                                    <input type="button" id="btn4" value="수정"
                                        onclick="location='myreview_update?id=${rvo.id}'">
                                    <input type="button" id="btn5" value="X"
                                        onclick="location='myreview_del?id=${rvo.id}'">
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                    
          
                        
                    <!-- 구분하기  -->
                    <table align="center" cellspacing="0">
                      <h2 align="center"> <span id="hh2"> QNA </span> </h2>
                        <tr>
                            <th> 상품 </th>
                            <th> 상품문의 </th>
                            <th> 작성자 </th>
                            <th> 답변여부 </th>
                        </tr>
                        <c:forEach items="${ilist}" var="ivo">
                            <tr align="center" height="70">
                                <td><a href="../product/pro_content?pcode=${ivo.pcode}"
                                        style="font-size: 13px">${ivo.ptitle}</a> <br>
                                    <img src="../resources/img/${ivo.pimg}" width="50" height="50">
                                </td>
                                <td> <a href="../product/pro_content?pcode=${ivo.pcode}"> ${ivo.title} </a> </td>
                                <td> ${ivo.userid} </td>
                                <c:if test="${ivo.cnt == 0 }">
                                    <td> 답변 대기 </td>
                                </c:if>
                                <c:if test="${ivo.cnt == 1}">
                                    <td style="color: red;"> 답변 완료 </td>
                                </c:if>
                            </tr>
                        </c:forEach>
                <tr>
                    <!-- 페이징 처리 -->
                    <td colspan="5" align="center" id="paging" style="border: none;">
                        <c:if test="${pstart != 1}">
                            <a href="myreview?page=${pstart-1}"> ◁◁ </a>
                        </c:if>
                        <c:if test="${pstart == 1}">
                            <!-- ◁◁ -->
                        </c:if>
                        <c:if test="${page != 1}">
                            <a href="myreview?page=${page-1}"> <i class="fa-solid fa-caret-left"></i> &nbsp </a>
                        </c:if>
                        <c:if test="${page == 1}">
                            <i class="fa-solid fa-caret-left"></i> &nbsp
                        </c:if>
                        <c:forEach begin="${pstart}" end="${pend}" var="i">
                            <c:if test="${page == i}">
                                <c:set var="st" value="style='color:red;'" />
                            </c:if>
                            <c:if test="${page != i}">
                                <c:set var="st" value="" />
                            </c:if>

                            <a href="myreview?page=${i}" ${st}> ${ i } </a>
                        </c:forEach>

                        <c:if test="${page != chong}">
                            <a href="myreview?page=${page+1}"> &nbsp <i class="fa-solid fa-caret-right"></i> </a>
                        </c:if>
                        <c:if test="${page == chong}">
                            &nbsp <i class="fa-solid fa-caret-right"></i>
                        </c:if>

                        <c:if test="${chong != pend}">
                            <a href="myreview?page=${pend+1}">
                                <!-- ▷▷ -->
                            </a>
                        </c:if>
                        <c:if test="${chong == pend}">
                            <!-- ▷▷ -->
                        </c:if>
                    </td>
                </tr>
                </table>
            </section>
        </body>
        </html>