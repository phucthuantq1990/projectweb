package csc.com.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import csc.com.entity.User;

@Repository
public class UserDAOImplement implements UserDAO {
	
	@PersistenceContext(unitName = "usersmanager")
	private EntityManager entityManager;
	
	@Override
	public User addUser(User user) {
		try {
			entityManager.persist(user);
			entityManager.flush();
			return user;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	@Override
	public User updateUser(User user) {
		try {
			entityManager.merge(user);
			entityManager.flush();
			return user;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	@Override
	public List<User> getUsers() {
		List<User> users = null;
		try {
		users = entityManager
					.createQuery(
							"select u from User u",User.class).getResultList();
		} catch (Exception e) {
			throw e;
		}
		return users;
	}
	@Override
	public User getUserByLoginId(String loginId) {
		try {
			
			return entityManager.createQuery("select u from User u where u.loginId = '"+loginId+"'",User.class)
					.getSingleResult();
		} catch (Exception e) {
			throw e;
		}
	}
	@Override
	public List<User> getNewUsers() {
		List<User> users = null;
		try {
		users = entityManager
					.createQuery(
							"select u from User u where u.state = 'new'",User.class).getResultList();
		} catch (Exception e) {
			throw e;
		}
		return users;
	}
}
