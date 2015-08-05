package csc.com.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;


/**
 * @author lthanh
 *
 */
@Entity
@Table(name = "role")
public class UserRole {

	@Id
	@Column(name = "id", nullable = false)
	private int userRoleId;

	@Column(name = "user_role", nullable = false)
	private String userRole;
	
	@JsonIgnore
	@OneToMany(mappedBy = "userRole", fetch = FetchType.LAZY)
	private List<User> listUser;
	
	public int getUserRoleId() {
		return userRoleId;
	}

	public void setUserRoleId(int userRoleId) {
		this.userRoleId = userRoleId;
	}

	public String getUserRole() {
		return userRole;
	}

	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}
}
