package skhu.admin.controller;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import skhu.dto.Department;
import skhu.dto.Rule;
import skhu.dto.Score;
import skhu.dto.Student;
import skhu.dto.Subject;
import skhu.dto.Substitution;
import skhu.mapper.DepartmentMapper;
import skhu.mapper.RuleMapper;
import skhu.mapper.ScoreMapper;
import skhu.mapper.StudentMapper;
import skhu.mapper.SubjectMapper;
import skhu.mapper.SubstitutionMapper;
import skhu.util.ExcelReader;
import skhu.util.ExcelReaderOption;

@Controller
@RequestMapping("admin/menu/course")
public class AdminCourseController {
	@Autowired SubjectMapper subjectMapper;
	@Autowired StudentMapper studentMapper;
	@Autowired DepartmentMapper departmentMapper;
	@Autowired ScoreMapper scoreMapper;
	@Autowired SubstitutionMapper substitutionMapper;
	@Autowired RuleMapper ruleMapper;

	@RequestMapping(value="changerequestlist", method=RequestMethod.GET)
	public String changerequestList(Model model, Student condition,
			@RequestParam(value="searchText", required=false) String searchText,
			@RequestParam(value="searchType", required=false) String searchType) {

		Rule rule = new Rule();
		rule.setName("대체과목");

		if(searchText == null)
			searchText = "";

		if(searchType == null)
			searchType = "0";

		List<Department> departments = departmentMapper.findWithoutCommon();
		List<Student> students = studentMapper.findAllWithDepartment(condition, searchType, "%" + searchText + "%");

		model.addAttribute("rule", rule);
		model.addAttribute("condition", condition);
		model.addAttribute("departments", departments);
		model.addAttribute("students", students);
		model.addAttribute("searchText", searchText);
		model.addAttribute("searchType", searchType);

		return "admin/menu/course/changerequestList";
	}

