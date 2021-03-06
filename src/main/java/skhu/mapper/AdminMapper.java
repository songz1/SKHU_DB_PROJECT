package skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import skhu.dto.Admin;

@Mapper
public interface AdminMapper {
	List<Admin> findAll();
	Admin findTest(@Param("loginId") String loginId);
	List<Admin> findAllWithDepartment(@Param("start")int start, @Param("end")int end, @Param("condition")Admin condition, @Param("searchType")String searchType, @Param("searchText")String searchText);
	Admin login(@Param("loginId")String loginId, @Param("password")String password);
	Admin findById(@Param("id")int id);
	int count(@Param("condition")Admin condition, @Param("searchType")String searchType, @Param("searchText")String searchText);
	void update(Admin admin);
	void insert(Admin admin);
	void delete(@Param("id")int id);
}
