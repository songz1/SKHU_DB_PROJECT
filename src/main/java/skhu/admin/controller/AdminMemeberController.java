package skhu.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import skhu.dto.Admin;
import skhu.dto.Department;
import skhu.dto.Student;
import skhu.mapper.DepartmentMapper;
import skhu.mapper.StudentMapper;

@Controller
@RequestMapping("admin/menu/member")
public class AdminMemeberController {
	@Autowired DepartmentMapper departmentMapper;
	@Autowired StudentMapper studentMapper;

	@RequestMapping(value="list", method=RequestMethod.GET)
	public String list(Model model) {
		List<Department> departments = departmentMapper.findAll();
		List<Student> students = studentMapper.findAllWithDepartment();
		Student student = new Student();
		
		model.addAttribute("student", student);
		model.addAttribute("departments", departments);
		model.addAttribute("students", students);
		
		return "admin/menu/member/list";
	}
	
	@RequestMapping(value="searchStudentList", method=RequestMethod.GET)
	public String searchStudentList(Model model) {
		
		return "redirect:list";
	}

	@RequestMapping(value="detail", method=RequestMethod.GET)
	public String detail(Model model, @RequestParam("id") int id) {
		Student student = studentMapper.findById(id);
		List<Department> departments = departmentMapper.findAll();
		
		model.addAttribute("student", student);
		model.addAttribute("departments", departments);
		
		return "admin/menu/member/detail";
	}
	
	@RequestMapping(value = "edit", method = RequestMethod.POST)
	public String edit(Model model, Student student) {
		
		studentMapper.update(student);
		
		return "redirect:list";
	}
	
	@RequestMapping("delete")
	public String delete(Model model, @RequestParam("id") int id) {
		studentMapper.delete(id);
		return "redirect:list";
	}
}
