<%@page import="snut.webframework.project.theclassic.board.domain.SearchCriteria"%>
<%@page import="snut.webframework.project.theclassic.board.domain.Criteria"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<%@ page import="snut.webframework.project.theclassic.board.*" %>
<%@include file="../include/header.jsp"%>

<%
	request.setCharacterEncoding("UTF-8");
SearchCriteria vo = (SearchCriteria) request.getAttribute("cri");
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
		
		
%>

<script type="text/javascript">
function paging(test){
	var url = test;
	
	location.href=test;
	
}
function check() {
	if (document.fr.name.value == "") {
		alert("이름을 입력해주세요.");
		document.fr.name.focus();
		return false;
	}
	if (document.fr.passwd.value == "") {
		alert("패스워드를 입력해주세요.");
		document.fr.passwd.focus();
		return false;
	}
	if (document.fr.subject.value == "") {
		alert("제목을 입력해주세요.");
		document.fr.subject.focus();
		return false;
	}
	if (document.fr.content.value == "") {
		alert("내용을 입력해주세요.");
		document.fr.content.focus();
		return false;
	}
}
</script>
<!-- Main content -->
	<div class="jumbotron" style="background-color:white;">
		<div class="container">
<section class="content">
	<div class="row">
		<!-- left column -->


		<div class="col-md-12">
			<!-- general form elements -->
			<h2><%=result %></h2>
			<br>
			<div class='box'>
				<div class="box-header with-border">
					<h3 class="box-title">검색</h3>
				</div>


				<div class='box-body'>

					<select name="searchType">
						<option value="n"
							<c:out value="${cri.searchType == null?'selected':''}"/>>
							---</option>
						<option value="t"
							<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
							제목</option>
						<option value="c"
							<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
							내용</option>
						<option value="w"
							<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
							글쓴이</option>
						<option value="tc"
							<c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>
							제목 or 내용</option>
						<option value="cw"
							<c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>
							내용 or 글쓴이</option>
						<option value="tcw"
							<c:out value="${cri.searchType eq 'tcw'?'selected':''}"/>>
							제목 or 내용 or 글쓴이</option>
					</select> <input type="text" name='keyword' id="keywordInput"
						value='${cri.keyword }'>
					<button id='searchBtn' class="btn btn-default">검색</button>
					<button id='newBtn' class="btn btn-default">새 글 쓰기</button>

				</div>
			</div>


			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">글 목록</h3>
				</div>
				<div class="box-body">
					<table class="table table-bordered">
						<tr>
							
							<th>제목</th>
							<th>글쓴이</th>
							<th>등록 시간</th>
							<th style="width: 140px">조회수</th>
						</tr>

						<c:forEach items="${list}" var="boardVO">

							<tr >
								
								<td onclick="paging('./readPage${pageMaker.makeSearch(pageMaker.cri.page) }&bno=${boardVO.bno}');"><a
									href='./readPage${pageMaker.makeSearch(pageMaker.cri.page) }&bno=${boardVO.bno}'>
										${boardVO.title} </a></td>
								<td>${boardVO.writer}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
										value="${boardVO.regdate}" /></td>
								<td><span class="badge bg-red">${boardVO.viewcnt }</span></td>
							</tr>

						</c:forEach>

					</table>
				</div>
				<!-- /.box-body -->


				<div class="box-footer">

					<div class="text-center">
						<ul class="pagination">

							<c:if test="${pageMaker.prev}">
								<li><a
									href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
							</c:if>

						</ul>
					</div>

				</div>
				<!-- /.box-footer-->
			</div>
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->
</div></div>

<script>
	var result = '${msg}';

	if (result == 'SUCCESS') {
		alert("처리가 완료되었습니다.");
	}
</script>

<script>
	$(document).ready(
			function() {

				$('#searchBtn').on(
						"click",
						function(event) {

							self.location = "list"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword=" + $('#keywordInput').val();

						});
				<%if(sessions.getAttribute("uname") !=null){%>

				$('#newBtn').on("click", function(evt) {

					self.location = "register";

				});
				<%}else{%>
				
				$('#newBtn').on("click", function(evt) {

					alert("로그인 해주십시오.");

				});
				<%}%>
				
				

			});
</script>

<%@include file="../include/footer.jsp"%>
