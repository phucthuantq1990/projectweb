package csc.com.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import csc.com.entity.User;
import csc.com.service.UserRoleServiceImpl;
import csc.com.service.UserService;
import csc.com.service.UserServiceImplement;



@Controller
@EnableWebMvc
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/register/create", method = RequestMethod.POST, headers = "Accept=*/*", produces = "application/json")
	public @ResponseBody String createUser(@RequestBody User user)
			throws JsonProcessingException {
		if (userService.addUser(user) != null) {
			System.out.println("success!");
			return new ObjectMapper().writeValueAsString("Successful");
		} else {
			System.out.println("error!");
			return new ObjectMapper().writeValueAsString("error");
		}
	}
	@RequestMapping(value = "/homeAdmin")
	public String Admin(ModelMap mm, HttpSession session){
		User user = (User)session.getAttribute("admin");
		List<User> users = userService.getUsers();
		mm.put("listuser", users);
		return "adminpage";
	}
	@RequestMapping(value = "/createuser")
	public String createUser(){
		return "createUserPage";
	}
	@RequestMapping(value = "/getusers", method = RequestMethod.GET)
	public @ResponseBody List<User> getListUsers(){
		List<User> users = userService.getUsers();
		return users;
	}
	@RequestMapping(value = "/homeUser")
	public String UserPage(){
	
		return "userpage";
	}
	@RequestMapping(value = "/adminmodify", method = RequestMethod.POST)
	public String modifyAdmin(@RequestParam("loginID") String loginId, @RequestParam("fullName") String name,
			@RequestParam("password")String password,@RequestParam("address")String address,
			@RequestParam("gender")String gender,@RequestParam("state")String state,HttpSession session
			,ModelMap mm){
		System.out.println(state);
		User user1 = userService.getUserByLoginId(loginId);
		System.out.println(user1);
		user1.setLoginId(loginId);
		user1.setPassword(password);
		user1.setName(name);
		user1.setAddress(address);
		user1.setGender(gender);
		user1.setState(state);
		userService.updateUser(user1);
		User user = (User)session.getAttribute("admin");
		List<User> users = userService.getUsers();
		mm.put("listuser", users);
		return "adminpage";
	}
	@RequestMapping(value = "/usermodify", method = RequestMethod.POST)
	public String modifyUser(@RequestParam("name") String name, @RequestParam("address") String address,
			@RequestParam("gender")String gender, HttpSession session,ModelMap mm){
		User user = (User)session.getAttribute("user");
		System.out.println(user.getLoginId());
		user.setName(name);
		user.setAddress(address);
		user.setGender(gender);
		userService.updateUser(user);
		mm.put("message", "Modify Success!");
		return "userpage";
	}
	@RequestMapping(value = "/changepass")
	public String changPasswordPage(){
	
		return "changePasswordpage";
	}
	@RequestMapping(value = "/changepasswordUser", method = RequestMethod.POST)
	public String changePaswordUser(@RequestParam("currentPassword") String currentPassword, @RequestParam("newPassword") String newPassword,
				HttpSession session, ModelMap mm){
		User user = (User)session.getAttribute("user");
		if(user.getPassword().equals(currentPassword)){
			System.out.println(user.getPassword());
			user.setPassword(newPassword);
			userService.updateUser(user);
			mm.put("message", "Change Success!!");
			return "changePasswordpage";
		}
		else{
			mm.put("1", 2);
			return "userpage";
		}
	}
	@RequestMapping(value = "/viewNew")
	public String adminViewNew(ModelMap mm, HttpSession session){
		User user = (User)session.getAttribute("admin");
		List<User> users = userService.getNewUsers();
		mm.put("listuser", users);
		return "viewNewpage";
	}
}