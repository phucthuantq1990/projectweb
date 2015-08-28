package csc.com.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import csc.com.entity.UserRole;


@Repository
public class UserRoleDAOImpl implements UserRoleDAO {
	
	@PersistenceContext(unitName = "usersmanager")
	private EntityManager entityManager;

	@Override
	public UserRole getUserRolebyId(int id) {
		try {
			return entityManager.find(UserRole.class, id);
		} catch (Exception e) {
			throw e;
		}
	}
	
}
