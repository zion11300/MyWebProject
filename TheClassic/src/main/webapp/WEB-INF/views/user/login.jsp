<%@ page contentType="text/html; charset=euc-kr"%>
<%@page import="java.io.PrintWriter"%>


<html xmlns:fb="http://ogp.me/ns/fb#">
<html>
<head>
<title>���θ�</title>
<script>

   function check() {
      var id = loginform.MEMBER_ID.value;
      var pass = loginform.MEMBER_PW.value;

      if (id.length == 0) {
         alert("���̵� �Է��ϼ���.");
         loginform.MEMBER_ID.focus();
         return false;
      }
      if (pass.length == 0) {
         alert("��й�ȣ�� �Է��ϼ���.");
         loginform.MEMBER_PW.focus();
         return false;
      }

      return true;
   }
   function openConfirmId(loginform) {
      var url = "./MemberFind.me";
      open(url, "confirm", "toolbar=no,location=no,status=no,menubar=no,"
            + "scrollbars=no,resizable=no,width=450px,height=300");
   }
</script>
</head>
<body>
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
function statusChangeCallback(response) {
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
  }
  
    function checkLoginState() {
    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
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
      //document.getElementById('status').innerHTML ='Thanks for logging in, ' + response.name + '!';
      
      document.getElementById("id").innerHTML="hi "+response.name; //p�±� id�� ����� �̸� ���.
      
      //setTimeout("location.href='../'",3000); //�α��� �� ������ �̵�
      //response.name�� ���ǿ� ��������.
      //window.open('../?name='+ name);
      //location.href='../?name='+sname; 
      location.href="../fb_login?name="+response.name;
      //location.href='../?name='
    });
  }
  
</script>
<!-- mine -->
   <div class="main-container center">

         <h2 align=center>The Classic Login</h2>
   
      <form action="/TheClassic/user/login" method=post name=loginform
         onsubmit="return check()">
      <br /><br />
            <table width="400" border="0" cellspacing="0" cellpadding="0" align="center">
               <tr>
                  <td bgcolor="f6f6f6">
                     <table width="400" border="0" cellspacing="4" cellpadding="0">
                        <tr>
                           <td valign="top" bgcolor="#FFFFFF">
                              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                 <tr>
                                    <td align="center">
                                       <table cellpadding=0 cellspacing=0 border=0>
                                          <tr>
                                             <td width=73>ID</td>
                                             <td width=9>:</td>
                                             <td width=103><input type=text name="uid"
                                                size=12 maxlength=20></td>
                                             <td width=66 rowspan=3><input type="submit"
                                                value="�α���" class="btn btn-default"></td>
                                             <td width=26 rowspan=3>
                                             <!-- fb login btn --><fb:login-button scope="public_profile,email" onlogin="checkLoginState();"></fb:login-button>
                                             </td>
                                          </tr>
                                          <tr>
                                             <td height=4 colspan=3></td>
                                          </tr>
                                          <tr>
                                             <td width=73>Passward</td>
                                             <td width=9>:</td>
                                             <td width=103><input type=password name="upw"
                                                size=12 maxlength=12></td>
                                          </tr>
                                          <tr>
                                             <td height=35 colspan=6 align="center"><input
                                                type="button" value="ȸ������"
                                                onclick="javascript:window.location='./join'"
                                                class="btn btn-default"> <a href="#"> <!-- <input
                                                   type="button" value="���̵�/��й�ȣ ã��"
                                                   onclick="openConfirmId(this.form)"
                                                   class="btn btn-default"> -->
                                             </a></td>
                                          </tr>
                                       </table>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td style="padding: 15 0 15 70;">
                                       <table width="400" border="0" cellspacing="0"
                                          cellpadding="0">
                                          <tr>
                                             <td width="8">
                                             </td>
                                             <td width="392"><font size=2 color="565656">
                                                   ���̵� ���� ��� 'ȸ������'�� Ŭ���Ͻʽÿ�. </font></td>
                                          </tr>
                                          <tr>
                                             <!-- <td><img src="#" width="8" height="7"></td>
                                             <td><font size=2 color="565656"> ���̵� �Ǵ� ��й�ȣ��
                                                   �ؾ������ ��� '���̵�/��й�ȣ ã��'�� Ŭ���Ͻʽÿ�. </font></td> -->
                                          </tr>
                                       </table>
                                    </td>
                                 </tr>
                              </table>
                           </td>
                        </tr>
                     </table>
                  </td>
               </tr>
            </table>
      </form>
       <p id="id"></p> <!-- �α��� ó���Ǹ� �߻��Ǵ� �ܶ�-->
       <%request.getParameter("name");%>
      </div>
      <!--    </tr> -->
      <!--                </table> ȸ�� �α���
            </td>
         </tr>
      </table> -->
   <div>${uid} ${upw}</div>
</body>
</html>