package csc.com.service;

import java.util.List;

import csc.com.entity.User;

public interface UserService {
	
	public User addUser(User user);
	public User updateUser(User user);
	public List<User> getUsers();
	public User getUserByLoginId(String loginId);
	public List<User> getNewUsers();
}