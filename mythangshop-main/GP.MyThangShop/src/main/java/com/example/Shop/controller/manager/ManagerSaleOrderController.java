package com.example.Shop.controller.manager;

import java.io.IOException;
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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.Shop.controller.user.BaseController;
import com.example.Shop.entities.SaleOrderEntity;
import com.example.Shop.entities.SaleOrderProductsEntity;
import com.example.Shop.service.ISaleOderService;
import com.example.Shop.service.ISaleOrderProductService;

@Controller
public class ManagerSaleOrderController extends BaseController{
	@Autowired
	private ISaleOderService saleorderService;
	
	@Autowired
	private ISaleOrderProductService saleorderProService;
	
	
	@RequestMapping(value = { "/admin/list-order" }, method = RequestMethod.GET) // -> action
	public String contact(final Model model,
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
		Pageable pageable = PageRequest.of(currentPage,pageSize, Sort.by("customerName")) ;
		
		Page<SaleOrderEntity> resultPage = null;
		

		if(StringUtils.hasText(keywork)) {
			resultPage = saleorderService.findByKeywork(keywork, pageable);
			model.addAttribute("keywork", keywork);
		}else {
			resultPage = saleorderService.findAll(pageable);
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
		}
		
		//Đẩy xuống tầng view
		model.addAttribute("saleorder",resultPage);
		
	
		return "manager/list-order"; // -> duong dan toi VIEW.
	}
	
	@RequestMapping(value = { "/admin/del-order/{saleOrderId}" }, method = RequestMethod.GET) // -> action
	public String deleteSaleOrder(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@PathVariable("saleOrderId") int saleOrderId
			)
			throws Exception {
	
	//	CategoryEntity categoriesDelete = categoriesService.getById(categoryId);
	//	categoriesService.delete(categoriesDelete);
	//	System.out.println("hi: " + saleOrderId);
		SaleOrderEntity sale = saleorderService.getById(saleOrderId);
//		System.out.println(sale.getCustomerName() + " - " + sale.getId() + " - " + sale.getCustomerEmail());
		saleorderService.delete(sale);

		return "redirect:/admin/list-order";
	}
	@RequestMapping(value = { "/admin/detail-order/{saleOrderId}" }, method = RequestMethod.GET) // -> action
	public String editProduct(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@PathVariable("saleOrderId") int saleOrderId)
			throws IOException {
		

		SaleOrderEntity saleOrderEntity = saleorderService.getById(saleOrderId);

		
		model.addAttribute("saleOrder",saleOrderEntity);
		List<SaleOrderProductsEntity> listOrder = saleorderProService.findById2(saleOrderId);
		model.addAttribute("listOrder", listOrder);
		double tong = 0;
		for (SaleOrderProductsEntity saleOrderProductsEntity : listOrder) {
			tong +=(double) saleOrderProductsEntity.getQuality() *Integer.valueOf(saleOrderProductsEntity.getProduct().getPriceSale().intValue());
		}
		
		System.out.println("tong: "+tong);
		model.addAttribute("total", tong);
		return "manager/detail-order"; // -> duong dan toi VIEW.
	}
}
