<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">

<link href="../dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="../dist/css/jumbotron.css" rel="stylesheet">
<link href="../dist/css/main.css" rel="stylesheet">
<link href="../dist/css/star-rating.min.css" rel="stylesheet">
<link href="../dist/css/bootstrap-select.min.css" rel="stylesheet">
<link href="../dist/css/bootstrap.css" rel="stylesheet">
<script>
   function check() {
      var id = joinform.MEMBER_ID.value;
      var password1 = joinform.MEMBER_PW.value;
      var password2 = joinform.MEMBER_PW2.value;
      var email1 = joinform.MEMBER_EMAIL1.value;
      var email2 = joinform.MEMBER_EMAIL2.value;
      var phone = joinform.MEMBER_PHONE.value;
      var addr1 = joinform.MEMBER_ADDR1.value;
      var addr2 = joinform.MEMBER_ADDR2.value;
      var mobile = joinform.MEMBER_MOBILE.value;

      var forms = document.getElementById("joinform");

      /*if ((forms.MEMBER_NAME.value == "")
            || (forms.MEMBER_NAME.value.length <= 1)) {
         alert("이름을 제대로 입력해 주세요.");
         forms.MEMBER_NAME.focus();
         return false;
      }*/
      if (id.length == 0) {
         alert("아이디를 입력하세요.");
         joinform.MEMBER_ID.focus();
         return false;
      }
      if (password1.length == 0) {
         alert("비밀번호를 입력하세요.");
         joinform.MEMBER_PW.focus();
         return false;
      }
      if (password1 != password2) {
         alert("비밀번호가 일치하지 않습니다.");
         joinform.MEMBER_PW.value = "";
         joinform.MEMBER_PW2.value = "";
         joinform.MEMBER_PW.focus();
         return false;
      }
      if (email1.length == 0 || email2.length == 0) {
         alert("이메일을 제대로 입력하세요.");
         joinform.MEMBER_EMAIL1.focus();
         return false;
      }
   /*    if ((forms.MEMBER_JUMIN1.value == "")
            || (forms.MEMBER_JUMIN1.value.length < 6)) {
         alert("주민등록번호 앞의 6자리를 입력해 주세요.");
         forms.MEMBER_JUMIN1.focus();
         return false;
      }
      if ((forms.MEMBER_JUMIN2.value == "")
            || (forms.MEMBER_JUMIN2.value.length < 7)) {
         alert("주민등록번호 뒤의 7자리를 입력해 주세요.");
         forms.MEMBER_JUMIN2.focus();
         return false;
      }
      if (email1.length == 0 || email2.length == 0) {
         alert("이메일을 제대로 입력하세요.");
         joinform.MEMBER_EMAIL1.focus();
         return false;
      }
      if (phone.length == 0) {
         alert("집 전화를 입력하세요.");
         joinform.MEMBER_PHONE.focus();
         return false;
      }
      if ((forms.MEMBER_ZIPCODE1.value == "")
            || (forms.MEMBER_ZIPCODE1.value.length < 3)) {
         alert("우편번호 앞의 3자리를 입력해 주세요.");
         forms.MEMBER_ZIPCODE1.focus();
         return false;
      }
      if ((forms.MEMBER_ZIPCODE2.value == "")
            || (forms.MEMBER_ZIPCODE2.value.length < 3)) {
         alert("우편번호 뒤의 3자리 입력해 주세요.");
         forms.MEMBER_ZIPCODE2.focus();
         return false;
      }
      if (addr1.length == 0) {
         alert("집 주소를 입력하세요.");
         joinform.MEMBER_ADDR1.focus();
         return false;
      }
      if (addr2.length == 0) {
         alert("상세 주소를 입력하세요.");
         joinform.MEMBER_ADDR2.focus();
         return false;
      }
      if (mobile.length == 0) {
         alert("휴대폰 번호를 입력하세요.");
         joinform.MEMBER_MOBILE.focus();
         return false;
      } */

      return true;
   }

   function openConfirmId(joinform) {
      var id = joinform.MEMBER_ID.value;
      var url = "./MemberIDCheckAction.me" + "?MEMBER_ID="
            + encodeURIComponent(joinform.MEMBER_ID.value);

      if (id.length == 0) {
         alert("아이디를 입력하세요.");
         joinform.MEMBER_ID.focus();
         return false;
      }
      window.open(url, "confirm", "toolbar=no,location=yes,"
            + "status=yes,menubar=no," + "scrollbars=yes,resizable=yes,"
            + "width=410,height=400");
   }

   function openConfirmNick(joinform) {
      var id = joinform.MEMBER_NICKNAME.value;
      var url = "./MemberNickCheckAction.me" + "?MEMBER_NICKNAME="
            +  joinform.MEMBER_NICKNAME.value;
      
      if (id.length == 0) {
         alert("닉네임을 입력하세요.");
         joinform.MEMBER_NICKNAME.focus();
         return false;
      }
      window.open(url, "confirm", "toolbar=no,location=yes,"
            + "status=yes,menubar=no," + "scrollbars=yes,resizable=yes,"
            + "width=410,height=400");
   }

   function openZipcode(joinform) {
      var url = "./Zipcode.me"
      window.open(url, "confirm", "toolbar=no,location=yes,"
            + "status=yes,menubar=no," + "scrollbars=yes,resizable=yes,"
            + "width=410,height=400");
   }

   function gNumCheck() {
      if (event.keyCode >= 48 && event.keyCode <= 57) {
         return true;
      } else {
         event.returnValue = false;
      }
   }
