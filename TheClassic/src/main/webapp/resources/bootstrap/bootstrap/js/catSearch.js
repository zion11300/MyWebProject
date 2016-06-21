function selectEvent(selectObj) {
	if(selectObj.value==1)//서울
		{
		document.getElementById('city').innerHTML="<option value='1'>강남구</option><option value='2'>강동구</option><option value='3'>강북구</option><option value='4'>강서구</option><option value='5'>관악구</option><option value='6'>광진구</option><option value='7'>구로구</option><option value='8'>금천구</option><option value='9'>노원구</option><option value='10'>도봉구</option><option value='11'>동대문구</option><option value='12'>동작구</option><option value='13'>마포구</option><option value='14'>서대문구</option><option value='15'>서초구</option><option value='16'>성동구</option><option value='17'>성북구</option><option value='18'>송파구</option><option value='19'>양천구</option>";
		
		}
	if(selectObj.value==2)//인천
	{
	document.getElementById('city').innerHTML="<option value='1'>강화군</option><option value='2'>계양구</option><option value='3'>남구</option>"
	+"<option value='4'>남동구</option><option value='5'>동구</option><option value='6'>부평구</option>"
	+"<option value='7'>서구</option><option value='8'>연수구</option><option value='9'>옹진구</option><option value='10'>중구</option>";
	}
	if(selectObj.value==3)//대전
	{
	document.getElementById('city').innerHTML="<option value='1'>대덕구</option><option value='2'>동구</option><option value='3'>서구</option>"
	+"<option value='4'>유성구</option><option value='5'>중구</option>";
	}
	if(selectObj.value==4)//대구
	{
	document.getElementById('city').innerHTML="<option value='1'>남구</option><option value='2'>달서구</option><option value='3'>당성군</option>"
	+"<option value='4'>동구</option><option value='5'>북구</option><option value='6'>서구</option><option value='7'>수성구</option><option value='8'>중구</option>";
	}
	if(selectObj.value==5)//광주
	{
	document.getElementById('city').innerHTML="<option value='1'>광산구</option><option value='2'>남구</option><option value='3'>동구</option>"
	+"<option value='4'>북구</option><option value='5'>서구</option>";
	}
	if(selectObj.value==6)//부산
	{
	document.getElementById('city').innerHTML=
	"<option value='1'>강서구</option><option value='2'>금정구</option><option value='3'>기장군</option>"
	+"<option value='4'>남구</option><option value='5'>동구</option><option value='6'>동래구</option>"
	+"<option value='7'>부산진구</option><option value='8'>북구</option><option value='9'>사상구</option>"
	+"<option value='10'>사하구</option><option value='11'>서구</option><option value='12'>수영구</option>"
	+"<option value='13'>연제구</option><option value='14'>영도구</option><option value='15'>중구</option>"
	+"<option value='16'>해운대구</option>";
	}
	if(selectObj.value==7)//울산
	{
	document.getElementById('city').innerHTML=
		"<option value='1'>중구</option><option value='2'>남구</option><option value='3'>동구</option>"
	   +"<option value='4'>북구</option><option value='5'>울주군</option>";
	}
	if(selectObj.value==8)//세종특별자치시
	{
	document.getElementById('city').innerHTML=
		"<option value='1'>세종특별자치시</option>";
	}
	if(selectObj.value==31)//경기도
	{
	document.getElementById('city').innerHTML=
	"<option value='1'>가평군</option><option value='2'>고양시</option><option value='3'>과천시</option>"
	+"<option value='4'>광명시</option><option value='5'>광주시</option><option value='6'>구리시</option>"
	+"<option value='7'>군포시</option><option value='8'>김포시</option><option value='9'>남양주시</option>"
	+"<option value='10'>동두천시</option><option value='11'>부천시</option><option value='12'>성남시</option>"
	+"<option value='13'>수원시</option><option value='14'>시흥시</option><option value='15'>안산시</option>"
	+"<option value='16'>안성시</option><option value='17'>안양시</option><option value='18'>양주시</option>"
	+"<option value='19'>양평군</option><option value='20'>여주시</option><option value='21'>연천군</option>"
	+"<option value='22'>오산시</option><option value='23'>용인시</option><option value='24'>의왕시</option>"
	+"<option value='25'>의정부시</option><option value='26'>이천시</option><option value='27'>파주시</option>"
	+"<option value='28'>평택시</option><option value='29'>포천시</option><option value='30'>하남시</option>"
	+"<option value='31'>화성시</option>";
	}
	if(selectObj.value==32)//강원도
	{
	document.getElementById('city').innerHTML=
	"<option value='1'>강릉시</option><option value='2'>고성군</option><option value='3'>동해시</option>"
	+"<option value='4'>삼척시</option><option value='5'>속초시</option><option value='6'>양구군</option>"
	+"<option value='7'>양양군</option><option value='8'>영월군</option><option value='9'>원주시</option>"
	+"<option value='10'>인제군</option><option value='11'>정선군</option><option value='12'>철원군</option>"
	+"<option value='13'>춘천시</option><option value='14'>태백시</option><option value='15'>평창군</option>"
	+"<option value='16'>홍천군</option><option value='17'>화천군</option><option value='18'>횡성군</option>";
	}
	if(selectObj.value==33)//충북
	{
	document.getElementById('city').innerHTML=
	"<option value='1'>괴산군</option><option value='2'>단양군</option><option value='3'>보은군</option>"
	+"<option value='4'>영동군</option><option value='5'>옥천군</option><option value='6'>음성군</option>"
	+"<option value='7'>제천시</option><option value='8'>진천군</option><option value='9'>청원군</option>"
	+"<option value='10'>청주시</option><option value='11'>충주시</option><option value='12'>증평군</option>";
	}
	if(selectObj.value==34)//충남
	{
	document.getElementById('city').innerHTML=
	"<option value='1'>공주시</option><option value='2'>금산군</option><option value='3'>논산시</option>"
	+"<option value='4'>당진시</option><option value='5'>보령시</option><option value='6'>부여군</option>"
	+"<option value='7'>서산시</option><option value='8'>서천군</option><option value='9'>아산시</option>"
	+"<option value='10'>예신군</option><option value='11'>천안시</option><option value='12'>청양군</option>"
	+"<option value='13'>태안군</option><option value='14'>홍성군</option><option value='15'>계룡시</option>";
	}
	if(selectObj.value==35)//경북
	{
	document.getElementById('city').innerHTML=
	"<option value='1'>경산시</option><option value='2'>경주시</option><option value='3'>고령군</option>"
	+"<option value='4'>구미시</option><option value='5'>군위군</option><option value='6'>김천시</option>"
	+"<option value='7'>문경시</option><option value='8'>봉화군</option><option value='9'>상주시</option>"
	+"<option value='10'>동두천시</option><option value='11'>부천시</option><option value='12'>성남시</option>"
	+"<option value='13'>성주군</option><option value='14'>안동시</option><option value='15'>영덕군</option>"
	+"<option value='16'>영양군</option><option value='17'>영주시</option><option value='18'>영천시</option>"
	+"<option value='19'>예천군</option><option value='20'>울릉군</option><option value='21'>의성군</option>"
	+"<option value='22'>청도군</option><option value='23'>청송군</option><option value='24'>칠곡군</option>"
	+"<option value='25'>포항시</option>";
	}
	if(selectObj.value==36)//경남
	{
	document.getElementById('city').innerHTML=
	"<option value='1'>거제시</option><option value='2'>거창군</option><option value='3'>고성군</option>"
	+"<option value='4'>김해시</option><option value='5'>남해군</option><option value='6'>마산시</option>"
	+"<option value='7'>밀양시</option><option value='8'>사천시</option><option value='9'>산청군</option>"
	+"<option value='10'>양산시</option><option value='11'>의령군</option><option value='12'>진주시</option>"
	+"<option value='13'>진해시</option><option value='14'>창녕군</option><option value='15'>창원시</option>"
	+"<option value='16'>통영시</option><option value='17'>하동군</option><option value='18'>함안군</option>"
	+"<option value='19'>함양군</option><option value='20'>함천군</option>";
	}
	if(selectObj.value==37)//전북
	{
	document.getElementById('city').innerHTML=
	"<option value='1'>고창군</option><option value='2'>군산시</option><option value='3'>김제시</option>"
	+"<option value='4'>남원시</option><option value='5'>무주군</option><option value='6'>부안군</option>"
	+"<option value='7'>순창군</option><option value='8'>완주군</option><option value='9'>익산시</option>"
	+"<option value='10'>임실군</option><option value='11'>장수군</option><option value='12'>전주시</option>"
	+"<option value='13'>정읍시</option><option value='14'>진안군</option>";
	}
	if(selectObj.value==38)//전남
	{
	document.getElementById('city').innerHTML=
	"<option value='1'>강진군</option><option value='2'>고흥군</option><option value='3'>곡성군</option>"
	+"<option value='4'>광양시</option><option value='5'>구례군</option><option value='6'>나주시</option>"
	+"<option value='7'>담양군</option><option value='8'>목포시</option><option value='9'>무안군</option>"
	+"<option value='10'>보성군</option><option value='11'>순천시</option><option value='12'>신안군</option>"
	+"<option value='13'>여수시</option><option value='14'>영광군</option><option value='15'>영암군</option>"
	+"<option value='16'>완도군</option><option value='17'>장성군</option><option value='18'>장흥군</option>"
	+"<option value='19'>진도군</option><option value='20'>함평군</option><option value='21'>해남군</option>"
	+"<option value='22'>화순군</option>";
	}
	if(selectObj.value==39)//제주
	{
	document.getElementById('city').innerHTML=
	"<option value='1'>남재주군</option><option value='2'>북제주군</option><option value='3'>서귀포시</option>"
	+"<option value='4'>제주시</option>";
	}
}