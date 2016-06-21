package snut.webframework.project.main;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import snut.webframework.project.theclass.controller.MemberController;

@Controller
@RequestMapping("/search/*")
public class SearchController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String home(Model model, HttpServletRequest request, HttpSession session) {
		System.out.println("search �겢由�");

		return "/tours/tourSearch";
	}

	@RequestMapping(value = "tourResult", method = RequestMethod.POST)
	public String home(Model model, HttpServletRequest request, HttpSession session,
			@RequestParam(value = "location") String location, @RequestParam(value = "city") String city,
			@RequestParam(value = "listSm") String listSm) {
		matchAPI start = new matchAPI();
		List<APIData> data = new ArrayList<APIData>();
		HttpSession Session = request.getSession();

		try {
			data = start.starts(location, city, listSm); // 占쏙옙占썩에 form占쏙옙占쏙옙 占쏙옙占쏙옙
															// value占쏙옙 占쌕뱄옙 url
															// 占쌍깍옙
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		logger.debug("data length : " + data.size());
		model.addAttribute("sharedData", data);
		model.addAttribute("session", session);
		model.addAttribute("dataSize", data.size());
		model.addAttribute("location", location);
		model.addAttribute("city", city);
		model.addAttribute("listSm", listSm);

		return "/tours/tourResult";
	}
	@RequestMapping(value = "tourResult2", method = RequestMethod.POST)
	public String home2(Model model, HttpServletRequest request, HttpSession session,
				@RequestParam(value = "keyword") String keyword) throws UnsupportedEncodingException {
		keywordSearch start = new keywordSearch();
		List<APIData> data = new ArrayList<APIData>();
		HttpSession Session = request.getSession();
		
		String Enkeyword=URLEncoder.encode(keyword,"UTF-8");
		
		try {
			data = start.starts(Enkeyword); // 占쏙옙占썩에 form占쏙옙占쏙옙 占쏙옙占쏙옙
															// value占쏙옙 占쌕뱄옙 url
															// 占쌍깍옙
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		logger.debug("data length : " + data.size());
		model.addAttribute("sharedData", data);
		model.addAttribute("session", session);
		model.addAttribute("dataSize", data.size());
		model.addAttribute("keyword",Enkeyword);

		return "/tours/tourResult2";
	}

	@RequestMapping(value = "tourDetailResult", method = RequestMethod.GET)
	public String ss(Model model, HttpServletRequest request, HttpSession session,
			HttpServletResponse response) {
		
		String ContentID = request.getParameter("ContentID");
		
		getDetail Detail = new getDetail();
		List<detailData> detailList = new ArrayList<detailData>();
		List<IntroData> introList= new ArrayList<IntroData>();
		List<String> imageList = new ArrayList<String>();
		List<APIData> commonList = new ArrayList<APIData>();
		try {
			detailList = Detail.detail(ContentID);
			introList = Detail.intro(ContentID);
			imageList = Detail.image(ContentID);
			commonList = Detail.common(ContentID);	
			} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		for(int i = 0 ; i < detailList.size(); i++){
//			System.out.println(detailList.get(i).getContent());
//		}
//		for(int i = 0 ; i < imageList.size(); i ++){
//			System.out.println(imageList.get(i));
//		}
		 List<IntroData> datas = introList;
		List<String> sibal = new ArrayList<String>();    
		List<String> result = new ArrayList<String>();
sibal.add(datas.get(0).getAgelimit());
sibal.add(datas.get(0).getBookingplace());
sibal.add(datas.get(0).getDiscountinfofestival());
sibal.add(datas.get(0).getEventstartdate());;
sibal.add(datas.get(0).getEventenddate());
sibal.add(datas.get(0).getEventhomepage());
sibal.add(datas.get(0).getEventplace());
sibal.add(datas.get(0).getPlaceinfo());
sibal.add(datas.get(0).getPlaytime());
sibal.add(datas.get(0).getProgram());
sibal.add(datas.get(0).getSpendtimefestival());
sibal.add(datas.get(0).getSponser1());
sibal.add(datas.get(0).getSponser1tel());
sibal.add(datas.get(0).getSponsor2());
sibal.add(datas.get(0).getSponser2tel());
sibal.add(datas.get(0).getSubevent());
sibal.add(datas.get(0).getUsetimefestival());
for(int i = 0 ; i < sibal.size() ; i++){
	
	
	result.add(sibal.get(i).replace('\n', ' '));
	System.out.println(result.get(i));
}
	
		System.out.println(commonList.size() + " / " + introList.size() + "/"+ detailList.size() + "detailList.size()" + " / " + imageList.size() );
		request.setAttribute("detailList", detailList);
		request.setAttribute("introList", result);
		request.setAttribute("imageList", imageList);
		request.setAttribute("commonList", commonList);
		request.setAttribute("ContentID", ContentID);
		return "/tours/tourDetailResult";
	}
	
	
	@RequestMapping(value = "tourDetailmap", method = RequestMethod.POST)
	public String sss(Model model, HttpServletRequest request, HttpSession session,
			HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String lot =(String) request.getParameter("lot");
		String lat = (String)request.getParameter("lat");
		String name = (String) request.getParameter("name1");
		System.out.println(lot+"/"+lat+"/"+name);
		request.setAttribute("mapx", lot);
		request.setAttribute("mapy", lat);
		request.setAttribute("name", name);
		return "/tours/map";
	}
}
