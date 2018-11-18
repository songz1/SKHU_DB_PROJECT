package skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import skhu.dto.Subject;

@Mapper
public interface SubjectMapper {
	Subject findByCode(@Param("code") String code);
	Subject findBySpecific(@Param("code") String code, @Param("year") String year, @Param("semester") int semester);
	List<Subject> findByDivision(String division);
	List<Subject> findBySubtitle(String subtitle);
	void insert(Subject subject);
}
