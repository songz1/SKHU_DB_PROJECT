package skhu.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("user/login")
public class LoginController {

	@RequestMapping(value="login", method=RequestMethod.GET)
	public String login() {
		return "user/login/login";
	}
}
