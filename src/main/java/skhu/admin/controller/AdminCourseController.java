package skhu.admin.controller;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
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
import skhu.dto.Score;
import skhu.dto.Student;
import skhu.dto.Subject;
import skhu.dto.Substitution;
import skhu.mapper.DepartmentMapper;
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

	@RequestMapping(value="changerequestlist", method=RequestMethod.GET)
	public String changerequestList(Model model, Student condition,
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
			for(Map<String, String> map : listExcel) {
				Substitution substitution = new Substitution();
				substitution.setSubjectCode(map.get("A"));
				substitution.setSubstitutionCode(map.get("B"));
				substitutionMapper.insert(substitution);
			}
		}

		return "redirect:changerequestlist";
	}

	@RequestMapping(value="changedetail", method=RequestMethod.POST)
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

	@RequestMapping(value="cancelchange", method=RequestMethod.GET)
	public String cancelchange() {
		return "redirect:changedetail";
	}

	@RequestMapping(value="changerequestconfrim", method=RequestMethod.GET)
	public String changerequestConfirm() {
		return "admin/menu/course/changerequestConfirm";
	}

	@RequestMapping(value="majorrequestlist", method=RequestMethod.GET)
	public String majorrequestList() {
		return "admin/menu/course/majorrequestList";
	}

	@RequestMapping(value="majorrequestdetail", method=RequestMethod.GET)
	public String majorrequestDetail() {
		return "admin/menu/course/majorrequestDetail";
	}

	@RequestMapping(value="majorrequestconfrim", method=RequestMethod.GET)
	public String majorrequestConfirm() {
		return "admin/menu/course/majorrequestConfirm";
	}

	@RequestMapping(value="gradelist", method=RequestMethod.GET)
	public String gradeList() {
		return "admin/menu/course/gradeList";
	}

	@RequestMapping(value="gradedetail", method=RequestMethod.GET)
	public String gradeDetail() {
		return "admin/menu/course/gradeDetail";
	}
}
