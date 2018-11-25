package skhu.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import skhu.dto.Admin;
import skhu.dto.Student;
import skhu.mapper.StudentMapper;

@Controller
@RequestMapping("user/forgot")
public class UserForgotController {
	@Autowired StudentMapper studentMapper;

	@RequestMapping(value = "forgotpwd", method = RequestMethod.GET)
	public String forgotpwd(Model model) {
		Student student = new Student();
		model.addAttribute("student", student);
		return "user/forgot/forgotpwd";
	}

	@RequestMapping(value = "confirm", method = RequestMethod.GET)
	public String confirm() {
		return "user/forgot/confirm";
	}
	
	@RequestMapping(value="changepwd", method=RequestMethod.POST)
	public String changepwd(HttpSession session, Model model, Student student, HttpServletResponse response) throws IOException {
		Student account = studentMapper.findByAccount(student.getName(), student.getStudentNumber());
		
		if(account != null) {
			model.addAttribute("account", account);
			return "user/forgot/changepwd";
		}
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>alert('사용자가 존재하지 않습니다.');location.href='forgotpwd';</script>");
		out.flush();
		return "redirect:forgotpwd";
	}
	
	@RequestMapping(value="updatepwd", method=RequestMethod.POST)
	public String updatepwd(HttpSession session, Model model, Student account, 
							@RequestParam("passwordConfirm") String passwordConfirm,
							HttpServletResponse response) throws IOException {
		if(account.getPassword().equals(passwordConfirm))
			studentMapper.update(account);

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>alert('비밀번호 변경 완료');location.href='../main';</script>");
		out.flush();
		return "redirect:../main";
	}
}
