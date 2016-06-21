<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/header.jsp" %>
 <%--      <%
	String cp = request.getContextPath();
	System.out.println(cp);
	HttpSession sessions = request.getSession();
	
	   
%> --%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>bootstrap template</title>

    <!-- Bootstrap -->
    <link href="<%=cp%>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- font awesome -->
    <link rel="stylesheet" href="css/font-awesome.min.css" media="screen" title="no title" charset="utf-8">
    <!-- Custom style -->
    <link rel="stylesheet" href="css/style.css" media="screen" title="no title" charset="utf-8">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>


      <article class="container">
        <div class="page-header">
          <h1>회원정보수정 <small>The Classic</small></h1>
        </div>
        <div class="col-md-6 col-md-offset-3">
          <form role="form" method="post">
           	<div class="form-group">
              <label for="uid">아이디 </label>
              <input type="text" class="form-control" name="uid" id="uuid" value="value" readonly>
            </div>
            <script>
            document.getElementById("uuid").setAttribute("value","<%=request.getAttribute("uID")%>");
           	//document.getElementById("uuid").setAttribute("value","nana")
			</script> 
            <div class="form-group">
              <label for="uname">닉네임</label>&nbsp;&nbsp;<font color="red"><span id="duplicateResultname"></span></font>
              <input type="text" class="form-control" name="uname" id="uname" placeholder="닉네임을 입력해 주세요">
            </div>
            <div class="form-group">
              <label for="upw">비밀번호</label>
              <input type="password" class="form-control" name="upw" id="upw" placeholder="비밀번호">
            </div>
            <div class="form-group">
              <label for="upw2">비밀번호 확인</label>
              <input type="password" class="form-control" name="upw2"  id="upw2" placeholder="비밀번호 확인">
              <p class="help-block">비밀번호 확인을 위해 다시한번 입력 해 주세요</p>
            </div>
            
             <div class="form-group">
              <label for="InputEmail1">이메일 주소</label>
              <input type="text" class="form-control" id="InputEmail" placeholder="이메일 주소" readonly>
            </div>
            <div class="form-group text-center">
              <button type="submit" class="btn btn-info">정보수정<i class="fa fa-check spaceLeft"></i></button>
              <button type="submit" class="btn btn-warning" formmethod="get" formaction="/TheClassic/">수정취소<i class="fa fa-times spaceLeft"></i></button>
            </div>
          </form>
        </div>

       
          <hr>
    
      </article>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function(){
           
           if($("#uid").val() != ""){
                $("#uid").keyup();
            };
            
            $("#uid").keyup(function(){
               
               
                $.ajax({
                type:'post',
                url:'/TheClassic/user/checkDup',
                headers: { 
                      "Content-Type": "application/json",
                      "X-HTTP-Method-Override": "POST" },
                dataType:'text',
                data:JSON.stringify({uid:$("#uid").val()}),
                success:function(result){
                   if($("#uid").val()==""){
                      $("#duplicateResult").text(" ")
                   }
                   else if(result == 'SUCCESS'){
                      $("#duplicateResult").text("사용 가능한 아이디 입니다.")
                   }
                   else{
                      $("#duplicateResult").text("이미 사용 중인 아이디 입니다.")
                   }
             }});
                
            });
            if($("#uname").val() != ""){
                $("#uname").keyup();
            };
            $("#uname").keyup(function(){
               
               
               $.ajax({
               type:'post',
               url:'/TheClassic/user/checkDupname',
               headers: { 
                     "Content-Type": "application/json",
                     "X-HTTP-Method-Override": "POST" },
               dataType:'text',
               data:JSON.stringify({uname:$("#uname").val()}),
               success:function(result){
                  if($("#uname").val()==""){
                      $("#duplicateResultname").text(" ")
                   }
                  else if(result == 'SUCCESS'){
                     $("#duplicateResultname").text("사용 가능한 닉네임 입니다.")
                  }
                  else{
                     $("#duplicateResultname").text("이미 사용 중인 닉네임 입니다.")
                  }
            }});
               
           });
            if($("#upw").val() != ""){
                $("#upw").keyup();
                $("#upw2").keyup();
            };
            $("#upw").keyup(function(){
               if($("#upw").val() == ""){
                  $("#pwcheck").text(" ")
               }
               else if($("#upw").val()==$("#upw2").val()){
                  $("#pwcheck").text("입력한 비밀번호가 동일합니다")
                  
               }else{
                  $("#pwcheck").text("입력한 비밀번호가 다릅니다.")
               }
            
            
            });
            $("#upw2").keyup(function(){
               if($("#upw").val() == ""){
                  $("#pwcheck").text(" ")
               }
               else if($("#upw").val()==$("#upw2").val()){
                  $("#pwcheck").text("입력한 비밀번호가 동일합니다")
               }
               else{
                  $("#pwcheck").text("입력한 비밀번호가 다릅니다.")
               }
            
            
            });
            
            
            
            
            
            
            
            
            
            
            
            
            });
           
        
         </script>
  </body>
</html>