	@RequestMapping(value="downchangerequestlist")
	public void downChangeRequestList(HttpServletResponse response) throws Exception {
		File destCompleteFile = new File("src\\main\\webapp\\res\\file\\form\\양식_대체과목목록.xlsx");
		response.setHeader("Content-Disposition", "attachment; filename=\"" +  new String("대체과목목록.xlsx".getBytes("UTF-8"), "ISO8859_1") + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setHeader("Content-Type", "application/octet-stream; charset=utf-8\r\n");
		response.setHeader("Content-Length", ""+ destCompleteFile.length());
		response.setHeader("Pragma", "no-cache;");
		response.setHeader("Expires", "-1;");

		if(!destCompleteFile.exists()){
			throw new RuntimeException("file not found");
		}

		FileInputStream fis = null;
		try{
			fis = new FileInputStream(destCompleteFile);
			FileCopyUtils.copy(fis, response.getOutputStream());
			response.getOutputStream().flush();
		}catch(Exception ex){
			throw new RuntimeException(ex);
		}finally {
			try {
				fis.close();
			}catch(Exception ex){
			}
		}
	}

	@RequestMapping(value="downchangerequestrule")
	public void downChangeRequestRule(HttpServletResponse response) throws Exception {
		File destCompleteFile = new File("src\\main\\webapp\\res\\file\\form\\양식_대체과목규칙.xlsx");
		response.setHeader("Content-Disposition", "attachment; filename=\"" +  new String("대체과목규칙.xlsx".getBytes("UTF-8"), "ISO8859_1") + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setHeader("Content-Type", "application/octet-stream; charset=utf-8\r\n");
		response.setHeader("Content-Length", ""+ destCompleteFile.length());
		response.setHeader("Pragma", "no-cache;");
		response.setHeader("Expires", "-1;");

		if(!destCompleteFile.exists()){
			throw new RuntimeException("file not found");
		}

		FileInputStream fis = null;
		try{
			fis = new FileInputStream(destCompleteFile);
			FileCopyUtils.copy(fis, response.getOutputStream());
			response.getOutputStream().flush();
		}catch(Exception ex){
			throw new RuntimeException(ex);
		}finally {
			try {
				fis.close();
			}catch(Exception ex){
			}
		}
	}

	@RequestMapping(value="addlist", method=RequestMethod.POST)
	public String addList(Model model, MultipartHttpServletRequest request) throws Exception {
		MultipartFile listFile = request.getFile("listFile");

		if(!listFile.isEmpty()) {
			File destListFile = new File(request.getSession().getServletContext().getRealPath("") + "\\res\\file\\admin\\대체과목목록.xlsx");
			listFile.transferTo(destListFile);

			ExcelReaderOption excelReaderOption = new ExcelReaderOption();
			excelReaderOption.setFilePath(destListFile.getAbsolutePath());
			excelReaderOption.setOutputColumns("A","B");
			excelReaderOption.setStartRow(2);
			excelReaderOption.setSheetRow(0);

			List<Map<String, String>> listExcel = ExcelReader.read(excelReaderOption);
			substitutionMapper.delete();
			subjectMapper.abolishChange();
			for(Map<String, String> map : listExcel) {
				Substitution substitution = new Substitution();
				substitution.setSubjectCode(map.get("A"));
				substitution.setSubstitutionCode(map.get("B"));
				substitutionMapper.insert(substitution);
				Subject subject = new Subject();
				subject.setAbolish(true);
				subject.setCode(substitution.getSubjectCode());
				subjectMapper.update(subject);
			}
		}

		return "redirect:changerequestlist";
	}

	@RequestMapping(value="changedetail", method=RequestMethod.GET)
	public String changerequestDetail(Model model, @RequestParam("id") int id) {
		Student student = studentMapper.findById(id);
		List<Score> abolishes = scoreMapper.findBySubstitutionCode(id, "0");
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

		return "admin/menu/course/changerequestDetail";
	}

	@RequestMapping(value="changecancel", method=RequestMethod.GET)
	public String changeCancel(@RequestParam("id") int id) {
		Score score = new Score();
		score.setId(id);
		score.setSubstitutionCode("0");
		scoreMapper.update(score);

		return "redirect:changerequestlist";
	}

	@RequestMapping(value="addchangesubject", method=RequestMethod.GET)
	public String addChangeSubject(Model model, @RequestParam("id") int id) {
		Rule rule = ruleMapper.findByName("대체과목");
		List<Score> scores = scoreMapper.findWithSubstitution(id);
		Map<Score, List<Subject>> changeMap = new HashMap<Score, List<Subject>>();
		Student student = studentMapper.findById(id);

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
		return "admin/menu/course/changerequestConfirm";
	}

	@RequestMapping(value="changerequest", method=RequestMethod.POST)
	public String changeRequest(Model model, @RequestParam("id") int id, @RequestParam("change") String code) {
		Score score = new Score();

		if(id == 0)
			return "redirect:changerequestlist";

		score.setId(id);
		score.setSubstitutionCode(code);

		scoreMapper.update(score);

		return "redirect:changerequestlist";
	}

	@RequestMapping(value="majorrequestlist", method=RequestMethod.GET)
	public String majorrequestList(Model model, Student condition,
			@RequestParam(value="searchText", required=false) String searchText,
			@RequestParam(value="searchType", required=false) String searchType) {

		Rule rule = new Rule();
		rule.setName("전공인정");

		if(searchText == null)
			searchText = "";

		if(searchType == null)
			searchType = "0";

		List<Department> departments = departmentMapper.findWithoutCommon();
		List<Student> students = studentMapper.findAllWithDepartment(condition, searchType, "%" + searchText + "%");

		model.addAttribute("rule", rule);
		model.addAttribute("condition", condition);
		model.addAttribute("departments", departments);
		model.addAttribute("students", students);
		model.addAttribute("searchText", searchText);
		model.addAttribute("searchType", searchType);

		return "admin/menu/course/majorrequestList";
	}

	@RequestMapping(value="majordetail", method=RequestMethod.GET)
	public String majorrequestDetail(Model model, @RequestParam("id") int id) {
		Student student = studentMapper.findById(id);
		List<Score> scores = scoreMapper.findByMajorAdmit(id, true);

		model.addAttribute("student", student);
		model.addAttribute("scores", scores);

		return "admin/menu/course/majorrequestDetail";
	}

	@RequestMapping(value="majorcancel", method=RequestMethod.GET)
	public String majorCancel(@RequestParam("id") int id) {
		Score score = new Score();
		score.setId(id);
		score.setMajorAdmit(false);
		scoreMapper.update(score);

		return "redirect:changedetail";
	}

	@RequestMapping(value="addmajoradmit", method=RequestMethod.GET)
	public String majorrequestConfirm(Model model, @RequestParam("id") int id) {
		Rule rule = ruleMapper.findByName("전공인정");
		Student student = studentMapper.findById(id);
		List<Score> scores = scoreMapper.findByEstablish(student.getDepartmentId(), "%" + student.getDepartment().getName() + "%");

		System.out.println(scores.size());

		model.addAttribute("scores", scores);
		model.addAttribute("rule", rule);

		return "admin/menu/course/majorrequestConfirm";
	}

	@RequestMapping(value="majoradmit", method=RequestMethod.POST)
	public String majorAdmit(Model model, @RequestParam("subject") int id) {
		Score score = new Score();
		if(id == 0)
			return "redirect:changerequestlist";

		score.setId(id);
		score.setMajorAdmit(true);

		scoreMapper.update(score);

		return "redirect:changerequestlist";
	}

	@RequestMapping(value="editrule", method=RequestMethod.POST)
	public String editRule(Model model, Rule rule) {
		Rule ruleEdit = ruleMapper.findByName(rule.getName());

		if(ruleEdit == null) {
			ruleEdit = new Rule();
			ruleEdit.setId(0);
			ruleEdit.setName(rule.getName());
			ruleEdit.setContent("");
		}

		model.addAttribute("rule", ruleEdit);
		return "admin/menu/course/ruleEdit";
	}

	@RequestMapping(value="updaterule", method=RequestMethod.POST)
	public String updateRule(Rule rule) {
		if(rule.getId() == 0 )
			ruleMapper.insert(rule);

		else
			ruleMapper.update(rule);

		if(rule.getName().equals("대체과목"))
			return "redirect:changerequestlist";

		else if(rule.getName().equals("전공인정"))
			return "redirect:majorrequestlist";

		else
			return "redirect:../main";
	}

	@RequestMapping(value="gradelist", method=RequestMethod.GET)
	public String gradeList(Model model, Student condition,
			@RequestParam(value="searchText", required=false) String searchText,
			@RequestParam(value="searchType", required=false) String searchType) {

		if(searchText == null)
			searchText = "";

		if(searchType == null)
			searchType = "0";

		List<Department> departments = departmentMapper.findWithoutCommon();
		List<Student> students = studentMapper.findAllWithDepartment(condition, searchType, "%" + searchText + "%");

		model.addAttribute("condition", condition);
		model.addAttribute("departments", departments);
		model.addAttribute("students", students);
		model.addAttribute("searchText", searchText);
		model.addAttribute("searchType", searchType);

		return "admin/menu/course/gradeList";
	}

	@RequestMapping(value="downscores")
	public void downScores(HttpServletResponse response) throws Exception {
		File destCompleteFile = new File("src\\main\\webapp\\res\\file\\form\\양식_일괄학생성적.xlsx");
		response.setHeader("Content-Disposition", "attachment; filename=\"" +  new String("일괄학생성적업로드.xlsx".getBytes("UTF-8"), "ISO8859_1") + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setHeader("Content-Type", "application/octet-stream; charset=utf-8\r\n");
		response.setHeader("Content-Length", ""+ destCompleteFile.length());
		response.setHeader("Pragma", "no-cache;");
		response.setHeader("Expires", "-1;");

		if(!destCompleteFile.exists()){
			throw new RuntimeException("file not found");
		}

		FileInputStream fis = null;
		try{
			fis = new FileInputStream(destCompleteFile);
			FileCopyUtils.copy(fis, response.getOutputStream());
			response.getOutputStream().flush();
		}catch(Exception ex){
			throw new RuntimeException(ex);
		}finally {
			try {
				fis.close();
			}catch(Exception ex){
			}
		}
	}

	@RequestMapping(value="gradedetail", method=RequestMethod.GET)
	public String gradeDetail(Model model, @RequestParam("id") int id) {
		Student student = studentMapper.findById(id);
		List<Score> scores = scoreMapper.findByStudentId(id);
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

		return "admin/menu/course/gradeDetail";
	}

	@RequestMapping(value="addscore", method=RequestMethod.POST)
	public String addScore(Model model, MultipartHttpServletRequest request, @RequestParam("studentNumber") String studentNumber, @RequestParam("id") int id) throws Exception {
		MultipartFile listFile = request.getFile("listFile");

		if(!listFile.isEmpty()) {
			File destListFile = new File(request.getSession().getServletContext().getRealPath("") + "\\res\\file\\admin\\scores\\학생성적_" + studentNumber + ".xlsx");
			listFile.transferTo(destListFile);

			ExcelReaderOption excelReaderOption = new ExcelReaderOption();
			excelReaderOption.setFilePath(destListFile.getAbsolutePath());
			excelReaderOption.setOutputColumns("B","C", "D", "E");
			excelReaderOption.setStartRow(3);
			excelReaderOption.setSheetRow(1);

			List<Map<String, String>> listExcel = ExcelReader.read(excelReaderOption);
			List<Score> scores = scoreMapper.findByStudentId(id);
			Map<String, Double> scoreMap = new HashMap<String, Double>();
			Student student = studentMapper.findById(id);
			int major = 0;
			int liberal = 0;
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

			for(Score score : scores) {
				if((score.getSubject().getDivision().equals("전공선택") || score.getSubject().getDivision().equals("전공필수")) &&
						!student.getDepartment().getRealName().equals(score.getSubject().getEstablish()))
					score.getSubject().setDivision("교양선택");

				if(score.isMajorAdmit())
					score.getSubject().setDivision("전공선택");

				if(score.getSubstitutionCode().equals("0") && !(score.getScore() < 0.0)) {
					if(score.getSubject().getDivision().contains("전공")) {
						major += score.getSubject().getScore();
					}

					else if(score.getSubject().getDivision().contains("교양"))
						liberal += score.getSubject().getScore();
				}
			}

			for(Map<String, String> map : listExcel) {
				Subject subject = new Subject();

				subject.setYear(map.get("B"));
				subject.setCode(map.get("D"));

				String tmp = map.get("C");

				if(tmp.equals("여름학기"))
					subject.setSemester(3);

				else if(tmp.equals("겨울학기"))
					subject.setSemester(4);

				else
					subject.setSemester((int)Double.parseDouble(tmp));

				subject = subjectMapper.findBySpecific(subject.getCode(), subject.getYear(), subject.getSemester());

				if(subject != null) {
					Score insert = new Score();
					insert.setStudentId(id);
					insert.setSubjectId(subject.getId());
					insert.setMajorAdmit(false);
					insert.setSubstitutionCode("0");
					insert.setScore(scoreMap.get(map.get("E")));
					if(scores != null) {
						for(int i = 0; i < scores.size(); ++i) {
							if(subject.getYear().equals(scores.get(i).getSubject().getYear()) && subject.getCode().equals(scores.get(i).getSubject().getCode()) && subject.getSemester() == scores.get(i).getSubject().getSemester()) {
								insert.setId(scores.get(i).getId());
								scoreMapper.update(insert);
								break;
							}

							else if(i == scores.size() - 1) {
								scoreMapper.insert(insert);

								if(!(insert.getScore() < 0.0)) {
									if(subject.getDivision().contains("전공"))
										major += subject.getScore();

									else if(subject.getDivision().contains("교양"))
										liberal += subject.getScore();
								}
							}
						}
					}

					else {
						scoreMapper.insert(insert);

						if(!(insert.getScore() < 0.0)) {
							if(subject.getDivision().contains("전공"))
								major += subject.getScore();

							else if(subject.getDivision().contains("교양"))
								liberal += subject.getScore();
						}
					}
				}
			}
			if(student.getMajorEssential() != major || student.getLiberalEssential() != liberal) {
				Student update = new Student();
				update.setId(student.getId());
				update.setMajorEssential(major);
				update.setLiberalEssential(liberal);
				studentMapper.update(update);
			}
		}

		return "redirect:gradelist";
	}

	@RequestMapping(value="addscores", method=RequestMethod.POST)
	public String addScores(Model model, MultipartHttpServletRequest request) throws Exception {
		MultipartFile listFile = request.getFile("listFile");

		if(!listFile.isEmpty()) {
			File destListFile = new File(request.getSession().getServletContext().getRealPath("") + "\\res\\file\\admin\\scores\\학생성적_일괄.xlsx");
			listFile.transferTo(destListFile);

			ExcelReaderOption excelReaderOption = new ExcelReaderOption();
			excelReaderOption.setFilePath(destListFile.getAbsolutePath());
			excelReaderOption.setOutputColumns("B","C", "D", "E", "F");
			excelReaderOption.setStartRow(3);
			excelReaderOption.setSheetRow(1);

			List<Map<String, String>> listExcel = ExcelReader.read(excelReaderOption);
			Map<String, Double> scoreMap = new HashMap<String, Double>();
			Student student = null;
			List<Score> scores = null;

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
				if(map.get("B") == null || map.get("B").equals(""))
					break;

				Subject subject = new Subject();

				subject.setYear(map.get("B"));
				subject.setCode(map.get("D"));

				String tmp = map.get("C");

				if(tmp.equals("여름학기"))
					subject.setSemester(3);

				else if(tmp.equals("겨울학기"))
					subject.setSemester(4);

				else
					subject.setSemester((int)Double.parseDouble(tmp));

				subject = subjectMapper.findBySpecific(subject.getCode(), subject.getYear(), subject.getSemester());

				String stdNum = map.get("F");

				if(stdNum != null && !stdNum.equals("") && stdNum.length() != 0) {
					student = studentMapper.findByStudentNumber(stdNum);
					scores = scoreMapper.findByStudentId(student.getId());
				}

				if(subject != null) {
					Score insert = new Score();
					insert.setStudentId(student.getId());
					insert.setSubjectId(subject.getId());
					insert.setMajorAdmit(false);
					insert.setSubstitutionCode("0");
					insert.setScore(scoreMap.get(map.get("E")));
					if(scores != null && scores.size() != 0) {
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
						System.out.println("tt");
						scoreMapper.insert(insert);
					}
				}
			}
		}

		return "redirect:gradelist";
	}

	@RequestMapping(value="addscoret", method=RequestMethod.POST)
	public String addScoret(Model model, MultipartHttpServletRequest request, @RequestParam("studentNumber") String studentNumber, @RequestParam("id") int id) throws Exception {
		MultipartFile listFile = request.getFile("listFile");

		if(!listFile.isEmpty()) {
			File destListFile = new File(request.getSession().getServletContext().getRealPath("") + "\\res\\file\\admin\\scores\\학생성적_" + studentNumber + ".xlsx");
			listFile.transferTo(destListFile);

			ExcelReaderOption excelReaderOption = new ExcelReaderOption();
			excelReaderOption.setFilePath(destListFile.getAbsolutePath());
			excelReaderOption.setOutputColumns("B","C", "D", "H");
			excelReaderOption.setStartRow(3);
			excelReaderOption.setSheetRow(1);

			List<Map<String, String>> listExcel = ExcelReader.read(excelReaderOption);
			List<Score> scores = scoreMapper.findByStudentId(id);
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

				if(subject != null) {
					Score insert = new Score();
					insert.setStudentId(id);
					insert.setSubjectId(subject.getId());
					insert.setMajorAdmit(false);
					insert.setSubstitutionCode("0");
					insert.setScore(scoreMap.get(map.get("H")));
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

		return "redirect:gradelist";
	}
}
