<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/header.jsp"%>
<%@ page import="snut.webframework.project.main.* , java.util.*"%>
<%@page import="java.util.List,java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">





<script   src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>


<% 
   List<APIData> data = (List<APIData>) request.getAttribute("commonList");

%>

<script type="text/javascript">
var Intro = "";
$(document).ready(function(){

   //alert("고");
   Intro = document.getElementById('content').innerHTML;
   //alert(Intro);

});
   
   

function intro(){
   //alert("intro");
   document.getElementById("intro").className = 'active';
   document.getElementById("info").className='';
   document.getElementById("detail").className='';
   document.getElementById("image").className='';
   var c_div=document.getElementById("content");
   c_div.innerHTML = '';
   c_div.innerHTML = Intro;
}
function info(){
   //alert("info");
   document.getElementById("intro").className = '';
   document.getElementById("info").className='active';
   document.getElementById("detail").className='';
   document.getElementById("image").className='';
}
function detail(){
   //alert("detail");
   document.getElementById("intro").className = '';
   document.getElementById("info").className='';
   document.getElementById("detail").className='active';
   document.getElementById("image").className='';
   var c_div = document.getElementById("content");
   var str = "";
   c_div.innerHTML ="";
   <% List<String> sibal = (List<String>) request.getAttribute("introList"); 
   
   for(int i = 0 ; i < sibal.size() ; i++){
      
      sibal.get(i).replaceAll(System.getProperty("line.separator"), "</br>");
      //System.out.println(sibal.get(i));%>
      str += '<%=sibal.get(i)%>' + '</br></br>';
      
   <%}%>
   

   
   //alert(str);
   
   c_div.innerHTML = str;
}


