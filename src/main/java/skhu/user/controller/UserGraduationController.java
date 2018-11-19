package skhu.user.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import skhu.dto.College;
import skhu.dto.CompleteScore;
import skhu.dto.Department;
import skhu.dto.Graduation;
import skhu.dto.GraduationGrade;
import skhu.dto.GraduationSubject;
import skhu.dto.Score;
import skhu.dto.Student;
import skhu.dto.Subject;
import skhu.mapper.CollegeMapper;
import skhu.mapper.CompleteScoreMapper;
import skhu.mapper.DepartmentMapper;
import skhu.mapper.GraduationGradeMapper;
import skhu.mapper.GraduationMapper;
import skhu.mapper.GraduationSubjectMapper;
import skhu.mapper.ScoreMapper;
import skhu.mapper.StudentMapper;
import skhu.mapper.SubjectMapper;

@Controller
@RequestMapping("user/menu/graduation")
public class UserGraduationController {
	@Autowired CollegeMapper collegeMapper;
	@Autowired StudentMapper studentMapper;
	@Autowired DepartmentMapper departmentMapper;
	@Autowired GraduationMapper graduationMapper;
	@Autowired GraduationGradeMapper graduationGradeMapper;
	@Autowired GraduationSubjectMapper graduationSubjectMapper;
	@Autowired ScoreMapper scoreMapper;
	@Autowired SubjectMapper subjectMapper;
	@Autowired CompleteScoreMapper completeScoreMapper;

	@RequestMapping(value="basic", method=RequestMethod.GET)
	public String basic(Model model) {
		List<GraduationGrade> graduationGrades = graduationGradeMapper.findByCommon();
		List<GraduationSubject> graduationSubjects = graduationSubjectMapper.findByCommon();
		List<CompleteScore> completeScores = completeScoreMapper.findAll();
		Map<String, List<GraduationGrade>> graduationGradeMap = new HashMap<String, List<GraduationGrade>>();
		Map<String, List<GraduationSubject>> graduationSubjectMap = new HashMap<String, List<GraduationSubject>>();
		List<GraduationGrade> gradeTemp = new ArrayList<GraduationGrade>();
		List<GraduationSubject> subjectTemp = new ArrayList<GraduationSubject>();

		for(int i = 0; i < graduationGrades.size(); ++i) {
			if(i != 0) {
				if(!graduationGrades.get(i).getYear().equals(graduationGrades.get(i-1).getYear())) {
					graduationGradeMap.put(graduationGrades.get(i).getYear(), gradeTemp);
					gradeTemp = new ArrayList<GraduationGrade>();
				}

			}
			gradeTemp.add(graduationGrades.get(i));
		}

		if(gradeTemp.size() > 0)
			graduationGradeMap.put(gradeTemp.get(0).getYear(), gradeTemp);

		for(int i = 0; i < graduationSubjects.size(); ++i) {
			if(i != 0) {
				if(!graduationSubjects.get(i).getYear().equals(graduationSubjects.get(i-1).getYear())) {
					graduationSubjectMap.put(graduationSubjects.get(i).getYear(), subjectTemp);
					subjectTemp = new ArrayList<GraduationSubject>();
				}

			}
			subjectTemp.add(graduationSubjects.get(i));
		}

		if(subjectTemp.size() > 0)
			graduationSubjectMap.put(subjectTemp.get(0).getYear(), subjectTemp);

		model.addAttribute("graduationGradeMap", graduationGradeMap);
		model.addAttribute("graduationSubjectMap", graduationSubjectMap);
		model.addAttribute("completeScores", completeScores);


		return "user/menu/graduation/basic";
	}

	@RequestMapping(value="detail", method=RequestMethod.GET)
	public String detail(Model model) {
		List<College> colleges = collegeMapper.findWithoutCommon();
		List<Department> departments = departmentMapper.findWithoutCommon();

		model.addAttribute("colleges", colleges);
		model.addAttribute("departments", departments);

		return "user/menu/graduation/detail";
	}

	@RequestMapping(value="yearchoice", method=RequestMethod.GET)
	public String yearChoice(Model model, @RequestParam("id") int id) {
		List<GraduationGrade> years = graduationGradeMapper.findYear(id);
		Department department = departmentMapper.findById(id);

		model.addAttribute("years", years);
		model.addAttribute("department", department);

		return "user/menu/graduation/yearChoice";
	}

