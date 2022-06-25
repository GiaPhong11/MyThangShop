package com.example.Shop.controller.manager;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.Shop.controller.user.BaseController;
import com.example.Shop.entities.CategoryEntity;
import com.example.Shop.entities.RoleEntity;
import com.example.Shop.entities.UserEntity;
import com.example.Shop.service.IUserService;

@Controller
public class ManagerUserController extends BaseController{
	@Autowired
	private IUserService userService;
	
	@RequestMapping(value = { "/admin/user" }, method = RequestMethod.GET) // -> action
	public String search(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@RequestParam(name="keywork",required = false )String keywork,
			@RequestParam("page") Optional<Integer> page,
			@RequestParam("size") Optional<Integer> size){
		
		
		//Giá trị ngầm định là 1 khi không nhập
		int currentPage = page.orElse(0);
		//5 giá trị trên 1 trnag 
		int pageSize = size.orElse(5);
		
		
		//Thực hiện sắp xếp theo title
		Pageable pageable = PageRequest.of(currentPage,pageSize, Sort.by("username")) ;
		
		Page<UserEntity> resultPage = null;
		

		if(StringUtils.hasText(keywork)) {
			resultPage =userService.findByKeywork(keywork, pageable);
			model.addAttribute("title", keywork);
		}else {
			resultPage = userService.findAll(pageable);
		}
		
		int totalPages = resultPage.getTotalPages();
		if(totalPages > 0) {
			
			//Tính toán không làm giá trị âm hoặc vượt quá
			int start = Math.max(1, currentPage -2 );
			int end = Math.min(currentPage + 2, totalPages);
			
			if(totalPages > 5) {
				if(end == totalPages) start = end -5;
				else if(start == 1 ) end = start + 5;
			}
			
			//Chuyển khoảng từ start tới end thành danh sách
			List<Integer> pageNumbers = IntStream.rangeClosed(start, end).boxed().collect(Collectors.toList());
			
			//Tính số trang hiển thị trên view
			model.addAttribute("pageNumbers", pageNumbers);
			model.addAttribute("pages", resultPage.getContent());
			model.addAttribute("number", resultPage.getNumber());
			model.addAttribute("totalElements", resultPage.getTotalElements());
		}
		
		//Đẩy xuống tầng view
		model.addAttribute("listPage",resultPage);
		
	
		return "manager/list-user"; // -> duong dan toi VIEW.
	}
	
	
	@RequestMapping(value = { "/admin/delete-user/{userId}" }, method = RequestMethod.GET) // -> action
	public String deleteCategory(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@PathVariable("userId") int userId
			)
			throws Exception {

		UserEntity userDelete = userService.findById(userId);
		userService.delete(userDelete);
		return "redirect:/admin/user"; // -> duong dan toi VIEW.
	}
	
	@RequestMapping(value = { "/admin/edit-user" }, method = RequestMethod.POST) // -> action
	public String edit(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			final @ModelAttribute("userEdit") UserEntity userEdit
			)
			throws Exception {	
			//Luu product vao db
			String role2 = request.getParameter("rolee");
			RoleEntity role = new RoleEntity();
		    role.setName(role2);
		    role.setDescription(role2);
		    BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		    String encodedPassword = passwordEncoder.encode(userEdit.getPassword());
		    userEdit.setPassword(encodedPassword);
 		    userEdit.addRoles(role);
		    
		    userService.save(userEdit);
		return "redirect:/admin/user";
	}
	@RequestMapping(value = { "/admin/edit-user/{userId}" }, method = RequestMethod.GET) // -> action
	public String editCategory(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@PathVariable("userId") int userId
			)
			throws Exception {

		UserEntity userEdit = userService.findById(userId);
		model.addAttribute("userEdit", userEdit);

		return "manager/edit-user"; // -> duong dan toi VIEW.
	}
	
	@GetMapping("/admin/user/{userId}")
	public String getUser(final Model model, final HttpServletRequest request, final HttpServletResponse response,
			@PathVariable("userId") int userId) throws Exception {

		UserEntity userGet = userService.findById(userId);
		model.addAttribute("u", userGet);
		return "redirect:/admin/user"; // -> duong dan toi VIEW.
	}
}
