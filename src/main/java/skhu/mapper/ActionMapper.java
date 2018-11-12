package skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import skhu.dto.Action;
import skhu.dto.Admin;

@Mapper
public interface ActionMapper {
	List<Action> findActionRecently(@Param("start")int start, @Param("end")int end);
	int count();
	List<Action> findById(@Param("id")int id);
	Action findByActionId(@Param("id")int id);
	void insert(Action action);
	void delete(@Param("id")int id);
}
