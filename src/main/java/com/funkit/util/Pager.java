package com.funkit.util;

public class Pager {
	private int page = 1;
	private int perPage = 6;
	private float total;
	
	public int getPrev() {
		return page <= 1 ? 1 : page-1;
	}

	public int getNext() {
		
		int next = page+1;
		int last = getLast();
		
		return next < last ? next : last; //다음 그룹 첫번째 페이지가 마지막 페이지보다 작으면
	}

	public int getLast() {
		int last = (int) Math.ceil(total / perPage); //list의 마지막페이지를 구한다.

		return last < 1 ? 1 : last;
	}

	public int getOffset() {
		return (page - 1) * perPage;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPerPage() {
		return perPage;
	}

	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}

	public float getTotal() {
		return total;
	}

	public void setTotal(float total) {
		this.total = total;
	}

}
