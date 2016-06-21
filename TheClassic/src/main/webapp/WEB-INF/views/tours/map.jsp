<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
request.setCharacterEncoding("UTF-8");
String name = (String) request.getAttribute("name");
String lot = (String) request.getAttribute("mapx");
String lat = (String) request.getAttribute("mapy");%>

	<script type="text/javascript"
	src="http://apis.daum.net/maps/maps3.js?apikey=8d3d8848b8809fedd638c96bcf4e8927&libraries=services"></script>
    
<script src="http://code.jquery.com/jquery-2.1.1.min.js"
	type="text/javascript"></script>
	


<body>
	<div id="map" style="width:750px;height:350px;"></div>

	
	<div id="demo1"></div>
	<button onclick="getLocation()">좌표 구하기!!</button>

<script type="text/javascript">
	  var sX=0,sY=0,eX=0,eY=0,sName="",eName="";  var resultSX=0,resultSY=0,resultEX=0,resultEY=0;
	
		var geocoder = new daum.maps.services.Geocoder();
		var latitude = 0;
		var longitude = 0;
		var lot = '<%=lot%>';
		var lat = '<%=lat%>';
		var name = '<%=name%>';
		var flag1 = false; var flag2 = false;
		var x = document.getElementById("demo1");
		function getLocation() {

		    if (navigator.geolocation) {
		        navigator.geolocation.getCurrentPosition(showPosition);
		        
		    } else {
		        x.innerHTML = "Geolocation is not supported by this browser.";
		    }
		 
		}
		function transCoordCB(status, result) {
		
		    // 정상적으로 검색이 완료됐으면 
		    if (status === daum.maps.services.Status.OK) {
				resultSX = result.x;
				resultSY = result.y;
				//alert("resultSX" + resultSX +"/" +resultSY);
				flag1 = true;
		        // 마커를 변환된 위치에 표시합니다
		        var marker = new daum.maps.Marker({
		            position: new daum.maps.LatLng(result.y, result.x), // 마커를 표시할 위치입니다
		            map: map // 마커를 표시할 지도객체입니다
		        })
		   
			}
		}
		function transCoordCB1(status, result) {
	
		    // 정상적으로 검색이 완료됐으면 
		    if (status === daum.maps.services.Status.OK) {
				resultEX = result.x;
				resultEY = result.y;
		        // 마커를 변환된 위치에 표시합니다
		        flag2= true;
		        var marker = new daum.maps.Marker({
		            position: new daum.maps.LatLng(result.y, result.x), // 마커를 표시할 위치입니다
		            map: map // 마커를 표시할 지도객체입니다
		        })
		   
	}
		}
		function searchDetailAddrFromCoords(coords, callback) {
		    // 좌표로 법정동 상세 주소 정보를 요청합니다
		    geocoder.coord2detailaddr(coords, callback);
		}
		function showPosition(position) {
		    x.innerHTML = "Latitude: " + position.coords.latitude + 
		    "<br>Longitude: " + position.coords.longitude; 
		    latitude = position.coords.latitude;
		    longitude = position.coords.longitude;
		    //alert(latitude + " / " + longitude);
		    
	 var sLatLng = new daum.maps.LatLng(lat,lot);
			var eLatLng = new daum.maps.LatLng(latitude,longitude);
			//alert(lat+ " / " + lot + " / " +latitude + " / "+longitude);

			  sX = latitude; sY = longitude; 
			  eX = lat; eY = lot;
			//alert(sX + " / " + sY + " / " + eX + " / " +eY);
			  geocoder.transCoord(sY, 
		    sX, 
		    daum.maps.services.Coords.WGS84, // 변환을 위해 입력한 좌표계 입니다
		    daum.maps.services.Coords.CONGNAMUL, // 변환 결과로 받을 좌표계 입니다 
		    transCoordCB); // 변환 결과를 받을 콜백합수 입니다
		
		    geocoder.transCoord(eY, 
		    		eX, 
			        daum.maps.services.Coords.WGS84, // 변환을 위해 입력한 좌표계 입니다
			        daum.maps.services.Coords.CONGNAMUL, // 변환 결과로 받을 좌표계 입니다 
			        transCoordCB1); // 변환 결과를 받을 콜백합수 입니다
			  
			      searchDetailAddrFromCoords(sLatLng, function(status, result) {
			        if (status === daum.maps.services.Status.OK) {
			            var detailAddr = !!result[0].roadAddress.name ? '<div>도로명주소 : ' + result[0].roadAddress.name + '</div>' : '';
			            detailAddr += '<div>지번 주소 : ' + result[0].jibunAddress.name + '</div>';
			            sName = result[0].jibunAddress.name;
			            var content = '<div class="bAddr">' +
			                            '<span class="title">법정동 주소정보</span>' + 
			                            detailAddr + 
			                        '</div>';

			            
			            searchDetailAddrFromCoords(eLatLng, function(status, result) {
					        if (status === daum.maps.services.Status.OK) {
					            var detailAddr = !!result[0].roadAddress.name ? '<div>도로명주소 : ' + result[0].roadAddress.name + '</div>' : '';
					            detailAddr += '<div>지번 주소 : ' + result[0].jibunAddress.name + '</div>';
					            eName = result[0].jibunAddress.name;
					            var content = '<div class="bAddr">' +
					                            '<span class="title">법정동 주소정보</span>' + 
					                            detailAddr + 
					                        '</div>';

					            
					           // alert(resultSX + " / " + resultSY + " / " + resultEX + " / " + resultEY + " / " +sName + " / " + eName);
						         location.href='http://map.daum.net/?map_type=TYPE_SKYVIEW&map_hybrid=true&target=car&sX='+resultSX+'&sY='+resultSY+'&eX='+resultEX+
						        		'&eY='+resultEY+'&sName='+eName+'&eName='+sName; 
					          /*   location.href='http://map.daum.net/?map_type=TYPE_SKYVIEW&map_hybrid=true&target=car&sX='+sX+'&sY='+sY+'&eX='+eX+
				        		'&eY='+eY+'&sName='+eName+'&eName='+sName; */
						       }
					        
					    });
			        }   
			    });
			   
			  
		}
	
		$(document).ready(function(){
			getLocation();
		});

		 /*  if (navigator.geolocation)
		    {
		    navigator.geolocation.getCurrentPosition(function(){
		    	latitude = position.coords.latitude; 
				longitude = position.coords.longitude;
		    });
		    } */
		//
	
	
	
	

	</script>

	
</body>
</html>