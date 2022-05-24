package com.funkit.util;

import java.util.ArrayList;
import java.util.List;

public class Pager {
	private int page = 1;
	private int perPage = 6;
	private int perGroup = 5;
	private float total;

	private String menu;

	public int getPrev() {
		return page <= perGroup ? 1 : (((page - 1) / perGroup) - 1) * perGroup + 1;
	}

	public int getNext() {
		int next = (((page - 1) / perGroup) + 1) * perGroup + 1;
		int last = getLast();

		return next < last ? next : last; //다음 그룹 첫번째 페이지가 마지막 페이지보다 작으면
	}

	public List<Integer> getList() {
		ArrayList<Integer> list = new ArrayList<Integer>();

		int startPage = (((page - 1) / perGroup) + 0) * perGroup + 1; //현재페이지 그룹의 첫번째 페이지를 구하는 수식

		for(int index=startPage; index < (startPage + perGroup) && index <= getLast(); index++) //현재 페이지보다 마지막페이지가 크면
			list.add(index);

		if(list.isEmpty())
			list.add(1);

		return list;
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

	public int getPerGroup() {
		return perGroup;
	}

	public void setPerGroup(int perGroup) {
		this.perGroup = perGroup;
	}

	public float getTotal() {
		return total;
	}

	public void setTotal(float total) {
		this.total = total;
	}

	public String getMenu() {
		return menu;
	}

	public void setMenu(String menu) {
		this.menu = menu;
	}

	@Override
	public String toString() {
		return "Pager{" +
				"page=" + page +
				", perPage=" + perPage +
				", perGroup=" + perGroup +
				", total=" + total +
				", menu='" + menu + '\'' +
				'}';
	}
}
