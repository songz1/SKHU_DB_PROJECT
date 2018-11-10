package skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import skhu.dto.CompleteScore;

@Mapper
public interface CompleteScoreMapper {
	List<CompleteScore> findAll();
	void insert(CompleteScore completeScore);
	void delete();
}
