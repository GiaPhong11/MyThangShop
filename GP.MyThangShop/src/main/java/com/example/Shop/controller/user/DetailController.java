
package com.example.Shop.controller.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.Shop.entities.CategoryEntity;
import com.example.Shop.entities.ProductsEntity;
import com.example.Shop.entities.ProductsImagesEntity;
import com.example.Shop.service.ICategoryService;
import com.example.Shop.service.IProductService;
import com.example.Shop.service.impl.ProductImageService;

@Controller
public class DetailController extends BaseController {

	// inject 1 bean vao 1 bean khac
	@Autowired
	private ICategoryService categoriesService;
	@Autowired
	private IProductService productService;

	@Autowired
	private ProductImageService proImgService;

	@RequestMapping(value = { "/detail/{id}" }, method = RequestMethod.GET) // -> action
	public String editProduct(final Model model, final HttpServletRequest request, final HttpServletResponse response,
			@PathVariable("id") Integer id) throws IOException {

		List<ProductsEntity> list2 = productService.findProduct();
		model.addAttribute("product2", list2);
		ProductsEntity pro = productService.findById(id);
		model.addAttribute("pro", pro);

		List<ProductsImagesEntity> list = proImgService.findAll();
		model.addAttribute("product", list);

		// Lấy danh sách categories
		List<CategoryEntity> categories = categoriesService.findAll();

		// Đẩy xuống tầng view
		model.addAttribute("categories", categories);

		return "user/detail"; // -> duong dan toi VIEW }

	}
}
