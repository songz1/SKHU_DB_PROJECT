package skhu.admin.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import skhu.util.ExcelReader;
import skhu.util.ExcelReaderOption;

@SessionAttributes("authInfo")
@Controller
public class TestController {
	@ResponseBody
	@RequestMapping(value="myTest", method = RequestMethod.POST)
	public String excelUploadAjax(MultipartHttpServletRequest request, Model model)  throws Exception{
		MultipartFile excelFile =request.getFile("excelFile");

		File destFile = new File("C:\\Users\\user\\Desktop\\study\\[PROJECT]\\database capstone design\\문서\\[참고 자료]\\양식\\test.xlsx");

		excelFile.transferTo(destFile);

		ExcelReaderOption excelReaderOption = new ExcelReaderOption();
		excelReaderOption.setFilePath(destFile.getAbsolutePath());
		excelReaderOption.setOutputColumns("A","B","C","D","E","F");
		excelReaderOption.setStartRow(2);


		List<Map<String, String>>excelContent =ExcelReader.read(excelReaderOption);

		for(Map<String, String> article: excelContent){
			System.out.println();
			System.out.println(article.get("B"));
			System.out.println(article.get("C"));
			System.out.println(article.get("D"));
		}

		model.addAttribute("excel", excelContent);

		return "myTest";
	}
}
