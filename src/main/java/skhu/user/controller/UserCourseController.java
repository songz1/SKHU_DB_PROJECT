package skhu.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("user/menu/course")
public class UserCourseController {

	@RequestMapping(value = "changerequest", method = RequestMethod.GET)
	public String changerequest() {
		return "user/menu/course/changerequest";
	}

	@RequestMapping(value = "changerequestList", method = RequestMethod.GET)
	public String changerequestList() {
		return "user/menu/course/changerequestList";
	}

	@RequestMapping(value = "majorrequest", method = RequestMethod.GET)
	public String majorrequest() {
		return "user/menu/course/majorrequest";
	}

	@RequestMapping(value = "majorrequestList", method = RequestMethod.GET)
	public String majorrequestList() {
		return "user/menu/course/majorrequestList";
	}

	@RequestMapping(value = "grades", method = RequestMethod.GET)
	public String grades() {
		return "user/menu/course/grades";
	}

}
