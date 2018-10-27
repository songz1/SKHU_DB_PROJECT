package skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import skhu.dto.Student;

@Mapper
public interface StudentMapper {
	List<Student> findAll();
	Student login(String studentNumber, String password);
	Student findById(int id);
	void update(Student student);
	void insert(Student student);
}
