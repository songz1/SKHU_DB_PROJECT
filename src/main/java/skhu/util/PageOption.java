package skhu.util;

public class PageOption {
	public static int setPage(String pg, int total) {
		int currentPage = 1;

    	if(pg != null)
    		currentPage = Integer.parseInt(pg);

		return currentPage;
	}
}
