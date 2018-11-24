package skhu.user.controller;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import skhu.dto.Department;
import skhu.dto.GraduationGrade;
import skhu.dto.GraduationSubject;
import skhu.dto.Score;
import skhu.dto.Student;
import skhu.dto.Subject;
import skhu.mapper.DepartmentMapper;
import skhu.mapper.GraduationGradeMapper;
import skhu.mapper.GraduationSubjectMapper;
import skhu.mapper.ScoreMapper;

@Controller
@RequestMapping("user/menu")
public class UserMainController {
	@Autowired ScoreMapper scoreMapper;
	@Autowired GraduationGradeMapper graduationGradeMapper;
	@Autowired GraduationSubjectMapper graduationSubjectMapper;
	@Autowired DepartmentMapper departmentMapper;

	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String main(Model model, HttpSession session) {
		Student student = ((Student)session.getAttribute("userInfo"));
		String year = student.getStudentNumber().substring(0, 4);
		List<GraduationGrade> graduationGrades = graduationGradeMapper.findByBasic(year);
		List<GraduationSubject> graduationSubjects = graduationSubjectMapper.findByBasic(year);
		Subject subject = new Subject();
		subject.setSemester(0);
		List<Score> scores = scoreMapper.findByStudentId(student.getId(), "", subject);
		int total = 0;
		int majorEssential = 0;
		int majorSelection = 0;
		int liberalEssential = 0;
		int liberalSelection = 0;
		int minorEssential = 0;
		int minorSelection = 0;
		int doubleMajorEssential1 = 0;
		int doubleMajorSelection1 = 0;
		int doubleMajorEssential2 = 0;
		int doubleMajorSelection2 = 0;
		int chapel = 0;
		int majorSearch = 0;
		List<Department> departments = departmentMapper.findWithoutCommon();
		Department minorDepartment = null;
		Department doubleMajorDepartment = null;
		Map<GraduationGrade, Integer> graduationGradeMap = new LinkedHashMap<GraduationGrade, Integer>();
		Map<GraduationSubject, Integer> graduationSubjectMap = new LinkedHashMap<GraduationSubject, Integer>();

		for(Department department : departments) {
			if(department.getName().equals(student.getMinor()))
				minorDepartment = department;

			else if(department.getName().equals(student.getDoubleMajor()))
				doubleMajorDepartment = department;
		}

		for(Score score : scores) {
			int subjectScore = (int)(score.getSubject().getScore());
			int subjectDepartmentId = score.getSubject().getDepartmentId();

			if(!(subjectScore < 0) && score.getSubstitutionCode().equals("0")) {
				total += subjectScore;

				for(GraduationGrade graduationGrade : graduationGrades) {
					String graduationName = graduationGrade.getName();

					if(!(score.getScore() < 0) && score.getSubstitutionCode().equals("0")) {
						String subjectName = score.getSubject().getName();
						if(graduationName.equals("졸업"))
							graduationGradeMap.put(graduationGrade, total);

						else if(graduationName.equals("채플")) {
							if(subjectName.contains("채플") || subjectName.contains("기도모임"))
								graduationGradeMap.put(graduationGrade, ++chapel);
						}

						else if(graduationName.contains("학부")) {
							if(score.getSubject().getEstablish().equals(student.getDepartment().getCollege().getRealName()))
								graduationGradeMap.put(graduationGrade, subjectScore);
						}

						else if(graduationName.contains("학과")) {
							if(score.getSubject().getEstablish().equals(student.getDepartment().getRealName()))
								graduationGradeMap.put(graduationGrade, subjectScore);
						}

						else if(graduationName.contains(score.getSubject().getDivision())) {
							graduationGradeMap.put(graduationGrade, subjectScore);
						}

						else if(graduationName.equals(score.getSubject().getSubjectDetail().getSubtitle()))
							graduationGradeMap.put(graduationGrade, subjectScore);

						else if(graduationName.equals(score.getSubject().getSubjectDetail().getTitle()))
							graduationGradeMap.put(graduationGrade, subjectScore);

					}
				}

				for(GraduationSubject graduationSubject : graduationSubjects) {
					if(!(score.getScore() < 0) && score.getSubstitutionCode().equals("0")) {
						if(graduationSubject.getSubject().getCode().equals(score.getSubject().getCode())) {
							graduationSubjectMap.put(graduationSubject, 1);
							break;
						}

						else if(graduationSubjectMap.containsKey(graduationSubject))
							continue;

						else {
							if(!graduationSubject.getNote().equals("") && graduationSubject.getNote().length() != 0)
								graduationSubjectMap.put(graduationSubject, 2);

							else
								graduationSubjectMap.put(graduationSubject, 0);

						}
					}
				}

				if(doubleMajorDepartment != null) {
					if(subjectDepartmentId == doubleMajorDepartment.getId()) {
						if(score.getSubject().getDivision().equals("전공필수"))
							doubleMajorEssential1 += subjectScore;

						else
							doubleMajorSelection1 += subjectScore;

						continue;
					}

					else if(subjectDepartmentId == minorDepartment.getId()) {
						minorEssential += subjectScore;

						if(score.getSubject().getDivision().equals("전공필수"))
							doubleMajorEssential2 += subjectScore;

						else
							doubleMajorSelection2 += subjectScore;

						continue;
					}
				}

				else if(minorDepartment != null) {
					if(subjectDepartmentId == minorDepartment.getId()) {
						minorEssential += subjectScore;

						if(score.getSubject().getDivision().equals("전공필수"))
							minorEssential += subjectScore;

						else
							minorSelection += subjectScore;

						continue;
					}
				}

				if(subjectDepartmentId == student.getDepartmentId()) {
					if(score.isMajorAdmit() || score.getSubject().getDivision().equals("전공선택"))
						majorSelection += subjectScore;

					else if(score.getSubject().getDivision().equals("전공필수"))
						majorEssential += subjectScore;

					else if(score.getSubject().getDivision().equals("전공선택"))
						majorSearch += subjectScore;
				}

				else {
					if(score.getSubject().getDivision().equals("교양필수"))
						liberalEssential += subjectScore;

					else
						liberalSelection += subjectScore;

				}
			}
		}

		model.addAttribute("graduationGradeMap", graduationGradeMap);
		model.addAttribute("graduationSubjectMap", graduationSubjectMap);
		model.addAttribute("graduationSubjects", graduationSubjects);
		model.addAttribute("total", total);
		model.addAttribute("majorSelection", majorSelection);
		model.addAttribute("liberalSelection", liberalSelection);
		model.addAttribute("minorSelection", minorSelection);
		model.addAttribute("doubleMajorSelection1", doubleMajorSelection1);
		model.addAttribute("doubleMajorSelection2", doubleMajorSelection2);
		model.addAttribute("majorEssential", majorEssential);
		model.addAttribute("liberalEssential", liberalEssential);
		model.addAttribute("minorEssential", minorEssential);
		model.addAttribute("doubleMajorEssential1", doubleMajorEssential1);
		model.addAttribute("doubleMajorEssential2", doubleMajorEssential2);
		model.addAttribute("student", student);

		return "user/menu/main";
	}

}
