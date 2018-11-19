package skhu.user.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import skhu.dto.Rule;
import skhu.dto.Score;
import skhu.dto.Student;
import skhu.dto.Subject;
import skhu.mapper.RuleMapper;
import skhu.mapper.ScoreMapper;
import skhu.mapper.StudentMapper;
import skhu.mapper.SubjectMapper;
import skhu.util.ExcelReader;
import skhu.util.ExcelReaderOption;

@Controller
@RequestMapping("user/menu/course")
public class UserCourseController {
	@Autowired ScoreMapper scoreMapper;
	@Autowired SubjectMapper subjectMapper;
	@Autowired RuleMapper ruleMapper;
	@Autowired StudentMapper studentMapper;

	@RequestMapping(value="changerequest", method=RequestMethod.GET)
	public String changerequest(Model model, HttpSession session) {
		Student student = ((Student)session.getAttribute("userInfo"));
		Rule rule = ruleMapper.findByName("대체과목");
		System.out.println(student.getId());
		List<Score> scores = scoreMapper.findWithSubstitution(student.getId());
		Map<Score, List<Subject>> changeMap = new HashMap<Score, List<Subject>>();
		System.out.println(student.getId());
		if(scores != null) {
			for(Score score : scores) {
				List<Subject> subjects = new ArrayList<Subject>();
				if(score.getSubstitution().getSubstitutionCode().equals("전공선택")) {
					subjects = subjectMapper.findByDivision("전공선택", student.getDepartmentId());
				}

				else if(score.getSubstitution().getSubstitutionCode().contains("전공")) {
					subjects = subjectMapper.findBySubtitle(score.getSubstitutionCode());
				}

				else {
					subjects.add(subjectMapper.findByCode(score.getSubstitutionCode()));
				}

				changeMap.put(score, subjects);
			}
		}

		model.addAttribute("changeMap", changeMap);
		model.addAttribute("rule", rule);
		return "user/menu/course/changerequest";
	}

	@RequestMapping(value="changerequest", method=RequestMethod.POST)
	public String changeRequest(Model model, @RequestParam("id") int id, @RequestParam("change") String code) {
		Score score = new Score();

		if(id == 0)
			return "redirect:changerequest";

		score.setId(id);
		score.setSubstitutionCode(code);

		scoreMapper.update(score);

		return "redirect:changerequest";
	}

	@RequestMapping(value="changerequestList", method=RequestMethod.GET)
	public String changerequestList(Model model, HttpSession session) {
		Student student = ((Student)session.getAttribute("userInfo"));
		List<Score> abolishes = scoreMapper.findBySubstitutionCode(student.getId(), "0");
		List<Subject> changes = new ArrayList<Subject>();
		List<String> scores = new ArrayList<String>();

		for(Score abolish : abolishes) {
			if(!abolish.getSubstitutionCode().equals("0"))
				changes.add(subjectMapper.findByCode(abolish.getSubstitutionCode()));

			if(abolish.getScore() == 4.5)
				scores.add("A+");

			else if(abolish.getScore() == 4.0)
				scores.add("A0");

			else if(abolish.getScore() == 3.5)
				scores.add("B+");

			else if(abolish.getScore() == 3.0)
				scores.add("B0");

			else if(abolish.getScore() == 2.5)
				scores.add("C+");

			else if(abolish.getScore() == 2.0)
				scores.add("C0");

			else if(abolish.getScore() == 1.5)
				scores.add("D+");

			else if(abolish.getScore() == 1.0)
				scores.add("D0");

			else if(abolish.getScore() > 4.5)
				scores.add("P");

			else if(abolish.getScore() < 1.0)
				scores.add("N");

			else
				scores.add("error");
		}

		model.addAttribute("student", student);
		model.addAttribute("abolishes", abolishes);
		model.addAttribute("changes", changes);
		model.addAttribute("scores", scores);

		return "user/menu/course/changerequestList";
	}

