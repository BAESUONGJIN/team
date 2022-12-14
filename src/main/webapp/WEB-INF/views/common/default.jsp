<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/c96178233f.js" crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <style>
    body {
       margin: 0px;
    }
    
    header { /* 1층 */
       width:100%;
       height:50px;
       margin:auto;
       background-color: rgba(164, 48, 35, 0.1);
                   
    }
    
    header #left{
      margin-left: 30px;
    }
          
   header #main {
     width:200px;
     height:40px;
     margin-top:10px;
     margin-left:55px;
     margin-bottom: 15px;
     position:absolute;
     bottom:94%; /* 위치 지정 */
     overflow:hidden; 
     font-size: 12px;
   }
   header #inner {
     padding-left:0px;
     padding-top:0px;
     margin-top:0px;
   }
   header #inner li {
     width:200px;
     height:40px;
     list-style-type:none;
     display:flex;
     align-items:center;
     justify-content:center;
     
 /*     border:1px solid #cccccc; */
   }
    
    header #right { /* 우측  */
       position:relative;
       margin-bottom: 15px;
       font-size: 12px;
       display: inline;
       position: absolute;
       bottom: 95%; /* 위치 지정 */
       right: 4%;
       z-index: 3;
    }
    
    header a {
       text-decoration: none;
       color: rgb(60, 60, 60);/* 주석 */
       
    }
    
     header a:hover {
      color:red;
    }
    
       header #myinfo {
       position:absolute;
       top:105%; /* 위치 지정 */
       right:-15px;
       padding-left:0px;
       border:1px hsla(0, 0%, 84%, 0.3);
       background: white;
       padding:0px;
       display:none;
    }
    
    header #myinfo li {
       list-style-type:none;
       width:110px;
       height:25px;
       text-align:center;
    }
    
    #lix {
    	
    	background-color: rgba(164, 48, 35, 0.1);
    	padding: 0px;
    	margin:0px 0px 7px 0px;
    }
    
     #myinfo a {
       text-decoration: none;
       color: rgb(60, 60, 60);
       
    }
     #myinfo a:hover {
       color: red;
     }
        
    .second{ /* 로고 넣기 */
     width:100%;
     height:100px;
     background-color: white;
     margin: auto;
     position: fixed;
     -webkit-transition-duration:0.4s;
     -webkit-transition-timing-function:ease;
     transition-duration:0.4s;
     transition-timing-function:ease;
     z-index: 2; /* 상위로 올리기 */
     
     /*position: fixed; 스크롤 고정 */
    }
   
    
    .second #logo{
     display: inline-block;
    }
    
    #navi { /* 네비바  */
       margin-left: 140px;
       position:absolute;
       top:50px;
       color: black;
       font-size: 13px;
       word-spacing: 1px;
       /*position: fixed;  고정 */
    }
    
    #navi a { /* 네비 바 a 태그 제거 */
      text-decoration: none;
      color: black;
    }
    
        #myinfo2 {
       position:absolute;
       right:-15px;
       padding-left:0px;
       border:1px hsla(0, 0%, 84%, 0.3);
       background: white;
       padding:5px;
       display:none;
    }
       #myinfo2 li {
       list-style-type:none;
       width:110px;
       height:25px;
       text-align:center;
    }
    
       myinfo2 a {
       text-decoration: none;
       color: rgb(60, 60, 60);
       
    }
    
     .second #outer { /* 검색창 */
      display:inline-block;
      width:180px;
      height:30px;
      border:1px solid #cccccc;
      padding:5px;
      border-radius:20px;
      position: absolute;
      left: 80%;
      bottom: 40%;
      background: #f0f0f0;
    }
    
    input#search{
    width:100px;
    height: 20px;
    border: none;
    outline:none;
    background: #f0f0f0;
    }
   
    /* 말풍선 */
    .wrap {
    position:absolute;
    left:82%;
    top:40px;
    margin-top: 0px;
    z-index: 5;
    }
    .chatbox {animation: motion 0.3s linear 0s infinite alternate; margin-top: 0;
   -webkit-animation: motion 0.3s linear 0s infinite alternate; margin-top: 0;

    }
        
    @keyframes motion {
   0% {margin-top: 0px;}
   100% {margin-top: 10px;}
   }

   -webkit-@keyframes motion {
   0% {margin-top: 0px;}
   100% {margin-top: 10px;}
   }
   
   footer {
       width:100%;
       height: 200px;
       border: 1px solid rgb(240, 240, 240);
       background: rgba(164, 48, 35, 0.1);
       margin-top: 20px;
    }
    
	.second2 {
		position: fixed;
		top: 0px;
		background: #fbebea;
	}
	
  </style>
  
  <script src="http://code.jquery.com/jquery-latest.js"></script>
  <script>
   $(function()
   {
      
       $("header #my").mouseover(function()
              {
                 $("header #myinfo").show();
              });
              
              $("header #my").mouseout(function()
                 {
                    $("header #myinfo").hide();
                 });
       
   });
   
   
   $(function()
         {
            
             $(" #my2").mouseover(function()
                    {
                       $(" #myinfo2").show();
                    });
                    
                    $(" #my2").mouseout(function()
                       {
                          $(" #myinfo2").hide();
                       });
             
         });
   
   
   
   
   $(function()
         {
            setInterval(function()
            {
               $(" header #inner").animate(
                {
                    marginTop:"-40px"
               },1500,function()
                       {
                          $("header #inner").css("margin-top","0px");
                          $("header #inner li").eq(0).insertAfter($("header #inner li").eq(2));
                      });
            },2000);
            
             
         });
   
       /* 스크롤  */  /* fixed 추가 */
      /*  $(document).ready(function(){
      $(window).scroll(function(){
        var scroll = $(window).scrollTop();
        if (scroll > 1) {
          $(".second").css("background" , "#fbebea");
   		  $(".second").css("margin-top", "-50px");
          $(".second").addClass("fixed");
        }
        else{
          $(".second").css("background" , "white");  
   		  $(".second").css("margin-top", "0px");
          $(".second").removeClass("fixed");
        }
      });
    }); */
     
    /* 스크롤 방법2 */
     $(document).ready(function(){
    	 var x = $(".second").offset();
    	 
    	 $(window).scroll(function(){
    		 if ( $( document ).scrollTop() > x.top)
    		{
    			 $(".second").addClass("second2");
    		}
    		 else
    		{
    			 $(".second").removeClass("second2");
    		}
    	 });
       });
  </script>
     
  <decorator:head/>
