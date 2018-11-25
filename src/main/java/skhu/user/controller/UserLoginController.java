package skhu.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import skhu.dto.Student;
import skhu.mapper.StudentMapper;

@Controller
@RequestMapping("user/login")
public class UserLoginController {
	@Autowired StudentMapper studentMapper;

	@RequestMapping(value="login", method=RequestMethod.POST)
	public String login(Student student, HttpSession session, HttpServletResponse response) throws IOException {
		Student login = studentMapper.login(student.getStudentNumber(), student.getPassword());

		if(login != null) {
			session.removeAttribute("adminInfo");
			session.setAttribute("userInfo", login);
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

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(HttpSession session, Model model) {
		if(session.getAttribute("userInfo") != null)
			return "redirect:../menu/main";

		Student login = new Student();

		model.addAttribute("login", login);

		return "user/login/login";
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
