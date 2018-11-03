package skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import skhu.dto.Score;

@Mapper
public interface ScoreMapper {
	List<Score> findByStudentId(int studentId);
}
