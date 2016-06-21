<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>

<div class="jumbotron" style="background-color:white;">
<div class="container">
<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h2>글 수정</h2>
				</div>
				<!-- /.box-header -->
<script type="text/javascript">


</script>
<form role="form" action="modifyPage" method="post">

	<input type='hidden' name='page' value="${cri.page}"> <input
		type='hidden' name='perPageNum' value="${cri.perPageNum}">
	<input type='hidden' name='searchType' value="${cri.searchType}">
	<input type='hidden' name='keyword' value="${cri.keyword}">

					<div class="box-body">

						<div class="form-group">
							<label for="exampleInputEmail1"><img
					src="/TheClassic/resources/img/4_head.png">&nbsp;&nbsp;글 넘버</label> <input type="text"
								name='bno' class="form-control" value="${data.bno}"
								readonly="readonly">
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1"><img
					src="/TheClassic/resources/img/4_head.png">&nbsp;&nbsp;제목</label> <input type="text"
								name='title' class="form-control" value="${data.title}">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1"><img
					src="/TheClassic/resources/img/4_head.png">&nbsp;&nbsp;내용</label>
							<textarea style="width:100%;" id="content" name="content" rows="10" cols="100"
								placeholder="Enter ..."></textarea></td>
							<script type="text/javascript" src="/TheClassic/resources/se2/js/HuskyEZCreator.js"
							charset="utf-8"></script> <script type="text/javascript">
								var oEditors = [];
								$(function() {
									nhn.husky.EZCreator
											.createInIFrame({
												oAppRef : oEditors,
												elPlaceHolder : "content",
												//SmartEditor2Skin.html 파일이 존재하는 경로
												sSkinURI : "/TheClassic/resources/se2/SmartEditor2Skin.html",
												htParams : {
													// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
													bUseToolbar : true,
													// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
													bUseVerticalResizer : true,
													// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
													bUseModeChanger : true,
													fOnBeforeUnload : function() {

													}
												},
												fOnAppLoad : function() {
													//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
													oEditors.getById["content"]
															.exec(
																	"PASTE_HTML",
																	[ "기존 DB에 저장된 내용을 에디터에 적용할 문구" ]);
												},
												fCreator : "createSEditor2"
											});
								});
								function _onSubmit(elClicked) {

									oEditors.getById["content"].exec(
											"UPDATE_CONTENTS_FIELD", []);
									try {
										check();
										elClicked.form.submit();
										
										$("#fr").submit();
									} catch (e) {
									}
								}
							</script>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1"><img
					src="/TheClassic/resources/img/4_head.png">&nbsp;&nbsp;글쓴이</label> <input
								type="text" name="writer" class="form-control"
								value="${data.writer}" readonly = "readonly">
						</div>
					</div>
					<!-- /.box-body -->
				</form>
				<div class="box-footer">
					<input class="btn btn-primary"
						type="button" name="save" id="save" value="저장"
						onclick="_onSubmit(this);">
					<button type="submit" class="btn btn-warning">취소</button>
				</div>

<script>
$(document).ready(
	function() {

		var formObj = $("form[role='form']");

		console.log(formObj);

		$(".btn-warning")
				.on("click",function() {
					self.location = "./list?page=${cri.page}&perPageNum=${cri.perPageNum}"
							+ "&searchType=${cri.searchType}&keyword=${cri.keyword}";
				});

		$(".btn-primary").on("click",
				function() {
					formObj.submit();
				});
	});
</script>




			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
</div></div>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<%@include file="../include/footer.jsp"%>
