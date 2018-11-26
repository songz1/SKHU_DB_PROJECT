package skhu.user.controller;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import skhu.dto.College;
import skhu.dto.CompleteScore;
import skhu.dto.Department;
import skhu.dto.Graduation;
import skhu.dto.GraduationGrade;
import skhu.dto.GraduationSubject;
import skhu.mapper.ActionMapper;
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
@RequestMapping("user/login/guest")
public class UserGuestController {

	@Autowired CollegeMapper collegeMapper;
	@Autowired StudentMapper studentMapper;
	@Autowired DepartmentMapper departmentMapper;
	@Autowired GraduationMapper graduationMapper;
	@Autowired GraduationGradeMapper graduationGradeMapper;
	@Autowired GraduationSubjectMapper graduationSubjectMapper;
	@Autowired ScoreMapper scoreMapper;
	@Autowired SubjectMapper subjectMapper;
	@Autowired CompleteScoreMapper completeScoreMapper;
	@Autowired ActionMapper actionMapper;

	@RequestMapping(value="basic", method=RequestMethod.GET)
	public String basic(Model model) throws Exception{
		List<GraduationGrade> graduationGrades = graduationGradeMapper.findByCommon();
		List<GraduationSubject> graduationSubjects = graduationSubjectMapper.findByCommon();
		List<CompleteScore> completeScores = completeScoreMapper.findAll();
		Map<String, List<GraduationGrade>> graduationGradeMap = new LinkedHashMap<String, List<GraduationGrade>>();
		Map<String, List<GraduationSubject>> graduationSubjectMap = new LinkedHashMap<String, List<GraduationSubject>>();
		List<GraduationGrade> gradeTemp = new ArrayList<GraduationGrade>();
		List<GraduationSubject> subjectTemp = new ArrayList<GraduationSubject>();

		for(int i = 0; i < graduationGrades.size(); ++i) {
			if(i != 0) {
				if(!graduationGrades.get(i).getYear().equals(graduationGrades.get(i-1).getYear())) {
					graduationGradeMap.put(graduationGrades.get(i-1).getYear(), gradeTemp);
					gradeTemp = new ArrayList<GraduationGrade>();
				}
			}

			gradeTemp.add(graduationGrades.get(i));
		}

		if(gradeTemp.size() > 0)
			graduationGradeMap.put(gradeTemp.get(gradeTemp.size() - 1).getYear(), gradeTemp);

		int idx = 0;
		int flag = 0;
		for(int i = 0; i < graduationSubjects.size(); ++i) {
			if(graduationSubjects.get(i).getNote().contains("봉사") && graduationSubjects.get(i).getYear().equals(graduationSubjects.get(idx).getYear())) {
				if(flag > 0)
					continue;

				flag = 1;
			}

			if(graduationSubjects.get(i).getSubject().getName().contains("(")) {
				String subjectName = graduationSubjects.get(i).getSubject().getName();
				int start = graduationSubjects.get(i).getSubject().getName().indexOf("(");
				int end = graduationSubjects.get(i).getSubject().getName().indexOf(")");

				graduationSubjects.get(i).getSubject().setName(subjectName.substring(0, start) + subjectName.substring(end + 1, subjectName.length()));
			}

			if(i != 0) {
				if(!graduationSubjects.get(i).getYear().equals(graduationSubjects.get(idx).getYear())) {
					graduationSubjectMap.put(graduationSubjects.get(idx).getYear(), subjectTemp);
					subjectTemp = new ArrayList<GraduationSubject>();
				}

				idx = i;
			}

			subjectTemp.add(graduationSubjects.get(i));
		}

		if(subjectTemp.size() > 0)
			graduationSubjectMap.put(subjectTemp.get(subjectTemp.size() - 1).getYear(), subjectTemp);

		model.addAttribute("graduationGradeMap", graduationGradeMap);
		model.addAttribute("graduationSubjectMap", graduationSubjectMap);
		model.addAttribute("completeScores", completeScores);


		return "user/login/guest/basic";
	}

	@RequestMapping(value="downdetail")
	public void downDetail(HttpServletResponse response, HttpServletRequest request) throws Exception {
		File destDetailFile = new File(request.getSession().getServletContext().getRealPath("") + "\\res\\file\\user\\통합_졸업요건.pdf");

		response.setHeader("Content-Disposition", "attachment; filename=\"" +  new String("통합_졸업요건.pdf".getBytes("UTF-8"), "ISO8859_1") + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setHeader("Content-Type", "application/octet-stream; charset=utf-8\r\n");
		response.setHeader("Content-Length", ""+ destDetailFile.length());
		response.setHeader("Pragma", "no-cache;");
		response.setHeader("Expires", "-1;");

		if(!destDetailFile.exists()){
			throw new RuntimeException("file not found");
		}

		FileInputStream fis = null;
		try{
			fis = new FileInputStream(destDetailFile);
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

	@RequestMapping(value="detail", method=RequestMethod.GET)
	public String detail(Model model) {
		List<College> colleges = collegeMapper.findWithoutCommon();
		List<Department> departments = departmentMapper.findWithoutCommon();

		model.addAttribute("colleges", colleges);
		model.addAttribute("departments", departments);

		return "user/login/guest/detail";
	}

	@RequestMapping(value="yearchoice", method=RequestMethod.GET)
	public String yearChoice(Model model, @RequestParam("id") int id) {
		List<GraduationGrade> years = graduationGradeMapper.findYear(id);
		Department department = departmentMapper.findById(id);

		model.addAttribute("years", years);
		model.addAttribute("department", department);

		return "user/login/guest/yearChoice";
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
					graduationGradeMap.put(graduationGrades.get(i-1).getGraduationId(), gradeTemp);
					gradeTemp = new ArrayList<GraduationGrade>();
				}
			}
			gradeTemp.add(graduationGrades.get(i));
			k = graduationGrades.get(i).getGraduationId();
		}

		if(gradeTemp.size() > 0)
			graduationGradeMap.put(k, gradeTemp);

		k = 0;
		int flag = 0;
		int idx = 0;


		for(int i = 0; i < graduationSubjects.size(); ++i) {
			k = graduationSubjects.get(i).getGraduationId();

			if(graduationSubjects.get(i).getGraduationId() == graduationSubjects.get(idx).getGraduationId() && graduationSubjects.get(i).getNote().equals(graduationSubjects.get(idx).getNote()) && !(graduationSubjects.get(i).getNote().equals(""))) {
				if(flag > 0)
					continue;

				flag = 1;
			}

			if(i != 0) {
				if(graduationSubjects.get(i).getGraduationId() != graduationSubjects.get(idx).getGraduationId()) {
					graduationSubjectMap.put(graduationSubjects.get(idx).getGraduationId(), subjectTemp);
					subjectTemp = new ArrayList<GraduationSubject>();
					flag = 0;
				}

				idx = i;
			}

			subjectTemp.add(graduationSubjects.get(i));
		}

		if(gradeTemp.size() > 0)
			graduationSubjectMap.put(k, subjectTemp);

		model.addAttribute("graduations", graduations);
		model.addAttribute("graduationGradeMap", graduationGradeMap);
		model.addAttribute("graduationSubjectMap", graduationSubjectMap);

		return "user/login/guest/info";
	}

}