</head>
<body>  <!-- index.jsp -->  
  <header> <!-- 1층 -->
   <div id="left"> 
    <a href="../" style="cursor: pointer;"> <img src="../resources/simg/a.png" width="59"> </a>
   </div>
    <div id="main"> <!-- 좌측 쿼리 -->
     <ul id="inner">
       <li> <span style="font-weight: bolder; font-size:13px; color: rgba(182, 83, 48, 0.5);"> 01.&nbsp;  </span> 데님진 OPEN </li>
       <li> <span style="font-weight: bolder; font-size:13px; color: rgba(182, 83, 48, 0.5);"> 02.&nbsp;  </span> 프릴 원피스 </li>
       <li> <span style="font-weight: bolder; font-size:13px; color: rgba(182, 83, 48, 0.5);"> 03.&nbsp;  </span> 가을 남방 </li>
     </ul>
   </div>
                
     <div id="right"> <!-- 우측 로그인 폼  -->
       <c:if test="${userid==null }">
        <a href="../member/memberinput"> JOIN US </a> &nbsp;<!-- 회원가입 --> </c:if> <!-- 흠 -->
       <c:if test="${userid !=null }">
       &nbsp;
       </c:if>
        
        <c:if test="${userid == null }"> <a href="../login/login"> LOGIN </a> &nbsp;<!-- 로그인  -->
        </c:if>
        <c:if test="${userid !=null }">
        <a href="../login/logout"> LOGOUT </a>&nbsp;
        </c:if>        
        <a href="../page/cart"> CART &nbsp;</a>
        <a href="../gongji/list"> NOTICE &nbsp;</a>
        
        <span id="my" style="display:inline-block"> <a href="../"> MY PAGE ∨</a>
        <ul id="myinfo">
      <c:if test="${userid != 'admin123'}">
      <li id="lix" style="height:16px;"> </li>
      <c:if test="${userid == null }"> <li> <a href="../login/login"> 회원정보 수정</a> </li>
      </c:if>
      <c:if test="${userid !=null }">
          <li> <a href="../mypage/myinfo_change"> 회원정보 수정 </a></li>
      </c:if>
      <c:if test="${userid == null }"> <li> <a href="../login/login"> 주문 조회 </a> </li>
      </c:if>
      <c:if test="${userid !=null }">
          <li> <a href="../page/myorder"> 주문 조회 </a></li>
      </c:if>
      <c:if test="${userid == null }"> <li> <a href="../login/login"> 나의 글 확인  </a> </li>
      </c:if>
      <c:if test="${userid !=null }">
          <li> <a href="../mypage/myreview"> 나의 글 확인 </a></li>
      </c:if>
      <c:if test="${userid == null }"> <li> <a href="../login/login"> 장바구니  </a> </li>
      </c:if>
      <c:if test="${userid !=null }"> <li> <a href="../page/cart"> 장바구니 </a></li>
      </c:if>
      <c:if test="${userid == null }"> <li> <a href="../login/login"> 관심 상품  </a> </li>
      </c:if>
      <c:if test="${userid !=null }"> <li> <a href="../page/wish"> 관심 상품 </a></li>
      </c:if>
      <c:if test="${userid == null }"> <li> <a href="../login/login"> 마이 페이지  </a> </li>
      </c:if>
      <c:if test="${userid !=null }">
          <li> <a href="../mypage/myinfo"> 마이 페이지 </a></li>
      </c:if>
      </c:if>
          <!-- 관리자 전용  -->
        <c:if test="${userid == 'admin123'}">
        	<li id="lix" style="height:16px;"> </li>
          <li style="font-weight: bold;"> 관리자 전용 </li>
          <li> <a href="../admin/buy_list"> 주문관련 </a> </li>
          <li> <a href="../product/pro_write"> 상품등록 </a> </li>
          <li> <a href="../admin/pro_list"> 상품관리 </a> </li>
          <li> <a href="../admin/inquiry_list"> 상품문의  </a> </li>
          <li> <a href="../admin/mem_list"> 회원관리</a> </li>
        </c:if> 
        </ul>
       </span>
    </div> 
         <!-- 말풍선 -->
   <c:if test="${userid ==null }">
       <div class="wrap"> 
      <img src="../resources/simg/b2.png" width="53px" class="chatbox">
   </div>
   </c:if>
   <c:if test="${userid !=null }">
          &nbsp;
   </c:if>
    </header>  <!-- 1층 마감 -->     
    <nav>
    <div class="second"> <!-- 2층 -->
      <div id="logo">
      <a href="../main/index"> <img src="../resources/simg/main22.png" width="210" style="margin-top: 10px; margin-left: 20px;"> </a>
    </div>
   <span id="navi"> 
    <a href="../product/pro_bestlist" style="color: red;"> BEST ITEM </a> &nbsp;
    <a href="../product/pro_newlist" style="font-weight: bolder;"> NEW5% </a> &nbsp;
    <a href="../product/pro_list?dcode=p01"> OUTER </a> &nbsp;
    <a href="../product/pro_list?dcode=p02"> TOP </a> &nbsp;
    <a href="../product/pro_list?dcode=p03"> BOTTOM </a> &nbsp;
    <a href="../product/pro_list?dcode=p04"> SKIRT </a> &nbsp;
    <a href="../product/pro_list?dcode=p05"> DRESS </a> &nbsp;
   <span id="my2" style="display:inline-block; "> 
     <a href="../" style="text-decoration: none; color: black; font-weight: bolder"> COMMUNITY ∨ </a>&nbsp;
        <ul id="myinfo2">
          <li> <a href="../gongji/list" style="text-decoration: none; color: black;"> NOTICE</a></li>
          <li> <a href="../faq/faq_list" style="text-decoration: none; color: black;"> FAQ </a></li>
          <li> <a href="../" style="text-decoration: none; color: black;"> EVENT </a></li>
        </ul>
     </span>
    </span>
          <div id="outer">  <!-- 검색창 -->
            <input type="text" id="search" name="search">
            <img src="../resources/simg/ss.png" width="16px" valign="middle" style="float: right;">          
          </div>
          </div>
          </nav>
  <decorator:body/>
    
 <footer> <!-- 쇼핑몰 관련-->
