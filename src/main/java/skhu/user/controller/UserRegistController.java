package skhu.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import skhu.dto.Department;
import skhu.dto.Student;
import skhu.mapper.DepartmentMapper;
import skhu.mapper.StudentMapper;

@Controller
@RequestMapping("user/regist")
public class UserRegistController {
	@Autowired StudentMapper studentMapper;
	@Autowired DepartmentMapper departmentMapper;

	@RequestMapping(value = "regist", method = RequestMethod.GET)
	public String regist(Model model) {
		Student student = new Student();
		List<Department> departments = departmentMapper.findAll();

		model.addAttribute("student", student);
		model.addAttribute("departments", departments);
		
		return "user/regist/regist";
	}

	@RequestMapping(value = "confirm", method = RequestMethod.GET)
	public String confirm() {
		return "user/regist/confirm";
	}

}
