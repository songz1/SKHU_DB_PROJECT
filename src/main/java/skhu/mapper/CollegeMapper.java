package skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import skhu.dto.College;

@Mapper
public interface CollegeMapper {
	List<College> findWithoutCommon();
}
