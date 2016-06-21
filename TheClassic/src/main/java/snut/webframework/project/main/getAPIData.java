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

public class getAPIData {
	String cultureServiceKey = "r3ynkH4eMvOrrkti0tzwlafQJ4GYJ9vB37XPuVFwdbcv0VDHdBM5uqQ1V%2BoyAEr1lUScEImr8XalSjk5zMn0aw%3D%3D";
	public List<APIData> starts() throws Exception {

		URL url = new URL(
				"http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?"
				+ "ServiceKey=r3ynkH4eMvOrrkti0tzwlafQJ4GYJ9vB37XPuVFwdbcv0VDHdBM5uqQ1V%2BoyAEr1lUScEImr8XalSjk5zMn0aw%3D%3D"
				+ "&contentTypeId=15&areaCode=&sigunguCode=&cat1=A02&cat2=A0208&cat3=A02080300&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=12&pageNo=1");
				
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
				//System.out.println(node.getNodeName()     +  "            :  " + node.getTextContent());
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
		URL testURL = new URL("http://www.culture.go.kr/openapi/rest/publicperformancedisplays/d/?ServiceKey=r3ynkH4eMvOrrkti0tzwlafQJ4GYJ9vB37XPuVFwdbcv0VDHdBM5uqQ1V%2BoyAEr1lUScEImr8XalSjk5zMn0aw%3D%3D&numOfRows=999&pageSize=999&pageNo=1&startPage=1"
				);
	
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