function newwindow(){
   
   
   // form
   var form = document.createElement("form");     
   form.setAttribute("method","post");                    
   form.setAttribute("action","./tourDetailmap");   
   form.setAttribute("target","_black");     
   document.body.appendChild(form);                        
    
   //input
   var input_id = document.createElement("input");  
   input_id.setAttribute("type", "hidden");                 
   input_id.setAttribute("name", "name1");                        
   input_id.setAttribute("value", '<%=data.get(0).getTitle()%>');                          
   form.appendChild(input_id);
   var input_id2 = document.createElement("input");  
   input_id2.setAttribute("type", "hidden");                 
   input_id2.setAttribute("name", "lot");                        
   input_id2.setAttribute("value", <%=data.get(0).getMapx()%>);                          
   form.appendChild(input_id2);
   var input_id3 = document.createElement("input");  
   input_id3.setAttribute("type", "hidden");                 
   input_id3.setAttribute("name", "lat");                        
   input_id3.setAttribute("value", <%=data.get(0).getMapy()%>);                          
   form.appendChild(input_id3);
   //폼전송
   form.submit();  
   
   
   
   
   
   
}
function image(){
   //alert("image");
      document.getElementById("intro").className = '';
   document.getElementById("info").className='';
   document.getElementById("detail").className='';
   document.getElementById("image").className='active';
   var c_div = document.getElementById("content");
   c_div.innerHTML = "";
   
   var str = '';
   str += '<br><br><div class="row"><div class="col-md-8">';
   //str   += '<tr>';
   //str  += '<td colspan="5">';
      
   str  += '<img id="largeView" src="/TheClassic/resources/images/noImage.png" style="width:100%; height:400px;" >';
      
   //str  += '</td>';
   //str  += '</tr>';
   str += '</div>';
      str += '<div class="col-md-4" style="overflow-y:scroll; border:1px solid blue; height:400px">';
      <% //imageList
      List<String> imageList = (List<String>) request.getAttribute("imageList");
      int count=0;
      if(imageList.size() > 0){
       for(int i = 0; i < imageList.size(); i++){
       if(count == 0){
       %>
      //str += '<tr>';
      str += '<div class="row">';
       <%} %>
      // str += '<td>';
          str += "<div class='col-md-4'><img class='img-responsive' src='<%=imageList.get(i).toString().trim() %>' width='100' height='100' style='margin:10px 10px 10px 10px;' onclick='changeImage(this);' /></div>";
    //      str += '</td>';
       <% count++;
       if(count == 3){%>
       str += '</div><br><br>';
     //  str += '</tr>'
     //  str += '</br>'
       <% 
       count=0;
       }
       }
       }%>
       
      
      
    
      str += '</div></div><br><br>';
    // str+= '</table>';
     
     c_div.innerHTML = str;
   
}
function changeImage(n){
   
   
   document.getElementById("largeView").src = n.src;
}
</script>
<script>
$(document).ready(function(){
   $("#star1").on("click",function(){
      $("#star1").attr('src',"<%=cp%>/resources/images/staron.png");
      $("#star2").attr('src',"<%=cp%>/resources/images/staroff.png");
      $("#star3").attr('src',"<%=cp%>/resources/images/staroff.png");
      $("#star4").attr('src',"<%=cp%>/resources/images/staroff.png");
      $("#star5").attr('src',"<%=cp%>/resources/images/staroff.png");
      $("#star").attr('value', "1");
      
   });
   $("#star2").on("click",function(){
      $("#star1").attr('src',"<%=cp%>/resources/images/staron.png");
      $("#star2").attr('src',"<%=cp%>/resources/images/staron.png");
      $("#star3").attr('src',"<%=cp%>/resources/images/staroff.png");
      $("#star4").attr('src',"<%=cp%>/resources/images/staroff.png");
      $("#star5").attr('src',"<%=cp%>/resources/images/staroff.png");
      $("#star").attr('value', "2");
      
   });
   $("#star3").on("click",function(){
      $("#star1").attr('src',"<%=cp%>/resources/images/staron.png");
      $("#star2").attr('src',"<%=cp%>/resources/images/staron.png");
      $("#star3").attr('src',"<%=cp%>/resources/images/staron.png");
      $("#star4").attr('src',"<%=cp%>/resources/images/staroff.png");
      $("#star5").attr('src',"<%=cp%>/resources/images/staroff.png");
      $("#star").attr('value', "3");
      $("#star").attr('value');
   });
   $("#star4").on("click",function(){
      $("#star1").attr('src',"<%=cp%>/resources/images/staron.png");
      $("#star2").attr('src',"<%=cp%>/resources/images/staron.png");
      $("#star3").attr('src',"<%=cp%>/resources/images/staron.png");
      $("#star4").attr('src',"<%=cp%>/resources/images/staron.png");
      $("#star5").attr('src',"<%=cp%>/resources/images/staroff.png");
      $("#star").attr('value', "4");
      $("#star").attr('value');
   });
   $("#star5").on("click",function(){
      $("#star1").attr('src',"<%=cp%>/resources/images/staron.png");
      $("#star2").attr('src',"<%=cp%>/resources/images/staron.png");
      $("#star3").attr('src',"<%=cp%>/resources/images/staron.png");
      $("#star4").attr('src',"<%=cp%>/resources/images/staron.png");
      $("#star5").attr('src',"<%=cp%>/resources/images/staron.png");
      $("#star").attr('value', "5");
      $("#star").attr('value');
   });
   
   
   
   
   
   
});
</script>
<script>
$(document).ready(function(){
   var bno = "<%=data.get(0).getContentid()%>";

   $.ajax({
      type:'post',
      url:'/TheClassic/tourreplies/star/'+bno,
      headers: { 
            "Content-Type": "application/json",
            "X-HTTP-Method-Override": "POST" },
      dataType:'text', 
      success:function(result){
         if(result=="1"||result=="2"||result=="3"||result=="4"||result=="5"){
            $("#avstar").attr("src", "<%=cp%>/resources/images/star"+result+".png" );
            
         }else{
         
         }
   }});
   
});
</script>

<!-- facebook -->
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.6&appId=1727975574126006";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
<!-- facebook -->

   <div class="jumbotron" style="background-color: white;">
      <div class="container">
      <div>
      <h1><%=data.get(0).getTitle()%></h1>
      </div>
      <div align="right" >
      <img id="avstar" src="<%=cp%>/resources/images/star0.png" style="width:30%"/>
      </div>
      <br>
      <div>
         <ul style="width:100%" class="nav nav-pills nav-justified">
            <li id="intro" role="presentation" class="active"><a href="#" onclick="intro()">개요</a></li>
            <li id="info" role="presentation"  style="display:none;"><a href="#" onclick="info()">소개</a></li>
            <li id="detail" role="presentation"  ><a href="#" onclick="detail()">상세</a></li>
            <li id="image" role="presentation" ><a href="#" onclick="image()" >이미지</a></li>
         </ul>
