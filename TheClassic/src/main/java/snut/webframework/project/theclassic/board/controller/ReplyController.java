package snut.webframework.project.theclassic.board.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import snut.webframework.project.theclassic.board.domain.Criteria;
import snut.webframework.project.theclassic.board.domain.PageMaker;
import snut.webframework.project.theclassic.board.domain.ReplyVO;
import snut.webframework.project.theclassic.board.service.ReplyService;

@RestController
@RequestMapping("/replies")
public class ReplyController {

  @Inject
  private ReplyService service;

  @RequestMapping(value = "", method = RequestMethod.POST)
  public ResponseEntity<String> register(@RequestBody ReplyVO vo, HttpSession session) {
	  ResponseEntity<String> entity = null;
	  if(session.getAttribute("uname")==null){
		  
		  
		  return entity;
		  
	  }
	  else{

		    
		    try {
		    	vo.setReplyer(session.getAttribute("uname").toString());
		    	
		      service.addReply(vo);
		      entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		    } catch (Exception e) {
		      e.printStackTrace();
		      entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		    }
		    return entity;
		  
	  }
	  

  }
  @RequestMapping(value = "", method = RequestMethod.GET)
  public ResponseEntity<String> get() {
	  

    ResponseEntity<String> entity = null;
    
    return entity;
  }
  @RequestMapping(value = "/all/{bno}", method = RequestMethod.GET)
  public ResponseEntity<List<ReplyVO>> list(@PathVariable("bno") Integer bno) {

    ResponseEntity<List<ReplyVO>> entity = null;
    try {
      entity = new ResponseEntity<>(service.listReply(bno), HttpStatus.OK);

    } catch (Exception e) {
      e.printStackTrace();
      entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }

    return entity;
  }

  @RequestMapping(value = "/{rno}", method = { RequestMethod.PUT, RequestMethod.PATCH })
  public ResponseEntity<String> update(@PathVariable("rno") Integer rno, @RequestBody ReplyVO vo, HttpSession session, HttpServletResponse res) throws IOException {
	  ResponseEntity<String> entity = null;
	  System.out.println(vo.getReplyer());
	  
	  if(session.getAttribute("uname") != null&&session.getAttribute("uname").equals(vo.getReplyer())){
		  try {
		      vo.setRno(rno);
		      service.modifyReply(vo);

		      entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		    } catch (Exception e) {
		      e.printStackTrace();
		      entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		    }
		    return entity;
	  }else{
		  
		  
		  return entity;
	  }

   
    
  }

  @RequestMapping(value = "/{rno}", method = RequestMethod.DELETE)
  public ResponseEntity<String> remove(@PathVariable("rno") Integer rno) {
	  ResponseEntity<String> entity = null;
	
    try {
      service.removeReply(rno);
      entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
    } catch (Exception e) {
      e.printStackTrace();
      entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
    }
    return entity;
	
  }

  @RequestMapping(value = "/{bno}/{page}", method = RequestMethod.GET)
  public ResponseEntity<Map<String, Object>> listPage(
      @PathVariable("bno") Integer bno,
      @PathVariable("page") Integer page) {

    ResponseEntity<Map<String, Object>> entity = null;
    
    try {
      Criteria cri = new Criteria();
      cri.setPage(page);

      PageMaker pageMaker = new PageMaker();
      pageMaker.setCri(cri);

      Map<String, Object> map = new HashMap<String, Object>();
      List<ReplyVO> list = service.listReplyPage(bno, cri);

      map.put("list", list);

      int replyCount = service.count(bno);
      pageMaker.setTotalCount(replyCount);

      map.put("pageMaker", pageMaker);

      entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);

    } catch (Exception e) {
      e.printStackTrace();
      entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
    }
    return entity;
  }

}
