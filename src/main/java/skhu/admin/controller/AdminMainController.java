package skhu.admin.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import skhu.dto.Action;
import skhu.mapper.ActionMapper;
import skhu.util.PageOption;
import skhu.vo.Page;

@Controller
@RequestMapping("admin/menu")
public class AdminMainController {
	@Autowired ActionMapper actionMapper;

	@RequestMapping(value="main", method=RequestMethod.GET)
	public String main(Model model, HttpSession session, HttpServletRequest request, @RequestParam(value="pg", required=false) String pg) {
		Page page = new Page();
		int total = actionMapper.count();
		int currentPage = PageOption.setPage(pg, total);

		List<Action> actions = actionMapper.findActionRecently((currentPage - 1) * 10, 10);
		ArrayList<Page> pages = page.paging(total, 10, currentPage, request.getQueryString());

		model.addAttribute("actions", actions);
		model.addAttribute("pages", pages);

		return "admin/menu/main";
	}
}
