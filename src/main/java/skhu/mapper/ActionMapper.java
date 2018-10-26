package skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import skhu.dto.Action;

@Mapper
public interface ActionMapper {
	List<Action> findActionRecently(int start, int end);
	int count();
}
