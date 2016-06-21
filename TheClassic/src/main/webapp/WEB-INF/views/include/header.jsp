<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
   System.out.println(cp);
   HttpSession sessions = request.getSession();
   int flag = 0;
   String uname = null;
   if(sessions.getAttribute("login_method")!= null){
      flag =  Integer.parseInt(sessions.getAttribute("login_method").toString());}
   if(sessions.getAttribute("uname") != null){
    uname = sessions.getAttribute("uname").toString();}
%>
<html xmlns:fb="http://ogp.me/ns/fb#">
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>The Classic 홈페이지에 오신걸 환영합니다.</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.4 -->
    <link href="/TheClassic/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="/TheClassic/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
    <link href="/TheClassic/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <link rel="shortcut icon" type="image/x-icon" href="/TheClassic/resources/img/favicon.ico" />
     <link rel="icon" type="image/x-icon" href="/TheClassic/resources/img/favicon.ico" />
   <script src="http://code.jquery.com/jquery-2.1.1.min.js"
   type="text/javascript"></script>
   <script src="/TheClassic/resources/bootstrap/js/bootstrap.min.js"></script>
    <script  type="text/javascript"  src="<%=cp%>/resources/bootstrap/js/catSearch.js"></script>
    <!-- kakao -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>   
   <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
 
    <!-- kakao -->
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
    
    
    @import url(http://fonts.googleapis.com/css?family=Roboto);

/****** LOGIN MODAL ******/
.loginmodal-container {
  padding: 30px;
  max-width: 350px;
  width: 100% !important;
  background-color: #F7F7F7;
  margin: 0 auto;
  border-radius: 2px;
  box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
  overflow: hidden;
  font-family: roboto;
}

.loginmodal-container h1 {
  text-align: center;
  font-size: 1.8em;
  font-family: roboto;
}

.loginmodal-container input[type=submit] {
  width: 100%;
  display: block;
  margin-bottom: 10px;
  position: relative;
}
.loginmodal-container a {
  width: 50%;
  display: block;
  margin-bottom: 10px;
  position: relative;
}
.loginmodal-container input[type=text], input[type=password] {
  height: 44px;
  font-size: 16px;
  width: 100%;
  margin-bottom: 10px;
  -webkit-appearance: none;
  background: #fff;
  border: 1px solid #d9d9d9;
  border-top: 1px solid #c0c0c0;
  /* border-radius: 2px; */
  padding: 0 8px;
  box-sizing: border-box;
  -moz-box-sizing: border-box;
}

.loginmodal-container input[type=text]:hover, input[type=password]:hover {
  border: 1px solid #b9b9b9;
  border-top: 1px solid #a0a0a0;
  -moz-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  -webkit-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
}

.loginmodal {
  text-align: center;
  font-size: 14px;
  font-family: 'Arial', sans-serif;
  font-weight: 700;
  height: 36px;
  padding: 0 8px;
/* border-radius: 3px; */
/* -webkit-user-select: none;
  user-select: none; */
}

.loginmodal-submit {
  /* border: 1px solid #3079ed; */
  border: 0px;
  color: #fff;
  text-shadow: 0 1px rgba(0,0,0,0.1); 
  background-color: #4d90fe;
  padding: 17px 0px;
  font-family: roboto;
  font-size: 14px;
  /* background-image: -webkit-gradient(linear, 0 0, 0 100%,   from(#4d90fe), to(#4787ed)); */
}

.loginmodal-submit:hover {
  /* border: 1px solid #2f5bb7; */
  border: 0px;
  text-shadow: 0 1px rgba(0,0,0,0.3);
  background-color: #357ae8;
  /* background-image: -webkit-gradient(linear, 0 0, 0 100%,   from(#4d90fe), to(#357ae8)); */
}

.loginmodal-container a {
  text-decoration: none;
  color: #666;
  font-weight: 400;
  text-align: center;
  display: inline-block;
  opacity: 0.6;
  transition: opacity ease 0.5s;
} 

.login-help{
  font-size: 12px;
}</style>
  </head>
      <!-- jQuery 2.1.4 -->
    <script src="<%=cp%>/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    
  <body class="skin-blue sidebar-mini">
  <!-- mine -->
     <div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.6&appId=1727975574126006";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

<script>
 

/*function statusChangeCallback(response) {
    console.log('statusChangeCallback');
    console.log(response);
   
    if (response.status === 'connected') {
      // Logged into your app and Facebook.
      testAPI();
    } else if (response.status === 'not_authorized') {
      // The person is logged into Facebook, but not your app.
      document.getElementById('status').innerHTML = 'Please log ' +
        'into this app.';
    } else {
      // The person is not logged into Facebook, so we are not sure if
      // they are logged into this app or not.
      document.getElementById('status').innerHTML = 'Please log ' +
        'into Facebook.';
    }
  }*/
  
    function checkLoginState() {
    FB.getLoginStatus(function(response) {
      //statusChangeCallback(response);
       FB.login(function(response) {
           console.log('fb');
              console.log(response);
            if (response.status === 'connected') {
              // Logged into your app and Facebook.
               testAPI();
            } else if (response.status === 'not_authorized') {
              // The person is logged into Facebook, but not your app.
               document.getElementById('status').innerHTML = 'Please log ' +
                  'into this app.';
            } else {
              // The person is not logged into Facebook, so we're not sure if
              // they are logged into this app or not.
               document.getElementById('status').innerHTML = 'Please log ' +
                  'into Facebook.';
            }
          });
    });
  }
  
  function checkLogoutState(){
  FB.logout(function(response) {
   document.getElementById("id").innerHTML=" logged out!";
});
  }
   window.fbAsyncInit = function() {
  FB.init({
    appId      : '1727975574126006',
    cookie     : true,  // enable cookies to allow the server to access 
                        // the session
    xfbml      : true,  // parse social plugins on this page
    version    : 'v2.2' // use version 2.2
  });
  
   
  }
   
  
   function testAPI() {
		  var name;
	    console.log('Welcome!  Fetching your information.... ');
	    FB.api('/me', function(response) {
	    	sname=response.name;
	      console.log('Successful login for: ' + response.name);
	   // form
	  	var form = document.createElement("form");     
	  	form.setAttribute("method","post");                    
	  	form.setAttribute("action","./fb_login");   
	    
	  	document.body.appendChild(form);                        
	  	 
	  	//input
	  	var input_id = document.createElement("input");  
	  	input_id.setAttribute("type", "hidden");                 
	  	input_id.setAttribute("name", "name");                        
	  	input_id.setAttribute("value", response.name);                          
	  	form.appendChild(input_id);
	  
	  	alert(response.name + '님 환영합니다.');
	  	//폼전송
	  	form.submit();  
	   
	    });
	  }
  
</script>
<!-- mine -->
  
  <nav class="navbar navbar-default">
   <div class="container-fluid">
      <!-- Brand and toggle get grouped for better mobile display -->
      <div class="navbar-header">
         <button type="button" class="navbar-toggle collapsed"
            data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
            <span class="sr-only">Toggle navigation</span> <span
               class="icon-bar"></span> <span class="icon-bar"></span> <span
               class="icon-bar"></span>
         </button>
         <a class="navbar-brand" href="/TheClassic/">TheClassic</a>
      </div>

      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse"
         id="bs-example-navbar-collapse-1">
         <ul class="nav navbar-nav">
            <li><a href="/TheClassic/notice/list">공지사항 
            <span class="sr-only">(current)</span></a></li>
            <li><a href="/TheClassic/search/search">검색</a></li>
            <li class="dropdown"><a href="#" class="dropdown-toggle"
               data-toggle="dropdown" role="button" aria-expanded="false">카테고리 게시판
                  <span class="caret"></span>
            </a>
               <ul class="dropdown-menu" role="menu">
                  <li><a href="/TheClassic/tradper/list">전통공연</a></li>
                  <li><a href="/TheClassic/theater/list">연극</a></li>
                  <li><a href="/TheClassic/musical/list">뮤지컬</a></li>
                  <li><a href="/TheClassic/opera/list">오페라</a></li>
                  <li><a href="/TheClassic/exhibit/list">전시회</a></li>
                  <li><a href="/TheClassic/expo/list">박람회</a></li>
                  <li><a href="/TheClassic/conven/list">컨벤션</a></li>
                  <li><a href="/TheClassic/dancing/list">무용</a></li>
                  <li><a href="/TheClassic/classic/list">클래식음악회</a></li>
                  <li><a href="/TheClassic/concert/list">대중콘서트</a></li>
                  <li><a href="/TheClassic/movie/list">영화</a></li>
                  <li><a href="/TheClassic/sport/list">스포츠경기</a></li>
                  <li><a href="/TheClassic/etc/list">기타행사</a></li>
                  
               </ul></li>
         </ul>
         <!-- <form class="navbar-form navbar-left" role="search">
            <div class="form-group">
               <input type="text" class="form-control" placeholder="Search">
            </div>
            <button type="submit" class="btn btn-default">Submit</button>
         </form> -->
         <ul class="nav navbar-nav navbar-right">
            <!--  <li><a>Link</a></li>  -->
            <% if(uname != null && flag == 1) {%>
            <li class="dropdown"><a href="#" class="dropdown-toggle"
               data-toggle="dropdown" role="button" aria-expanded="false">
               <img src="/TheClassic/resources/img/animated_favicon1.png" width="32" height="32" />
               <%=uname%>
                  <span class="caret"></span>
            </a>
            
               <ul class="dropdown-menu" role="menu">
                  <li><a href="/TheClassic/user/logout">Log out</a></li>
                  <li><a href="/TheClassic/user/fix">회원정보수정</a></li>
                  
               </ul></li>
                <%}else if( uname !=null
                && flag == 3){ %>
               <li class="dropdown"><a href="#" class="dropdown-toggle"
               data-toggle="dropdown" role="button" aria-expanded="false">
               <img src="/TheClassic/resources/images/facebook_icon.png" width="32" height="32" />
<%=uname %>
                  <span class="caret"></span></a>
            
               <ul class="dropdown-menu" role="menu">
                
                  <li><a href="/TheClassic/fb_login/logout">facebook Log out</a></li>
                  
               </ul></li>
               <%}else if(uname != null&& flag == 2){ %>
               <li class="dropdown"><a href="#" class="dropdown-toggle"
               data-toggle="dropdown" role="button" aria-expanded="false">
               <img src="/TheClassic/resources/images/kakaolink_btn_small.png" width="32" height="32" />
               <%=uname %>
                  <span class="caret"></span></a>
            
               <ul class="dropdown-menu" role="menu">
                 
                  <li><a href="/TheClassic/k_login/logout">kakao Log out</a></li>
                  
               </ul></li>
            <%} else { %>
            
            <li class="active">
            <a href="#" data-toggle="modal" data-target="#login-modal">로그인</a>

         <div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
            <div class="modal-dialog">
            <div class="loginmodal-container">
            <script>
            window.name = "test_target";
            </script>
               <h1>TheClassic 로그인</h1><br>
              <form action="/TheClassic/user/login" method=post name=loginform>
               <input type="text" id ="uid" name="uid" placeholder="Username">
               <input type="password" id = "upw" name="upw" placeholder="Password">
               
              </form>
              <input type="submit" name="login" id = "loginbtn" class="login loginmodal-submit" value="로그인">
             <a href="#" onclick="checkLoginState();"><img width="300" src="/TheClassic/resources/images/facebook.PNG"/></a>
              <div class="login-help">
      

               
               
                <a id="kakao-login-btn"></a> 
               <script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('a9bf7c6ba38c4088254aa9d72820cdb1');
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      size: 'large',

      success: function(authObj) {
        // 로그인 성공시, API를 호출합니다.
        Kakao.API.request({
          url: '/v1/user/me',
          success: function(res) {
            //alert(JSON.stringify(res));
            alert(res.properties.nickname+'님 환영합니다.');
            //location.href="./k_login?name="+res.properties.nickname;
        	var form = document.createElement("form");     
    	  	form.setAttribute("method","post");                    
    	  	form.setAttribute("action","./k_login");   
    	    
    	  	document.body.appendChild(form);                        
    	  	 
    	  	//input
    	  	var input_id = document.createElement("input");  
    	  	input_id.setAttribute("type", "hidden");                 
    	  	input_id.setAttribute("name", "name");                        
    	  	input_id.setAttribute("value", res.properties.nickname);                          
    	  	form.appendChild(input_id);
    	  
    	  	//폼전송
    	  	form.submit();  
          },
          fail: function(error) {
            alert(JSON.stringify(error));
          }
        });
      },
      fail: function(err) {
        alert(JSON.stringify(err));
      }
    });
  //]]>
