package com.example.Shop.controller.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.Shop.entities.RoleEntity;
import com.example.Shop.entities.UserEntity;
import com.example.Shop.service.IUserService;




@Controller
public class LoginController extends BaseController {
	
	@Autowired
	private IUserService userService;
	@RequestMapping(value = { "/login" }, method = RequestMethod.GET) // -> action
	public String login(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response)
			throws IOException {
			
		return "login"; // -> duong dan toi VIEW.
	}
	@RequestMapping(value = { "/register" }, method = RequestMethod.GET) // -> action
	public String register(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response)
			throws IOException {
			
		model.addAttribute("regis", new UserEntity());
		
		return "register"; // -> duong dan toi VIEW.
	}
	@RequestMapping(value = { "/register" }, method = RequestMethod.POST) // -> action
	public String saveContact(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			final @ModelAttribute("regis") UserEntity regis)
			throws IOException {
		//b1: lay thong tin nguoi dung day len
	//	String email = request.getParameter("txtEmail");
	//	String emailFromSpringForm = contact.getTxtEmail(); 
		String username = regis.getUsername();
//		String password = regis.getPassword();
//		String email = regis.getEmail();
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	    String encodedPassword = passwordEncoder.encode(regis.getPassword());
	    regis.setPassword(encodedPassword);
//	    regis.setUsername(username);
	    RoleEntity role = new RoleEntity();
	    role.setName("GUEST");
	    role.setDescription("GUEST");
	    regis.addRoles(role);
	    @SuppressWarnings("unchecked")
		List<UserEntity> user = (List<UserEntity>) userService.findByusername(username);
	    if(user == null || user.size() <=0) {
	    	userService.save(regis);
			//b3: thong bao cho nguoi dung biet da luu thanh cong
			model.addAttribute("thongbao", "Đăng ký thành công");
	    	
	    }else {
	    	model.addAttribute("loi","Tài khoản đã tồn tại");
	    }
		//TODO b2: luu thong tin vao csdl
		
		
		//return "WEB-INF/views/user/home.jsp";
		return "register"; // -> duong dan toi VIEW.
	}
}
