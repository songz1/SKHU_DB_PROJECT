package skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import skhu.dto.Admin;

@Mapper
public interface AdminMapper {
	List<Admin> findAll();
	List<Admin> findAllWithDepartment(@Param("condition")Admin condition, @Param("searchType")String searchType, @Param("searchText")String searchText);
	Admin login(@Param("loginId")String loginId, @Param("password")String password);
	Admin findById(@Param("id")int id);
	void update(Admin admin);
	void insert(Admin admin);
	void delete(@Param("id")int id);
}
