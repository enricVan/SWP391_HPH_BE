package fu.swp.dorm_mnm.controller.base;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import fu.swp.dorm_mnm.dto.base.RoleDto;
import fu.swp.dorm_mnm.dto.base.UserDto;
import fu.swp.dorm_mnm.service.base.RoleService;

@RestController
@RequestMapping("/role")
public class RoleController {

    @Autowired
    private RoleService roleService;

    @GetMapping()
    public ResponseEntity<List<RoleDto>> getRoles() {
        List<RoleDto> resp = roleService.findAllDto();
        return !resp.isEmpty() ? new ResponseEntity<>(resp, HttpStatus.OK)
                : new ResponseEntity<>(resp, HttpStatus.NOT_FOUND);
    }

    @GetMapping("{roleId}/users")
    public ResponseEntity<List<UserDto>> getUserByRole(@PathVariable Long roleId) {
        List<UserDto> resp = roleService.getUserByRoleId(roleId);
        return !resp.isEmpty() ? new ResponseEntity<>(resp, HttpStatus.OK)
                : new ResponseEntity<>(resp, HttpStatus.NOT_FOUND);
    }

}
