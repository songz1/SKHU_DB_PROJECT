package skhu.admin.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import skhu.dto.Admin;
import skhu.dto.Department;
import skhu.dto.Subject;
import skhu.mapper.AdminMapper;
import skhu.mapper.DepartmentMapper;
import skhu.mapper.SubjectMapper;
import skhu.util.ExcelReader;
import skhu.util.ExcelReaderOption;

@SessionAttributes("authInfo")
@Controller
public class TestController {
	@Autowired AdminMapper adminMapper;
	@Autowired SubjectMapper subjectMapper;
	@Autowired DepartmentMapper departmentMapper;

	@RequestMapping(value="test2", method = RequestMethod.GET)
	public String test2() {
		return "test2";
	}
	@RequestMapping(value="myTest1", method = RequestMethod.POST)
	public String excelUploadAjax(MultipartHttpServletRequest request, Model model)  throws Exception{
		MultipartFile excelFile = request.getFile("excelFile");

		File destFile = new File(request.getSession().getServletContext().getRealPath("") + "\\res\\file\\admin\\테스트.xlsx");

		excelFile.transferTo(destFile);

		ExcelReaderOption excelReaderOption = new ExcelReaderOption();
		excelReaderOption.setFilePath(destFile.getAbsolutePath());
		excelReaderOption.setOutputColumns("A","B");
		excelReaderOption.setStartRow(2);
		excelReaderOption.setSheetRow(0);


		List<Map<String, String>>excelContent =ExcelReader.read(excelReaderOption);

		for(Map<String, String> map : excelContent){
			if(!map.containsKey("A") || map.get("A") == null || map.get("A").equals("") ||
					!map.containsKey("B") || map.get("B") == null || map.get("B").equals("")
					)
				break;
			Admin admin = new Admin();
			admin.setLoginId(map.get("A"));

			if(adminMapper.findTest(admin.getLoginId()) == null) {
				admin.setName(map.get("B"));
				admin.setDepartmentId(1);
				admin.setEmail("test@test.com");
				admin.setAuthority(4);
				admin.setPassword("1234");
				adminMapper.insert(admin);
			}


		}

		model.addAttribute("excel", excelContent);

		destFile.delete();
		return "redirect:test2";
	}

	@RequestMapping(value="myTest2", method = RequestMethod.POST)
	public String excelUploadTest2(MultipartHttpServletRequest request, Model model)  throws Exception{
		MultipartFile excelFile =request.getFile("excelFile");

		File destFile = new File(request.getSession().getServletContext().getRealPath("") + "\\res\\file\\admin\\테스트.xlsx");

		excelFile.transferTo(destFile);

		ExcelReaderOption excelReaderOption = new ExcelReaderOption();
		excelReaderOption.setFilePath(destFile.getAbsolutePath());
		excelReaderOption.setOutputColumns("A","B", "C", "D", "E", "F", "G", "H", "I");
		excelReaderOption.setStartRow(2);
		excelReaderOption.setSheetRow(0);


		List<Map<String, String>>excelContent = ExcelReader.read(excelReaderOption);

		for(Map<String, String> map : excelContent){
			if(!map.containsKey("A") || map.get("A") == null || map.get("A").equals("") &&
					!map.containsKey("B") || map.get("B") == null || map.get("B").equals("") &&
					!map.containsKey("C") || map.get("C") == null || map.get("C").equals("") &&
					!map.containsKey("D") || map.get("D") == null || map.get("D").equals("") &&
					!map.containsKey("E") || map.get("E") == null || map.get("E").equals("") &&
					!map.containsKey("F") || map.get("F") == null || map.get("F").equals("") &&
					!map.containsKey("G") || map.get("G") == null || map.get("G").equals("") &&
					!map.containsKey("H") || map.get("H") == null || map.get("H").equals("")
					)
				break;
			Subject subject = new Subject();

			subject.setCode(map.get("C"));
			subject.setYear(map.get("A"));
			subject.setSemester((int)Double.parseDouble(map.get("B")));
			subject.setSubjectClass(map.get("D"));

			if(subjectMapper.findBySpecific(subject.getCode(), subject.getYear(), subject.getSemester(), subject.getSubjectClass()) == null) {
				subject.setAbolish(false);
				subject.setDepartmentId(7);
				subject.setDetailId(1);
				subject.setDivision(map.get("G"));
				subject.setEstablish(map.get("H"));
				subject.setName(map.get("E"));
				Admin admin = adminMapper.findTest(map.get("I"));
				if(admin != null)
					subject.setProfessorId(admin.getId());

				else
					subject.setProfessorId(1);

				subject.setScore(Double.parseDouble(map.get("F")));

				subjectMapper.insert(subject);
			}


		}

		model.addAttribute("excel", excelContent);

		destFile.delete();
		return "redirect:test2";
	}