<div>
      <div id="imageeDIV">
      
      
      
      
      </div>
      
      <div id="content" >
         <div class="row">
            <div class="col-md-6">
            <hr>
               <img class="img-responsive" alt="Responsive image" src="<%=data.get(0).getFirstimageURL()%>" width="500"
                  height="500" />
            </div>
            <%--    <div class="col-md-4">
               <img src="<%=data.get(0).getFirstimageURL()%>" width="300"
                  height="300" />
            </div> --%>
            <div class="col-md-6">
            <hr>

               <div>

                  <table  width="500" height="250" cellspacing="5" cellpadding="10">
                  <tr><td valign=top><font color=#58ACFA><b>이름</b></font> </td> <td valign=top><%=data.get(0).getTitle()%></td></tr> 
                  <tr><td valign=top><font color=#58ACFA><b>연락처 </b></font></td><td valign=top> <%=data.get(0).getTel()%></td></tr> 
                  <tr><td valign=top><font color=#58ACFA><b>주소 </b></font></td><td valign=top> <%=data.get(0).getAddr1() %> <%=data.get(0).getAddr2() %></td></tr>
                  </table>
                  <br>
                  <div align=right>
                  <button type="button" class="btn btn-success" onclick="newwindow()">지도보기</button>
                  <button type="button" class="btn btn-info" onclick="javascript:history.go(-1);">목록</button>
                  </div>               
               </div>
            </div>
         </div>
<!-- hoon -->

<div align=right>
<a id="kk" href="#" target="_blank"><img src="/TheClassic/resources/images/story_android_36x36.png"/></a>
<script>
document.getElementById('kk').setAttribute("href","https://story.kakao.com/share?url=http://ec2-52-69-81-216.ap-northeast-1.compute.amazonaws.com/TheClassic/search/tourDetailResult?ContentID="+"<%=request.getAttribute("ContentID") %>");
</script>

<a id="kakao-link-btn" href="javascript:oncheck();">
 <img src="/TheClassic/resources/images/kakaolink_btn_small.png"/>
</a>
<script type='text/javascript'>
function oncheck(){
   //alert("체크");

   var filter = "win16|win32|win64|mac";
   var inMobile = false;
   if(navigator.platform){
   if(0 > filter.indexOf(navigator.platform.toLowerCase())){
   //alert("Mobile");
   inMobile = true;
   }else{
   //alert("PC");
   inMobile = false;
   }
   }
   if(inMobile == true){
         Kakao.init('a9bf7c6ba38c4088254aa9d72820cdb1');
          // // 카카오톡 링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
          Kakao.Link.createTalkLinkButton({
            container: '#kakao-link-btn',
            label: 'TheClassic 공연/행사에 당신을 초대합니다. :)',
            image: {
              src: 'http://dn.api1.kage.kakao.co.kr/14/dn/btqaWmFftyx/tBbQPH764Maw2R6IBhXd6K/o.jpg',
              width: '300',
              height: '200'
            },
            webButton: {
              text: '보러가기',
              url: location.href // 앱 설정의 웹 플랫폼에 등록한 도메인의 URL이어야 합니다.
            }
          });
   }else{
      alert('모바일 접속이 아니어서 \n카카오톡 공유하기를 사용할 수 없습니다.');
   }
}


</script> 
<div id="fb" class="fb-share-button" data-href="#" data-mobile-iframe="true"><a class="fb-xfbml-parse-ignore" target="_blank">공유하기</a></div>
               <script>
                  document.getElementById('fb').setAttribute("data-href","http://ec2-52-69-81-216.ap-northeast-1.compute.amazonaws.com:8080/TheClassic/search/tourDetailResult?ContentID="+<%=request.getAttribute("ContentID") %>);
               </script>
 <!-- hoon -->
 
 </div>
 
 
         <div id="intro">


            <h2>개 요</h2>
            <br>
            <hr style="border: 5px solid;"></hr>
            <%
               List<detailData> bb = (List<detailData>) request.getAttribute("detailList");

               if (bb != null) {
                  for (int i = 0; i < bb.size(); i++) {
                     if (bb.get(i).getType().equals("행사소개")) {
            %>
            <%=bb.get(i).getContent()%>

            <%
               }
            %>
            <%
               }
               }
            %>
         </div>
         <br>
     

          
<!-- Modal -->
<div id="modifyModal" class="modal modal-primary fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"></h4><h4 class="modal-name"></h4>
      </div>
      <div class="modal-body" data-rno>
        <p><input type="text" id="replytext" class="form-control"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-info" id="replyModBtn">수정</button>
        <button type="button" class="btn btn-danger" id="replyDelBtn">삭제</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>      
   
   
</section>
<!-- /.content -->

