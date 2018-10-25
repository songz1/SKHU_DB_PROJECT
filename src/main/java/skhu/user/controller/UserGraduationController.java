package skhu.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("user/menu/graduation")
public class UserGraduationController {

	@RequestMapping(value = "basic", method = RequestMethod.GET)
	public String basic() {
		return "user/menu/graduation/basic";
	}

	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public String detail() {
		return "user/menu/graduation/detail";
	}

	@RequestMapping(value = "yearChoice", method = RequestMethod.GET)
	public String yearChoice() {
		return "user/menu/graduation/yearChoice";
	}

	@RequestMapping(value = "info", method = RequestMethod.GET)
	public String info() {
		return "user/menu/graduation/info";
	}

	@RequestMapping(value = "mygraduation", method = RequestMethod.GET)
	public String mygraduation() {
		return "user/menu/graduation/mygraduation";
	}

}
