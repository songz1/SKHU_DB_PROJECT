package skhu.admin.controller;

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
import skhu.mapper.AdminMapper;
import skhu.mapper.DepartmentMapper;
import skhu.mapper.GraduationMapper;

@Controller
@RequestMapping("admin/menu/account")
public class AdminAccountController {
	@Autowired AdminMapper adminMapper;
	@Autowired DepartmentMapper departmentMapper;

	@RequestMapping(value="adminList", method=RequestMethod.GET)
	public String adminList(Model model) {
		List<Department> departments = departmentMapper.findAll();
		List<Admin> admins = adminMapper.findAll();
		Admin admin = new Admin();
		
		model.addAttribute("admins", admins);
		model.addAttribute("admin", admin);
		model.addAttribute("departments", departments);
		
		return "admin/menu/account/adminList";
	}
	
	@RequestMapping(value="searchAdminList", method=RequestMethod.GET)
	public String SearchAdminList(Model model) {
		List<Department> departments = departmentMapper.findAll();
		List<Admin> admins = adminMapper.findAllWithDepartment();
		Admin admin = new Admin();
		
		model.addAttribute("admins", admins);
		model.addAttribute("admin", admin);
		model.addAttribute("departments", departments);
		
		return "admin/menu/account/adminList";
	}

	@RequestMapping(value="adminEdit", method=RequestMethod.GET)
	public String adminEdit(Model model, @RequestParam("id") int id) {
		Admin admin = adminMapper.findById(id);
		List<Department> departments = departmentMapper.findAll();
		
		model.addAttribute("admin", admin);
		model.addAttribute("departments", departments);

		return "admin/menu/account/edit";
	}

	@RequestMapping(value = "edit", method = RequestMethod.POST)
	public String edit(Model model, Admin admin) {
		adminMapper.update(admin);
		
		return "redirect:adminList";
	}
	
	@RequestMapping("delete")
	public String delete(Model model, @RequestParam("id") int id) {
		adminMapper.delete(id);
		return "redirect:adminList";
	}

	@RequestMapping(value="acntchange", method=RequestMethod.GET)
	public String acntchange(HttpSession session, Model model) {
		List<Department> departments = departmentMapper.findAll();
		
		model.addAttribute("admin", session.getAttribute("adminInfo"));
		model.addAttribute("departments", departments);

		return "admin/menu/account/acntchange";
	}

	@RequestMapping(value="acntupdate", method=RequestMethod.POST)
	public String anctupdate(HttpSession session, Model model, Admin account) {
		adminMapper.update(account);
		account.setPassword(null);
		session.removeAttribute("adminInfo");
		session.setAttribute("adminInfo", account);
		session.setMaxInactiveInterval(5400);

		return "redirect:../main";
	}

	@RequestMapping(value="pwdconfirm", method=RequestMethod.GET)
	public String pwdConfirm() {
		return "admin/menu/account/pwdconfirm";
	}

	@RequestMapping(value="pwdchange", method=RequestMethod.POST)
	public String pwdchange(HttpSession session, Model model, Admin confirm) {
		int id = ((Admin)session.getAttribute("adminInfo")).getId();
		Admin account = adminMapper.findById(id);
		if(confirm != null && account != null && confirm.getPassword().equals(account.getPassword())) {
			model.addAttribute("account", account);

			return "admin/menu/account/pwdchange";
		}
		return "redirect:pwdconfirm";
	}

	@RequestMapping(value="pwdupdate", method=RequestMethod.POST)
	public String pwdupdate(HttpSession session, Model model, Admin account, @RequestParam("passwordConfirm") String passwordConfirm) {
		if(account.getPassword().equals(passwordConfirm))
			adminMapper.update(account);

		return "redirect:../main";
	}

	@RequestMapping(value="addadmin", method=RequestMethod.GET)
	public String addadmin(Model model) {
		Admin admin = new Admin();
		List<Department> departments = departmentMapper.findAll();

		model.addAttribute("admin", admin);
		model.addAttribute("departments", departments);

		return "admin/menu/account/addadmin";
	}

	@RequestMapping(value="insert", method=RequestMethod.POST)
	public String insert(Model model, Admin admin, @RequestParam("passwordConfirm") String passwordConfirm) {
		if((admin.getEmail().length() != 0 && !admin.getEmail().equals("")) &&
		(admin.getLoginId().length() != 0 && !admin.getLoginId().equals("")) &&
		(admin.getName().length() != 0 && !admin.getName().equals("")) &&
		(admin.getPassword().length() != 0 && !admin.getPassword().equals("")) &&
		admin.getPassword().equals(passwordConfirm))
			adminMapper.insert(admin);

		return "redirect:../main";
	}
}
