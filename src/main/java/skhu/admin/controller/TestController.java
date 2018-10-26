package skhu.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import skhu.dto.Admin;
import skhu.mapper.AdminMapper;

@Controller
public class TestController {
	@Autowired AdminMapper adminMapper;

	@RequestMapping(value="myTest", method=RequestMethod.GET)
	public String myTest(Model model) {
		List<Admin> admins = adminMapper.findAll();
		model.addAttribute("admins", admins);
		return "myTest";
	}
}
