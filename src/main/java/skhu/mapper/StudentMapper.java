package skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import skhu.dto.Student;

@Mapper
public interface StudentMapper {
	List<Student> findAll();
	Student login(@Param("studentNumber")String studentNumber, @Param("password")String password);
	Student findById(int id);
	void update(Student student);
	void insert(Student student);
}