</script>
<a class="join-modal" href="/TheClassic/user/join">회원가입</a>
              </div>
            </div>
         </div>
        </div>
        </li>
            <%} %>
         </ul>
      </div>
      <!-- /.navbar-collapse -->
   </div>
   <script>
   $(document).ready(function(){
      $("#loginbtn").on("click",function(){
         var uid = $("#uid").val();
         var upw = $("#upw").val();
                      
           $.ajax({
               type:'post',
               url:'/TheClassic/user/login',
               headers: { 
                     "Content-Type": "application/json",
                     "X-HTTP-Method-Override": "POST" },
               dataType:'text',
               data:JSON.stringify({uid:uid, upw:upw}),
               success:function(result){
                  console.log("result: " + result);
                  if(result == 'SUCCESS'){
                     alert("로그인 되었습니다.");
                     window.location.href = "${targetUrl}";
                  }
                  else{
                     alert("아이디 혹은 비밀번호를 확인해주세요");
                  }
            }});
      });
      
   });
   </script>
   <!-- /.container-fluid --> </nav>
   
   <%--  <div class="wrapper">
      
      <header class="main-header">
        <!-- Logo -->
        <a href="<%=cp%>/resources/index2.html" class="logo">
          <!-- mini logo for sidebar mini 50x50 pixels -->
          <span class="logo-mini"><b>A</b>LT</span>
          <!-- logo for regular state and mobile devices -->
          <span class="logo-lg"><b>The</b> Classic</span>
        </a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top" role="navigation">
          <!-- Sidebar toggle button-->
          <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <div class="navbar-custom-menu">
          
                    
          </div>
        </nav>
      </header>
      <!-- Left side column. contains the logo and sidebar -->
      <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
          <!-- Sidebar user panel -->
          <div class="user-panel">
            <div class="pull-left image">
              <img src="<%=cp%>/resources/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image" />
            </div>
            <div class="pull-left info">
              <p>User Name</p>

              <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
          </div>
          
          <!-- sidebar menu: : style can be found in sidebar.less -->
          <ul class="sidebar-menu">
            <li class="header">MAIN NAVIGATION</li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-dashboard"></i> <span>Dashboard</span> <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="<%=cp%>/resources/index.html"><i class="fa fa-circle-o"></i> Dashboard v1</a></li>
                <li><a href="<%=cp%>/resources/index2.html"><i class="fa fa-circle-o"></i> Dashboard v2</a></li>
              </ul>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-files-o"></i>
                <span>Layout Options</span>
                <span class=" -primary pull-right">4</span>
              </a>
              <ul class="treeview-menu">
                <li><a href="../layout/top-nav.html"><i class="fa fa-circle-o"></i> Top Navigation</a></li>
                <li><a href="../layout/boxed.html"><i class="fa fa-circle-o"></i> Boxed</a></li>
                <li><a href="../layout/fixed.html"><i class="fa fa-circle-o"></i> Fixed</a></li>
                <li><a href="../layout/collapsed-sidebar.html"><i class="fa fa-circle-o"></i> Collapsed Sidebar</a></li>
              </ul>
            </li>
            <li>
              <a href="../widgets.html">
                <i class="fa fa-th"></i> <span>Widgets</span> <small class=" pull-right bg-green">new</small>
              </a>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-pie-chart"></i>
                <span>Charts</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="../charts/chartjs.html"><i class="fa fa-circle-o"></i> ChartJS</a></li>
                <li><a href="../charts/morris.html"><i class="fa fa-circle-o"></i> Morris</a></li>
                <li><a href="../charts/flot.html"><i class="fa fa-circle-o"></i> Flot</a></li>
                <li><a href="../charts/inline.html"><i class="fa fa-circle-o"></i> Inline charts</a></li>
              </ul>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-laptop"></i>
                <span>UI Elements</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="../UI/general.html"><i class="fa fa-circle-o"></i> General</a></li>
                <li><a href="../UI/icons.html"><i class="fa fa-circle-o"></i> Icons</a></li>
                <li><a href="../UI/buttons.html"><i class="fa fa-circle-o"></i> Buttons</a></li>
                <li><a href="../UI/sliders.html"><i class="fa fa-circle-o"></i> Sliders</a></li>
                <li><a href="../UI/timeline.html"><i class="fa fa-circle-o"></i> Timeline</a></li>
                <li><a href="../UI/modals.html"><i class="fa fa-circle-o"></i> Modals</a></li>
              </ul>
            </li>
            
            <li class="treeview">
              <a href="#">
                <i class="fa fa-table"></i> <span>Tables</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="../tables/simple.html"><i class="fa fa-circle-o"></i> Simple tables</a></li>
                <li><a href="../tables/data.html"><i class="fa fa-circle-o"></i> Data tables</a></li>
              </ul>
            </li>
            <li>
              <a href="../calendar.html">
                <i class="fa fa-calendar"></i> <span>Calendar</span>
                <small class=" pull-right bg-red">3</small>
              </a>
            </li>
            <li>
              <a href="../mailbox/mailbox.html">
                <i class="fa fa-envelope"></i> <span>Mailbox</span>
                <small class=" pull-right bg-yellow">12</small>
              </a>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-folder"></i> <span>Examples</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="../examples/invoice.html"><i class="fa fa-circle-o"></i> Invoice</a></li>
                <li><a href="../examples/login.html"><i class="fa fa-circle-o"></i> Login</a></li>
                <li><a href="../examples/register.html"><i class="fa fa-circle-o"></i> Register</a></li>
                <li><a href="../examples/lockscreen.html"><i class="fa fa-circle-o"></i> Lockscreen</a></li>
                <li><a href="../examples/404.html"><i class="fa fa-circle-o"></i> 404 Error</a></li>
                <li><a href="../examples/500.html"><i class="fa fa-circle-o"></i> 500 Error</a></li>
                <li><a href="../examples/blank.html"><i class="fa fa-circle-o"></i> Blank Page</a></li>                
              </ul>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-share"></i> <span>Multilevel</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="#"><i class="fa fa-circle-o"></i> Level One</a></li>
                <li>
                  <a href="#"><i class="fa fa-circle-o"></i> Level One <i class="fa fa-angle-left pull-right"></i></a>
                  <ul class="treeview-menu">
                    <li><a href="#"><i class="fa fa-circle-o"></i> Level Two</a></li>
                    <li>
                      <a href="#"><i class="fa fa-circle-o"></i> Level Two <i class="fa fa-angle-left pull-right"></i></a>
                      <ul class="treeview-menu">
                        <li><a href="#"><i class="fa fa-circle-o"></i> Level Three</a></li>
                        <li><a href="#"><i class="fa fa-circle-o"></i> Level Three</a></li>
                      </ul>
                    </li>
                  </ul>
                </li>
                <li><a href="#"><i class="fa fa-circle-o"></i> Level One</a></li>
              </ul>
            </li>
            <li><a href="<%=cp%>/resources/documentation/index.html"><i class="fa fa-book"></i> <span>Documentation</span></a></li>
            <li class="header">S</li>
            <li><a href="#"><i class="fa fa-circle-o text-red"></i> <span>Important</span></a></li>
            <li><a href="#"><i class="fa fa-circle-o text-yellow"></i> <span>Warning</span></a></li>
            <li><a href="#"><i class="fa fa-circle-o text-aqua"></i> <span>Information</span></a></li>
          </ul>
        </section>
        <!-- /.sidebar -->
      </aside>

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            Category Board
            <small>Preview</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="#">Category board</a></li>
            <li class="active">Opera</li>
          </ol>
        </section> --%>