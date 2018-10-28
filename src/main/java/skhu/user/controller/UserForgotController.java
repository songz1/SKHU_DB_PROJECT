package skhu.user.controller;

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
	public String forgotpwd() {
		return "user/forgot/forgotpwd";
	}

	@RequestMapping(value = "confirm", method = RequestMethod.GET)
	public String confirm() {
		return "user/forgot/confirm";
	}
	
	@RequestMapping(value="changepwd", method=RequestMethod.POST)
	public String changepwd(HttpSession session, Model model, Student account, @RequestParam("passwordConfirm") String passwordConfirm) {
		if(account.getPassword().equals(passwordConfirm))
			studentMapper.update(account);

		return "user/login/login";
	}
}
