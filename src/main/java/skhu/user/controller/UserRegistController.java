package skhu.user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

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
		List<Department> departments = departmentMapper.findWithoutCommon();

		model.addAttribute("student", student);
		model.addAttribute("departments", departments);

		return "user/regist/regist";
	}

	@RequestMapping(value="insert", method=RequestMethod.POST)
	public String insert(Model model, Student student, @RequestParam("passwordConfirm") String passwordConfirm) {
		if((student.getEmail().length() != 0 && !student.getEmail().equals("")) &&
		(student.getStudentNumber().length() != 0 && !student.getStudentNumber().equals("")) &&
		(student.getName().length() != 0 && !student.getName().equals("")) &&
		(student.getPassword().length() != 0 && !student.getPassword().equals("")) &&
		student.getPassword().equals(passwordConfirm))
			studentMapper.insert(student);

		return "redirect:confirm";
	}

	@RequestMapping(value = "confirm", method = RequestMethod.GET)
	public String confirm(HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>alert('회원가입 완료');location.href='../main';</script>");
		out.flush();
		return "redirect:/user/login/login";
	}

}
