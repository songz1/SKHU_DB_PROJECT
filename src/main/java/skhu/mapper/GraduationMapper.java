package skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import skhu.dto.Graduation;

@Mapper
public interface GraduationMapper {
	List<Graduation> findWithoutCommon();
	List<Graduation> findAll();
}
