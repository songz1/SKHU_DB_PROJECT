package skhu.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("admin/menu/course")
public class AdminCourseController {

	@RequestMapping(value="changerequestList", method=RequestMethod.GET)
	public String changerequestList() {
		return "admin/menu/course/changerequestList";
	}

	@RequestMapping(value="changerequestDetail", method=RequestMethod.GET)
	public String changerequestDetail() {
		return "admin/menu/course/changerequestDetail";
	}

	@RequestMapping(value="changerequestConfrim", method=RequestMethod.GET)
	public String changerequestConfirm() {
		return "admin/menu/course/changerequestConfirm";
	}

	@RequestMapping(value="majorrequestList", method=RequestMethod.GET)
	public String majorrequestList() {
		return "admin/menu/course/majorrequestList";
	}

	@RequestMapping(value="majorrequestDetail", method=RequestMethod.GET)
	public String majorrequestDetail() {
		return "admin/menu/course/majorrequestDetail";
	}

	@RequestMapping(value="majorrequestConfrim", method=RequestMethod.GET)
	public String majorrequestConfirm() {
		return "admin/menu/course/majorrequestConfirm";
	}

	@RequestMapping(value="gradeList", method=RequestMethod.GET)
	public String gradeList() {
		return "admin/menu/course/gradeList";
	}

	@RequestMapping(value="gradeDetail", method=RequestMethod.GET)
	public String gradeDetail() {
		return "admin/menu/course/gradeDetail";
	}
}
