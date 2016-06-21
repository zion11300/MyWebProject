package snut.webframework.project.main;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpServletRequest request) {

		getAPIData start = new getAPIData();
		List<APIData> data = new ArrayList<APIData>();
		// HttpSession Session = request.getSession();
		// session.setAttribute("id", "������ �ٺ�");
		try {
			data = start.starts();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		logger.debug("data length : " + data.size());
		model.addAttribute("sharedData", data);

		
		return "main";
	}
	
	@RequestMapping(value="/test")
	public String test(){
		return "noticesboard/test";
	}

	@RequestMapping(value = "/fb_login", method = RequestMethod.POST)
	public String homes(Model model, HttpServletRequest request, HttpSession session) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String name= request.getParameter("name").toString();
		System.out.println(name);
		session.setAttribute("uname", name);
		session.setAttribute("login_method", 3);
		return "redirect:/";
	}
	@RequestMapping(value = "/fb_login/logout", method =RequestMethod.GET)
	   public String logout(HttpSession session){
	      session.removeAttribute("uname");
	      session.removeAttribute("login_method");
	      return "redirect:/";
	      
	   }
	@RequestMapping(value = "/k_login", method = RequestMethod.POST)
	public String homess(Model model, HttpServletRequest request, HttpSession session) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String name= request.getParameter("name").toString();
		System.out.println(name+"controller");
		session.setAttribute("uname", name);
		session.setAttribute("login_method", 2);
		return "redirect:/";
	}
	@RequestMapping(value = "/k_login/logout", method =RequestMethod.GET)
	   public String klogout(HttpSession session){
	      session.removeAttribute("uname");
	      session.removeAttribute("login_method");
	      return "redirect:/";
	      
	   }
}