	@RequestMapping(value="myTest3", method = RequestMethod.POST)
	public String excelUploadTest3(MultipartHttpServletRequest request, Model model)  throws Exception{
		MultipartFile excelFile =request.getFile("excelFile");

		File destFile = new File(request.getSession().getServletContext().getRealPath("") + "\\res\\file\\admin\\테스트.xlsx");

		excelFile.transferTo(destFile);

		ExcelReaderOption excelReaderOption = new ExcelReaderOption();
		excelReaderOption.setFilePath(destFile.getAbsolutePath());
		excelReaderOption.setOutputColumns("A","B", "C", "D", "E", "F", "G", "H");
		excelReaderOption.setStartRow(2);
		excelReaderOption.setSheetRow(1);


		List<Map<String, String>>excelContent = ExcelReader.read(excelReaderOption);

		for(Map<String, String> map : excelContent){
			if(!map.containsKey("A") || map.get("A") == null || map.get("A").equals("") &&
					!map.containsKey("B") || map.get("B") == null || map.get("B").equals("") &&
					!map.containsKey("C") || map.get("C") == null || map.get("C").equals("") &&
					!map.containsKey("D") || map.get("D") == null || map.get("D").equals("") &&
					!map.containsKey("E") || map.get("E") == null || map.get("E").equals("") &&
					!map.containsKey("F") || map.get("F") == null || map.get("F").equals("") &&
					!map.containsKey("G") || map.get("G") == null || map.get("G").equals("") &&
					!map.containsKey("H") || map.get("H") == null || map.get("H").equals("")
					)
				break;
			Subject subject = new Subject();
			List<Department> departments = new ArrayList<Department>();
			Map<String, Integer> deptMap = new HashMap<String, Integer>();

			for(Department department : departments) {
				deptMap.put(department.getRealName(), department.getId());
			}
			subject.setYear(map.get("A"));
			subject.setCode(map.get("C"));

			String tmp = map.get("B");

			if(tmp.equals("여름학기"))
				subject.setSemester(3);

			else if(tmp.equals("겨울학기"))
				subject.setSemester(4);

			else
				subject.setSemester((int)Double.parseDouble(map.get("B")));

			subject.setSubjectClass(map.get("D"));

			if(subjectMapper.findBySpecific(subject.getCode(), subject.getYear(), subject.getSemester(), subject.getSubjectClass()) == null) {
				subject.setAbolish(false);
				subject.setDetailId(1);
				subject.setEstablish(map.get("E"));

				if(deptMap.containsKey(subject.getEstablish())) {
					subject.setDepartmentId(deptMap.get(subject.getEstablish()));
				}

				else
					subject.setDepartmentId(1);

				subject.setProfessorId(1);
				subject.setDivision(map.get("G"));
				subject.setName(map.get("F"));
				subject.setScore(Double.parseDouble(map.get("H")));

				subjectMapper.insert(subject);
			}
		}

		destFile.delete();
		return "redirect:test2";
	}

	@RequestMapping(value="myTest4", method = RequestMethod.POST)
	public String excelUploadTest4(MultipartHttpServletRequest request, Model model)  throws Exception{
		MultipartFile excelFile =request.getFile("excelFile");

		File destFile = new File(request.getSession().getServletContext().getRealPath("") + "\\res\\file\\admin\\테스트.xlsx");

		excelFile.transferTo(destFile);

		ExcelReaderOption excelReaderOption = new ExcelReaderOption();
		excelReaderOption.setFilePath(destFile.getAbsolutePath());
		excelReaderOption.setOutputColumns("A","B", "C", "D", "E", "F");
		excelReaderOption.setStartRow(2);
		excelReaderOption.setSheetRow(0);


		List<Map<String, String>>excelContent = ExcelReader.read(excelReaderOption);

		for(Map<String, String> map : excelContent){
			if(!map.containsKey("A") || map.get("A") == null || map.get("A").equals("") ||
					!map.containsKey("B") || map.get("B") == null || map.get("B").equals("") ||
					!map.containsKey("C") || map.get("C") == null || map.get("C").equals("") ||
					!map.containsKey("D") || map.get("D") == null || map.get("D").equals("") ||
					!map.containsKey("E") || map.get("E") == null || map.get("E").equals("")
					)
				break;

			Subject subject = new Subject();
			subject.setCode(map.get("C"));
			subject.setYear(map.get("A"));
			subject.setSemester((int)Double.parseDouble(map.get("B")));
			subject.setSubjectClass(map.get("D"));

			subject = subjectMapper.findBySpecific(subject.getCode(), subject.getYear(), subject.getSemester(), subject.getSubjectClass());

			String temp = map.get("F");

			if(temp == null || temp.equals(""))
				continue;

			if(subject == null)
				continue;

			if(temp.equals("대안역량"))
				subject.setDetailId(2);

			else if(temp.equals("가치역량"))
				subject.setDetailId(3);

			else if(temp.equals("실천역량"))
				subject.setDetailId(4);

			else
				subject.setDetailId(1);

			System.out.println(subject.getDetailId());

			if(subject != null && subject.getId() != 0 && subject.getDetailId() != 1) {
				subjectMapper.test(subject.getId(), subject.getDetailId());
			}
		}

		destFile.delete();
		return "redirect:test2";
	}
}
