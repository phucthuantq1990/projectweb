package csc.com.dao;

import java.util.List;

import csc.com.entity.User;

public interface UserDAO {
	public User addUser(User user);
	public User updateUser(User user);
	public List<User> getUsers();
	public User getUserByLoginId(String loginId);
	public List<User> getNewUsers();
}
