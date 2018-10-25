package skhu.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("user/menu")
public class UserMainController {

	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String main() {
		return "user/menu/main";
	}

}
