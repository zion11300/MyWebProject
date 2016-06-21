package snut.webframework.project.main;

import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;



public class getDetail {

	public List<IntroData> intro(String Contentid) throws Exception {
		String urls = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro?"
				+ "ServiceKey=r3ynkH4eMvOrrkti0tzwlafQJ4GYJ9vB37XPuVFwdbcv0VDHdBM5uqQ1V%2BoyAEr1lUScEImr8XalSjk5zMn0aw%3D%3D"
+"&contentId="+Contentid+"&contentTypeId=15&MobileOS=ETC&MobileApp=AppTesting&introYN=Y";

		URL url = new URL(
				urls);
				
		URLConnection connection = url.openConnection();

		Document doc = parseXML(connection.getInputStream());
		NodeList descNodes = doc.getElementsByTagName("item");
		
		List<IntroData> datas = new ArrayList<IntroData>();
		for (int i = 0; i < descNodes.getLength(); i++) {
			IntroData data = new IntroData();
			
			//xml nodes
			for (Node node = descNodes.item(i).getFirstChild(); node != null; node = node.getNextSibling()) {
				//System.out.println(node.getNodeName()     +  "            :  " + node.getTextContent());
				if (node.getNodeName().equals("agelimit")) {
					data.setAgelimit("관람 가능연령 : "+node.getTextContent());
				} else if (node.getNodeName().equals("bookingplace")) {
					data.setBookingplace("예매처 : " + node.getTextContent());
				} else if (node.getNodeName().equals("discountinfofestival")) {
					data.setDiscountinfofestival("할인 정보 : " +node.getTextContent());
				} else if (node.getNodeName().equals("eventenddate")) {
					data.setEventenddate("행사 종료일 : " + node.getTextContent());
				} else if (node.getNodeName().equals("eventhomepage")) {
					data.setEventhomepage("행사 홈페이지 : " + node.getTextContent());
				} else if (node.getNodeName().equals("eventplace")) {
					data.setEventplace("행사 장소 : " + node.getTextContent());
				} else if (node.getNodeName().equals("eventstartdate")) {
					data.setEventstartdate("행사 시작일 : " + node.getTextContent());
				}
				else if (node.getNodeName().equals("contenttypeid")) {
					data.setContenttypeid(node.getTextContent());
				} else if (node.getNodeName().equals("contentid")) {
					data.setContentid(node.getTextContent());
				} else if (node.getNodeName().equals("placeinfo")) {
					data.setPlaceinfo("행사장 위치안내 : " +node.getTextContent());
				} else if (node.getNodeName().equals("playtime")) {
					data.setPlaytime("공연시간 : " +node.getTextContent());
				} else if (node.getNodeName().equals("program")) {
					data.setProgram("행사 프로그램 : " + node.getTextContent());
				} else if (node.getNodeName().equals("spendtimefestival")) {
					data.setSpendtimefestival("관람 소요시간 : " + node.getTextContent());
				} else if (node.getNodeName().equals("sponsor1")) {
					data.setSponser1("주최자 정보 : " + node.getTextContent());
				} else if (node.getNodeName().equals("sponsor1tel")) {
					data.setSponser1tel("주최자 연락처 : " + node.getTextContent());
				} else if (node.getNodeName().equals("sponsor2")) {
					data.setSponsor2("주관사 정보 : " + node.getTextContent());
				} else if (node.getNodeName().equals("sponsor2tel")) {
					data.setSponser2tel("주관사 연락처 : " + node.getTextContent());
				} else if (node.getNodeName().equals("subevent")) {
					data.setSubevent("부대 행사 : " + node.getTextContent());
				} else if (node.getNodeName().equals("usetimefestival")) {
					data.setUsetimefestival("이용요금 : "+node.getTextContent());
				} 
				
			}
			datas.add(data);
		}
		//System.out.println(datas.size());
		return datas;

	}

	public List<detailData> detail(String Contentid) throws Exception {
		String urls = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailInfo?ServiceKey="
				+ "r3ynkH4eMvOrrkti0tzwlafQJ4GYJ9vB37XPuVFwdbcv0VDHdBM5uqQ1V%2BoyAEr1lUScEImr8XalSjk5zMn0aw%3D%3D"
			+"&contentId="+Contentid+"&contentTypeId=15&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&detailYN=Y";

		URL url = new URL(
				urls);
				
		URLConnection connection = url.openConnection();

		Document doc = parseXML(connection.getInputStream());
		NodeList descNodes = doc.getElementsByTagName("item");
		
		List<detailData> datas = new ArrayList<detailData>();
		for (int i = 0; i < descNodes.getLength(); i++) {
			detailData data = new detailData();
			
			//xml nodes
			for (Node node = descNodes.item(i).getFirstChild(); node != null; node = node.getNextSibling()) {
				
				if (node.getNodeName().equals("infoname")) {
					data.setType(node.getTextContent());
				} else if (node.getNodeName().equals("infotext")) {
					data.setContent(node.getTextContent());
				} 
				
			}
			datas.add(data);
		}
		
		return datas;

	}
	
