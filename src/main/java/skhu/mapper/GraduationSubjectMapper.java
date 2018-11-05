package skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import skhu.dto.GraduationSubject;
import skhu.dto.Student;

@Mapper
public interface GraduationSubjectMapper {
	List<GraduationSubject> findByCommon();
	List<GraduationSubject> findByDepartment(@Param("departmentId") int departmentId, @Param("year") String year);
	List<GraduationSubject> findByOption(@Param("condition") GraduationSubject condition, @Param("searchText") String searchText);
	int countByOption(@Param("condition") GraduationSubject condition, @Param("searchText") String searchText);
	List<GraduationSubject> findByStudent(@Param("year") String year, @Param("student") Student student, @Param("minorId") int minorId, @Param("doubleMajorId") int doubleMajorId, @Param("mainGraduationId") int mainGraduationId, @Param("subGraduationId") int subGraduationId, @Param("differentDepartmentGraduationId") int differentDepartmentGraduationId);
	GraduationSubject findById(@Param("id") int id);
	void update(GraduationSubject graduationSubject);
	void delete(@Param("id") int id);
	void insert(GraduationSubject graduationSubject);
}
