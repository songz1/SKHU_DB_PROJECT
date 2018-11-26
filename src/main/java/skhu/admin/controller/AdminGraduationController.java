package skhu.admin.controller;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import skhu.dto.Action;
import skhu.dto.Admin;
import skhu.dto.College;
import skhu.dto.CompleteScore;
import skhu.dto.Department;
import skhu.dto.Graduation;
import skhu.dto.GraduationGrade;
import skhu.dto.GraduationSubject;
import skhu.dto.Score;
import skhu.dto.Student;
import skhu.dto.Subject;
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
import skhu.util.ExcelReader;
import skhu.util.ExcelReaderOption;
import skhu.vo.Page;

@Controller
@RequestMapping("admin/menu/graduation")
public class AdminGraduationController {
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


		return "admin/menu/graduation/basic";
	}

	@RequestMapping(value="downcompletescore")
	public void downCompleteScore(HttpServletResponse response, HttpServletRequest request) throws Exception {
		File destCompleteFile = new File(request.getSession().getServletContext().getRealPath("") + "\\res\\file\\form\\양식_학년별수료학점.xlsx");
		response.setHeader("Content-Disposition", "attachment; filename=\"" +  new String("양식_학년별수료학점.xlsx".getBytes("UTF-8"), "ISO8859_1") + "\";");
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


	@RequestMapping(value="basic", method=RequestMethod.POST)
	public String basic(Model model, MultipartHttpServletRequest request) throws Exception {
		MultipartFile completeFile = request.getFile("completeFile");
		MultipartFile detailFile = request.getFile("detailFile");

		if(!completeFile.isEmpty()) {
			File destCompleteFile = new File(request.getSession().getServletContext().getRealPath("") + "\\res\\file\\admin\\학년별수료학점.xlsx");
			completeFile.transferTo(destCompleteFile);

			ExcelReaderOption excelReaderOption = new ExcelReaderOption();
			excelReaderOption.setFilePath(destCompleteFile.getAbsolutePath());
			excelReaderOption.setOutputColumns("B","C","D");
			excelReaderOption.setStartRow(3);
			excelReaderOption.setSheetRow(1);

			List<Map<String, String>> completeExcel = ExcelReader.read(excelReaderOption);
			completeScoreMapper.delete();
			for(Map<String, String> map : completeExcel) {
				if(!map.containsKey("B") || map.get("B") == null || map.get("B").equals("") ||
						!map.containsKey("C") || map.get("C") == null || map.get("C").equals("") ||
						!map.containsKey("D") || map.get("D") == null || map.get("D").equals("")
						)
					break;
				CompleteScore completeScore = new CompleteScore();
				completeScore.setYear(map.get("B").equals("공통") ? map.get("B") : map.get("B").substring(0, map.get("B").length() - 2));
				completeScore.setGrade((int)Double.parseDouble(map.get("C")));
				completeScore.setScore((int)Double.parseDouble(map.get("D")));
				completeScoreMapper.insert(completeScore);
			}
		}

		if(!detailFile.isEmpty()) {
			File destDetailFile = new File(request.getSession().getServletContext().getRealPath("") + "\\res\\file\\user\\통합_졸업요건.pdf");
			detailFile.transferTo(destDetailFile);
		}

		return "redirect:basic";
	}

	@RequestMapping(value="detail", method=RequestMethod.GET)
	public String detail(Model model) {
		List<College> colleges = collegeMapper.findWithoutCommon();
		List<Department> departments = departmentMapper.findWithoutCommon();

		model.addAttribute("colleges", colleges);
		model.addAttribute("departments", departments);

		return "admin/menu/graduation/detail";
	}

	@RequestMapping(value="yearchoice", method=RequestMethod.GET)
	public String yearChoice(Model model, @RequestParam("id") int id) {
		List<GraduationGrade> years = graduationGradeMapper.findYear(id);
		Department department = departmentMapper.findById(id);

		model.addAttribute("years", years);
		model.addAttribute("department", department);

		return "admin/menu/graduation/yearChoice";
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

		return "admin/menu/graduation/info";
	}

	@RequestMapping(value="gradelist", method=RequestMethod.GET)
	public String gradelist(Model model, GraduationGrade condition,
							@RequestParam(value="searchText", required=false) String searchText,
							HttpServletRequest request, @RequestParam(value="pg", required=false) String pg) {
		if(searchText == null)
			searchText = "";

		Page page = new Page();
		int total = graduationGradeMapper.countByOption(condition, "%" + searchText + "%");
		int currentPage = 1;

		if(pg != null)
			currentPage = Integer.parseInt(pg);

		List<GraduationGrade> graduationGrades = graduationGradeMapper.findByOption((currentPage - 1) * 15, 15, condition, "%" + searchText + "%");
		List<Department> departments = departmentMapper.findAll();
		List<Graduation> graduations = graduationMapper.findAll();
		ArrayList<Page> pages = page.paging(total, 15, currentPage, request.getQueryString());

		model.addAttribute("condition", condition);
		model.addAttribute("searchText", searchText);
		model.addAttribute("departments", departments);
		model.addAttribute("graduations", graduations);
		model.addAttribute("graduationGrades", graduationGrades);
		model.addAttribute("pages", pages);

		return "admin/menu/graduation/gradelist";
	}

	@RequestMapping(value="editgrade", method=RequestMethod.GET)
	public String editgrade(Model model, @RequestParam("id") int id) {
		GraduationGrade graduationGrade = graduationGradeMapper.findById(id);
		List<Department> departments = departmentMapper.findAll();
		List<Graduation> graduations = graduationMapper.findAll();

		model.addAttribute("graduationGrade", graduationGrade);
		model.addAttribute("departments", departments);
		model.addAttribute("graduations", graduations);

		return "admin/menu/graduation/editgrade";
	}

	@RequestMapping(value="gradeupdate", method=RequestMethod.POST)
	public String gradeupdate(Model model, GraduationGrade graduationGrade) {
		graduationGradeMapper.update(graduationGrade);

		return "redirect:gradelist";
	}

	@RequestMapping(value="gradedelete", method=RequestMethod.POST)
	public String gradedelete(Model model, @RequestParam("deleteId")int[] deleteId) {
		for(int i = 0; i < deleteId.length; ++i)
			graduationGradeMapper.delete(deleteId[i]);

		return "redirect:gradelist";
	}

	@RequestMapping(value="subjectlist", method=RequestMethod.GET)
	public String subjectlist(Model model, GraduationSubject condition,
							@RequestParam(value="searchText", required=false) String searchText,
							HttpServletRequest request, @RequestParam(value="pg", required=false) String pg) {
		if(searchText == null)
			searchText = "";

		Page page = new Page();
		int total = graduationSubjectMapper.countByOption(condition, "%" + searchText + "%");
		int currentPage = 1;

		if(pg != null)
			currentPage = Integer.parseInt(pg);

		List<GraduationSubject> graduationSubjects = graduationSubjectMapper.findByOption((currentPage - 1) * 15, 15, condition, "%" + searchText + "%");
		List<Department> departments = departmentMapper.findAll();
		List<Graduation> graduations = graduationMapper.findAll();
		ArrayList<Page> pages = page.paging(total, 15, currentPage, request.getQueryString());

		for(int i = 0; i < graduationSubjects.size(); ++i) {
			if(graduationSubjects.get(i).getSubject().getName().contains("(")) {
				String subjectName = graduationSubjects.get(i).getSubject().getName();
				int start = graduationSubjects.get(i).getSubject().getName().indexOf("(");
				int end = graduationSubjects.get(i).getSubject().getName().indexOf(")");

				graduationSubjects.get(i).getSubject().setName(subjectName.substring(0, start) + subjectName.substring(end + 1, subjectName.length()));
			}
		}

		model.addAttribute("condition", condition);
		model.addAttribute("searchText", searchText);
		model.addAttribute("departments", departments);
		model.addAttribute("graduations", graduations);
		model.addAttribute("graduationSubjects", graduationSubjects);
		model.addAttribute("pages", pages);

		return "admin/menu/graduation/subjectlist";
	}

	@RequestMapping(value="editsubject", method=RequestMethod.GET)
	public String editsubject(Model model, @RequestParam("id") int id) {
		GraduationSubject graduationSubject = graduationSubjectMapper.findById(id);
		List<Department> departments = departmentMapper.findAll();
		List<Graduation> graduations = graduationMapper.findAll();

		model.addAttribute("graduationSubject", graduationSubject);
		model.addAttribute("departments", departments);
		model.addAttribute("graduations", graduations);

		return "admin/menu/graduation/editsubject";
	}

	@RequestMapping(value="subjectupdate", method=RequestMethod.POST)
	public String subjectupdate(Model model, GraduationSubject graduationSubject, @RequestParam("code") String code) {
		Subject subject = subjectMapper.findByCode(code);

		if(subject == null)
			return "redirect:subjectlist";

		graduationSubject.setSubjectId(subject.getId());

		graduationSubjectMapper.update(graduationSubject);

		return "redirect:subjectlist";
	}

	@RequestMapping(value="subjectdelete", method=RequestMethod.POST)
	public String subjectdelete(Model model, @RequestParam("deleteId")int[] deleteId) {
		for(int i = 0; i < deleteId.length; ++i)
			graduationSubjectMapper.delete(deleteId[i]);

		return "redirect:subjectlist";
	}

	@RequestMapping(value="creategraduation", method=RequestMethod.GET)
	public String creategraduation(Model model) {
		GraduationGrade graduationGrade = new GraduationGrade();
		GraduationSubject graduationSubject = new GraduationSubject();
		List<Department> departments = departmentMapper.findAll();
		List<Graduation> graduations = graduationMapper.findAll();

		model.addAttribute("graduationSubject", graduationSubject);
		model.addAttribute("graduationGrade", graduationGrade);
		model.addAttribute("departments", departments);
		model.addAttribute("graduations", graduations);

		return "admin/menu/graduation/creategraduation";
	}

	@RequestMapping(value="downgradegraduation")
	public void downGradegGraduation(HttpServletResponse response, HttpServletRequest request) throws Exception {
		File destGraduationFile = new File(request.getSession().getServletContext().getRealPath("") + "\\res\\file\\form\\양식_학점졸업요건.xlsx");

		response.setHeader("Content-Disposition", "attachment; filename=\"" +  new String("학점졸업요건.xlsx".getBytes("UTF-8"), "ISO8859_1") + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setHeader("Content-Type", "application/octet-stream; charset=utf-8\r\n");
		response.setHeader("Content-Length", ""+ destGraduationFile.length());
		response.setHeader("Pragma", "no-cache;");
		response.setHeader("Expires", "-1;");

		if(!destGraduationFile.exists()){
			throw new RuntimeException("file not found");
		}

		FileInputStream fis = null;
		try{
			fis = new FileInputStream(destGraduationFile);
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

	@RequestMapping(value="downsubjectgraduation")
	public void downSubjectGraduation(HttpServletResponse response, HttpServletRequest request) throws Exception {
		File destGraduationFile = new File(request.getSession().getServletContext().getRealPath("") + "\\res\\file\\form\\양식_과목졸업요건.xlsx");

		response.setHeader("Content-Disposition", "attachment; filename=\"" +  new String("과목졸업요건.xlsx".getBytes("UTF-8"), "ISO8859_1") + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setHeader("Content-Type", "application/octet-stream; charset=utf-8\r\n");
		response.setHeader("Content-Length", ""+ destGraduationFile.length());
		response.setHeader("Pragma", "no-cache;");
		response.setHeader("Expires", "-1;");

		if(!destGraduationFile.exists()){
			throw new RuntimeException("file not found");
		}

		FileInputStream fis = null;
		try{
			fis = new FileInputStream(destGraduationFile);
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

	@RequestMapping(value="creategrade", method=RequestMethod.POST)
	public String createGrade(Model model, GraduationGrade graduationGrade) {
		if((graduationGrade.getYear().length() != 0 && !graduationGrade.getYear().equals("")) &&
				(graduationGrade.getName().length() != 0 && !graduationGrade.getName().equals("")))
			graduationGradeMapper.insert(graduationGrade);

		return "redirect:gradelist";
	}

	@RequestMapping(value="createsubject", method=RequestMethod.POST)
	public String createSubject(Model model, GraduationSubject graduationSubject, @RequestParam("code") String code) {
		Subject subject = subjectMapper.findByCode(code);

		if(subject == null)
			return "redirect:subjectlist";

		graduationSubject.setSubjectId(subject.getId());

		if((graduationSubject.getYear().length() != 0 && !graduationSubject.getYear().equals("")))
			graduationSubjectMapper.insert(graduationSubject);

		return "redirect:subjectlist";
	}

	@RequestMapping(value="createexcel", method=RequestMethod.POST)
	public String createExcel(Model model, MultipartHttpServletRequest request) throws Exception {
		MultipartFile gradeFile = request.getFile("gradeFile");
		MultipartFile subjectFile = request.getFile("subjectFile");
		List<Department> departments = departmentMapper.findAll();
		Map<String, Integer> departmentMap = new HashMap<String, Integer>();
		List<Graduation> graduations = graduationMapper.findAll();
		Map<String, Integer> graduationMap = new HashMap<String, Integer>();

		for(Department department : departments) {
			departmentMap.put(department.getName(), department.getId());
		}

		for(Graduation graduation : graduations) {
			graduationMap.put(graduation.getName(), graduation.getId());
		}

		ExcelReaderOption excelReaderOption = new ExcelReaderOption();
		excelReaderOption.setStartRow(3);
		excelReaderOption.setSheetRow(1);

		if(!gradeFile.isEmpty()) {
			File destGradeFile = new File(request.getSession().getServletContext().getRealPath("") + "\\res\\file\\admin\\학점졸업요건.xlsx");
			gradeFile.transferTo(destGradeFile);

			excelReaderOption.setFilePath(destGradeFile.getAbsolutePath());
			excelReaderOption.setOutputColumns("B","C","D", "E", "F", "G");
			List<Map<String, String>> gradeExcel = ExcelReader.read(excelReaderOption);

			for(Map<String, String> map : gradeExcel) {
				if(!map.containsKey("B") || map.get("B") == null || map.get("B").equals("") ||
						!map.containsKey("C") || map.get("C") == null || map.get("C").equals("") ||
						!map.containsKey("D") || map.get("D") == null || map.get("D").equals("") ||
						!map.containsKey("E") || map.get("E") == null || map.get("E").equals("") ||
						!map.containsKey("F") || map.get("F") == null || map.get("F").equals("")
						)
					break;
				GraduationGrade graduationGrade = new GraduationGrade();
				graduationGrade.setYear(map.get("B").equals("공통") ? map.get("B") : map.get("B").substring(0, map.get("B").length() - 2));
				graduationGrade.setDepartmentId(departmentMap.get(map.get("C")));
				graduationGrade.setGraduationId(graduationMap.get(map.get("D")));
				graduationGrade.setName(map.get("E"));
				graduationGrade.setScore((int)Double.parseDouble(map.get("F")));

				if(map.containsKey("G"))
					graduationGrade.setNote(map.get("G"));

				else
					graduationGrade.setNote("");

				graduationGradeMapper.insert(graduationGrade);
			}
		}

		if(!subjectFile.isEmpty()) {
			File destSubjectFile = new File(request.getSession().getServletContext().getRealPath("") + "\\res\\file\\admin\\과목졸업요건.xlsx");
			subjectFile.transferTo(destSubjectFile);

			excelReaderOption.setFilePath(destSubjectFile.getAbsolutePath());
			excelReaderOption.setOutputColumns("B","C","D", "E", "F", "G", "H");
			List<Map<String, String>> subjectExcel = ExcelReader.read(excelReaderOption);

			for(Map<String, String> map : subjectExcel) {
				if(!map.containsKey("B") || map.get("B") == null || map.get("B").equals("") ||
						!map.containsKey("C") || map.get("C") == null || map.get("C").equals("") ||
						!map.containsKey("D") || map.get("D") == null || map.get("D").equals("") ||
						!map.containsKey("E") || map.get("E") == null || map.get("E").equals("") ||
						!map.containsKey("F") || map.get("F") == null || map.get("F").equals("")
						)
					break;
				Subject subject = subjectMapper.findByCode(map.get("E"));
				if(subject == null) {
					return "redirect:creategraduation";
				}

				GraduationSubject graduationSubject = new GraduationSubject();
				graduationSubject.setYear(map.get("B").equals("공통") ? map.get("B") : map.get("B").substring(0, map.get("B").length() - 2));
				graduationSubject.setDepartmentId(departmentMap.get(map.get("C")));
				graduationSubject.setGraduationId(graduationMap.get(map.get("D")));
				graduationSubject.setSubjectId(subject.getId());
				graduationSubject.setSemester(map.get("F").equals("공통") ? 0 : (int)Double.parseDouble(map.get("F")));

				if(map.containsKey("H"))
					graduationSubject.setNote(map.get("H"));

				else
					graduationSubject.setNote("");

				graduationSubject.setNote(map.get("G"));
				graduationSubject.setEssential(map.get("H").equals("O") ? true : false);

				graduationSubjectMapper.insert(graduationSubject);
			}
		}
		return "redirect:creategraduation";
	}

	@RequestMapping(value="graduationlist", method=RequestMethod.GET)
	public String graduationList(Model model, HttpServletRequest request, Student condition,
			@RequestParam(value="searchText", required=false) String searchText, @RequestParam(value="pg", required=false) String pg,
			@RequestParam(value="searchType", required=false) String searchType, @RequestParam(value="majorCheck", required=false) boolean majorCheck,
			@RequestParam(value="minorCheck", required=false) boolean minorCheck) {

		if(searchText == null)
			searchText = "";

		if(searchType == null)
			searchType = "0";

		Page page = new Page();
		int total = studentMapper.countByGraduation(condition, searchType, "%" + searchText + "%", majorCheck, minorCheck);
		int currentPage = 1;

		if(pg != null)
			currentPage = Integer.parseInt(pg);

		List<Student> students = studentMapper.findByGraduation((currentPage - 1) * 15, 15, condition, searchType, "%" + searchText + "%", majorCheck, minorCheck);
		List<Department> departments = departmentMapper.findWithoutCommon();
		ArrayList<Page> pages = page.paging(total, 15, currentPage, request.getQueryString());

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
		Subject subject = new Subject();
		subject.setSemester(0);
		Student student = studentMapper.findById(id);
		List<Score> scores = scoreMapper.findByStudentId(student.getId(), "", subject);
		List<Graduation> graduations = graduationMapper.findWithoutCommon();
		List<Department> departments = departmentMapper.findWithoutCommon();
		String year = student.getStudentNumber().substring(0, 4);
		List<GraduationGrade> graduationGrades = null;
		List<GraduationSubject> graduationSubjects = null;
		Map<GraduationGrade, Integer> graduationGradeMap = new LinkedHashMap<GraduationGrade, Integer>();
		Map<GraduationSubject, Integer> graduationSubjectMap = new LinkedHashMap<GraduationSubject, Integer>();
		if(!student.getGraduation().equals("0")) {
			String[] splitGraduations = student.getGraduation().split(" ", 2);

			if(splitGraduations.length == 1) {
				splitGraduations = new String[2];
				splitGraduations[0] = student.getGraduation();
				splitGraduations[1] = "";
			}
			int mainGraduationId = 0;
			int subGraduationId = 0;
			int differentDepartmentGraduationId = 0;
			int minorId = 0;
			int doubleMajorId = 0;

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

							else if(graduationGrade.getGraduationId() == differentDepartmentGraduationId) {
								if(graduationGrade.getGraduation().getName().contains("부전공") && score.getSubject().getDepartmentId() != minorId)
									continue;

								else if(graduationGrade.getGraduation().getName().contains("복수전공")) {
									if(graduationGrade.getDepartmentId() != minorId || graduationGrade.getDepartmentId() != doubleMajorId)
										continue;
								}
							}

							total += score.getSubject().getScore();
							graduationGradeMap.put(graduationGrade, total);
						}
					}
				}
			}

			for(GraduationSubject graduationSubject : graduationSubjects) {
				if(graduationSubject.getSubject().getName().contains("(")) {
					String subjectName = graduationSubject.getSubject().getName();
					int start = graduationSubject.getSubject().getName().indexOf("(");
					int end = graduationSubject.getSubject().getName().indexOf(")");

					graduationSubject.getSubject().setName(subjectName.substring(0, start) + subjectName.substring(end + 1, subjectName.length()));
				}

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
		model.addAttribute("graduationGrades", graduationGrades);
		model.addAttribute("graduationSubjects", graduationSubjects);
		model.addAttribute("graduationGradeMap", graduationGradeMap);
		model.addAttribute("graduationSubjectMap", graduationSubjectMap);

		return "admin/menu/graduation/graduationDetail";
	}

	@RequestMapping(value="counseling", method=RequestMethod.GET)
	public String counseling(Model model, Student condition,
			@RequestParam(value="searchText", required=false) String searchText,
			@RequestParam(value="searchType", required=false) String searchType,
			HttpServletRequest request, @RequestParam(value="pg", required=false) String pg) {

		if(searchText == null)
			searchText = "";

		if(searchType == null)
			searchType = "0";

		Page page = new Page();
		int total = studentMapper.count(condition, searchType, "%" + searchText + "%");
		int currentPage = 1;

		if(pg != null)
			currentPage = Integer.parseInt(pg);

		List<Student> students = studentMapper.findAllWithCounseling((currentPage - 1) * 15, 15, condition, searchType, "%" + searchText + "%");
		List<Department> departments = departmentMapper.findWithoutCommon();
		ArrayList<Page> pages = page.paging(total, 15, currentPage, request.getQueryString());

		model.addAttribute("condition", condition);
		model.addAttribute("searchText", searchText);
		model.addAttribute("searchType", searchType);
		model.addAttribute("students", students);
		model.addAttribute("departments", departments);
		model.addAttribute("pages", pages);

		return "admin/menu/graduation/counseling";
	}

	@RequestMapping(value="counselingList", method=RequestMethod.GET)
	public String counselingList(Model model, @RequestParam("id") int id) {

		Student student = studentMapper.findById(id);
		List<Action> actions = actionMapper.findById(id);

		model.addAttribute("student", student);
		model.addAttribute("actions", actions);

		return "admin/menu/graduation/counselingList";
	}

	@RequestMapping(value="counselingDetail", method=RequestMethod.GET)
	public String counselingDetail(Model model, @RequestParam("id") int id) {

		Action action = actionMapper.findByActionId(id);

		model.addAttribute("action", action);

		return "admin/menu/graduation/counselingDetail";
	}

	@RequestMapping(value="counselingAdd", method=RequestMethod.GET)
	public String counselingAdd(Model model, @RequestParam("id") int id) {
		Action action = new Action();
		action.setStudentId(id);
		model.addAttribute("action", action);

		return "admin/menu/graduation/counselingAdd";
	}

	@RequestMapping(value="insert", method=RequestMethod.POST)
	public String insert(Model model, Action action, HttpSession session) {
		Admin admin = ((Admin)session.getAttribute("adminInfo"));
		action.setAdminId(admin.getId());

		if((action.getName().length() != 0 && !action.getName().equals("")) &&
				(action.getContent().length() != 0 && !action.getContent().equals("")))
			actionMapper.insert(action);

		return "redirect:counseling";
	}

	@RequestMapping("delete")
	public String delete(Model model, @RequestParam("id") int id) {
		actionMapper.delete(id);
		return "redirect:counseling";
	}

}
