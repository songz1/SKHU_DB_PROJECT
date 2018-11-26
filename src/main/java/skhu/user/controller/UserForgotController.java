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
	public String changepwd(HttpSession session, Model model, Student student) {
		Student account = studentMapper.findByAccount(student.getName(), student.getStudentNumber());
		
		if(account != null) {
			model.addAttribute("account", account);
			return "user/forgot/changepwd";
		}
		
		String message = "사용자가 존재하지 않습니다.";
	    String location = "forgotpwd";
	
	    model.addAttribute("message", message);
	    model.addAttribute("location", location);
	
	    return "user/error/error";
	}
	
	@RequestMapping(value="updatepwd", method=RequestMethod.POST)
	public String updatepwd(HttpSession session, Model model, Student account, 
							@RequestParam("passwordConfirm") String passwordConfirm) {
		if(account.getPassword().equals(passwordConfirm))
			studentMapper.update(account);

		String message = "비밀번호 변경 완료";
	    String location = "../login/login";
	
	    model.addAttribute("message", message);
	    model.addAttribute("location", location);
	
	    return "user/error/error";
	}
}
