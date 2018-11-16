package skhu.mapper;


import org.apache.ibatis.annotations.Mapper;

import skhu.dto.Rule;

@Mapper
public interface RuleMapper {
	Rule findByName(String name);
	void insert(Rule rule);
	void update(Rule rule);
}
