package com.example.Shop.controller.manager;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.Shop.controller.user.BaseController;
import com.example.Shop.entities.CategoryEntity;
import com.example.Shop.entities.ProductsEntity;
import com.example.Shop.service.ICategoryService;
import com.example.Shop.service.impl.CategoryService;
import com.example.Shop.service.impl.ProductService;

@Controller
public class ManagerAddCategoryController extends BaseController{
	@Autowired
	private CategoryService categoriesService;
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value = { "/admin/add-category" }, method = RequestMethod.GET) // -> action
	public String addCategory(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response)
			throws IOException {
		
	
		model.addAttribute("category", new CategoryEntity());
		
		//model.addAttribute("product",new ProductsEntity());
		
		return "manager/add-category"; // -> duong dan toi VIEW.
	}
	
	@RequestMapping(value = { "/admin/add-category" }, method = RequestMethod.POST) // -> action
	public String saveCategory(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			final @ModelAttribute("category") CategoryEntity category
			)
			throws Exception {	
			//Luu product vao db
			categoriesService.save(category);
		return "redirect:/admin/categories";
	}
	@RequestMapping(value = { "/admin/edit-category" }, method = RequestMethod.POST) // -> action
	public String edit(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			final @ModelAttribute("category") CategoryEntity category
			)
			throws Exception {	
			//Luu product vao db
			categoriesService.editCategory(category);
		return "redirect:/admin/categories";
	}
	@RequestMapping(value = { "/admin/edit-category/{categoryId}" }, method = RequestMethod.GET) // -> action
	public String editCategory(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			final @ModelAttribute("category") CategoryEntity category,
			@PathVariable("categoryId") int categoryId
			)
			throws Exception {

		CategoryEntity categories = categoriesService.findById(categoryId);
		model.addAttribute("category", categories);

		return "manager/edit-category"; // -> duong dan toi VIEW.
	}
	
	@RequestMapping(value = { "/admin/del-category/{categoryId}" }, method = RequestMethod.GET) // -> action
	public String deleteCategory(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@PathVariable("categoryId") int categoryId) 
			throws Exception {
		CategoryEntity categoriesDelete = categoriesService.findById(categoryId);
		categoriesService.delete(categoriesDelete);
		//model.addAttribute("category", categories);		
		//categoriesService.save(category);
		//return "WEB-INF/views/user/home.jsp";
		return "redirect:/admin/categories"; // -> duong dan toi VIEW.
	}
	
		
	
}