package skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import skhu.dto.Student;

@Mapper
public interface StudentMapper {
	List<Student> findAll();
	Student login(@Param("studentNumber")String studentNumber, @Param("password")String password);
	Student findById(@Param("id")int id);
	Student findByAccount(@Param("name")String name, @Param("studentNumber")String studentNumber);
	List<Student> findByGraduation(
		@Param("start")int start, @Param("end")int end, @Param("condition") Student condition,
		@Param("searchText") String searchText, @Param("searchType") String searchType,
		@Param("majorCheck") boolean majorCheck, @Param("minorCheck") boolean minorCheck
	);
	int countByGraduation(
		@Param("condition") Student condition, @Param("searchText") String searchText,
		@Param("searchType") String searchType, @Param("majorCheck") boolean majorCheck,
		@Param("minorCheck") boolean minorCheck
	);
	void update(Student student);
	void insert(Student student);
}
