package skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import skhu.dto.Subject;

@Mapper
public interface SubjectMapper {
	Subject findByCode(@Param("code") String code);
	Subject findBySpecific(@Param("code") String code, @Param("year") String year, @Param("semester") int semester, @Param("subjectClass") String subjectClass);
	Subject findBySpecificName(@Param("code") String code, @Param("year") String year, @Param("semester") int semester, @Param("name") String name);
	Subject findBySpecificClass(@Param("code") String code, @Param("year") String year, @Param("semester") int semester, @Param("subjectClass") String subjectClass);
	List<Subject> findByDivision(@Param("division") String division, @Param("departmentId") int departmentId);
	List<Subject> findBySubtitle(String subtitle);
	void insert(Subject subject);
	void abolishChange();
	void update(Subject subject);
	void test(@Param("id") int id, @Param("detailId") int detailId);
}
