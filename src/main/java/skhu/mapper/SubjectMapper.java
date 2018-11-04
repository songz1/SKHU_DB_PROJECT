package skhu.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface SubjectMapper {
	int findByCode(@Param("code") String code);
}
