package com.example.Shop.controller.manager;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.Shop.controller.user.BaseController;



@Controller
public class ManagerHomeController extends BaseController {
	@RequestMapping(value = { "/admin/index" }, method = RequestMethod.GET) // -> action
	//Method: POST: thêm
	//		: PUT: sửa
	//		: DELETE: xóa
	//		: GET : hiển thị dữ liệu
	public String home(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response){
		
		// cac views se duoc dat tai thu muc: 
		//Nếu mà không có MVCConf
		//return "WEB-INF/views/user/home.jsp";
		return "manager/index"; // -> duong dan toi VIEW.
	}
}