<script id="template" type="text/x-handlebars-template">
{{#each .}}
<li class="replyLi" data-rno={{rno}}>
<i class="fa fa-comments bg-blue"></i>
 <div class="timeline-item" >

  <span class="time">
    <i class="fa fa-clock-o"></i>{{prettifyDate regdate}}
  </span>

  <h3 class="timeline-header" >{{replyer}}<img id="stars" src="<%=cp%>/resources/images/star{{star}}.png" width=100></h3> 
  <div class="timeline-body">{{replytext}} </div>
    <div class="timeline-footer">
     <a class="btn btn-primary btn-xs" 
       data-toggle="modal" data-target="#modifyModal">Modify</a>
    </div>
  </div>         
</li>
{{/each}}
</script>

<script>
$(document).ready(function(){
    Handlebars.registerHelper("prettifyDate", function(timeValue) {
      var dateObj = new Date(timeValue);
      var year = dateObj.getFullYear();
      var month = dateObj.getMonth() + 1;
      var date = dateObj.getDate();
      return year + "/" + month + "/" + date;
   }); 

   var printData = function(replyArr, target, templateObject) {

       var template = Handlebars.compile(templateObject.html());

      var html = template(replyArr);
      $(".replyLi").remove();
      target.after(html); 

   }
   
   var sessionName = "<%=sessions.getAttribute("uname")%>"
   var bno = "<%=data.get(0).getContentid()%>";
   
   var replyPage = 1;

   function getPage(pageInfo) {

      $.getJSON(pageInfo, function(data) {
         printData(data.list, $("#repliesDiv"), $('#template'));
         printPaging(data.pageMaker, $(".pagination"));

         $("#modifyModal").modal('hide');

      });
   }

   var printPaging = function(pageMaker, target) {

      var str = "";

      if (pageMaker.prev) {
         str += "<li><a href='" + (pageMaker.startPage - 1)
               + "'> << </a></li>";
      }

      for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
         var strClass = pageMaker.cri.page == i ? 'class=active' : '';
         str += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";
      }

      if (pageMaker.next) {
         str += "<li><a href='" + (pageMaker.endPage + 1)
               + "'> >> </a></li>";
      }

      target.html(str);
   };

   $("#repliesDiv").on("click", function() {
      

      if ($(".timeline li").size() > 1) {
         return;
      }
      getPage("/TheClassic/tourreplies/" + bno + "/1");

   });
   

   $(".pagination").on("click", "li a", function(event){
      
      event.preventDefault();
      
      replyPage = $(this).attr("href");
      
      getPage("/TheClassic/replies/"+bno+"/"+replyPage);
      
   });

   

   

   $(".timeline").on("click", ".replyLi", function(event){
      
      var reply = $(this);
      
      $("#replytext").val(reply.find('.timeline-body').text());
      $(".modal-title").html(reply.attr("data-rno"));
      $(".modal-name").html(reply.find('.timeline-header').text());
      
      
   });
   var replyer = $(".modal-name").html();
   
   

   $("#replyModBtn").on("click",function(){
      
       
       
        var replyer = $(".modal-name").html();
        var rno = $(".modal-title").html();
        var replytext = $("#replytext").val();
       // alert(sessionName);
         //alert(replyer);
        if(sessionName != null && sessionName == replyer){
        $.ajax({
            type:'put',
            url:'/TheClassic/tourreplies/'+rno,
            headers: { 
                  "Content-Type": "application/json",
                  "X-HTTP-Method-Override": "PUT" },
            data:JSON.stringify({replyer:replyer, replytext:replytext}), 
            dataType:'text', 
            success:function(result){
               console.log("result: " + result);
               if(result == 'SUCCESS'){
                  alert("수정 되었습니다.");
                  getPage("/TheClassic/tourreplies/"+bno+"/"+replyPage );
               }
         }});
        }
        else{
           alert("로그인 하지않았거나 자신이 작성한 댓글이 아닙니다.");
        }
      
         });
   

   $("#replyDelBtn").on("click",function(){
        var replyer = $(".modal-name").html();
        var rno = $(".modal-title").html();
        var replytext = $("#replytext").val();
        if(sessionName != null && sessionName == replyer){
        $.ajax({
            type:'delete',
            url:'/TheClassic/tourreplies/'+rno,
            headers: { 
                  "Content-Type": "application/json",
                  "X-HTTP-Method-Override": "DELETE" },
            dataType:'text', 
            success:function(result){
               console.log("result: " + result);
               if(result == 'SUCCESS'){
                  alert("삭제 되었습니다.");
                  getPage("/TheClassic/tourreplies/"+bno+"/"+replyPage );
               }
         }});
        }
        else{
           alert("로그인 하지않았거나 자신이 작성한 댓글이 아닙니다.");
        }
   });
   <%if(sessions.getAttribute("uname") !=null){%>

   $("#replyAddBtn").on("click", function(){
      
       //var replyerObj = $("#newReplyWriter");
       var replytextObj = $("#newReplyText");
       //var replyer = replyerObj.val();
       var replytext = replytextObj.val();
       var star = $("#star").attr("value");
        
        $.ajax({
            type:'post',
            url:'/TheClassic/tourreplies/',
            headers: { 
                  "Content-Type": "application/json",
                  "X-HTTP-Method-Override": "POST" },
            dataType:'text',
            data: JSON.stringify({bno:bno, replytext:replytext, star:star}),
            success:function(result){
               console.log("result: " + result);
               if(result == 'SUCCESS'){
                  
                  replyPage = 1;
                  getPage("/TheClassic/tourreplies/"+bno+"/"+replyPage );
                  //replyerObj.val("");
                  replytextObj.val("");
               }
         }});
       
      
   });
   <%}else{%>
   
   $("#replyAddBtn").on("click", function() {

      alert("로그인 해주십시오.");

   });
   <%}%>
   


});
</script>


<script>
$(document).ready(function(){
   
   var formObj = $("form[role='form']");
   var sessionName = "<%=sessions.getAttribute("uname")%>"
   var writer = "${data.writer}";
   console.log(formObj);
   var url = location.href;
   var loc = url.split("/");

   //alert(loc[4]);

   
   $("#modifyBtn").on("click", function(){
      
      if(sessionName !=null && sessionName==writer){
      formObj.attr("action", "/TheClassic/"+loc[4]+"/modifyPage");
      
      formObj.attr("method", "get");      
      formObj.submit();
      }else{
         alert("로그인 하지 않았거나 자신이 작성한 글이 아닙니다.");
      }
      
   });
   
   $("#removeBtn").on("click", function(){
      if(sessionName !=null && sessionName==writer){
      formObj.attr("action", "/TheClassic/"+loc[4]+"/removePage");
      
      //formObj.attr("method","get");
      formObj.submit();
      }else{
         alert("로그인 하지 않았거나 자신이 작성한 글이 아닙니다.");
      }
   });
   
   $("#goListBtn ").on("click", function(){
      formObj.attr("method", "get");
      formObj.attr("action", "/TheClassic/"+loc[4]+"/list");
   
      formObj.submit();
   });
   
   
});
</script>








      </div>
      </br>
          <div class="row">
      <div class="col-md-12">

         <div class="box box-success">
            <div class="box-header">
               <h3 class="box-title">댓글 달기</h3>
            </div>
            <div class="box-body">
               <!--  <label for="exampleInputEmail1">Writer</label> <input class="form-control" type="text" placeholder="USER ID"
                  id="newReplyWriter"> -->
                  <label for="exampleInputEmail1">내용</label>
                  <img align="right" id="star5" src="<%=cp%>/resources/images/staroff.png" width=40>
                  <img align="right" id="star4" src="<%=cp%>/resources/images/staroff.png" width=40>
                  <img align="right" id="star3" src="<%=cp%>/resources/images/staron.png" width=40>
                  <img align="right" id="star2" src="<%=cp%>/resources/images/staron.png" width=40>
                  <img align="right" id="star1" src="<%=cp%>/resources/images/staron.png" width=40>
                  <input type=hidden name="star" id ="star" value=3>
                   <input class="form-control" type="text"
                  placeholder="REPLY TEXT" id="newReplyText">

            </div>
            <!-- /.box-body -->
         
            <div class="box-footer">
               <button type="button" class="btn btn-primary" id="replyAddBtn">댓글 달기</button>
            </div>
         </div>


         <!-- The time line -->
         <ul class="timeline">
            <!-- timeline time label -->
            <li class="time-label" id="repliesDiv"><span class="bg-green">
                  댓글 목록 </span></li>
         </ul>

         <div class='text-center'>
            <ul id="pagination" class="pagination pagination-sm no-margin ">

            </ul>
         </div>

      </div>
      <!-- /.col -->
   </div>
   <!-- /.row -->
      
</div>

   </div>
<%@include file="../include/footer.jsp"%>
</body>

</html>