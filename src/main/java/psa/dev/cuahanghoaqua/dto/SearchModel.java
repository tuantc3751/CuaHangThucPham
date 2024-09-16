package psa.dev.cuahanghoaqua.dto;

public class SearchModel {
	private int status;
	private int categoryId;
	private String keyword;
	
	private String beginDate;
	private String endDate;
	
	private int sizeOfPage;
	private int currentPage;
	private int totalItems;
	private int totalPages;
	
	public SearchModel() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SearchModel(int status, int categoryId, String keyword, String beginDate, String endDate, int sizeOfPage,
			int currentPage, int totalItems, int totalPages) {
		super();
		this.status = status;
		this.categoryId = categoryId;
		this.keyword = keyword;
		this.beginDate = beginDate;
		this.endDate = endDate;
		this.sizeOfPage = sizeOfPage;
		this.currentPage = currentPage;
		this.totalItems = totalItems;
		this.totalPages = totalPages;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getBeginDate() {
		return beginDate;
	}

	public void setBeginDate(String beginDate) {
		this.beginDate = beginDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public int getSizeOfPage() {
		return sizeOfPage;
	}

	public void setSizeOfPage(int sizeOfPage) {
		this.sizeOfPage = sizeOfPage;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalItems() {
		return totalItems;
	}

	public void setTotalItems(int totalItems) {
		this.totalItems = totalItems;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}
}
