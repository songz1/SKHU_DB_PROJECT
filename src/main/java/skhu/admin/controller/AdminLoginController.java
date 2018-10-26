package skhu.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import skhu.dto.Admin;
import skhu.mapper.AdminMapper;

@Controller
@RequestMapping("admin/login")
public class AdminLoginController {
	@Autowired AdminMapper adminMapper;

	@RequestMapping(value="login", method=RequestMethod.POST)
	public String login(Model model, Admin admin, HttpSession session) {
		Admin login = adminMapper.login(admin.getLoginId(), admin.getPassword());

		if(login != null) {
			session.removeAttribute("userInfo");
			session.setAttribute("adminInfo", login);
			session.setMaxInactiveInterval(5400);
			return "redirect:../menu/main";
		}

		else {
			return "admin/login/login";
		}
	}

	@RequestMapping(value="login", method=RequestMethod.GET)
	public String login() {
		return "admin/login/login";
	}

	@RequestMapping(value="logout", method=RequestMethod.POST)
	public String logout(HttpSession session) {
		session.invalidate();

		return "redirect:login";
	}
}
