package skhu.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import skhu.mapper.StudentMapper;

@Controller
@RequestMapping("user/login")
public class UserLoginController {
	@Autowired StudentMapper studentMapper;
	
	

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(HttpSession session) {
		if(session.getAttribute("userInfo") != null)
			return "redirect:../menu/main";

		return "user/login/login";
	}
	
	@RequestMapping(value="logout", method=RequestMethod.POST)
	public String logout(HttpSession session) {
		session.invalidate();

		return "redirect:login";
	}

}
