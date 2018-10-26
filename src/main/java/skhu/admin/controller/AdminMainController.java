package skhu.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import skhu.dto.Action;
import skhu.mapper.ActionMapper;

@Controller
@RequestMapping("admin/menu")
public class AdminMainController {
	@Autowired ActionMapper actionMapper;
	
	@RequestMapping(value="main", method=RequestMethod.GET)
	public String main(Model model, HttpSession session, Pageable pageable) {
		List<Action> actions = actionMapper.findActionRecently();

		model.addAttribute("actions", actions);

		return "admin/menu/main";
	}
}
