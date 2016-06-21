package snut.webframework.project.login;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.ModelAndView;

import snut.webframework.project.theclassic.board.domain.ReplyVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.datasource.UserCredentialsDataSourceAdapter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/user/*")
public class LoginController {
   @Inject
   private LoginService service;
   // @Autowired
   // Loginservice loginservice;
   //

   // @RequestMapping(value = "/list", method = RequestMethod.GET)
   // public String list(Model model) {
   //
   //
   // List<Login> lists = loginservice.getMemList();
   //
   //
   // model.addAttribute("member", loginservice.getMemList());
   //
   // System.out.println("list : " + lists.get(0).getId());
   //
   // return "list";
   // }
   @RequestMapping(value = "/login", method = RequestMethod.GET)
   public String login() {

      return "user/login";
   }

//   @RequestMapping(value = "/login", method = RequestMethod.POST)
//   public ModelAndView login(Model model, HttpSession session, HttpServletRequest request,
//         @RequestParam("uid") String uid, @RequestParam("upw") String upw, LoginVO vo) throws Exception {
//      ModelAndView mav = new ModelAndView();
//
//      model.addAttribute("uid", uid);
//      model.addAttribute("upw", upw);
//    
//    	  List<LoginVO> lists = service.login(uid);
//    	  if (!lists.isEmpty()) {
//    		  System.out.println("service.login : " + service.login(uid));
//    	         System.out.println(lists.get(0).getUpw() + "    postpw: " + upw);
//    	         if (lists.get(0).getUpw().toString().trim().equals(
//    	               upw.toString().trim())) {
//    	            session.setAttribute("uname", lists.get(0).getUname().toString());
//    	            System.out.println("Login success");
//    	            mav.setViewName("redirect:/");
//    	         } else {
//    	            mav.setViewName(null);
//    	            System.out.println("Login Fail");
//    	         }
//    	      }
//    	  else{
//    		  mav.setViewName(null);
//    	  }
    	  
    	  @RequestMapping(value = "/login", method = RequestMethod.POST)
    	  public ResponseEntity<String> login(@RequestBody LoginVO vo, HttpSession session) throws Exception {
    		  ResponseEntity<String> entity = null;
    		  List<LoginVO> lists = service.login(vo.getUid());
    		  session.setAttribute("uID", lists.get(0).getUid().toString());
    		  if (!lists.isEmpty()) {
        		 
        	         if (lists.get(0).getUpw().toString().trim().equals(
        	               vo.getUpw().toString().trim())) {
        	            session.setAttribute("uname", lists.get(0).getUname().toString());
        	            session.setAttribute("login_method",1);
        	            entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
        	            
        	         } else {
        	        	 entity = new ResponseEntity<String>("FAIL", HttpStatus.OK);
        	            
        	          
        	         }
        	         
        	      }else{
        	    	  entity = new ResponseEntity<String>("FAIL", HttpStatus.OK);
        	      }
			return entity;
        	
   }
   @RequestMapping(value = "/logout", method =RequestMethod.GET)
   public String logout(HttpSession session){
      session.removeAttribute("uname");
      session.removeAttribute("login_method");
      return "redirect:/";
      
   }
   @RequestMapping(value = "/join", method = RequestMethod.GET)
   public String join() {

      return "user/join1";
   }
   @RequestMapping(value = "/join", method = RequestMethod.POST)
   public ModelAndView join(Model model, HttpSession session, HttpServletRequest request,
         LoginVO vo) throws Exception {
      ModelAndView mav = new ModelAndView();
      mav.setViewName("redirect:/");
      System.out.println(vo.toString());

      service.join(vo);
      
      return mav;
   }
   
  
   @RequestMapping(value = "/checkDup", method = RequestMethod.POST)
	  public ResponseEntity<String> Dup(@RequestBody LoginVO vo) throws Exception {
	   
		  ResponseEntity<String> entity = null;
		  List<LoginVO> lists = service.login(vo.getUid());
		  if (!lists.isEmpty()) {
			  entity = new ResponseEntity<String>("FAIL", HttpStatus.OK);
			  
 		       	        
 	      }else{
 	    	  entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
 	    	  
 	      }
		return entity;
   }
   @RequestMapping(value = "/checkDupname", method = RequestMethod.POST)
	  public ResponseEntity<String> Dupname(@RequestBody LoginVO vo) throws Exception {
	   
		  ResponseEntity<String> entity = null;
		  List<LoginVO> lists = service.uname(vo.getUname());
		  if (!lists.isEmpty()) {
			  entity = new ResponseEntity<String>("FAIL", HttpStatus.OK);
			  
		       	        
	      }else{
	    	  entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	    	  
	      }
		return entity;
}
   @RequestMapping(value = "/fix", method = RequestMethod.GET)
   public String fix(HttpServletRequest request,HttpSession session) {
	  String uID=session.getAttribute("uID").toString();
	  request.setAttribute("uID",uID);
      return "user/fix";
   }
  
   
   @RequestMapping(value = "/fix", method = RequestMethod.POST)
   public ModelAndView fix(Model model, HttpSession session, HttpServletRequest request,
	         LoginVO vo) throws Exception {
	      ModelAndView mav = new ModelAndView();
	      
	      mav.setViewName("redirect:/");
	      System.out.println(vo.toString());

	      service.fix(vo);
	      
	      return mav;
	   }
}