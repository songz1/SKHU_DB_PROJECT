package skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import skhu.dto.Score;

@Mapper
public interface ScoreMapper {
	List<Score> findByStudentId(int studentId);
	List<Score> findBySubstitutionCode(@Param("studentId") int studentId, @Param("substitutionCode") String substitutionCode);
	List<Score> findByMajorAdmit(@Param("studentId") int studentId, @Param("majorAdmit") boolean majorAdmit);
	List<Score> findByEstablish(@Param("departmentId") int departmentId, @Param("establish") String establish);
	void update(Score score);
	List<Score> findWithSubstitution(int studentId);
	void insert(Score score);
}
