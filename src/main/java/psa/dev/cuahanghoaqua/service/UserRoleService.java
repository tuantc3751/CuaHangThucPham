package psa.dev.cuahanghoaqua.service;


import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import psa.dev.cuahanghoaqua.model.UserRole;

@Service
public class UserRoleService extends BaseService<UserRole> {
	@Override
	public Class<UserRole> clazz() {
		// TODO Auto-generated method stub
		return UserRole.class;
	}
	
//	@Transactional
//	public void deleteListUserRole(int userId) {
//		String sql = "SELECT * FROM tbl_user_role WHERE user_id = "+ userId;
//		List<UserRole> userRoles =  super.executeNativeSql(sql);
//		for (UserRole userRole : userRoles) {
//			super.deleteById(userRole.getId());
//		}
//	}
}
