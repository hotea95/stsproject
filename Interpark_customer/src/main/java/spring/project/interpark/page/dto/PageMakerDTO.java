package spring.project.interpark.page.dto;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMakerDTO {
	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int displayPageNum = 10;
	private PageDTO pageDTO;

	public void setPageDTO(PageDTO pageDTO) {
		this.pageDTO = pageDTO;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
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

	public PageDTO getPageDTO() {
		return pageDTO;
	}

	private void calcData() {
		endPage = (int) (Math.ceil(pageDTO.getPage() / (double) displayPageNum) * displayPageNum);
		startPage = (endPage - displayPageNum) + 1;

		int tempEndPage = (int) (Math.ceil(totalCount / (double) pageDTO.getPerPageNum()));
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		prev = startPage == 1 ? false : true;
		next = endPage * pageDTO.getPerPageNum() >= totalCount ? false : true;
	}

	public String makeQuery(int page) {
		UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page)
				.queryParam("perPageNum", pageDTO.getPerPageNum()).build();

		return uriComponents.toUriString();
	}
	
}