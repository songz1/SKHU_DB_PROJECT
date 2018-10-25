package skhu.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("user/login/guest")
public class UserGuestController {

	@RequestMapping(value = "guestBasic", method = RequestMethod.GET)
	public String guestBasic() {
		return "user/login/guest/guestBasic";
	}

	@RequestMapping(value = "guestDetail", method = RequestMethod.GET)
	public String guestDetail() {
		return "user/login/guest/guestDetail";
	}

	@RequestMapping(value = "guestYearChoice", method = RequestMethod.GET)
	public String guestYearChoice() {
		return "user/login/guest/guestYearChoice";
	}

	@RequestMapping(value = "guestInfo", method = RequestMethod.GET)
	public String guestInfo() {
		return "user/login/guest/guestInfo";
	}

}
