<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
@import url('https://fonts.googleapis.com/css2?family=Song+Myung&display=swap');
 /* 검색창 만들기 끝 */
    #image {
       width:100%;
       height:500px;
       background:silver;
       margin-top: 105px;
    }
    
    #image #outer {
       width:100%;
       height:500px;
       overflow:hidden; 
       
       z-index: 8; /* 상위 속성 */
    }
    #image #inner {
       width:100%;
       height:500px;
    }
    
    section { /* section 기본  */
       width:1400px;
       height:100%;
       margin:auto;
       
    }
    section #ar2 { /* 사분할 BEST ITEM | NEW ITEM | ACC | REVIEW EVENT */
       width:100%;
       height:300px;
       margin-top:30px;
       background:white;
    }
    
    .scroll-image{
    margin-top:30px;
    display: inline-block;  
    justify-content: center;
    padding: 20px;
    margin-left: 10px;
    }
    
    section #ar3 { /* 사진 3장씩 */
       width:100%;
       height:1650px;
       background:white;
       margin-top: 200px;
       text-align: center;
    }
    
    .col{ /* 부트스트랩 */
      width: 430px;
      height: 660px;
    }
       
    
    h1 {  /* 글자 hover */
  color: #000;
  display:inline-block; 
  font-size:15px;
  margin:0;
  text-transform:uppercase; }
  
   h1:after {
  display:block;
  content: '';
  border-bottom: solid 3px #ea2129;  
  transform: scaleX(0);  
  transition: transform 250ms ease-in-out;
}

   h1:hover:after { transform: scaleX(1); }

    
    
    section #ar4 {
       width:100%;
       height:1650px;
       background:white;
       margin:auto;
       text-align: center;
    }
/*     section #ar5 { /* 특가처리 주석 */
       width:100%;
       height:800px;
       background:#BDBDBD;
       margin:auto;
    } */
    

    /* 퀵 메뉴 */
    div, ul, li {
    -webkit-box-sizing: border-box;-moz-box-sizing: border-box;box-sizing: border-box;padding:0;margin:0
    }
    a {
    text-decoration:none;
    }

