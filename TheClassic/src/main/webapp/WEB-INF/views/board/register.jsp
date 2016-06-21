<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>
<script type="text/javascript">
function check() {
	if (document.fr.title.value == "") {
		alert("제목을 입력해주세요.");
		document.fr.name.focus();
		return false;
	}
	/* if (document.fr.passwd.value == "") {
		alert("패스워드를 입력해주세요.");
		document.fr.passwd.focus();
		return false;
	} */
	if (document.fr.content.value == "") {
		alert("내용을 입력해주세요.");
		document.fr.subject.focus();
		return false;
	}
	
}
</script>
<!-- Main content -->
<div class="jumbotron" style="background-color:white;">
<div class="container">
		<!-- left column -->

			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h2>글쓰기</h2>
				</div>
				
				<!-- /.box-header -->

				<form role="form" method="post" id="fr" name="fr">
				
				<table style="width:100%;">
						<tr>
							<td><label for="exampleInputEmail1"><img
					src="/TheClassic/resources/img/4_head.png">&nbsp;&nbsp;제목</label>
							</td>
							<td> <input type="text"
								name='title' class="form-control" placeholder="Enter Title">
								</td>
						</tr>
						<tr>
							<td><label for="exampleInputPassword1"><img
					src="/TheClassic/resources/img/4_head.png">&nbsp;&nbsp;내용</label></td>
							<td><textarea style="width:100%;" id="content" name="content" rows="10" cols="100"
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
																	[ "" ]);
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
						</tr>
						<tr>
							<td><label for="exampleInputEmail1"><img
					src="/TheClassic/resources/img/4_head.png">&nbsp;&nbsp;글쓴이</label></td><td> <input type="text"
								value=<%=sessions.getAttribute("uname") %> readonly="readonly" name="writer" class="form-control" placeholder="Enter Writer">
								</td>
								</tr>
						
					<tr>
				<td><input class="btn btn-primary"
						type="button" name="save" id="save" value="등록"
						onclick="_onSubmit(this);">
					</td></tr>
					</table>
				</form>


			</div>
			<!-- /.box -->
	</div>	</div>
		<!--/.col (left) -->


<!-- /.content-wrapper -->

<%@include file="../include/footer.jsp"%>
