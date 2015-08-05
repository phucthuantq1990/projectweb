package csc.com.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import csc.com.dao.UserDAO;
import csc.com.entity.User;
import csc.com.entity.UserRole;

@Service
public class UserServiceImplement implements UserService {
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private UserRoleService userRoleService;

	@Transactional
	public User addUser(User user) {
		user.setState("new");
		user.setUserRole(userRoleService.getUserRolebyId(2));
		return userDAO.addUser(user);
	}
	@Transactional
	public User updateUser(User user) {
		return userDAO.updateUser(user);
	}

	public List<User> getUsers() {
		try {
			return userDAO.getUsers();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	@Override
	public User getUserByLoginId(String loginId) {
		
		return userDAO.getUserByLoginId(loginId);
	}
	@Override
	public List<User> getNewUsers() {
		try {
			return userDAO.getNewUsers();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