.quickmenu {position:absolute;width:80px;top:50%;margin-top:-20px;right:10px;background:#fff; }
.quickmenu ul {position:relative;float:left;width:100%;display:inline-block;*display:inline;border:1px solid #ddd;}
.quickmenu ul li {float:left;width:100%;border-bottom:1px solid #ddd;text-align:center;display:inline-block;*display:inline;}
.quickmenu ul li a {position:relative;float:left;width:100%;height:20px;line-height:20px;text-align:center;color:#999;font-size:7pt;}
.quickmenu ul li a:hover {color:#BDBDBD;}
.quickmenu ul li:last-child {border-bottom:0;}

.content {position:relative;min-height:1000px;}
    

</style>
<script>
  $(function()
  {
	  // 슬라이드 그림 움직이기
	  function mainmove()
	  {
	    ss=setInterval(function()
	    {
	    	$("#image #inner").animate(
 		    {
 		    	marginLeft:"-1600px"
 		    },2000,function()
 		           {
 		    	       $("#image #inner").css("margin-left","0px");
 		    	       $("#image #inner img").eq(0).insertAfter($("#image #inner img").eq(4));
 		           });
	    },4000);
	  }
	  mainmove();
	  
	  $("#image #outer").mouseover(function()
	  {
		  clearInterval(ss);
	  });
	  $("#image #outer").mouseout(function()
	  {
		  mainmove();
	  });
  });
  
  /* 퀵메뉴 */
  $(document).ready(function(){
	  var currentPosition = parseInt($(".quickmenu").css("top"));
	  $(window).scroll(function() {
	    var position = $(window).scrollTop(); 
	    $(".quickmenu").stop().animate({"top":position+currentPosition+"px"},1000);
	  });
	}); 
  
</script>  
</head> 
    <div id="image"><!-- 그림슬라이드흠 -->
      <div id="outer">
        <div id="inner">
          <img src="../resources/main/pic6.png" width="100%" height="500">
          <img src="../resources/main/pic5.png" width="100%" height="500">
          <img src="../resources/main/pic4.png" width="100%" height="500">
          <img src="../resources/main/pic3.png" width="100%" height="500">
          <img src="../resources/main/pic2.png" width="100%" height="500">
        </div>
      </div>
    </div> 
    
    
    <section>           <!-- 현재페이지의 필요한 내용 -->  <!-- article는 section내의 하나의 항목 -->
    
    
      <article id="ar2"> 
        
               <!-- 퀵 메뉴  -->
             <div class="quickmenu">
  <ul>
    <li><a href="../faq/faq_list">FAQ</a> </li>
    <li><a href="#">1:1문의</a></li>
    <li><a href="#">후기</a></li>
  </ul>
            </div>
            
   <div class="scroll-image">
    <img src="../resources/main/best5.png" width="300" height="300" style="margin-right: 20px;">&nbsp;
    <img src="../resources/main/best2.png" width="300" height="300" style="margin-right: 20px;">&nbsp;
    <a href="../mypage/myreview"><img src="../resources/main/best7.png" width="300" height="300" style="margin-right: 20px;"></a>&nbsp;
    <a href="../gongji/list"><img src="../resources/main/best4.png" width="300" height="300" style="margin-right: 20px;"></a>&nbsp;
  </div>

      </article> <!-- 최신 상품 -->
      
      
      <article id="ar3"> 
      
      <h1 class="fromcenter"> BEST ITEM </h1> <p>
      
      
      <div class="row row-cols-1 row-cols-md-3 g-4">
  <div class="col">
    <div class="card">
      <img src="https://nimage.g-enews.com/phpwas/restmb_allidxmake.php?idx=5&simg=2020011314253409585aca1a8c21a210178107185.jpg" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">[MD추천] 데일리 자수 가디건</h5>
        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
      </div>
    </div>
  </div>
  <div class="col">
    <div class="card">
      <img src=https://cdn.speconomy.com/news/photo/201904/20190405_1_bodyimg_201400.jpg class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">[MD추천] 데일리 원피스</h5>
        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
      </div>
    </div>
  </div>
  <div class="col">
    <div class="card">
      <img src= https://m.w-girlz.co.kr/web/product/big/202106/d6fc858227931b4ec2823f41853f5575.jpg class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">데일리 자수 가디건</h5>
        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content.</p>
      </div>
    </div>
  </div>
  <div class="col">
    <div class="card">
      <img src=http://openimage.interpark.com/goods_image_big/6/5/1/6/8627706516_l.jpg class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">데일리 자수 가디건</h5>
        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
      </div>
    </div>
  </div>
    <div class="col">
    <div class="card">
      <img src= https://m.gababa.co.kr/web/product/big/202201/8fc0bdc50eb52816b988511b640f7a47.jpg class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">데일리 자수 가디건</h5>
        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content.</p>
      </div>
    </div>
  </div>
    <div class="col">
    <div class="card">
      <img src= https://static.coupangcdn.com/image/vendor_inventory/7ca2/fc14c6b512fca257ef54f58fd21df51bc390d0da65efa5320255b2148f28.jpg class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">데일리 자수 가디건</h5>
        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content.</p>
      </div>
    </div>
  </div>
   
</div>
      
     
     
      </article> <!-- 인기 상품 -->
      
      <article id="ar4"> 
      <h1 class="fromcenter"> NEW ITEM </h1> <p>
     
           <div class="row row-cols-1 row-cols-md-3 g-4">
  <div class="col">
    <div class="card">
      <img src="https://nimage.g-enews.com/phpwas/restmb_allidxmake.php?idx=5&simg=2020011314253409585aca1a8c21a210178107185.jpg" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">[MD추천] 데일리 자수 가디건</h5>
        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
      </div>
    </div>
  </div>
  <div class="col">
    <div class="card">
      <img src=https://cdn.speconomy.com/news/photo/201904/20190405_1_bodyimg_201400.jpg class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">[MD추천] 데일리 원피스</h5>
        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
      </div>
    </div>
  </div>
  <div class="col">
    <div class="card">
      <img src= https://m.w-girlz.co.kr/web/product/big/202106/d6fc858227931b4ec2823f41853f5575.jpg class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">Card title</h5>
        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content.</p>
      </div>
    </div>
  </div>
  <div class="col">
    <div class="card">
      <img src=http://openimage.interpark.com/goods_image_big/6/5/1/6/8627706516_l.jpg class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">데일리 자수 가디건</h5>
        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
      </div>
    </div>
  </div>
    <div class="col">
    <div class="card">
      <img src= https://m.gababa.co.kr/web/product/big/202201/8fc0bdc50eb52816b988511b640f7a47.jpg class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">데일리 자수 가디건</h5>
        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content.</p>
      </div>
    </div>
  </div>
    <div class="col">
    <div class="card">
      <img src= https://static.coupangcdn.com/image/vendor_inventory/7ca2/fc14c6b512fca257ef54f58fd21df51bc390d0da65efa5320255b2148f28.jpg class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">데일리 자수 가디건</h5>
        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content.</p>
      </div>
    </div>
  </div>
   
</div>
<!--       </article> 특가 상품
      
      <article id="ar5"> 이벤트 상품 5개 
      </article> 이벤트상품 -->
      
    </section>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
    </html>
  