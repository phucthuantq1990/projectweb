package csc.com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import csc.com.dao.UserRoleDAO;
import csc.com.entity.UserRole;

@Service
public class UserRoleServiceImpl implements UserRoleService{
	@Autowired
	private UserRoleDAO userRoleDAO;

	@Override
	public UserRole getUserRolebyId(int id) {
		try {
			return userRoleDAO.getUserRolebyId(id);
		} catch (Exception e) {
			return null;
		}
	}

}
