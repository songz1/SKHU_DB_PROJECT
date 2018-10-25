package skhu.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("user/login/guest")
public class UserGuestController {

	@RequestMapping(value = "basic", method = RequestMethod.GET)
	public String basic() {
		return "user/login/guest/basic";
	}

	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public String detail() {
		return "user/login/guest/detail";
	}

	@RequestMapping(value = "yearChoice", method = RequestMethod.GET)
	public String yearChoice() {
		return "user/login/guest/yearChoice";
	}

	@RequestMapping(value = "info", method = RequestMethod.GET)
	public String info() {
		return "user/login/guest/info";
	}

}