	@RequestMapping(value="changecancel", method=RequestMethod.GET)
	public String changeCancel(@RequestParam("id") int id) {
		Score score = new Score();
		score.setId(id);
		score.setSubstitutionCode("0");
		scoreMapper.update(score);

		return "redirect:changerequestList";
	}

	@RequestMapping(value="majorrequest", method=RequestMethod.GET)
	public String majorrequest(Model model, HttpSession session) {
		Student student = ((Student)session.getAttribute("userInfo"));
		Rule rule = ruleMapper.findByName("전공인정");
		System.out.println(student.getDepartment().getRealName());
		System.out.println(student.getDepartment().getId());
		List<Score> scores = scoreMapper.findByEstablish(student.getId(), student.getDepartmentId(), "%" + student.getDepartment().getRealName().substring(0, student.getDepartment().getRealName().indexOf(" ")) + "%");

		model.addAttribute("scores", scores);
		model.addAttribute("rule", rule);

		return "user/menu/course/majorrequest";
	}

	@RequestMapping(value="majoradmit", method=RequestMethod.POST)
	public String majorAdmit(Model model, @RequestParam("subject") int id) {
		Score score = new Score();
		if(id == 0)
			return "redirect:majorrequest";

		score.setId(id);
		score.setMajorAdmit(true);

		scoreMapper.update(score);

		return "redirect:majorrequest";
	}

	@RequestMapping(value="majorrequestList", method=RequestMethod.GET)
	public String majorrequestList(Model model, HttpSession session) {
		Student student = ((Student)session.getAttribute("userInfo"));
		List<Score> scores = scoreMapper.findByMajorAdmit(student.getId(), true);

		model.addAttribute("student", student);
		model.addAttribute("scores", scores);

		return "user/menu/course/majorrequestList";
	}

	@RequestMapping(value="majorcancel", method=RequestMethod.GET)
	public String majorCancel(@RequestParam("id") int id) {
		Score score = new Score();
		score.setId(id);
		score.setMajorAdmit(false);
		scoreMapper.update(score);

		return "redirect:majorrequestList";
	}

	@RequestMapping(value="grades", method=RequestMethod.GET)
	public String grades(Model model, Subject condition,
			@RequestParam(value="searchText", required=false) String searchText,
			HttpSession session) {

		Student student = ((Student)session.getAttribute("userInfo"));
		if(searchText == null)
			searchText = "";

		System.out.println(searchText);

		List<Score> scores = scoreMapper.findByStudentId(student.getId(), "%" + searchText + "%", condition);
		List<String> scoreChar = new ArrayList<String>();
		double requestGrade = 0.0;
		double getGrade = 0.0;
		double averageGrade = 0.0;
		int scoreCount = 0;

		for(Score score : scores) {
			if((score.getSubject().getDivision().equals("전공선택") || score.getSubject().getDivision().equals("전공필수")) &&
					!student.getDepartment().getRealName().equals(score.getSubject().getEstablish()))
				score.getSubject().setDivision("교양선택");

			if(score.isMajorAdmit())
				score.getSubject().setDivision("전공선택");

			requestGrade += score.getSubject().getScore();

			if(score.getSubstitutionCode().equals("0") && !(score.getScore() < 0.0)) {
				getGrade += score.getSubject().getScore();

				if(!(score.getScore() > 4.5)) {
					++scoreCount;
					averageGrade += score.getScore();
				}
			}

			if(score.getScore() == 4.5)
				scoreChar.add("A+");

			else if(score.getScore() == 4.0)
				scoreChar.add("A0");

			else if(score.getScore() == 3.5)
				scoreChar.add("B+");

			else if(score.getScore() == 3.0)
				scoreChar.add("B0");

			else if(score.getScore() == 2.5)
				scoreChar.add("C+");

			else if(score.getScore() == 2.0)
				scoreChar.add("C0");

			else if(score.getScore() == 1.5)
				scoreChar.add("D+");

			else if(score.getScore() == 1.0)
				scoreChar.add("D0");

			else if(score.getScore() > 4.5)
				scoreChar.add("P");

			else if(score.getScore() < 0.0)
				scoreChar.add("N");

			else
				scoreChar.add("error");


		}

		averageGrade /= scoreCount;

		model.addAttribute("student", student);
		model.addAttribute("scores", scores);
		model.addAttribute("scoreChar", scoreChar);
		model.addAttribute("requestGrade", requestGrade);
		model.addAttribute("getGrade", getGrade);
		model.addAttribute("averageGrade", Double.parseDouble(String.format("%.2f", averageGrade)));
		model.addAttribute("condition", condition);
		model.addAttribute("searchText", searchText);

		return "user/menu/course/grades";
	}

