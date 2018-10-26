package skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import skhu.dto.Admin;

@Mapper
public interface AdminMapper {
	List<Admin> findAll();
	Admin login(String loginId, String password);
}
