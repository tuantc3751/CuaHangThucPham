package psa.dev.cuahanghoaqua.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="tbl_user_role")
public class UserRole extends BaseModel{
	@Column(name = "role_id")
	private int roleId;
	
	@Column(name = "user_id")
	private int userId;
	
	public UserRole() {
		super();
		// TODO Auto-generated constructor stub
	}

	public UserRole(Integer id, Date createDate, Date updateDate, Boolean status) {
		super(id, createDate, updateDate, status);
		// TODO Auto-generated constructor stub
	}

	public UserRole(int roleId, int userId) {
		super();
		this.roleId = roleId;
		this.userId = userId;
	}

	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}
	
}
