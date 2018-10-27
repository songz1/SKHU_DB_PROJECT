package skhu.user.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import skhu.dto.Department;
import skhu.dto.Student;
import skhu.mapper.DepartmentMapper;
import skhu.mapper.StudentMapper;

@Controller
@RequestMapping("user/menu/account")
public class UserAccountController {
	@Autowired StudentMapper studentMapper;
	@Autowired DepartmentMapper departmentMapper;

	@RequestMapping(value = "acntchange", method = RequestMethod.GET)
	public String acntchange(HttpSession session, Model model) {
		List<Department> departments = departmentMapper.findAll();

		model.addAttribute("student", session.getAttribute("userInfo"));
		model.addAttribute("departments", departments);
		return "user/menu/account/acntchange";
	}

	@RequestMapping(value = "pwdconfirm", method = RequestMethod.GET)
	public String pwdconfirm() {
		return "user/menu/account/pwdconfirm";
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
