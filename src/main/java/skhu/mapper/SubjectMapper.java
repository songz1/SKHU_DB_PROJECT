package skhu.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import skhu.dto.Subject;

@Mapper
public interface SubjectMapper {
	Subject findByCode(@Param("code") String code);
}