	public List<String> image(String Contentid) throws Exception {
		String urls = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailImage?ServiceKey="
				+ "r3ynkH4eMvOrrkti0tzwlafQJ4GYJ9vB37XPuVFwdbcv0VDHdBM5uqQ1V%2BoyAEr1lUScEImr8XalSjk5zMn0aw%3D%3D"
			+"&contentId="+Contentid+"&imageYN=Y&MobileOS=ETC&MobileApp=AppTesting";

		URL url = new URL(
				urls);
				
		URLConnection connection = url.openConnection();

		Document doc = parseXML(connection.getInputStream());
		NodeList descNodes = doc.getElementsByTagName("item");
		
		List<String> datas = new ArrayList<String>();
		for (int i = 0; i < descNodes.getLength(); i++) {
			String data = new String();
			
			//xml nodes
			for (Node node = descNodes.item(i).getFirstChild(); node != null; node = node.getNextSibling()) {
				
				if (node.getNodeName().equals("originimgurl")) {
					data = node.getTextContent();
				} 
				
			}
			datas.add(data);
		}
		
		return datas;

	}
	public List<APIData> common(String id) throws Exception {

		URL url = new URL(
				"http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey="
				+ "r3ynkH4eMvOrrkti0tzwlafQJ4GYJ9vB37XPuVFwdbcv0VDHdBM5uqQ1V%2BoyAEr1lUScEImr8XalSjk5zMn0aw%3D%3D"
					
					+"&contentId="+id+"&defaultYN=Y&addrinfoYN=Y&overviewYN=Y&firstImageYN=Y&areacodeYN=Y&mapinfoYN=Y&MobileOS=ETC&MobileApp=AppTesting");
//				"http://api.visitkorea.or.kr/openapi/service/rest/KorService/"
//				+ "searchFestival?"
//				+ "MobileOS=ETC"
//				+ "&MobileApp=�����ڿ�����"
//				+ "&numOfRows=18"
//				+ "&pageNo=2"
//				+ "&ServiceKey=v4NLx7ibzkPI1S708YBFV5wa8wkpqGiMaxRtpPiLr0bo3A6bjgKGYe6900SLrdN8eJghYvWUEkStS1iN%2FCGazg%3D%3D");
		URLConnection connection = url.openConnection();

		Document doc = parseXML(connection.getInputStream());
		NodeList descNodes = doc.getElementsByTagName("item");
		
		List<APIData> datas = new ArrayList<APIData>();
		for (int i = 0; i < descNodes.getLength(); i++) {
			APIData data = new APIData();
			
			//xml nodes
			for (Node node = descNodes.item(i).getFirstChild(); node != null; node = node.getNextSibling()) {
				System.out.println(node.getNodeName()     +  "            :  " + node.getTextContent());
				if (node.getNodeName().equals("addr1")) {
					data.setAddr1(node.getTextContent());
				} else if (node.getNodeName().equals("addr2")) {
					data.setAddr2(node.getTextContent());
				} else if (node.getNodeName().equals("areacode")) {
					data.setAreacode(node.getTextContent());
				} else if (node.getNodeName().equals("cat1")) {
					data.setCat1(node.getTextContent());
				} else if (node.getNodeName().equals("cat2")) {
					data.setCat2(node.getTextContent());
				} else if (node.getNodeName().equals("cat3")) {
					data.setCat3(node.getTextContent());
				} else if (node.getNodeName().equals("contentid")) {
					data.setContentid(node.getTextContent());
				}
				else if (node.getNodeName().equals("contenttypeid")) {
					data.setContexttypeid(node.getTextContent());
				} else if (node.getNodeName().equals("createtime")) {
					data.setCreatetime((Long.parseLong(node.getTextContent())));
				} else if (node.getNodeName().equals("eventenddate")) {
					data.setEventenddate(node.getTextContent());
				} else if (node.getNodeName().equals("eventstartdate")) {
					data.setEventstartdate((node.getTextContent()));
				} else if (node.getNodeName().equals("firstimage")) {
					data.setFirstimageURL(node.getTextContent());
					
				} else if (node.getNodeName().equals("firstimage2")) {
					data.setFirstImage2URL(node.getTextContent());
				
				} else if (node.getNodeName().equals("mapx")) {
					data.setMapx(node.getTextContent());
				} else if (node.getNodeName().equals("mapy")) {
					data.setMapy((node.getTextContent()));
				} else if (node.getNodeName().equals("modifiedtime")) {
					data.setModifiedtime((node.getTextContent()));
				} else if (node.getNodeName().equals("readcount")) {
					data.setReadcount((node.getTextContent()));
				} else if (node.getNodeName().equals("sigungucode")) {
					data.setSigungucode((node.getTextContent()));
				} else if (node.getNodeName().equals("tel")) {
					data.setTel(node.getTextContent());
				} else if (node.getNodeName().equals("title")) {
					data.setTitle(node.getTextContent());
				}
				
			}
			if(data.getFirstImage2URL().equals("")){
				data.setFirstimageURL("/TheClassic/resources/images/noImage.png");
			}
			if(data.getFirstimageURL().equals("")){
				data.setFirstimageURL("/TheClassic/resources/images/noImage.png");
			}
			datas.add(data);
		}
		//System.out.println(datas.size());
		return datas;

	}
	
	public Document parseXML(InputStream stream) throws Exception {

		DocumentBuilderFactory objDocumentBuilderFactory = null;
		DocumentBuilder objDocumentBuilder = null;
		Document doc = null;

		try {

			objDocumentBuilderFactory = DocumentBuilderFactory.newInstance();
			objDocumentBuilder = objDocumentBuilderFactory.newDocumentBuilder();

			doc = objDocumentBuilder.parse(stream);

		} catch (Exception ex) {
			throw ex;
		}
	
		return doc;
	}
}