	@RequestMapping(value="info", method=RequestMethod.GET)
	public String info(Model model, @RequestParam("id") int id, @RequestParam("year") String year) {
		List<Graduation> graduations = graduationMapper.findWithoutCommon();
		List<GraduationGrade> graduationGrades = graduationGradeMapper.findByDepartment(id, year);
		List<GraduationSubject> graduationSubjects = graduationSubjectMapper.findByDepartment(id, year);
		Map<Integer, List<GraduationGrade>> graduationGradeMap = new HashMap<Integer, List<GraduationGrade>>();
		Map<Integer, List<GraduationSubject>> graduationSubjectMap = new HashMap<Integer, List<GraduationSubject>>();
		List<GraduationGrade> gradeTemp = new ArrayList<GraduationGrade>();
		List<GraduationSubject> subjectTemp = new ArrayList<GraduationSubject>();
		int k = 0;

		for(int i = 0; i < graduationGrades.size(); ++i) {
			if(i != 0) {
				if(graduationGrades.get(i).getGraduationId() != graduationGrades.get(i-1).getGraduationId()) {
					graduationGradeMap.put(graduations.get(k++).getId(), gradeTemp);
					gradeTemp = new ArrayList<GraduationGrade>();
				}
			}
			gradeTemp.add(graduationGrades.get(i));
		}

		if(gradeTemp.size() > 0)
			graduationGradeMap.put(graduations.get(k++).getId(), gradeTemp);

		k = 0;

		for(int i = 0; i < graduationSubjects.size(); ++i) {
			if(i != 0) {
				if(!graduationSubjects.get(i).getYear().equals(graduationSubjects.get(i-1).getYear())) {
					graduationSubjectMap.put(graduations.get(k++).getId(), subjectTemp);
					subjectTemp = new ArrayList<GraduationSubject>();
				}

			}
			subjectTemp.add(graduationSubjects.get(i));
		}

		if(gradeTemp.size() > 0)
			graduationGradeMap.put(graduations.get(k++).getId(), gradeTemp);

		model.addAttribute("graduations", graduations);
		model.addAttribute("graduationGradeMap", graduationGradeMap);
		model.addAttribute("graduationSubjectMap", graduationSubjectMap);

		return "user/menu/graduation/info";
	}

