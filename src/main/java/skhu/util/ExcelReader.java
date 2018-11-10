package skhu.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

public class ExcelReader {
	public static List<Map<String, String>> read(ExcelReaderOption excelReadOption) {
		Workbook wb = ExcelTypeReader.getWorkbook(excelReadOption.getFilePath());
		int sheetEnd = wb.getNumberOfSheets();
		int sheetStart = excelReadOption.getSheetRow();
		int numOfCells = 0;
		Row row = null;
		Cell cell = null;
		String cellName = "";
		Map<String, String> map = null;
		List<Map<String, String>> result = new ArrayList<Map<String, String>>();

		for(; sheetStart < sheetEnd; sheetStart++){
			Sheet sheet = wb.getSheetAt(sheetStart);
			int numOfRows = sheet.getPhysicalNumberOfRows();

			for(int rowIndex = excelReadOption.getStartRow() - 1; rowIndex <= numOfRows; rowIndex++) {
				row = sheet.getRow(rowIndex);
				if(row != null) {
					numOfCells =  row.getLastCellNum();
					map = new HashMap<String, String>();
					for(int cellIndex = 0; cellIndex < numOfCells; cellIndex++) {
						cell = row.getCell(cellIndex);
						cellName = ExcelCellReader.getName(cell, cellIndex);
						if( !excelReadOption.getOutputColumns().contains(cellName) ) {
							continue;
						}
						map.put(cellName, ExcelCellReader.getValue(cell));
					}
					result.add(map);
				}
			}
		}
		return result;
	}
}