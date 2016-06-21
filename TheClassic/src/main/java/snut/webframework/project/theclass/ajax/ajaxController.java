package snut.webframework.project.theclass.ajax;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ajaxController {

	@RequestMapping(value = "/getsiguncode.ajax", method = RequestMethod.GET)
	public ModelAndView getSiguncode(Model model) {
		List<siguncode> Lists = new ArrayList<siguncode>();
		
		ModelAndView mav = new ModelAndView();

		return mav;
	}
}

class siguncode {
	private String name;
	private String code;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

}