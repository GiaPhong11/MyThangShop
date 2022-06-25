package com.example.Shop.controller.manager;

import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.Shop.controller.user.BaseController;
import com.example.Shop.entities.CategoryEntity;
import com.example.Shop.entities.SaleOrderEntity;
import com.example.Shop.entities.SaleOrderProductsEntity;
import com.example.Shop.service.ISaleOderService;
import com.example.Shop.service.ISaleOrderProductService;

@Controller
public class ManagerChartController extends BaseController{
	@Autowired
	ISaleOderService saleOderService;
	
	@Autowired
	ISaleOrderProductService saleOrderProductService;
	
	
	
	@RequestMapping(value = { "/admin/chart" }, method = RequestMethod.GET) // -> action
	public String search(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response
			) throws Exception{
		
//		String date1 = request.getParameter("date1");
//		String date2 = request.getParameter("date2");
//		Date date11 = date1.toString();
//		Date date11 = (Date) new SimpleDateFormat().parse(date1);
//		Date date12 = (Date) new SimpleDateFormat().parse(date2);
//		Date date = (Date) new SimpleDateFormat("yyyy-MM-dd HH:mm:ss z").parse(date1);
//	    return new SimpleDateFormat("dd.MM.yyyy HH:mm:ss").format(date);
//		saleOderService.findByTime(date, date);
//		//Giá trị ngầm định là 1 khi không nhập
//		int currentPage = page.orElse(0);
//		//5 giá trị trên 1 trnag 
//		int pageSize = size.orElse(5);
//		
//		
//		//Thực hiện sắp xếp theo title
//		Pageable pageable = PageRequest.of(currentPage,pageSize, Sort.by("name")) ;
//		
//		Page<CategoryEntity> resultPage = null;
//		
//
//		if(StringUtils.hasText(date1) && StringUtils.hasText(date2)) {
////			resultPage =categoriesService.findByKeywork(keywork, pageable);
////			model.addAttribute("title", keywork);
//			Date date = (Date) new SimpleDateFormat("yyyy-MM-dd").parse(date1);
//			Date date5 = (Date) new SimpleDateFormat("yyyy-MM-dd").parse(date2);
//			String sql = "SELECT e.* FROM tbl_saleorder e Where e.created_date >= %?1% AND e.created_date <= %?2%";
//			List<SaleOrderEntity> sales = saleOderService.findByTime(date, date5);
//			System.out.println(sales.toString());
//		}else {
////			resultPage = categoriesService.findAll(pageable);
//		}
//		
//		int totalPages = resultPage.getTotalPages();
//		if(totalPages > 0) {
//			
//			//Tính toán không làm giá trị âm hoặc vượt quá
//			int start = Math.max(1, currentPage -2 );
//			int end = Math.min(currentPage + 2, totalPages);
//			
//			if(totalPages > 5) {
//				if(end == totalPages) start = end -5;
//				else if(start == 1 ) end = start + 5;
//			}
//			
//			//Chuyển khoảng từ start tới end thành danh sách
//			List<Integer> pageNumbers = IntStream.rangeClosed(start, end).boxed().collect(Collectors.toList());
//			
//			//Tính số trang hiển thị trên view
//			model.addAttribute("pageNumbers", pageNumbers);
//			model.addAttribute("pages", resultPage.getContent());
//			model.addAttribute("number", resultPage.getNumber());
//			model.addAttribute("totalElements", resultPage.getTotalElements());
//		}
//		
//		//Đẩy xuống tầng view
//		model.addAttribute("categoriesPage",resultPage);
		
	
		return "manager/thongke"; // -> duong dan toi VIEW.
	}
	
//	@GetMapping("/admin/chart/thongke")
//	public ResponseEntity<SaleOrderEntity> search(){
//		
//		return null;
//		
//	}
	
	@GetMapping("/admin/chart/thongke")
	public ResponseEntity<List<SaleOrderProductsEntity>> search(
			Model model,
			@RequestParam(name="date1",required = false )String date1,
			@RequestParam(name = "date2", required = false) String date2) throws Exception {
//			resultPage =categoriesService.findByKeywork(keywork, pageable);
//			model.addAttribute("title", keywork);
			Date date = (Date) new SimpleDateFormat("yyyy-MM-dd").parse(date1);
			Date date5 = (Date) new SimpleDateFormat("yyyy-MM-dd").parse(date2);
			List<SaleOrderProductsEntity> proFound = saleOrderProductService.findByTime(date, date5);
			if(proFound != null && !proFound.isEmpty()) {
////				List<SaleOrderEntity> proFoundd = saleOderService.findById2(proFound.get(0).getId());
//				System.out.println(proFound.get(0).getSaleOrderEntity().getCustomerName());
//				Optional<SaleOrderEntity> saleOrder = saleOderService.findById(proFound.get(0).getSaleOrderEntity().getId());
//				System.out.println(saleOrder.get().getCustomerName());
//				model.addAttribute("saleOrder", saleOrder);
				long tong = 0;
				for(SaleOrderProductsEntity s : proFound){
					tong += s.getQuality();
				}
				model.addAttribute("totalBan", tong);
				return ResponseEntity.ok(proFound);
			}
			return new ResponseEntity<List<SaleOrderProductsEntity>>(HttpStatus.FAILED_DEPENDENCY);
			

	}

}

