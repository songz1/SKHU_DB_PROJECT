package skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import skhu.dto.Department;

@Mapper
public interface DepartmentMapper {
	List<Department> findWithoutCommon();
	List<Department> findAll();
	Department findById(@Param("id") int id);
}