</script>
</head>
<body>
   <div class="container">
   <div class="content" align="center">
      <table width="960" cellspacing="0" cellpadding="0" border="0" >
      
            <td colspan=2>
               <!-- 회원가입 -->
               <form role="form" method="post"
                  onsubmit="return check()">
                  <p align="center">
                  <table border="1" width="80%" height="80%">
                     <!--  <tr>
                        <td width="17%" bgcolor="#f5f5f5"><font size="2">&nbsp;&nbsp;&nbsp;&nbsp;이름</font>
                        </td>
                        <td>&nbsp;&nbsp;&nbsp; <input type="text"
                           name="MEMBER_NAME" size="20" />
                        </td>
                     </tr>-->
                     <tr>
                        <td bgcolor="#f5f5f5"><font size="2">&nbsp;&nbsp;&nbsp;&nbsp;아이디</font>
                        </td>
                        <td>&nbsp;&nbsp;&nbsp; <input type="text" name="uid"
                           size="10" maxlength=15 /> <input type="button" class="btn btn-default btn-sm" 
                           name="confirm_id" value="아이디 중복확인"
                           onclick="openConfirmId(this.form)" />
                        </td>
                     </tr>
                     <tr>
                        <td bgcolor="#f5f5f5"><font size="2">&nbsp;&nbsp;&nbsp;&nbsp;닉네임</font>
                        </td>
                        <td>&nbsp;&nbsp;&nbsp; <input type="text" name="uname"
                           size="10" maxlength=15 /> <input type="button"
                           name="confirm_id" value="닉네임 중복확인" class="btn btn-default btn-sm"  
                           onclick="openConfirmNick(this.form)" />
                        </td>
                     </tr> 
                     <tr>
                        <td bgcolor="#f5f5f5"><font size="2">&nbsp;&nbsp;&nbsp;&nbsp;비밀번호</font>
                        </td>
                        <td>&nbsp;&nbsp;&nbsp; <input type="password"
                           name="upw" size="15" />
                        </td>
                     </tr>
                     <tr>
                        <td bgcolor="#f5f5f5"><font size="2">&nbsp;&nbsp;&nbsp;&nbsp;비밀번호
                              확인</font></td>
                        <td>&nbsp;&nbsp;&nbsp; <input type="password"
                           name="upw2" size="15" />
                     
                     </tr>
                     <tr>
                        <td bgcolor="#f5f5f5"><font size="2">&nbsp;&nbsp;&nbsp;&nbsp;이메일
                              주소</font></td>
                        <td>&nbsp;&nbsp;&nbsp; <input type="text"
                           name="email1" size="13" />@ <input type="text"
                           name="email2" size="15" />
                        </td>
                     </tr>
                     <tr>
                        <td bgcolor="#f5f5f5">&nbsp;</td>
                        <td><font size="2">&nbsp;&nbsp;&nbsp; (아이디와 비밀번호는
                              문자와 숫자를 조합하여 2~12자리로 만들어 주세요)</font></td>
                     </tr>
                     
                  <!--    <tr>
                        <td bgcolor="#f5f5f5"><font size="2">&nbsp;&nbsp;&nbsp;&nbsp;닉네임</font></td>
                        <td>&nbsp;&nbsp;&nbsp; <input type="text" name="MEMBER_NICKNAME"
                           size="15" />
                        </td>
                        <td>
                        <input type="button"
                     </tr> -->
                     <!--    <tr>
                        <td bgcolor="#f5f5f5"><font size="2">&nbsp;&nbsp;&nbsp;&nbsp;주민등록번호</font>
                        </td>
                        <td>&nbsp;&nbsp;&nbsp; <input type="text"
                           name="MEMBER_JUMIN1" size="12" onkeypress="gNumCheck()"
                           maxlength="6" />- <input type="text" name="MEMBER_JUMIN2"
                           size="12" onkeypress="gNumCheck()" maxlength="7" />
                        </td>
                     </tr> -->
                  <!--    <tr>
                        <td bgcolor="#f5f5f5"><font size="2">&nbsp;&nbsp;&nbsp;&nbsp;이메일
                              주소</font></td>
                        <td>&nbsp;&nbsp;&nbsp; <input type="text"
                           name="MEMBER_EMAIL1" size="13" />@ <input type="text"
                           name="MEMBER_EMAIL2" size="15" />
                        </td>
                     </tr>
                     <tr>
                        <td bgcolor="#f5f5f5"><font size="2">&nbsp;&nbsp;&nbsp;&nbsp;메일
                              수신 여부</font></td>
                        <td>&nbsp;&nbsp;&nbsp; <input type="radio"
                           name="MEMBER_EMAIL_GET" value="YES" checked /> <font size="2">수신</font>
                           &nbsp;&nbsp;<input type="radio" name="MEMBER_EMAIL_GET"
                           value="NO" /> <font size="2">수신 안함</font>
                        </td>
                     </tr>
                     <tr>
                        <td bgcolor="#f5f5f5"><font size="2">&nbsp;&nbsp;&nbsp;&nbsp;집전화</font>
                        </td>
                        <td>&nbsp;&nbsp;&nbsp; <input type="text"
                           name="MEMBER_PHONE" size="24" />
                        </td>
                     </tr>
                     <tr>
                        <td bgcolor="#f5f5f5"><font size="2">&nbsp;&nbsp;&nbsp;&nbsp;우편번호</font>
                        </td>
                        <td>&nbsp;&nbsp;&nbsp; <input type="text"
                           name="MEMBER_ZIPCODE1" size="6" onkeypress="gNumCheck()"
                           maxlength="3" />- <input type="text" name="MEMBER_ZIPCODE2"
                           size="6" onkeypress="gNumCheck()" maxlength="3" />&nbsp;&nbsp;
                           <input type="button" name="zipcode" value="우편번호 검색"
                           onclick="openZipcode(this.form)" />
                        </td>
                     </tr>
                     <tr>
                        <td bgcolor="#f5f5f5"><font size="2">&nbsp;&nbsp;&nbsp;&nbsp;집주소</font>
                        </td>
                        <td>&nbsp;&nbsp;&nbsp; <input type="text"
                           name="MEMBER_ADDR1" size="50" />
                        </td>
                     </tr>
                     <tr>
                        <td bgcolor="#f5f5f5"><font size="2">&nbsp;&nbsp;&nbsp;&nbsp;상세주소</font>
                        </td>
                        <td>&nbsp;&nbsp;&nbsp; <input type="text"
                           name="MEMBER_ADDR2" size="50" />
                        </td>
                     </tr>
                     <tr>
                        <td bgcolor="#f5f5f5"><font size="2">&nbsp;&nbsp;&nbsp;&nbsp;휴대폰</font>
                        </td>
                        <td>&nbsp;&nbsp;&nbsp; <input type="text"
                           name="MEMBER_MOBILE" size="24" />
                        </td>
                     </tr> -->
                  </table>
                  <table width="80%">
                     <tr>
                        <td align="center"><br /> <input type="submit" value="확 인" class="btn btn-default btn-sm"/></td>
                     </tr>
                  </table>
               </form> <!-- 회원가입 -->
            </td>
         </tr>
      </table>
      </div>
   </div>
   <script
      src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
   <script src="../dist/js/bootstrap.min.js"></script>
   <script src="../dist/js/bootstrap-select.min.js"></script>
   <script src="../dist/js/star-rating.min.js"></script>
   <script src="../dist/js/skel.min.js"></script>
   <script src="../dist/js/skel-layers.min.js"></script>
   <script src="../dist/js/select-sigun.js"></script>
</body>