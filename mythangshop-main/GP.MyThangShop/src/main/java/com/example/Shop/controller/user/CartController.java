package com.example.Shop.controller.user;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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

	@RequestMapping(value = { "/cart/finish" }, method = RequestMethod.POST) // -> action
	public String checkoutViewpost(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {

		model.addAttribute("totalprice", this.getTotalPrice(request));

		// Lấy thông tin khách hàng
		String customerName = request.getParameter("customerName");
		String customerAddress = request.getParameter("customerAddress");
		String customerPhone = request.getParameter("customerPhone");
		String customerEmail = request.getParameter("customerEmail");

		// Tạo hóa đơn
		SaleOrderEntity saleOrderEntity = new SaleOrderEntity();
		saleOrderEntity.setCode(String.valueOf(System.currentTimeMillis()));
		saleOrderEntity.setCustomerName(customerName);
		saleOrderEntity.setCustomerAddress(customerAddress);
		saleOrderEntity.setCustomerPhone(customerPhone);
		saleOrderEntity.setCustomerEmail(customerEmail);
		if(isLogined()) {
			saleOrderEntity.setUser(getUserLogined());
		}
		

		// Lấy thông tin giỏ hàng
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		for (CartItem cartItem : cart.getCartItems()) {
			SaleOrderProductsEntity saleOrderProductsEntity = new SaleOrderProductsEntity();
			saleOrderProductsEntity.setProduct(productService.findById(cartItem.getProductId()));
			saleOrderProductsEntity.setQuality(cartItem.getQuanlity());
			saleOrderEntity.addRelationProduct(saleOrderProductsEntity);
		}

		// Lưu vào CSDL
		saleorderService.saveSaleOder(saleOrderEntity);

		// Xóa dữ liệu giỏ hàng trong secction
		model.addAttribute("thongbao", "Cảm ơn bạn đã mua hàng");
		session.setAttribute("cart", null);

		return "user/checkout"; // -> duong dan toi VIEW.
	}

	@RequestMapping(value = { "/cart/view" }, method = RequestMethod.GET) // -> action
	public String cartView(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {

		model.addAttribute("totalprice", this.getTotalPrice(request));

		// Lấy danh sách categories
		List<CategoryEntity> categories = categoriesService.findAll();

		// Đẩy xuống tầng view
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

		// Section tương tự như kiểu map và được lưu trên main memory
		HttpSession session = request.getSession();

		// Lấy thông tin giỏ hàng
		Cart cart = null;
		if (session.getAttribute("cart") != null) {
			cart = (Cart) session.getAttribute("cart");
		} else {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}

		// Lấy danh sách sản phẩm có trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();

		// Kiểm tra nếu có trong giỏ hàng thì tăng số lượng
		boolean isExists = false;
		for (CartItem item : cartItems) {
			if (item.getProductId() == newItem.getProductId()) {
				isExists = true;
				item.setQuanlity(item.getQuanlity() + newItem.getQuanlity());
			}
		}

		// Nếu sản phẩm chưa có trong giỏ hàng
		if (!isExists) {
			ProductsEntity productInDb = productService.findById(newItem.getProductId());

			newItem.setProductName(productInDb.getTitle());
			newItem.setPriceUnit(productInDb.getPrice());
			newItem.setProductImage(productInDb.getAvatar());
			cart.getCartItems().add(newItem);
		}

		// Trả kết quả
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", getTotalItems(request));
		jsonResult.put("message", "Thêm vào giỏ hàng thành công!");
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
