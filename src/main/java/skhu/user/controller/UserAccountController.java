package skhu.user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
		Student account = ((Student)session.getAttribute("userInfo"));
		List<Department> departments = departmentMapper.findWithoutCommon();
		List<Graduation> graduations = graduationMapper.findWithoutCommon();

		int value = 0;
		if(account.getSemester()%2 == 0) value = 2;
		else if(account.getSemester()%2 == 1) value = 1;
		account.setSemester(value);
		
		System.out.println(account.getMinor());

		String[] splitGraduations = account.getGraduation().split(" ", 2);

		if(splitGraduations.length == 1) {
			splitGraduations = new String[2];
			splitGraduations[0] = account.getGraduation();
			splitGraduations[1] = "";
		}

		model.addAttribute("account", account);
		model.addAttribute("mainSelect", splitGraduations[0]);
		model.addAttribute("detailSelect", splitGraduations[1]);
		model.addAttribute("departments", departments);
		model.addAttribute("graduations", graduations);
		return "user/menu/account/acntchange";
	}

	@RequestMapping(value="acntupdate", method=RequestMethod.POST)
	public String anctupdate(HttpSession session, Model model, Student account,
			@RequestParam("mainGraduation") String mainGraduation, @RequestParam("minor") String minor,
			@RequestParam("doubleMajor1") String doubleMajor1, @RequestParam("doubleMajor2") String doubleMajor2,
			@RequestParam("detailGraduation") String detailGraduation) {
		account.setSemester((account.getYear() - 1) * 2 + account.getSemester());

		if(detailGraduation.equals("0"))
			account.setGraduation(mainGraduation);

		else
			account.setGraduation(mainGraduation + " " + detailGraduation);

		if(mainGraduation.equals("부전공")) {
			doubleMajor1 = "0";
		}

		else if(mainGraduation.equals("복수전공")) {
			if(!doubleMajor1.equals("0") && !doubleMajor2.equals("0")) {
				minor = doubleMajor1;
				doubleMajor1 = doubleMajor2;
			}

			else {
				minor = "0";
				doubleMajor1 ="0";
			}
		}

		else {
			minor = "0";
			doubleMajor1 = "0";
		}

		account.setMinor(minor);
		account.setDoubleMajor(doubleMajor1);

		studentMapper.update(account);

		account = studentMapper.findById(account.getId());
		session.removeAttribute("userInfo");
		session.setAttribute("userInfo", account);
		session.setMaxInactiveInterval(5400);

		String message = "회원정보 수정 완료";
	    String location = "acntchange";
	
	    model.addAttribute("message", message);
	    model.addAttribute("location", location);
	
	    return "user/error/error";
	}

	@RequestMapping(value = "pwdconfirm", method = RequestMethod.GET)
	public String pwdconfirm(Model model) {
		Student confirm = new Student();

		model.addAttribute("confirm", confirm);

		return "user/menu/account/pwdconfirm";
	}

	@RequestMapping(value="pwdchange", method=RequestMethod.POST)
	public String pwdchange(HttpSession session, Model model, Student confirm) {
		Student student = ((Student)session.getAttribute("userInfo"));

		if(studentMapper.login(student.getStudentNumber(), confirm.getPassword()) != null) {
			model.addAttribute("account", student);

			return "user/menu/account/pwdchange";
		}

		String message = "패스워드 불일치";
	    String location = "pwdconfirm";
	
	    model.addAttribute("message", message);
	    model.addAttribute("location", location);
	
	    return "user/error/error";
	}

	@RequestMapping(value="pwdupdate", method=RequestMethod.POST)
	public String pwdupdate(HttpSession session, Model model, Student account,
							@RequestParam("passwordConfirm") String passwordConfirm) {
		
		if(passwordConfirm != null && !passwordConfirm.equals("") && account.getPassword().equals(passwordConfirm)) {
			studentMapper.update(account);
			return "redirect:../main";
		}

		String message = "일치하지 않습니다!";
		String location = "../account/pwdconfirm";

		model.addAttribute("message", message);
		model.addAttribute("location", location);

		return "user/error/error";
	}

}
