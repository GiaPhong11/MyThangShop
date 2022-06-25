package com.example.Shop.controller.manager;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.Shop.controller.user.BaseController;
import com.example.Shop.entities.CategoryEntity;
import com.example.Shop.entities.ProductsEntity;
import com.example.Shop.service.ICategoryService;
import com.example.Shop.service.IProductService;

@Controller
@MultipartConfig(maxFileSize = 1024*1024*1024,maxRequestSize = 1024*1024*1024)
public class ManagerAddProductController extends BaseController{
	// inject 1 bean vao 1 bean khac 
	@Autowired
	private ICategoryService categoriesService;
	
	@Autowired
	private IProductService productService;
	
	@RequestMapping(value = { "/admin/add-product" }, method = RequestMethod.GET) // -> action
	public String addProduct(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response){
		
		
		//Lấy danh sách categories
		List<CategoryEntity> categories= categoriesService.findAll();
		
		//Đẩy xuống tầng view
		model.addAttribute("categories",categories);
		
		model.addAttribute("product",new ProductsEntity());
	
		return "manager/add-product"; // -> duong dan toi VIEW.
	}
	
	
	
	@RequestMapping(value = { "/admin/add-product" }, method = RequestMethod.POST) // -> action
	public String addProduct(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@ModelAttribute("product") ProductsEntity product,
			@RequestParam("inputPictures") MultipartFile[] inputPictures,
			@RequestParam("inputAvatar") MultipartFile inputAvatar) 
					throws Exception {
		List<CategoryEntity> categories= categoriesService.findAll();
			//Lưu vào DB
			if (product.getTitle().trim().equals("")) {
				model.addAttribute("loi", "Tiêu đề không được để trống");
				model.addAttribute("categories",categories);
				return "/manager/add-product";
			}
			if(product.getPrice() == null) {
				model.addAttribute("loi", "Giá không được để trống");
				model.addAttribute("categories",categories);
				return "/manager/add-product";
			}
			if(product.getPriceSale() == null) {
				model.addAttribute("loi", "Giá sale không được để trống");
				model.addAttribute("categories",categories);
				return "/manager/add-product";
			}
			
			if(product.getShortDescription().trim().equals("")) {
				model.addAttribute("loi", "Mô tả ngắn không được để trống");
				model.addAttribute("categories",categories);
				return "/manager/add-product";
			}
			
			if(product.getDetails().trim().equals("")) {
				model.addAttribute("loi", "Mô tả chi tiết không được để trống");
				model.addAttribute("categories",categories);
				return "/manager/add-product";
			}
			
			productService.addProduct(product, inputAvatar, inputPictures);
	
	
			return "redirect:/admin/list-product";
	}
	
	@RequestMapping(value = { "/admin/edit-product" }, method = RequestMethod.POST) // -> action
	public String editProduct(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@ModelAttribute("product") ProductsEntity product,
			@RequestParam("inputPictures") MultipartFile[] productPictures,
			@RequestParam("inputAvatar") MultipartFile productAvatar) 
					throws Exception {
		List<CategoryEntity> categories= categoriesService.findAll();
		//Lưu vào DB
		if (product.getTitle().trim().equals("")) {
			model.addAttribute("loi", "Tiêu đề không được để trống");
			model.addAttribute("categories",categories);
			return "/manager/edit-product";
		}
		if(product.getPrice() == null) {
			model.addAttribute("loi", "Giá không được để trống");
			model.addAttribute("categories",categories);
			return "/manager/edit-product";
		}
		if(product.getPriceSale() == null) {
			model.addAttribute("loi", "Giá sale không được để trống");
			model.addAttribute("categories",categories);
			return "/manager/edit-product";
		}
		
		if(product.getShortDescription().trim().equals("")) {
			model.addAttribute("loi", "Mô tả ngắn không được để trống");
			model.addAttribute("categories",categories);
			return "/manager/edit-product";
		}
		
		if(product.getDetails().trim().equals("")) {
			model.addAttribute("loi", "Mô tả chi tiết không được để trống");
			model.addAttribute("categories",categories);
			return "/manager/edit-product";
		}
		productService.editProduct(product, productAvatar, productPictures);
	
		return "redirect:/admin/list-product";
	}
	
	@RequestMapping(value = { "/admin/edit-product/{productId}" }, method = RequestMethod.GET) // -> action
	public String editProduct(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@PathVariable("productId") int productId)
			throws IOException {
		
		//Lấy sản phẩm từ database
		ProductsEntity product = productService.findById(productId);
				
		//Can lay danh sach category từ db và trả về view qua model
		List<CategoryEntity> categories = categoriesService.findAll();
				
		//Đẩy dữ liệu xuống view thông qua thằng model
		model.addAttribute("categories",categories);
		
		model.addAttribute("product",product);
		
		return "manager/edit-product"; // -> duong dan toi VIEW.
	}
	
	
	@RequestMapping(value = { "/admin/delete/{productId}" }, method = RequestMethod.GET) // -> action
	public String deleteProduct(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@PathVariable("productId") int productId)
			throws IOException {
		
		//Lấy sp từ db
		ProductsEntity product = productService.findById(productId);
		productService.deleteProduct(productId);
		//Can lay danh sach category từ db và trả về view qua model
				
		//Đẩy dữ liệu xuống view thông qua thằng model
		
		
		return "redirect:/admin/list-product"; // -> duong dan toi VIEW.
	}
}
