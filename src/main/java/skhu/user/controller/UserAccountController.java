package skhu.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("user/menu/account")
public class UserAccountController {

	@RequestMapping(value = "acntchange", method = RequestMethod.GET)
	public String acntchange() {
		return "user/menu/account/acntchange";
	}

	@RequestMapping(value = "pwdconfirm", method = RequestMethod.GET)
	public String pwdconfirm() {
		return "user/menu/account/pwdconfirm";
	}

	@RequestMapping(value = "pwdchange", method = RequestMethod.GET)
	public String pwdchange() {
		return "user/menu/account/pwdchange";
	}

}
