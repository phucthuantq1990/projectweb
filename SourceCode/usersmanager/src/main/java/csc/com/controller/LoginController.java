package csc.com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import csc.com.entity.User;
import csc.com.service.UserService;

@Controller
public class LoginController {
	@Autowired
	private UserService userService;

	@RequestMapping(value = "/login")
	public String Login() {
		return "loginpage";
	}
	@RequestMapping(value = "/login2", method = RequestMethod.GET)
	public String Login2() {
		return "loginpage";
	}

	@RequestMapping(value = "/login2", method = RequestMethod.POST, params = "login")
	public String Login2(@RequestParam("loginId") String loginId,
			@RequestParam("password") String password, ModelMap mm , HttpServletRequest request,
			HttpSession session) {
			List<User> users = userService.getUsers();
			session.setAttribute("users", users);
			int flag = 0;
			System.out.println(loginId);
			System.out.println(password);
			for (User user : users) {
				System.out.println(user.getLoginId()+","+user.getPassword());
				if (user.getLoginId().equals(loginId) && user.getPassword().equals(password)) {
					if (user.getUserRole().getUserRoleId() == 1) {
						session.setAttribute("admin", user);
						session.setAttribute("loginId", loginId);
						flag = 1;
						break;
					}
					if(user.getUserRole().getUserRoleId() == 2 && user.getState().equals("enable"))
					{
						session.setAttribute("user", user);
						flag = 2;
						break;
					}
				}
			}
			if (flag == 1) {
				//list User
				mm.put("listuser", users);
				return "adminpage";
			}
			if (flag == 2) {
				return "userpage";
			} else {
				String message = "Login ID or Password is failed";
				mm.put("failed", message);
				return "loginpage";
			}
	  }
	@RequestMapping(value = "/login2", method = RequestMethod.POST, params = "register")
	public String Register() {
		System.out.println("Register");
		return "register";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String Logout(HttpSession session) {
		session.removeAttribute("loginId");
		System.out.println("Logout");
		return "loginpage";
	}
}
