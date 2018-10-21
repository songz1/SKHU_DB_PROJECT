package skhu.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("admin/menu/graduation")
public class AdminGraduationController {

	@RequestMapping(value="basic", method=RequestMethod.GET)
	public String basic() {
		return "admin/menu/graduation/basic";
	}

	@RequestMapping(value="detail", method=RequestMethod.GET)
	public String detail() {
		return "admin/menu/graduation/detail";
	}

	@RequestMapping(value="yearChoice", method=RequestMethod.GET)
	public String yearChoice() {
		return "admin/menu/graduation/yearChoice";
	}

	@RequestMapping(value="info", method=RequestMethod.GET)
	public String info() {
		return "admin/menu/graduation/info";
	}

	@RequestMapping(value="gradelist", method=RequestMethod.GET)
	public String gradelist() {
		return "admin/menu/graduation/gradelist";
	}

	@RequestMapping(value="editgrade", method=RequestMethod.GET)
	public String editgrade() {
		return "admin/menu/graduation/editgrade";
	}

	@RequestMapping(value="subjectlist", method=RequestMethod.GET)
	public String subjectlist() {
		return "admin/menu/graduation/subjectlist";
	}

	@RequestMapping(value="editsubject", method=RequestMethod.GET)
	public String editsubject() {
		return "admin/menu/graduation/editsubject";
	}

	@RequestMapping(value="creategraduation", method=RequestMethod.GET)
	public String creategraduation() {
		return "admin/menu/graduation/creategraduation";
	}

	@RequestMapping(value="graduationList", method=RequestMethod.GET)
	public String graduationList() {
		return "admin/menu/graduation/graduationList";
	}

	@RequestMapping(value="graduationDetail", method=RequestMethod.GET)
	public String graduationDetail() {
		return "admin/menu/graduation/graduationDetail";
	}

	@RequestMapping(value="counseling", method=RequestMethod.GET)
	public String counseling() {
		return "admin/menu/graduation/counseling";
	}

	@RequestMapping(value="counselingList", method=RequestMethod.GET)
	public String counselingList() {
		return "admin/menu/graduation/counselingList";
	}

	@RequestMapping(value="counselingDetail", method=RequestMethod.GET)
	public String counselingDetail() {
		return "admin/menu/graduation/counselingDetail";
	}

	@RequestMapping(value="counselingAdd", method=RequestMethod.GET)
	public String counselingAdd() {
		return "admin/menu/graduation/counselingAdd";
	}

}
