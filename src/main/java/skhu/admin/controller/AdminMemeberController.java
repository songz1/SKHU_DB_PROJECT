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
	public String list(Model model, Student condition,
			@RequestParam(value="searchText", required=false) String searchText,
			@RequestParam(value="searchType", required=false) String searchType) {
		
		if(searchText == null)
			searchText = "";
		
		if(searchType == null)
			searchType = "0";
		
		List<Department> departments = departmentMapper.findWithoutCommon();
		List<Student> students = studentMapper.findAllWithDepartment(condition, "%" + searchText + "%", searchType);
		Student student = new Student();
		
		model.addAttribute("condition", condition);
		model.addAttribute("departments", departments);
		model.addAttribute("students", students);
		model.addAttribute("student", student);
		model.addAttribute("searchText", searchText);
		model.addAttribute("searchType", searchType);
		
		return "admin/menu/member/list";
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
