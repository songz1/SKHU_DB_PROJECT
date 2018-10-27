package skhu.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

	@RequestMapping(value="pwdchange", method=RequestMethod.POST)
	public String pwdchange(HttpSession session, Model model, Student confirm) {
		int id = ((Student)session.getAttribute("userInfo")).getId();
		Student account = studentMapper.findById(id);
		if(confirm != null && account != null && confirm.getPassword().equals(account.getPassword())) {
			model.addAttribute("account", account);

			return "user/menu/account/pwdchange";
		}
		return "redirect:pwdconfirm";
	}
}
