//package snut.webframework.project;
//
//import java.util.List;
//
//import javax.inject.Inject;
//
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.web.util.UriComponents;
//import org.springframework.web.util.UriComponentsBuilder;
//
//import snut.webframework.project.theclassic.board.domain.NoticeBoardVO;
//import snut.webframework.project.theclassic.board.persistence.NoticeBoardDAO;
//
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
//public class BoardDAOTest {
//
//  @Inject
//  private NoticeBoardDAO dao;
//
//  private static Logger logger = LoggerFactory.getLogger(BoardDAOTest.class);
//
//  @Test
//  public void testCreate() throws Exception {
//
//	  NoticeBoardVO board = new NoticeBoardVO();
//    board.setTitle("새로운 글을 넣습니다. ");
//    board.setContent("새로운 글을 넣습니다. ");
//    board.setWriter("user00");
//    dao.create(board);
//  }
//
//  @Test
//  public void testRead() throws Exception {
//
//    logger.info(dao.read(1).toString());
//  }
//
//  @Test
//  public void testUpdate() throws Exception {
//
//	  NoticeBoardVO board = new NoticeBoardVO();
//    board.setBno(1);
//    board.setTitle("수정된 글입니다.");
//    board.setContent("수정 테스트 ");
//    dao.update(board);
//  }
//
//  @Test
//  public void testDelete() throws Exception {
//
//    dao.delete(1);
//  }
//
//  @Test
//  public void testListAll() throws Exception {
//
//    logger.info(dao.listAll().toString());
//
//  }
////
////  @Test
////  public void testListPage() throws Exception {
////
////    int page = 3;
////
////    List<NoticeBoardVO> list = dao.listPage(page);
////
////    for (NoticeBoardVO boardVO : list) {
////      logger.info(boardVO.getBno() + ":" + boardVO.getTitle());
////    }
////  }
////
////  @Test
////  public void testListCriteria() throws Exception {
////
////    Criteria cri = new Criteria();
////    cri.setPage(2);
////    cri.setPerPageNum(20);
////
////    List<NoticeBoardVO> list = dao.listCriteria(cri);
////
////    for (NoticeBoardVO boardVO : list) {
////      logger.info(boardVO.getBno() + ":" + boardVO.getTitle());
////    }
////  }
////
////  @Test
////  public void testURI() throws Exception {
////
////    UriComponents uriComponents = UriComponentsBuilder.newInstance().path("/board/read").queryParam("bno", 12)
////        .queryParam("perPageNum", 20).build();
////
////    logger.info("/board/read?bno=12&perPageNum=20");
////    logger.info(uriComponents.toString());
////
////  }
////
////  @Test
////  public void testURI2() throws Exception {
////
////    UriComponents uriComponents = UriComponentsBuilder.newInstance().path("/{module}/{page}").queryParam("bno", 12)
////        .queryParam("perPageNum", 20).build().expand("board", "read").encode();
////
////    logger.info("/board/read?bno=12&perPageNum=20");
////    logger.info(uriComponents.toString());
////  }
////
////  @Test
////  public void testDynamic1() throws Exception {
////
////    SearchCriteria cri = new SearchCriteria();
////    cri.setPage(1);
////    cri.setKeyword("글");
////    cri.setSearchType("t");
////
////    logger.info("=====================================");
////
////    List<NoticeBoardVO> list = dao.listSearch(cri);
////
////    for (NoticeBoardVO boardVO : list) {
////      logger.info(boardVO.getBno() + ": " + boardVO.getTitle());
////    }
////
////    logger.info("=====================================");
////
////    logger.info("COUNT: " + dao.listSearchCount(cri));
////  }
//
//}
