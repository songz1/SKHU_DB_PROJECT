package skhu.user.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import skhu.dto.Admin;
import skhu.dto.Department;
import skhu.dto.Graduation;
import skhu.dto.Student;
import skhu.mapper.DepartmentMapper;
import skhu.mapper.GraduationMapper;
import skhu.mapper.StudentMapper;

@Controller
@RequestMapping("user/menu/account")
public class UserAccountController {
	@Autowired StudentMapper studentMapper;
	@Autowired DepartmentMapper departmentMapper;
	@Autowired GraduationMapper graduationMapper;

	@RequestMapping(value = "acntchange", method = RequestMethod.GET)
	public String acntchange(HttpSession session, Model model) {
		List<Department> departments = departmentMapper.findAll();
		List<Graduation> graduations = graduationMapper.findAll();
		
		List<Graduation> base = new ArrayList<Graduation>();
		List<Graduation> detail = new ArrayList<Graduation>();
		
		for(int i = 0; i < graduations.size(); ++i) {
			if(graduations.get(i).getDivision().equals('0'))
				base.add(graduations.get(i));
			
			else
				detail.add(graduations.get(i));
		}
		
		model.addAttribute("student", session.getAttribute("userInfo"));
		model.addAttribute("departments", departments);
		model.addAttribute("base", base);
		model.addAttribute("detail", detail);
		return "user/menu/account/acntchange";
	}
	
	@RequestMapping(value="acntupdate", method=RequestMethod.POST)
	public String anctupdate(HttpSession session, Model model, Student account) {
		studentMapper.update(account);
		account.setPassword(null);
		session.removeAttribute("userInfo");
		session.setAttribute("userInfo", account);
		session.setMaxInactiveInterval(5400);

		return "redirect:../main";
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
	
	@RequestMapping(value="pwdupdate", method=RequestMethod.POST)
	public String pwdupdate(HttpSession session, Model model, Student account, @RequestParam("passwordConfirm") String passwordConfirm) {
		if(account.getPassword().equals(passwordConfirm))
			studentMapper.update(account);

		return "redirect:../main";
	}

}
