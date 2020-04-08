package com.qhit.utils;

import java.util.List;

public class Page {
	//page里面的数据
	List list;
	//总记录数
	private int totalRecord;
	//每页记录数
	private int pageNum = 10;
	//总页数
	private int totalPages;
	//当前页
	private int currentPage;
	//起始页
	private int startIndex;
	//结束页
	private int endIndex;
	private String url;

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public int getEndIndex() {
		return endIndex;
	}

	public void setEndIndex(int endIndex) {
		this.endIndex = endIndex;
	}

	
	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public Page(int currentPage, int totalRecord){
		this.totalRecord = totalRecord;
		this.currentPage = currentPage;
		if(totalRecord % pageNum==0){
			totalPages = totalRecord / pageNum;
		}else{
			totalPages = totalRecord / pageNum + 1;
		}
		
		if(totalRecord<10 && totalRecord>0){
			startIndex = 1;
			endIndex = totalPages;
		}else if(currentPage - 4<=0){
			startIndex =
					1;
			if(totalPages<10){
			endIndex = totalPages ;
			}else{
				endIndex=10;
			}
		}
		else if(currentPage + 5>totalPages){
				startIndex = totalPages - 9;
				endIndex = totalPages ;
			} else{
				startIndex = currentPage - 4;
				endIndex = currentPage + 5 ;

				System.out.println(startIndex);
				System.out.println(endIndex);
		}
	}

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}
	
	
}