	@RequestMapping(value="addscore", method=RequestMethod.POST)
	public String addScore(Model model, MultipartHttpServletRequest request, @RequestParam("studentNumber") String studentNumber, @RequestParam("id") int id) throws Exception {
		MultipartFile listFile = request.getFile("listFile");

		Subject sub = new Subject();
		sub.setSemester(0);

		if(!listFile.isEmpty()) {
			File destListFile = new File(request.getSession().getServletContext().getRealPath("") + "\\res\\file\\admin\\학생성적_" + studentNumber + ".xlsx");
			listFile.transferTo(destListFile);

			ExcelReaderOption excelReaderOption = new ExcelReaderOption();
			excelReaderOption.setFilePath(destListFile.getAbsolutePath());
			excelReaderOption.setOutputColumns("B","C", "D", "H");
			excelReaderOption.setStartRow(3);
			excelReaderOption.setSheetRow(0);

			List<Map<String, String>> listExcel = ExcelReader.read(excelReaderOption);
			List<Score> scores = scoreMapper.findByStudentId(id, "", sub);
			Map<String, Double> scoreMap = new HashMap<String, Double>();
			scoreMap.put("A+", 4.5);
			scoreMap.put("A0", 4.0);
			scoreMap.put("B+", 3.5);
			scoreMap.put("B0", 3.0);
			scoreMap.put("C+", 2.5);
			scoreMap.put("C0", 2.0);
			scoreMap.put("D+", 1.5);
			scoreMap.put("D0", 1.0);
			scoreMap.put("P", 10.0);
			scoreMap.put("N", -1.0);

			for(Map<String, String> map : listExcel) {
				Subject subject = new Subject();

				String temp = map.get("B");

				subject.setYear(temp.substring(0, temp.indexOf(".")));
				subject.setCode(map.get("D"));

				String tmp = map.get("C");

				if(tmp.equals("여름학기"))
					subject.setSemester(3);

				else if(tmp.equals("겨울학기"))
					subject.setSemester(4);

				else
					subject.setSemester((int)Double.parseDouble(tmp.substring(0, 1)));

				subject = subjectMapper.findBySpecific(subject.getCode(), subject.getYear(), subject.getSemester());
				Score insert = new Score();
				insert.setStudentId(id);
				insert.setSubjectId(subject.getId());
				insert.setMajorAdmit(false);
				insert.setSubstitutionCode("0");
				insert.setScore(scoreMap.get(map.get("H")));

				if(subject != null) {
					if(scores != null) {
						for(int i = 0; i < scores.size(); ++i) {
							if(subject.getYear().equals(scores.get(i).getSubject().getYear()) && subject.getCode().equals(scores.get(i).getSubject().getCode()) && subject.getSemester() == scores.get(i).getSubject().getSemester()) {
								insert.setId(scores.get(i).getId());
								scoreMapper.update(insert);
								break;
							}

							else if(i == scores.size() - 1)
								scoreMapper.insert(insert);
						}
					}

					else {
						scoreMapper.insert(insert);
					}
				}
			}
		}

		return "redirect:grades";
	}

}
