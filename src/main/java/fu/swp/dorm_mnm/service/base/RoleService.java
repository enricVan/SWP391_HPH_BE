package fu.swp.dorm_mnm.service.base;

import java.util.List;

import fu.swp.dorm_mnm.dto.base.RoleDto;
import fu.swp.dorm_mnm.dto.base.UserDto;
import fu.swp.dorm_mnm.model.Role;

public interface RoleService {

    public List<UserDto> getUserByRoleId(Long roleId);

    public List<Role> findAll();

    public Role findByRoleName(String roleName);

    public List<RoleDto> findAllDto();

}