	@RequestMapping(value = "mygraduation", method = RequestMethod.GET)
	public String mygraduation(Model model, HttpSession session) {
		Student student = ((Student)session.getAttribute("userInfo"));
		Subject sub = new Subject();
		sub.setSemester(0);

		List<Graduation> graduations = graduationMapper.findWithoutCommon();
		List<Department> departments = departmentMapper.findWithoutCommon();
		List<Score> scores = scoreMapper.findByStudentId(student.getId(), "", sub);
		String year = student.getStudentNumber().substring(0, 4);
		List<GraduationGrade> graduationGrades = null;
		List<GraduationSubject> graduationSubjects = null;
		Map<GraduationGrade, Integer> graduationGradeMap = new LinkedHashMap<GraduationGrade, Integer>();
		Map<GraduationSubject, Integer> graduationSubjectMap = new LinkedHashMap<GraduationSubject, Integer>();
		int mainGraduationId = 0;
		int subGraduationId = 0;
		int minorId = 0;
		int doubleMajorId = 0;

		if(!student.getGraduation().equals("0")) {
			String[] splitGraduations = student.getGraduation().split(" ", 2);

			if(splitGraduations.length == 1) {
				splitGraduations = new String[2];
				splitGraduations[0] = student.getGraduation();
				splitGraduations[1] = "";
			}

			int differentDepartmentGraduationId = 0;

			for(Graduation graduation : graduations) {
				if(graduation.getName().equals("타과학생 복수전공")) {
					if(splitGraduations[0].equals("복수전공")) {
						differentDepartmentGraduationId = graduation.getId();
					}
				}

				else if(splitGraduations[0].equals("부전공")) {
					if(graduation.getName().equals("타과학생 부전공")) {
						differentDepartmentGraduationId = graduation.getId();
					}
				}

				if(graduation.getName().equals(splitGraduations[0]))
					mainGraduationId = graduation.getId();

				if(graduation.getName().equals(splitGraduations[1]))
					subGraduationId = graduation.getId();
			}

			for(Department department : departments) {
				if(department.getName().equals(student.getMinor()))
					minorId = department.getId();

				if(department.getName().equals(student.getDoubleMajor()))
					doubleMajorId = department.getId();

			}

			graduationGrades = graduationGradeMapper.findByStudent(year, student, minorId, doubleMajorId, mainGraduationId, subGraduationId, differentDepartmentGraduationId);
			graduationSubjects = graduationSubjectMapper.findByStudent(year, student, minorId, doubleMajorId, mainGraduationId, subGraduationId, differentDepartmentGraduationId);

			for(GraduationGrade graduationGrade : graduationGrades) {
				int total = 0;
				graduationGradeMap.put(graduationGrade, total);
				for(Score score : scores) {
					if(score.getSubstitutionCode().equals("0")) {
						if(graduationGrade.getName().contains("채플")) {
							if(score.getSubject().getName().contains("채플") && score.getScore() > 0) {
								total += 1;
								graduationGradeMap.put(graduationGrade, total);
							}
						}

						else if((graduationGrade.getName().equals(score.getSubject().getDivision())) ||
								graduationGrade.getName().equals(score.getSubject().getSubjectDetail().getSubtitle()) ||
								graduationGrade.getName().equals("졸업") ||
								(graduationGrade.getName().contains("전공") && score.getSubject().getDivision().contains("전공") ||
										(graduationGrade.getName().contains("교양") && score.getSubject().getDivision().contains("교양")))) {

							if(graduationGrade.getName().equals("전공필수") && score.getSubject().getDivision().equals("전공선택"))
								continue;

							else if(graduationGrade.getName().equals("교양필수") && score.getSubject().getDivision().equals("교양선택"))
								continue;

							total += score.getSubject().getScore();
							graduationGradeMap.put(graduationGrade, total);
						}
					}
				}
			}

			for(GraduationSubject graduationSubject : graduationSubjects) {
				for(Score score : scores) {
					if(!graduationSubject.getNote().equals("") && graduationSubject.getNote().length() != 0) {
						if(score.getSubstitutionCode().equals("0") && graduationSubject.getSubject().getCode().equals(score.getSubject().getCode())) {
							graduationSubjectMap.put(graduationSubject, 1);
							break;
						}

						else
							graduationSubjectMap.put(graduationSubject, 2);
					}

					else {
						if(score.getSubstitutionCode().equals("0") && graduationSubject.getSubject().getCode().equals(score.getSubject().getCode())) {
							graduationSubjectMap.put(graduationSubject, 1);
							break;
						}

						else
							graduationSubjectMap.put(graduationSubject, 0);
					}
				}
			}


		}

		else
			student.setGraduation("미설정");

		model.addAttribute("student", student);
		model.addAttribute("minorId", minorId);
		model.addAttribute("mainGraduationId", mainGraduationId);
		model.addAttribute("subGraduationId", subGraduationId);
		model.addAttribute("doubleMajorId", doubleMajorId);
		model.addAttribute("graduations", graduations);
		model.addAttribute("departments", departments);
		model.addAttribute("graduationGradeMap", graduationGradeMap);
		model.addAttribute("graduationSubjectMap", graduationSubjectMap);

		return "user/menu/graduation/mygraduation";
	}

