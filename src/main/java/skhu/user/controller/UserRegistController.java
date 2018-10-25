package skhu.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("user/regist")
public class UserRegistController {

	@RequestMapping(value = "regist", method = RequestMethod.GET)
	public String regist() {
		return "user/regist/regist";
	}

	@RequestMapping(value = "confirm", method = RequestMethod.GET)
	public String confirm() {
		return "user/regist/confirm";
	}

}
