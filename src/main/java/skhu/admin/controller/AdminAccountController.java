package skhu.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("admin/menu/account")
public class AdminAccountController {
	@RequestMapping(value="adminList", method=RequestMethod.GET)
	public String adminList() {
		return "admin/menu/account/adminList";
	}

	@RequestMapping(value="adminEdit", method=RequestMethod.GET)
	public String adminEdit() {
		return "admin/menu/account/adminEdit";
	}

	@RequestMapping(value="pwdconfirm", method=RequestMethod.GET)
	public String pwdconfirm() {
		return "admin/menu/account/pwdconfirm";
	}

	@RequestMapping(value="acntchange", method=RequestMethod.GET)
	public String acntchange() {
		return "admin/menu/account/acntchange";
	}

	@RequestMapping(value="addadmin", method=RequestMethod.GET)
	public String addadmin() {
		return "admin/menu/account/addadmin";
	}
}
