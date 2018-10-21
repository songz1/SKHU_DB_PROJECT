package skhu.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("admin/menu/member")
public class AdminMemeberController {

	@RequestMapping(value="list", method=RequestMethod.GET)
	public String list() {
		return "admin/menu/member/list";
	}

	@RequestMapping(value="detail", method=RequestMethod.GET)
	public String detail() {
		return "admin/menu/member/detail";
	}
}
