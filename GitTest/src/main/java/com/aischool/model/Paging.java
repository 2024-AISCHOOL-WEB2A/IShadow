package com.aischool.model;

public class Paging {
	
	public int getPageCount(int numPerPage, int dataCount) {
		int pageCount = 0;

		pageCount = dataCount / numPerPage;

		if (dataCount % numPerPage != 0)
			pageCount++;

		return pageCount;
	}

	public String pageIndexList(int currentPage, int totalPage, String listUrl) {
		StringBuffer strList = new StringBuffer();
		int numPerBlock = 10;

		int currentPageSetup;
		int page;
		int n;

		if (currentPage == 0)

		{
			return "";

		}
		if (listUrl.indexOf("?") != -1)
			listUrl = listUrl + "&";
		else
			listUrl = listUrl + "?";

		currentPageSetup = (currentPage / numPerBlock) * numPerBlock;

		if (currentPage % numPerBlock == 0)
			currentPageSetup = currentPageSetup - numPerBlock;

		if (currentPage % numPerBlock == 0)
			currentPageSetup = currentPageSetup - numPerBlock;

		if ((totalPage > numPerBlock) && (currentPageSetup > 0))
			strList.append(" <a href ='" + listUrl + "pageNum=1'>1</a>");
		n = currentPage - numPerBlock;

		if ((totalPage > numPerBlock) && (currentPageSetup > 0)) {
			strList.append("  <a href='" + listUrl + "pageNum=" + n + "'>Prev</a>");
		}

		page = currentPageSetup + 1;

		while ((page <= totalPage) && (page <= currentPageSetup + numPerBlock)) {
			if (page == currentPage)
				strList.append(" <span style='color:orange; font-weight:bold;'>" + page + "</span>");
			else
				strList.append(" <a href = '" + listUrl + "pageNum=" + page + "'>" + page + "</a>");

			page++;

		}

		n = currentPage + numPerBlock;

		if ((totalPage - currentPageSetup) > numPerBlock)
			strList.append(" <a href = '" + listUrl + "pageNum=" + n + "'>Next</a>");
		if ((totalPage > numPerBlock) && ((currentPageSetup + numPerBlock) < totalPage))
			strList.append(" <a href = '" + listUrl + "pageNum=" + totalPage + "'>" + totalPage + "</a>");

		return strList.toString();
	}
}
