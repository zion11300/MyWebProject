package snut.webframework.project.theclass.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	
	@Autowired MemberService memberService;
	
	@RequestMapping(value = "/member", method = RequestMethod.GET)
	public String home(Model model){
		
		model.addAttribute("shardData",memberService.getMemberLists());
		
		return "/member/memberList";
	}
}
