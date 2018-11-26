package skhu.admin.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
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
	public String login(Model model, Admin admin, HttpSession session, HttpServletResponse response) throws IOException {
		Admin login = adminMapper.login(admin.getLoginId(), admin.getPassword());
		if(login != null) {
			session.removeAttribute("userInfo");
			session.setAttribute("adminInfo", login);
			session.setMaxInactiveInterval(5400);
			return "redirect:../menu/main";
		}

		else {
			String message = "아이디나 비밀번호가 일치하지 않습니다.";
		    String location = "login";

		    model.addAttribute("message", message);
		    model.addAttribute("location", location);

		    return "user/error/error";
		}
	}

	@RequestMapping(value="login", method=RequestMethod.GET)
	public String login(HttpSession session, Model model) {
		if(session.getAttribute("adminInfo") != null)
			return "redirect:../menu/main";

		Admin login = new Admin();

		model.addAttribute("login", login);

		return "admin/login/login";
	}

	@RequestMapping(value="logout", method=RequestMethod.POST)
	public String logout(HttpSession session, HttpServletResponse response) throws IOException {
		session.invalidate();

		return "redirect:login";
	}
}
