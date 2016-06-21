

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import="snut.webframework.project.theclassic.board.domain.NoticeBoardVO"%>
<%@include file="../include/header.jsp"%>
<%@ page import="snut.webframework.project.theclassic.board.*,java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%
	request.setCharacterEncoding("UTF-8");
	NoticeBoardVO vo = (NoticeBoardVO) request.getAttribute("VO");
	String category = vo.getCategory();
	String result = "";
	if (category.equals("notice"))
		result="공지사항";
	if (category.equals("tradper"))
		result="전통공연";
	if (category.equals("theater"))
		result="연극";
	if (category.equals("musical"))
		result="뮤지컬";
	if (category.equals("opera"))
		result="오페라";
	if (category.equals("exhibit"))
		result="전시회";
	if (category.equals("expo"))
		result="박람회";
	if (category.equals("conven"))
		result="컨벤션";
	if (category.equals("dancing"))
		result="무용";
	if (category.equals("concert"))
		result="대중콘서트";
	if (category.equals("movie"))
		result="영화";
	if (category.equals("sport"))
		result="스포츠";
	if (category.equals("etc"))
		result="기타"; 
		
	SimpleDateFormat a = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	String date = a.format(vo.getRegdate());
		
%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<!-- Main content -->
<div class="jumbotron" style="background-color: white;">
	<div class="container">
		<section class="content">
			<div class="row">
				<!-- left column -->
				<div class="col-md-12">
					<!-- general form elements -->
					<div class="box box-primary">
						<div class="box-header">
							<h1><%=result %></h1>
						</div>
						<!-- /.box-header -->

						<form role="form" action="modifyPage" method="post">

							<input type='hidden' name='bno' value="${data.bno}"> <input
								type='hidden' name='page' value="${cri.page}"> <input
								type='hidden' name='perPageNum' value="${cri.perPageNum}">
							<input type='hidden' name='searchType' value="${cri.searchType}">
							<input type='hidden' name='keyword' value="${cri.keyword}">

						</form>

						<table class="table">
							<tr>
								<td><label for="exampleInputEmail1"><img
										src="/TheClassic/resources/img/4_head.png">&nbsp;&nbsp;제목</label></td>
								<td colspan="5" style="width: 85%;"><input type="text"
									style="width: 100%; background: transparent; border: 0px;"
									name='title' class="form-control" value="${data.title}"
									readonly="readonly"></td>
							</tr>
							<tr>
								<td><label for="exampleInputEmail1"><img
										src="/TheClassic/resources/img/4_head.png">&nbsp;&nbsp;글쓴이</label></td>
								<td><input type="text"
									style="background: transparent; border: 0px;" name="writer"
									class="form-control" value="${data.writer}" readonly="readonly"></td>
								<td><label for="exampleInputEmail1"><img
										src="/TheClassic/resources/img/4_head.png">&nbsp;&nbsp;시간</label></td>
								<td><%=date %></td>
								<td><label for="exampleInputEmail1"><img
										src="/TheClassic/resources/img/4_head.png">&nbsp;&nbsp;조회수</label></td>
								<td>${data.viewcnt }</textarea></td>
							</tr>
							<tr>
								<td><label for="exampleInputPassword1"><img
										src="/TheClassic/resources/img/4_head.png">&nbsp;&nbsp;내용</label></td>
								<td colspan="5" style="width: 85%;">${data.content}</td>
							</tr>

						</table>
						<!-- /.box-body -->

						<div class="box-footer box-footer-right">
							
							<button type="submit" class="btn btn-primary" id="goListBtn">목록</button>
							
							
							<button  type="submit" class="btn btn-warning right" id="modifyBtn">수정</button>
							<button  type="submit" class="btn btn-danger right" id="removeBtn">삭제</button>
							
						</div>



					</div>
					<!-- /.box -->
				</div>
				<!--/.col (left) -->

			</div>
			<!-- /.row -->



			<div class="row">
				<div class="col-md-12">

					<div class="box box-success">
						<div class="box-header">
							<h3 class="box-title">댓글 달기</h3>
						</div>
						<div class="box-body">
							<!--  <label for="exampleInputEmail1">Writer</label> <input class="form-control" type="text" placeholder="USER ID"
						id="newReplyWriter"> -->
							<label for="exampleInputEmail1">댓글 내용</label> <input
								class="form-control" type="text" placeholder="내용을 입력해 주세요."
								id="newReplyText">

						</div>
						<!-- /.box-body -->
						<div class="box-footer">
							<button type="button" class="btn btn-primary" id="replyAddBtn">댓글
								달기</button>
						</div>
					</div>


					<!-- The time line -->
					<ul class="timeline">
						<!-- timeline time label -->
						<li class="time-label" id="repliesDiv"><span class="bg-green">
								댓글 목록</span></li>
					</ul>

					<div class='text-center'>
						<ul id="pagination" class="pagination pagination-sm no-margin ">

						</ul>
					</div>

				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->



			<!-- Modal -->
			<div id="modifyModal" class="modal modal-primary fade" role="dialog">
				<div class="modal-dialog">
					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title"></h4>
							<h4 class="modal-name"></h4>
						</div>
						<div class="modal-body" data-rno>
							<p>
								<input type="text" id="replytext" class="form-control">
							</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-info" id="replyModBtn">수정</button>
							<button type="button" class="btn btn-danger" id="replyDelBtn">삭제</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>


		</section>
	</div>
