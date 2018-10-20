package skhu.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("admin/login")
public class AdminLoginController {

	@RequestMapping(value="login", method=RequestMethod.GET)
	public String login() {
		return "admin/login/login";
	}
}
