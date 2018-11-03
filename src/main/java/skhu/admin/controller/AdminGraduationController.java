package skhu.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import skhu.dto.Department;
import skhu.dto.GraduationGrade;
import skhu.dto.GraduationSubject;
import skhu.dto.Score;
import skhu.dto.Student;
import skhu.mapper.DepartmentMapper;
import skhu.mapper.GraduationGradeMapper;
import skhu.mapper.GraduationMapper;
import skhu.mapper.GraduationSubjectMapper;
import skhu.mapper.ScoreMapper;
import skhu.mapper.StudentMapper;
import skhu.vo.Page;

@Controller
@RequestMapping("admin/menu/graduation")
public class AdminGraduationController {
	@Autowired StudentMapper studentMapper;
	@Autowired DepartmentMapper departmentMapper;
	@Autowired GraduationMapper graduationMapper;
	@Autowired GraduationGradeMapper graduationGradeMapper;
	@Autowired GraduationSubjectMapper graduationSubjectMapper;
	@Autowired ScoreMapper scoreMapper;

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

	@RequestMapping(value="graduationlist", method=RequestMethod.GET)
	public String graduationList(Model model, HttpServletRequest request, Student condition,
		@RequestParam(value="searchText", required=false) String searchText, @RequestParam(value="pg", required=false) String pg,
		@RequestParam(value="searchType", required=false) String searchType,@RequestParam(value="majorCheck", required=false) boolean majorCheck,
		@RequestParam(value="minorCheck", required=false) boolean minorCheck) {

		if(searchText == null)
    		searchText = "";

		if(searchType == null)
    		searchType = "0";

		Page page = new Page();
		int total = studentMapper.countByGraduation(condition, "%" + searchText + "%", searchType, majorCheck, minorCheck);
		int currentPage = 1;

    	if(pg != null)
    		currentPage = Integer.parseInt(pg);

		List<Student> students = studentMapper.findByGraduation((currentPage - 1) * 10, 10, condition, "%" + searchText + "%", searchType, majorCheck, minorCheck);
		List<Department> departments = departmentMapper.findAll();
		ArrayList<Page> pages = page.paging(total, 10, currentPage, request.getQueryString());

		for(Student ttest : students) {
			System.out.println(ttest.getDepartmentId());
			System.out.println(ttest.getDepartment().getName());
		}

		model.addAttribute("condition", condition);
		model.addAttribute("searchText", searchText);
		model.addAttribute("searchType", searchType);
		model.addAttribute("majorCheck", majorCheck);
		model.addAttribute("minorCheck", minorCheck);
		model.addAttribute("students", students);
		model.addAttribute("departments", departments);
		model.addAttribute("pages", pages);
		return "admin/menu/graduation/graduationList";
	}

	@RequestMapping(value="graduationdetail", method=RequestMethod.GET)
	public String graduationDetail(Model model, @RequestParam("id") int id) {
		Student student = studentMapper.findById(id);
		List<Score> scores = scoreMapper.findByStudentId(student.getId());
		String year = student.getStudentNumber().substring(0, 3);
		List<GraduationGrade> graduationGrades = null;
		List<GraduationSubject> graduationSubjects = null;
		Map<GraduationGrade, Integer> graduationGradeMap = new HashMap<GraduationGrade, Integer>();
		Map<GraduationSubject, Integer> graduationSubjectMap = new HashMap<GraduationSubject, Integer>();

		if(!student.getGraduation().equals("0")) {
			String[] graduations = student.getGraduation().split(" ", 2);
			graduationGrades = graduationGradeMapper.findByStudent(year, student, graduations[0], graduations[1]);
			graduationSubjects = graduationSubjectMapper.findByStudent(year, student, graduations[0], graduations[1]);

			for(GraduationGrade graduationGrade : graduationGrades) {
				int total = 0;
				for(Score score : scores) {
					if(score.getSubstitutionCode().equals("0")) {
						if(graduationGrade.getName().equals(score.getSubject().getDivision()) ||graduationGrade.getName().equals(score.getSubject().getSubjectDetail().getSubtitle())) {
							total += score.getSubject().getScore();
							graduationGradeMap.put(graduationGrade, total);
						}

						else if(graduationGrade.getGraduationId() == 1 && graduationGrade.getDepartmentId() == 1) {
							total += score.getSubject().getScore();
							if(graduationGrade.getName().equals("전공") && (score.getSubject().getDivision().equals("전공필수")) || score.getSubject().getDivision().equals("전공선택"))
								graduationGradeMap.put(graduationGrade, total);

							else if(graduationGrade.getName().equals("교양") && (score.getSubject().getDivision().equals("교양필수")) || score.getSubject().getDivision().equals("교양선택"))
								graduationGradeMap.put(graduationGrade, total);

							else if(graduationGrade.getName().equals("졸업"))
								graduationGradeMap.put(graduationGrade, total);
						}
					}
				}
			}

			for(GraduationSubject graduationSubject : graduationSubjects) {
				for(Score score : scores) {
					if(score.getSubstitutionCode().equals("0") && graduationSubject.getSubject().getCode().equals(score.getSubject().getCode()))
						graduationSubjectMap.put(graduationSubject, 1);

					else if(!graduationSubject.getNote().equals("0"))
						graduationSubjectMap.put(graduationSubject, 2);

					else
						graduationSubjectMap.put(graduationSubject, 0);
				}
			}


		}

		else
			student.setGraduation("미설정");

		model.addAttribute("student", student);
		model.addAttribute("graduationGrades", graduationGrades);
		model.addAttribute("graduationSubjects", graduationSubjects);
		model.addAttribute("graduationGradeMap", graduationGradeMap);
		model.addAttribute("graduationSubjectMap", graduationSubjectMap);

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
