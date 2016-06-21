<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="include/header.jsp" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>The Classic 홈페이지에 오신 것을 환영합니다.</title>



<head>
<style>
@font-face {
   font-family: NanumGothic;
   weight: 300;
   src: url(/TheClassic/resources/Nanum/nanumbarungothicregular.eot);
   src: local('※'), url(/TheClassic/resources/Nanum/nanumbarungothicregular.woff) format('woff');
}

body, html {
   font-family: NanumGothic;
   font-style: normal;
   color:black;
}
div{
font-famliy:NanumGothic;
font-style:normal;
color:black;
}
</style>
<script type="text/javascript">
 function changeSigun(){
    var areacode = document.getElementsById("contentType");
    
    $.ajax({
           type : "GET",
       url : "http://localhost:8080/project/getsiguncode.ajax",
       data : $('#searchbox').val(),
       contentType : "application/x-www-form-urlencoded; charset=UTF-8",
           success: function(data) {
               if(data != null)    {
                  // ....
               } else {
                  // ....
               }
           }
       });
    
 }


</script>
<!-- jQuery library (served from Google) -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<!-- bxSlider Javascript file -->
<script src="/TheClassic/resources/bootstrap/js/jquery.bxslider.min.js"></script>
<!-- bxSlider CSS file -->
<link href="/TheClassic/resources/bootstrap/css/jquery.bxslider.css" rel="stylesheet" />

</head>
<body style="font-family: NanumGothic; background-color:white; font-style: normal;">

   



   <script>
   $(document).ready(function(){
   $('.bxslider').bxSlider({
        mode:'horizontal', //default : 'horizontal', options: 'horizontal', 'vertical', 'fade'
        speed:1000, //default:500 이미지변환 속도
        auto: true, //default:false 자동 시작
        captions: true, // 이미지의 title 속성이 노출된다.
        autoControls: true, //default:false 정지,시작 콘트롤 노출, css 수정이 필요
      });
   });
   </script>




   <div class="jumbotron" style="background-color:white;" >
      <div class="container" style="background-color:white;">  
      
      <div class="row" align="center"   class="center">
     <div class="col-md-3"></div>
     <div class="col-md-5">
                        
                           <form class="form-inline" role="form2" name="f2" id="searchForm2" method="post"  action="/TheClassic/search/tourResult2">
                           <div class="form-group" >
                           <font size=4>키워드 검색 :</font>
                           
                               <input class="form-control input-lg" type="text" size="40" style="width:70%;" id="keyword" name="keyword"/>
                                 </div>
                                 </form>
                                 
                                 </div>
                        <div class="col-md-1">      
                           <button type="submit" class="btn btn-info btn-lg" id="search2">검색</button>
                           
                     </div>
                     <div class="col-md-3"></div>
               
   
      </div>
      <hr>
        <ul class="bxslider" style="width:auto; height:auto;">
      <li style="width:70%;">
      <img src="/TheClassic/resources/images/main1.png" width=100% height=100% class="img-responsive" ></li>
      <li style="width:70%;">
      <img src="/TheClassic/resources/images/main2.png" width=100% height=100% class="img-responsive" ></li>
     <li style="width:70%;">
      <img src="/TheClassic/resources/images/main3.png" width=100% height=100% class="img-responsive" ></li>
      </ul>
      </div>
     <%@include file="include/footer.jsp" %>
      </div>
      
     
      
      
      
      </div>
      </div>
      
        <script>
$(document).ready(function(){
   
   var formObj2 = $("form[role='form2']");

   $("#search2").on("click", function() {
      
      if($("#keyword").val()!=""){
         formObj2.attr("action", "/TheClassic/search/tourResult2");

         formObj2.attr("method", "post");
         formObj2.submit();
      }else{
         alert("키워드를 입력해 주세요.");
      }
      
      
      
      
      
   });
      
      
      
      
   });
   
   
   
   
   

</script>
  