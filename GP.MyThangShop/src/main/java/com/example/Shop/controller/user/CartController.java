package com.example.Shop.controller.user;

import java.io.IOException;
import java.sql.Date;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.Shop.entities.SaleOrderEntity;
import com.example.Shop.entities.SaleOrderProductsEntity;

import com.example.Shop.dto.Cart;
import com.example.Shop.dto.CartItem;
import com.example.Shop.entities.CategoryEntity;
import com.example.Shop.entities.ProductsEntity;
import com.example.Shop.service.ICategoryService;
import com.example.Shop.service.IProductService;
import com.example.Shop.service.ISaleOderService;
import com.paypal.api.payments.Item;

@Controller
public class CartController extends BaseController {
	// inject 1 bean vao 1 bean khac
	@Autowired
	private ICategoryService categoriesService;
	@Autowired
	private IProductService productService;

	@Autowired
	private ISaleOderService saleorderService;

	@RequestMapping(value = { "/cart/checkout" }, method = RequestMethod.GET) // -> action
	public String checkoutView(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		model.addAttribute("totalprice", this.getTotalPrice(request));

		return "user/checkout"; // -> duong dan toi VIEW.
	}

	@RequestMapping(value = { "/pay"  }, method = RequestMethod.POST,params = "thanhtoan1") // -> action
	public String checkoutViewpost(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {

		model.addAttribute("totalprice", this.getTotalPrice(request));

		// L???y th??ng tin kh??ch h??ng
		String customerName = request.getParameter("customerName");
		String customerAddress = request.getParameter("customerAddress");
		String customerPhone = request.getParameter("customerPhone");
		String customerEmail = request.getParameter("customerEmail");

		// T???o h??a ????n
		SaleOrderEntity saleOrderEntity = new SaleOrderEntity();
		saleOrderEntity.setCode(String.valueOf(System.currentTimeMillis()));
		saleOrderEntity.setCustomerName(customerName);
		saleOrderEntity.setCustomerAddress(customerAddress);
		saleOrderEntity.setCustomerPhone(customerPhone);
		saleOrderEntity.setCustomerEmail(customerEmail);
//		LocalDate date = LocalDate.now();
		  DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy MM dd");
//		  String text = date.format(formatter);
//		  Date date = new Date(System.currentTimeMillis());
		saleOrderEntity.setCreatedDate(new Date(System.currentTimeMillis()));
		saleOrderEntity.setTinhTrang("Ch??a thanh to??n");
		if(isLogined()) {
			saleOrderEntity.setUser(getUserLogined());
		}
		
		boolean flag = false;

		// L???y th??ng tin gi??? h??ng
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		for (CartItem cartItem : cart.getCartItems()) {
			ProductsEntity product = productService.findById(cartItem.getProductId());
			if(product.getSoLuongTon() < cartItem.getQuanlity()) {
				flag = true;
				break;
			}
			product.setSoLuongTon(product.getSoLuongTon() - cartItem.getQuanlity());
			SaleOrderProductsEntity saleOrderProductsEntity = new SaleOrderProductsEntity();
			saleOrderProductsEntity.setProduct(productService.findById(cartItem.getProductId()));
			saleOrderProductsEntity.setQuality(cartItem.getQuanlity());
			saleOrderProductsEntity.setCreatedDate(new Date(System.currentTimeMillis()));
			saleOrderEntity.addRelationProduct(saleOrderProductsEntity);
			
		}
		if(flag) {
			model.addAttribute("thongbao", "L???i ????t h??ng do s??? l?????ng v?????t qu?? s??? l?????ng c??n c??");
		}else {
			saleorderService.saveSaleOder(saleOrderEntity);

			// X??a d??? li???u gi??? h??ng trong secction
			model.addAttribute("thongbao", "C???m ??n b???n ???? mua h??ng");
			session.setAttribute("cart", null);
		}
		
		// L??u v??o CSDL
		

		return "user/checkout"; // -> duong dan toi VIEW.
	}

	@RequestMapping(value = { "/cart/view" }, method = RequestMethod.GET) // -> action
	public String cartView(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {

		model.addAttribute("totalprice", this.getTotalPrice(request));

		// L???y danh s??ch categories
		List<CategoryEntity> categories = categoriesService.findAll();

		// ?????y xu???ng t???ng view
		model.addAttribute("categories", categories);

		return "user/shopping-cart"; // -> duong dan toi VIEW.
	}

	private int getTotalItems(final HttpServletRequest request) {
		HttpSession httpSession = request.getSession();

		if (httpSession.getAttribute("cart") == null) {
			return 0;
		}

		Cart cart = (Cart) httpSession.getAttribute("cart");
		List<CartItem> cartItems = cart.getCartItems();

		int total = 0;
		for (CartItem item : cartItems) {
			total += item.getQuanlity();
		}

		return total;
	}

	private Double getTotalPrice(HttpServletRequest request) {

		HttpSession httpSession = request.getSession();

		if (httpSession.getAttribute("cart") == null) {
			return 0d;
		}

		Cart cart = (Cart) httpSession.getAttribute("cart");
		List<CartItem> cartItems = cart.getCartItems();

		Double totalPrice = 0d;
		for (CartItem item : cartItems) {
			totalPrice += item.getPriceUnit().doubleValue() * item.getQuanlity();
		}

		return totalPrice;
	}

	@RequestMapping(value = { "/cart/add" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> addToCart(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response, @RequestBody CartItem newItem) {

		// Section t????ng t??? nh?? ki???u map v?? ???????c l??u tr??n main memory
		HttpSession session = request.getSession();
		String soLuongTon = request.getParameter("soluongton");
		// L???y th??ng tin gi??? h??ng
		Cart cart = null;
		if (session.getAttribute("cart") != null) {
			cart = (Cart) session.getAttribute("cart");
		} else {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}

		// L???y danh s??ch s???n ph???m c?? trong gi??? h??ng
		List<CartItem> cartItems = cart.getCartItems();

		// Ki???m tra n???u c?? trong gi??? h??ng th?? t??ng s??? l?????ng
		boolean isExists = false;
		for (CartItem item : cartItems) {
			if (item.getProductId() == newItem.getProductId()) {
				isExists = true;
				item.setQuanlity(item.getQuanlity() + newItem.getQuanlity());
			}
		}

		// N???u s???n ph???m ch??a c?? trong gi??? h??ng
		if (!isExists) {
			ProductsEntity productInDb = productService.findById(newItem.getProductId());

			newItem.setProductName(productInDb.getTitle());
			newItem.setPriceUnit(productInDb.getPrice());
			newItem.setProductImage(productInDb.getAvatar());
			cart.getCartItems().add(newItem);
		}
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		ProductsEntity productInDb = productService.findById(newItem.getProductId());
		if(productInDb.getSoLuongTon() < newItem.getQuanlity()) {
			jsonResult.put("message", "L???i s??? l?????ng b???n ch???n nhi???u h??n s??? l?????ng c??n l???i!");
			session.setAttribute("cart", null);
			return ResponseEntity.ok(jsonResult);
		}

		// Tr??? k???t qu???
//		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", getTotalItems(request));
		jsonResult.put("message", "Th??m v??o gi??? h??ng th??nh c??ng!");
		session.setAttribute("totalItems", getTotalItems(request));
		return ResponseEntity.ok(jsonResult);
	}

	@RequestMapping(value = { "/cart-delete" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> deleteItemInCart(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response, @RequestBody CartItem cartItem) {
		HttpSession httpSession = request.getSession();

		Cart cart = (Cart) httpSession.getAttribute("cart");

		List<CartItem> cartItems = cart.getCartItems();
		Double totalPrice = 0d;

		for (int i = 0; i < cartItems.size(); i++) {
			if (cartItems.get(i).getProductId() == cartItem.getProductId()) {
				cartItems.remove(i);
				break;
			}
		}
		for (CartItem item : cartItems) {
			totalPrice += item.getPriceUnit().doubleValue();
		}

		httpSession.setAttribute("totalItems", getTotalItems(request));
		httpSession.setAttribute("totalPrice", totalPrice);
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", getTotalItems(request));
		return ResponseEntity.ok(jsonResult);
	}

}
