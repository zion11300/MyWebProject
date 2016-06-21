package snut.webframework.project.theclassic.board.controller;

import java.text.SimpleDateFormat;

import javax.inject.Inject;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import snut.webframework.project.theclassic.board.domain.NoticeBoardVO;
import snut.webframework.project.theclassic.board.domain.PageMaker;
import snut.webframework.project.theclassic.board.domain.SearchCriteria;
import snut.webframework.project.theclassic.board.service.NoticeBoardService;

@Controller
@RequestMapping("/{category}/*")
public class SearchBoardController {

  private static final Logger logger = LoggerFactory.getLogger(SearchBoardController.class);

  @Inject
  private NoticeBoardService service;

  @RequestMapping(value = "/list", method = RequestMethod.GET)
  public String listPage(@ModelAttribute("cri") SearchCriteria cri, Model model, @PathVariable("category") String category
		  ,HttpServletRequest request
		  
		  ) throws Exception {
	cri.setCategory(category);
    logger.info(cri.toString());

    // model.addAttribute("list", service.listCriteria(cri));
    model.addAttribute("list", service.listSearchCriteria(cri));

    PageMaker pageMaker = new PageMaker();
    pageMaker.setCri(cri);

    // pageMaker.setTotalCount(service.listCountCriteria(cri));
    pageMaker.setTotalCount(service.listSearchCount(cri));
    request.setAttribute("cri", cri);
    model.addAttribute("pageMaker", pageMaker);
	return "board/list";
  }

  @RequestMapping(value = "/readPage", method = RequestMethod.GET)
  public String read(@RequestParam("bno") int bno, @ModelAttribute("cri") SearchCriteria cri, Model model
		  ,HttpServletRequest request
		  )
      throws Exception {
	
	  NoticeBoardVO vo = service.read(bno);
	  int viewcnt = vo.getViewcnt();
	  if(viewcnt == 0){
		  vo.setViewcnt(1);
		  service.updateviewcnt(vo);
		  
	  }else{
		  vo.setViewcnt(viewcnt+1);
		  service.updateviewcnt(vo);
		 
	  }
	  request.setAttribute("VO",vo);
    model.addAttribute("data",vo);
    
    return "board/readPage";
  }

  @RequestMapping(value = "/removePage", method = RequestMethod.POST)
  public String remove(@RequestParam("bno") int bno, SearchCriteria cri, RedirectAttributes rttr) throws Exception {

    service.remove(bno);

    rttr.addAttribute("page", cri.getPage());
    rttr.addAttribute("perPageNum", cri.getPerPageNum());
    rttr.addAttribute("searchType", cri.getSearchType());
    rttr.addAttribute("keyword", cri.getKeyword());

    rttr.addFlashAttribute("msg", "SUCCESS");

    return "redirect:/{category}/list";
  }

  @RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
  public String modifyPagingGET(int bno, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

    model.addAttribute("data",service.read(bno));
    return "board/modifyPage";
  }

  @RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
  public String modifyPagingPOST(NoticeBoardVO board, SearchCriteria cri, RedirectAttributes rttr) throws Exception {

    logger.info(cri.toString());
    service.modify(board);

    rttr.addAttribute("page", cri.getPage());
    rttr.addAttribute("perPageNum", cri.getPerPageNum());
    rttr.addAttribute("searchType", cri.getSearchType());
    rttr.addAttribute("keyword", cri.getKeyword());

    rttr.addFlashAttribute("msg", "SUCCESS");

    logger.info(rttr.toString());

    return "redirect:/{category}/list";
  }  

  @RequestMapping(value = "/register", method = RequestMethod.GET)
  public String registGET(Model model, HttpSession session) throws Exception {
	  if(session.getAttribute("uname")!=null){
		  return "board/register";
	  }
	  else
	  {
		  model.addAttribute("msg","로그인해주세요");
		  model.addAttribute("url", "list.jsp");
		  
		  return "redirect";
	  }

    
    
  }

  @RequestMapping(value = "/register", method = RequestMethod.POST)
  public String registPOST(NoticeBoardVO board, RedirectAttributes rttr, @PathVariable("category") String category) throws Exception {

    logger.info("regist post ...........");
    logger.info(board.toString());
    board.setCategory(category);

    service.regist(board);

    rttr.addFlashAttribute("msg", "SUCCESS");

    return "redirect:/{category}/list";
  }

  // @RequestMapping(value = "/list", method = RequestMethod.GET)
  // public void listPage(@ModelAttribute("cri") SearchCriteria cri,
  // Model model) throws Exception {
  //
  // logger.info(cri.toString());
  //
  // model.addAttribute("list", service.listCriteria(cri));
  //
  // PageMaker pageMaker = new PageMaker();
  // pageMaker.setCri(cri);
  //
  // pageMaker.setTotalCount(service.listCountCriteria(cri));
  //
  // model.addAttribute("pageMaker", pageMaker);
  // }
}
