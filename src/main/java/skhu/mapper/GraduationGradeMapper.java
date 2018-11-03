package skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import skhu.dto.GraduationGrade;
import skhu.dto.Student;

@Mapper
public interface GraduationGradeMapper {
	List<GraduationGrade> findByStudent(@Param("year") String year, @Param("student") Student student, @Param("mainGraduation") String mainGraduation, @Param("subGraduation") String subGraduationString);
}
