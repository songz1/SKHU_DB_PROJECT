package skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import skhu.dto.GraduationSubject;
import skhu.dto.Student;

@Mapper
public interface GraduationSubjectMapper {
	List<GraduationSubject> findByStudent(@Param("year") String year, @Param("student") Student student, @Param("mainGraduation") String mainGraduation, @Param("subGraduation") String subGraduationString);
}
