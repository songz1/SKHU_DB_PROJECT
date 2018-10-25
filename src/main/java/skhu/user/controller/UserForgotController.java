package skhu.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("user/forgot")
public class UserForgotController {

	@RequestMapping(value = "forgotpwd", method = RequestMethod.GET)
	public String forgotpwd() {
		return "user/forgot/forgotpwd";
	}

	@RequestMapping(value = "confirm", method = RequestMethod.GET)
	public String confirm() {
		return "user/forgot/confirm";
	}

	@RequestMapping(value = "changepwd", method = RequestMethod.GET)
	public String changepwd() {
		return "user/forgot/changepwd";
	}

}
