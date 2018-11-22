package skhu.user.controller;

import java.util.List;

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
		List<GraduationGrade> graduationGrades = graduationGradeMapper.findByBasic();
		List<GraduationSubject> graduationSubjects = graduationSubjectMapper.findByBasic();
		Subject subject = new Subject();
		subject.setSemester(0);
		List<Score> scores = scoreMapper.findByStudentId(student.getId(), "", subject);
		int total = 0;
		int majorSelection = 0;
		int liberalSelection = 0;
		int minorEssential = 0;
		int minorSelection = 0;
		int doubleMajorEssential1 = 0;
		int doubleMajorSelection1 = 0;
		int doubleMajorEssential2 = 0;
		int doubleMajorSelection2 = 0;
		List<Department> departments = departmentMapper.findWithoutCommon();
		Department minorDepartment = null;
		Department doubleMajorDepartment = null;

		for(Department department : departments) {
			if(department.getName().equals(student.getMinor()))
				minorDepartment = department;

			else if(department.getName().equals(student.getDoubleMajor()))
				doubleMajorDepartment = department;
		}

		for(Score score : scores) {
			int subjectScore = (int)(score.getSubject().getScore());
			if(!(score.getScore() < 0.0) && !score.getSubstitutionCode().equals("0")) {
				total = subjectScore;

				if(doubleMajorDepartment != null) {
					if(score.getSubject().getDepartmentId() == doubleMajorDepartment.getId()) {
						if(score.getSubject().getDivision().equals("전공필수"))
							doubleMajorEssential1 = subjectScore;

						else
							doubleMajorSelection1 = subjectScore;
					}

					else if(score.getSubject().getDepartmentId() == minorDepartment.getId()) {
						minorEssential = subjectScore;

						if(score.getSubject().getDivision().equals("전공필수"))
							doubleMajorEssential2 = subjectScore;

						else
							doubleMajorSelection2 = subjectScore;
					}
				}

				else if(minorDepartment != null) {
					if(score.getSubject().getDepartmentId() == minorDepartment.getId()) {
						minorEssential = subjectScore;

						if(score.getSubject().getDivision().equals("전공필수"))
							minorEssential = subjectScore;

						else
							minorSelection = subjectScore;
					}
				}

				else {
					if(score.isMajorAdmit() || (score.getSubject().getDepartmentId() == student.getDepartmentId() && score.getSubject().getDivision().equals("전공선택"))) {
						majorSelection = subjectScore;
					}

					else if(score.getSubject().getDivision().equals("교양선택") || (score.getSubject().getDepartmentId() != 1 && score.getSubject().getDepartmentId() != student.getDepartmentId()))
						minorSelection = subjectScore;
				}
			}
			for(GraduationGrade graduationGrade : graduationGrades) {

			}

			for(GraduationSubject graduationSubject : graduationSubjects) {

			}
		}

		return "user/menu/main";
	}

}