	@RequestMapping(value = "mygraduation", method = RequestMethod.POST)
	public String mygraduation(Model model, HttpSession session,
			@RequestParam("mainGraduation") int mainGraduation, @RequestParam("minor") int minor,
			@RequestParam("doubleMajor1") int doubleMajor1, @RequestParam("doubleMajor2") int doubleMajor2,
			@RequestParam("subGraduation") int subGraduation) {
		Student student = ((Student)session.getAttribute("userInfo"));
		Subject sub = new Subject();
		sub.setSemester(0);

		List<Graduation> graduations = graduationMapper.findWithoutCommon();
		List<Department> departments = departmentMapper.findWithoutCommon();
		List<Score> scores = scoreMapper.findByStudentId(student.getId(), "", sub);
		String year = student.getStudentNumber().substring(0, 4);
		List<GraduationGrade> graduationGrades = null;
		List<GraduationSubject> graduationSubjects = null;
		Map<GraduationGrade, Integer> graduationGradeMap = new LinkedHashMap<GraduationGrade, Integer>();
		Map<GraduationSubject, Integer> graduationSubjectMap = new LinkedHashMap<GraduationSubject, Integer>();
		if(!student.getGraduation().equals("0")) {

			int differentDepartmentGraduationId = 0;

			for(Graduation graduation : graduations) {
				if(mainGraduation == graduation.getId()) {
					if(graduation.getName().equals("부전공")) {
						for(Graduation temp : graduations) {
							if(temp.getName().equals("타과학생 부전공")) {
								differentDepartmentGraduationId = graduation.getId();
								break;
							}
						}
					}

					else if(graduation.getName().equals("복수전공")) {
						for(Graduation temp : graduations) {
							if(temp.getName().equals("타과학생 복수전공")) {
								differentDepartmentGraduationId = graduation.getId();
								break;
							}
						}
					}
					break;
				}
			}

			if(minor == 0)
				minor = doubleMajor1;

			graduationGrades = graduationGradeMapper.findByStudent(year, student, minor, doubleMajor2, mainGraduation, subGraduation, differentDepartmentGraduationId);
			graduationSubjects = graduationSubjectMapper.findByStudent(year, student, minor, doubleMajor2, mainGraduation, subGraduation, differentDepartmentGraduationId);

			for(GraduationGrade graduationGrade : graduationGrades) {
				int total = 0;
				graduationGradeMap.put(graduationGrade, total);
				for(Score score : scores) {
					if(score.getSubstitutionCode().equals("0")) {
						if(graduationGrade.getName().contains("채플")) {
							if(score.getSubject().getName().contains("채플") && score.getScore() > 0) {
								total += 1;
								graduationGradeMap.put(graduationGrade, total);
							}
						}

						else if((graduationGrade.getName().equals(score.getSubject().getDivision())) ||
								graduationGrade.getName().equals(score.getSubject().getSubjectDetail().getSubtitle()) ||
								graduationGrade.getName().equals("졸업") ||
								(graduationGrade.getName().contains("전공") && score.getSubject().getDivision().contains("전공") ||
										(graduationGrade.getName().contains("교양") && score.getSubject().getDivision().contains("교양")))) {

							if(graduationGrade.getName().equals("전공필수") && score.getSubject().getDivision().equals("전공선택"))
								continue;

							else if(graduationGrade.getName().equals("교양필수") && score.getSubject().getDivision().equals("교양선택"))
								continue;

							total += score.getSubject().getScore();
							graduationGradeMap.put(graduationGrade, total);
						}
					}
				}
			}

			for(GraduationSubject graduationSubject : graduationSubjects) {
				for(Score score : scores) {
					if(!graduationSubject.getNote().equals("") && graduationSubject.getNote().length() != 0) {
						if(score.getSubstitutionCode().equals("0") && graduationSubject.getSubject().getCode().equals(score.getSubject().getCode())) {
							graduationSubjectMap.put(graduationSubject, 1);
							break;
						}

						else
							graduationSubjectMap.put(graduationSubject, 2);
					}

					else {
						if(score.getSubstitutionCode().equals("0") && graduationSubject.getSubject().getCode().equals(score.getSubject().getCode())) {
							graduationSubjectMap.put(graduationSubject, 1);
							break;
						}

						else
							graduationSubjectMap.put(graduationSubject, 0);
					}
				}
			}


		}

		else
			student.setGraduation("미설정");

		model.addAttribute("student", student);
		model.addAttribute("minorId", minor);
		model.addAttribute("mainGraduationId", mainGraduation);
		model.addAttribute("subGraduationId", subGraduation);
		model.addAttribute("doubleMajorId", doubleMajor2);
		model.addAttribute("graduations", graduations);
		model.addAttribute("departments", departments);
		model.addAttribute("graduationGradeMap", graduationGradeMap);
		model.addAttribute("graduationSubjectMap", graduationSubjectMap);
		return "user/menu/graduation/mygraduation";
	}

}
