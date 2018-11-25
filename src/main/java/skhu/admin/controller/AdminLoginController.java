package skhu.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;

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
	public String login(Admin admin, HttpSession session, HttpServletResponse response) throws IOException {
		Admin login = adminMapper.login(admin.getLoginId(), admin.getPassword());
		if(login != null) {
			session.removeAttribute("userInfo");
			session.setAttribute("adminInfo", login);
			session.setMaxInactiveInterval(5400);
			return "redirect:../menu/main";
		}

		else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 정보를 확인해주세요.');location.href='login';</script>");
			out.flush();
			return "redirect:login";
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

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>alert('로그아웃 되었습니다.');location.href='login';</script>");
		out.flush();
		return "redirect:login";
	}
}