</div>
<!-- /.content -->

<script id="template" type="text/x-handlebars-template">
{{#each .}}
<li class="replyLi" data-rno={{rno}}>
<i class="fa fa-comments bg-blue"></i>
 <div class="timeline-item" >
  <span class="time">
    <i class="fa fa-clock-o"></i>{{prettifyDate regdate}}
  </span>
  <h3 class="timeline-header" >{{replyer}}</h3>
  <div class="timeline-body">{{replytext}} </div>
    <div class="timeline-footer">
     <a class="btn btn-primary btn-xs" 
	    data-toggle="modal" data-target="#modifyModal">수정</a>
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
	var bno = ${data.bno};
	
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
		getPage("/TheClassic/replies/" + bno + "/1");

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
		  if(sessionName != null && sessionName == replyer){
		  $.ajax({
				type:'put',
				url:'/TheClassic/replies/'+rno,
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "PUT" },
				data:JSON.stringify({replyer:replyer, replytext:replytext}), 
				dataType:'text', 
				success:function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("수정 되었습니다."+ replyer);
						getPage("/TheClassic/replies/"+bno+"/"+replyPage );
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
				url:'/TheClassic/replies/'+rno,
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "DELETE" },
				dataType:'text', 
				success:function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("삭제 되었습니다.");
						getPage("/TheClassic/replies/"+bno+"/"+replyPage );
					}
			}});
		  }
		  else{
			  alert("로그인 하지않았거나 자신이 작성한 댓글이 아닙니다.");
		  }
	});
	<%if (sessions.getAttribute("uname") != null) {%>

	$("#replyAddBtn").on("click", function(){
		
		 //var replyerObj = $("#newReplyWriter");
		 var replytextObj = $("#newReplyText");
		 //var replyer = replyerObj.val();
		 var replytext = replytextObj.val();
		 
		  
		  $.ajax({
				type:'post',
				url:'/TheClassic/replies/',
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "POST" },
				dataType:'text',
				data: JSON.stringify({bno:bno, replytext:replytext}),
				success:function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						
						replyPage = 1;
						getPage("/TheClassic/replies/"+bno+"/"+replyPage );
						//replyerObj.val("");
						replytextObj.val("");
					}
			}});
		 
		
	});
	<%} else {%>
	
	$("#replyAddBtn").on("click", function() {

		alert("로그인 해주십시오.");

	});
	<%}%>
	


});
</script>


<script>
$(document).ready(function(){
	
	var formObj = $("form[role='form']");
	var sessionName = "<%=sessions.getAttribute("uname")%>";
	
				var writer = "${data.writer}";
				console.log(formObj);
				var url = location.href;
				var loc = url.split("/");

				//alert(loc[4]);

				$("#modifyBtn").on(
						"click",
						function() {

							if (sessionName != null && sessionName == writer) {
								formObj.attr("action", "/TheClassic/" + loc[4]
										+ "/modifyPage");

								formObj.attr("method", "get");
								formObj.submit();
							} else {
								alert("로그인 하지 않았거나 자신이 작성한 글이 아닙니다.");
							}

						});

				$("#removeBtn").on(
						"click",
						function() {
							if (sessionName != null && sessionName == writer) {
								formObj.attr("action", "/TheClassic/" + loc[4]
										+ "/removePage");

								//formObj.attr("method","get");
								formObj.submit();
							} else {
								alert("로그인 하지 않았거나 자신이 작성한 글이 아닙니다.");
							}
						});

				$("#goListBtn ").on("click", function() {
					formObj.attr("method", "get");
					formObj.attr("action", "/TheClassic/" + loc[4] + "/list");

					formObj.submit();
				});

			});
</script>






<%@include file="../include/footer.jsp"%>
