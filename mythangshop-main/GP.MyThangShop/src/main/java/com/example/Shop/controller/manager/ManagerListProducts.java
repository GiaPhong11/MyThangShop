package com.example.Shop.controller.manager;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collector;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.aspectj.apache.bcel.classfile.Module.Require;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.Shop.controller.user.BaseController;
import com.example.Shop.entities.ProductsEntity;
import com.example.Shop.service.IProductService;


@Controller
public class ManagerListProducts extends BaseController{
	// inject 1 bean vao 1 bean khac 
		@Autowired
		private IProductService productservice;
		
		/*
		 * @RequestMapping(value = { "/admin/list-product" }, method =
		 * RequestMethod.GET) // -> action public String homelistproduct(final Model
		 * model, final HttpServletRequest request, final HttpServletResponse response,
		 * 
		 * @RequestParam(name="title",required = false )String title){
		 * 
		 * List<ProductsEntity> products = null; if(StringUtils.hasText(title)) {
		 * products =productservice.findByTitle(title); }else { products =
		 * productservice.findAll(); }
		 * 
		 * //Lấy danh sách categories
		 * 
		 * 
		 * //Đẩy xuống tầng view model.addAttribute("products",products);
		 * 
		 * 
		 * return "manager/list-product"; // -> duong dan toi VIEW. }
		 */
		@RequestMapping(value = { "/admin/list-product" }, method = RequestMethod.GET) // -> action
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
			Pageable pageable = PageRequest.of(currentPage,pageSize, Sort.by("title")) ;
			
			Page<ProductsEntity> resultPage = null;
			
	
			if(StringUtils.hasText(keywork)) {
				resultPage =productservice.findByKeywork(keywork, pageable);
				model.addAttribute("title", keywork);
			}else {
				resultPage = productservice.findAll(pageable);
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
			model.addAttribute("productPage",resultPage);
			
		
			return "manager/list-productpage"; // -> duong dan toi VIEW.
		}
		
	
	}

