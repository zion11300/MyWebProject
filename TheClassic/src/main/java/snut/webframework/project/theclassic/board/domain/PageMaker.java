package snut.webframework.project.theclassic.board.domain;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {

	  private int totalCount;
	  private int startPage;
	  private int endPage;
	  private boolean prev;
	  private boolean next;

	  private int displayPageNum = 10;

	  private Criteria cri;

	  public void setCri(Criteria cri) {
	    this.cri = cri;
	  }

	  public void setTotalCount(int totalCount) {
	    this.totalCount = totalCount;

	    calcData();
	  }
	  /**
	   * page = 3 : startPage = 1, endPage = 10 , next= true, prev=false
	   * page = 10 : startPage = 1, endpage = 10, next = true, prev = false
	   * page = 11 : startPage = 11, endPage = 13 ,next=false, prev = true
	   * 
	   */
	  private void calcData() {
		  /**
		   * ���� �������� 3�϶� : Math.ceil(3/10) * 10 = 10
		   * 			1�϶� : Math.ceil(1/10) * 10 = 10
		   * 			20�϶� : Math.ceil(20/10) * 10 = 20
		   * 			30�϶� : Math.ceil(30/10) * 10 = 30
		   * 
		   */
	    endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);

	    /**
	     * endpage - ��������ȣ�� ��) + 1
	     * 
	     */
	    startPage = (endPage - displayPageNum) + 1;

	    int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));

	    if (endPage > tempEndPage) {
	      endPage = tempEndPage;
	    }

	    prev = startPage == 1 ? false : true;

	    next = endPage * cri.getPerPageNum() >= totalCount ? false : true;

	  }

	  public int getTotalCount() {
	    return totalCount;
	  }

	  public int getStartPage() {
	    return startPage;
	  }

	  public int getEndPage() {
	    return endPage;
	  }

	  public boolean isPrev() {
	    return prev;
	  }

	  public boolean isNext() {
	    return next;
	  }

	  public int getDisplayPageNum() {
	    return displayPageNum;
	  }

	  public Criteria getCri() {
	    return cri;
	  }

	  public String makeQuery(int page) {

	    UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page)
	        .queryParam("perPageNum", cri.getPerPageNum()).build();

	    return uriComponents.toUriString();
	  }
	  
	  
	  public String makeSearch(int page){
	    
	    UriComponents uriComponents =
	              UriComponentsBuilder.newInstance()
	              .queryParam("page", page)
	              .queryParam("perPageNum", cri.getPerPageNum())
	              .queryParam("searchType", ((SearchCriteria)cri).getSearchType())
	              .queryParam("keyword", ((SearchCriteria)cri).getKeyword())
	              .build();             
	    
	    return uriComponents.toUriString();
	  } 



}

