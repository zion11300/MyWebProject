<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/header.jsp" %>




	
	<div class="jumbotron" style="background-color:white;">
		<div class="container">
		
					<h2>상세 검색</h2>
				 		<div class="row">
				 		<div class="col-md-7">
								<form class="form-inline" role="form1" name="f" id="searchForm" method="post"  action="/TheClassic/search/tourResult">
					
									<!-- <th class="second wHacki8" scope="row">관광타입</th> -->
									
											<select name="tourType" id="tourType" style="display:none;">
												<option value="12">관광지</option>
												<option value="14">문화시설</option>
												<option value="15" selected>축제공연행사</option>
												<option value="25">여행코스</option>
												<option value="28">레포츠</option>
												<option value="32">숙박</option>
												<option value="38">쇼핑</option>
												<option value="39">음식점</option>
											</select>
									
							
									<font size=4>서비스분류 : </font>
											<select id="select1" name="listBg" id="listBg" style="display:none;" >
												<option selected>대분류</option> 
												<option value="A01">자연</option>
												<option value="A02">인문</option> 
											</select>
											<select id="select2" name="listM" id="listM" style="display:none;">
												<option selected>중분류</option>
												<option value="A0101">자연관광지</option>
												<option value="A0102">관광자원</option>
												<option value="A0208">공연/행사</option>
											</select>
											<div class="form-group">
											<select class="form-control input-lg" id="select3" name="listSm"  >
												<option selected>소분류</option>
												<option value="A02080100">전통공연</option>
												<option value="A02080200">연극</option>
												<option value="A02080300" selected>뮤지컬</option>
												<option value="A02080400">오페라</option>
												<option value="A02080500">전시회</option> 
												<option value="A02080600">박람회</option>
												<option value="A02080700">컨벤션</option>
												<option value="A02080800">무용</option>
												<option value="A02080900">클래식음악회</option>
												<option value="A02081000">대중콘서트</option>
												<option value="A02081100">영화</option>
												<option value="A02081200">스포츠경기</option>
												<option value="A02081300">기타행사</option>
											</select>
											
									
									<font size=4> &nbsp;지역 :</font>
									
											<select class="form-control input-lg" name="location" id="location"  onChange="javascript:selectEvent(this)">
												<option >지역선택</option>
												<option value="1">서울</option>
												<option value="2">인천</option>
												<option value="3">대전</option>
												<option value="4">대구</option>
												<option value="5">광주</option>
												<option value="6">부산</option>
												<option value="7">울산</option>
												<option value="8">세종</option>
												<option value="31">경기도</option>
												<option value="32">강원도</option>
												<option value="33">충청북도</option>
												<option value="34">충청남도</option>
												<option value="35">경상북도</option>
												<option value="36">경상남도</option>
												<option value="37">전라북도</option>
												<option value="38">전라남도</option>
												<option value="39">제주도</option> 
											</select>&nbsp;
									
											<select class="form-control input-lg" name="city" id="city" >
												<option >시군구 선택</option>
											
											</select>
											</div>
											<input type="hidden" value="1" name="hidden" id="hidden" >
													
								</form>
								</div>
								<div class="col-md-4">
								
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
							
						</div>
						
						
				<!-- <div class="searchUtill">
					<div>
					  <select name="arrange" id="arran"  title="정렬방법" >
						<option value="A" selected >제목순</option>
						<option value="B" >인기순</option>
						<option value="C" >최근수정순</option>
						<option value="D" >등록순</option>
						<option value="O" >제목순(이미지)</option>
					    <option value="P" >인기순(이미지)</option>
						<option value="Q" >최근수정순(이미지)</option>
						<option value="R" >등록순(이미지)</option>

					</select>
	             <input class="btn btn-info btn-sm" type="submit" id="arrview"  value="검색"  /> -->

				<hr>
			</div>
			
			</div>
			

			
<script>
$(document).ready(function(){
	var formObj1 = $("form[role='form1']");
	var formObj2 = $("form[role='form2']");

	$("#search2").on("click", function() {
		
		if($("#keyword").val()!=""){
			formObj2.attr("action", "/TheClassic/search/tourResult2");

			formObj2.attr("method", "post");
			formObj2.submit();
		}else{
			formObj1.attr("action", "/TheClassic/search/tourResult");

			formObj1.attr("method", "post");
			formObj1.submit();
		}
		
		
		
		
	});
		
		
		
		
	});
	
	
	
	
	

</script>
			
</body>
</html>