<div id="foot1" style="float: left; width: 33%; padding:10px; margin-top: 15px;"> <!-- 1 -->
  <span style="font-size: 13px; font-weight: bold;">
  CUSTOMER CENTER
  </span>
  <p>
  <span style="font-size: 30px; font-weight: bold;">
  070-8691-7777
  </span> <p>
  <div style="font-size: 12px; ">
MON - FRIAM 10:00 - PM 5:00 <p>
LUNCH TIMEPM 1:00 - PM 2:00 <p>
SAT, SUN, <span style="color: red;"> HOLIDAY CLOSED </span> <p>
  </div>
</div>

<div id="foot2" style="float: left; width: 33%; padding:10px; margin-top: 15px; text-align: left;"> <!-- 2 -->
   <span>
  <span style="font-size: 13px; font-weight: bold;"> ACCOUNT INFO </span> <p>
  <div style="font-size: 12px;">   
     농협은행 302-0643-7948-77

      예금주 [Amitie]
</div>
 </span>
</div>

<div id="foot3" style="float: right; width: 33%; padding:10px; margin-top: 15px;"> <!-- 2 -->
<div style="font-size: 12px;">
<span style="font-weight: bold; font-size: 12px; color: black;">HOME</span> 상호명 Amitie 대표전화 010-4406-7777 <p>
<span style="font-weight: bold; font-size: 12px; color: black;">COMPANY</span> 개인정보관리책임자 Amitie(amitie@naver.com) <p>
<span style="font-weight: bold; font-size: 12px; color: black;">AGREEMENT</span> 통신판매업신고 2018-경기도청-7770 <p>
<u>
<span style="font-weight: bold; font-size: 12px; color: black;">PRIVACY</span></u>
 사업자등록번호722-00-7777 [사업자정보확인] <p>
</div>  
</div>
 </footer>
 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>