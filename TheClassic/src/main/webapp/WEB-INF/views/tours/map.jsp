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
	<button onclick="getLocation()">��ǥ ���ϱ�!!</button>

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
		
		    // ���������� �˻��� �Ϸ������ 
		    if (status === daum.maps.services.Status.OK) {
				resultSX = result.x;
				resultSY = result.y;
				//alert("resultSX" + resultSX +"/" +resultSY);
				flag1 = true;
		        // ��Ŀ�� ��ȯ�� ��ġ�� ǥ���մϴ�
		        var marker = new daum.maps.Marker({
		            position: new daum.maps.LatLng(result.y, result.x), // ��Ŀ�� ǥ���� ��ġ�Դϴ�
		            map: map // ��Ŀ�� ǥ���� ������ü�Դϴ�
		        })
		   
			}
		}
		function transCoordCB1(status, result) {
	
		    // ���������� �˻��� �Ϸ������ 
		    if (status === daum.maps.services.Status.OK) {
				resultEX = result.x;
				resultEY = result.y;
		        // ��Ŀ�� ��ȯ�� ��ġ�� ǥ���մϴ�
		        flag2= true;
		        var marker = new daum.maps.Marker({
		            position: new daum.maps.LatLng(result.y, result.x), // ��Ŀ�� ǥ���� ��ġ�Դϴ�
		            map: map // ��Ŀ�� ǥ���� ������ü�Դϴ�
		        })
		   
	}
		}
		function searchDetailAddrFromCoords(coords, callback) {
		    // ��ǥ�� ������ �� �ּ� ������ ��û�մϴ�
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
		    daum.maps.services.Coords.WGS84, // ��ȯ�� ���� �Է��� ��ǥ�� �Դϴ�
		    daum.maps.services.Coords.CONGNAMUL, // ��ȯ ����� ���� ��ǥ�� �Դϴ� 
		    transCoordCB); // ��ȯ ����� ���� �ݹ��ռ� �Դϴ�
		
		    geocoder.transCoord(eY, 
		    		eX, 
			        daum.maps.services.Coords.WGS84, // ��ȯ�� ���� �Է��� ��ǥ�� �Դϴ�
			        daum.maps.services.Coords.CONGNAMUL, // ��ȯ ����� ���� ��ǥ�� �Դϴ� 
			        transCoordCB1); // ��ȯ ����� ���� �ݹ��ռ� �Դϴ�
			  
			      searchDetailAddrFromCoords(sLatLng, function(status, result) {
			        if (status === daum.maps.services.Status.OK) {
			            var detailAddr = !!result[0].roadAddress.name ? '<div>���θ��ּ� : ' + result[0].roadAddress.name + '</div>' : '';
			            detailAddr += '<div>���� �ּ� : ' + result[0].jibunAddress.name + '</div>';
			            sName = result[0].jibunAddress.name;
			            var content = '<div class="bAddr">' +
			                            '<span class="title">������ �ּ�����</span>' + 
			                            detailAddr + 
			                        '</div>';

			            
			            searchDetailAddrFromCoords(eLatLng, function(status, result) {
					        if (status === daum.maps.services.Status.OK) {
					            var detailAddr = !!result[0].roadAddress.name ? '<div>���θ��ּ� : ' + result[0].roadAddress.name + '</div>' : '';
					            detailAddr += '<div>���� �ּ� : ' + result[0].jibunAddress.name + '</div>';
					            eName = result[0].jibunAddress.name;
					            var content = '<div class="bAddr">' +
					                            '<span class="title">������ �ּ�����</span>' + 
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