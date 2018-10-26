package skhu.vo;

import java.util.ArrayList;

public class Page {
    int page;
    String label;
    String queryString;

    public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public String getQueryString() {
		return queryString;
	}

	public void setQueryString(String queryString) {
		this.queryString = queryString;
	}

	public Page() {

    }

    Page(int page, String label, String queryString) {
        this.page = page;
        this.label = label;
        this.queryString = queryString;
    }

    public ArrayList<Page> paging(int recordCount, int pageSize, int currentPage, String queryString) {
    	if(currentPage <= 0)
    		currentPage = 1;

    	int pageCount = recordCount / pageSize;

    	if (pageCount * pageSize < recordCount)
    		++pageCount;


    	if (currentPage > pageCount)
    		currentPage = pageCount;

    	int base = ((currentPage - 1) / 10) * 10;

    	if (queryString == null)
    		queryString = "pg=@@@";

    	else if (queryString.matches(".*pg=[0-9]+.*"))
    	    queryString = queryString.replaceAll("pg=[0-9]+", "pg=@@@");
    	else
    	    queryString = queryString + "&pg=@@@";

    	ArrayList<Page> pages = new ArrayList<Page>();

    	if (base > 0)
    		pages.add(new Page(base, "&lt;", queryString.replace("@@@", String.valueOf(base))));

    	for (int i = 1; i <= 10; ++i) {
    	    int n = base + i;
    	    if (n > pageCount)
    	    	break;
    	    pages.add(new Page(n, String.valueOf(n), queryString.replace("@@@", String.valueOf(n))));
    	}
    	int n = base + 11;
    	if (n <= pageCount)
    	    pages.add(new Page(n, "&gt;", queryString.replace("@@@", String.valueOf(n))));

    	return pages;
    }
}