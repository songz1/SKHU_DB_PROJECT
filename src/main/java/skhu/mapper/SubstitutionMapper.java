package skhu.mapper;

import org.apache.ibatis.annotations.Mapper;

import skhu.dto.Substitution;

@Mapper
public interface SubstitutionMapper {
	void delete();
	void insert(Substitution substitution);
}
