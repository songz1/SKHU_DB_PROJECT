package skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import skhu.dto.Student;

@Mapper
public interface StudentMapper {
	List<Student> findAll();
	List<Student> findAllWithDepartment(@Param("condition")Student condition, @Param("searchType")String searchType, @Param("searchText")String searchText);
	Student login(@Param("studentNumber")String studentNumber, @Param("password")String password);
	Student findById(@Param("id")int id);
	Student findByAccount(@Param("name")String name, @Param("studentNumber")String studentNumber);
	List<Student> findByGraduation(
		@Param("start")int start, @Param("end")int end, @Param("condition") Student condition,
		@Param("searchType") String searchType, @Param("searchText") String searchText,
		@Param("majorCheck") boolean majorCheck, @Param("minorCheck") boolean minorCheck
	);
	int countByGraduation(
		@Param("condition") Student condition, @Param("searchType") String searchType,
		@Param("searchText") String searchText, @Param("majorCheck") boolean majorCheck,
		@Param("minorCheck") boolean minorCheck
	);
	List<Student> findAllWithCounseling(@Param("condition")Student condition, @Param("searchType")String searchType, @Param("searchText")String searchText);
	void update(Student student);
	void insert(Student student);
	void delete(@Param("id")int id);
}
