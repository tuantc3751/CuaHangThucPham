package psa.dev.cuahanghoaqua.service;

import java.util.List;

import org.springframework.stereotype.Service;
import psa.dev.cuahanghoaqua.model.Role;

@Service
public class RoleService extends BaseService<Role> {
	@Override
	public Class<Role> clazz() {
		// TODO Auto-generated method stub
		return Role.class;
	}
	
	public List<Role> findAllActive(){
		String sql = "SELECT * FROM tbl_Role WHERE Status = 1";
		return super.executeNativeSql(sql);
	}
	
	public Role getRoleByName(String name) {
		String sql = "SELECT * FROM tbl_role r WHERE r.name = '" + name + "'";
		List<Role> roles = super.executeNativeSql(sql);
		
		if(roles != null && roles.size() > 0) {
			return roles.get(0);
		}else {
			return new Role();
		}
	}
}
