package com.example.Shop.controller.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.Shop.entities.CategoryEntity;
import com.example.Shop.entities.ProductsEntity;
import com.example.Shop.service.ICategoryService;
import com.example.Shop.service.IProductService;

@Controller
public class HomeController extends BaseController {

	// inject 1 bean vao 1 bean khac
	@Autowired
	private ICategoryService categoriesService;
	@Autowired
	private IProductService productService;

	@RequestMapping(value = { "/index" }, method = RequestMethod.GET) // -> action
	public String home(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {

		List<ProductsEntity> list = productService.findProduct();
		model.addAttribute("product", list);

		// Lấy danh sách categories
		List<CategoryEntity> categories = categoriesService.findAll();

		// Đẩy xuống tầng view
		model.addAttribute("categories", categories);

		return "user/index"; // -> duong dan toi VIEW.
	}
}
