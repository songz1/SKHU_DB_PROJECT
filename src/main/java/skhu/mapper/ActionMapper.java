package skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import skhu.dto.Action;

@Mapper
public interface ActionMapper {
	List<Action> findActionRecently(@Param("start")int start, @Param("end")int end);
	int count();
}
