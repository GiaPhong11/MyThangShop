package com.example.Shop.controller.API;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.yaml.snakeyaml.constructor.BaseConstructor;

import com.example.Shop.conf.PaypalPaymentIntent;
import com.example.Shop.conf.PaypalPaymentMethod;
import com.example.Shop.controller.user.BaseController;
import com.example.Shop.dto.Cart;
import com.example.Shop.dto.CartItem;
import com.example.Shop.entities.ProductsEntity;
import com.example.Shop.entities.SaleOrderEntity;
import com.example.Shop.entities.SaleOrderProductsEntity;
import com.example.Shop.service.IProductService;
import com.example.Shop.service.ISaleOderService;
import com.example.Shop.service.impl.PaypalService;
import com.example.Shop.util.Utils;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;
@Controller
public class PaymentController extends BaseController{
	public static final String URL_PAYPAL_SUCCESS = "pay/success";
	public static final String URL_PAYPAL_CANCEL = "pay/cancel";
	private Logger log = LoggerFactory.getLogger(getClass());
	@Autowired
	private PaypalService paypalService;
	
	@Autowired
	private IProductService productService;

	@Autowired
	private ISaleOderService saleorderService;


	@RequestMapping(value = { "/pay"  }, method = RequestMethod.POST,params = "thanh2")
	public String pay(HttpServletRequest request, final Model model) {
		String cancelUrl = Utils.getBaseURL(request) + "/" + URL_PAYPAL_CANCEL;
		String successUrl = Utils.getBaseURL(request) + "/" + URL_PAYPAL_SUCCESS;

		try {
			String customerName = request.getParameter("customerName");
			String customerAddress = request.getParameter("customerAddress");
			String customerPhone = request.getParameter("customerPhone");
			String customerEmail = request.getParameter("customerEmail");
			String price3 = request.getParameter("tongTien2");
			Double price2 = Double.parseDouble(price3);
			Payment payment = paypalService.createPayment(price2, "VND", PaypalPaymentMethod.paypal,
					PaypalPaymentIntent.sale, "payment description", cancelUrl, successUrl);
			// L???y th??ng tin kh??ch h??ng
			

			// T???o h??a ????n
			SaleOrderEntity saleOrderEntity = new SaleOrderEntity();
			saleOrderEntity.setCode(String.valueOf(System.currentTimeMillis()));
			saleOrderEntity.setCustomerName(customerName);
			saleOrderEntity.setCustomerAddress(customerAddress);
			saleOrderEntity.setCustomerPhone(customerPhone);
			saleOrderEntity.setCustomerEmail(customerEmail);
			saleOrderEntity.setCreatedDate(new Date(System.currentTimeMillis()));
			saleOrderEntity.setTinhTrang("???? thanh to??n");
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

			// L??u v??o CSDL
			if(flag) {
				model.addAttribute("thongbao", "L???i ????t h??ng do s??? l?????ng v?????t qu?? s??? l?????ng c??n c??");
				return "user/checkout";
			} else {
				saleorderService.saveSaleOder(saleOrderEntity);

				// X??a d??? li???u gi??? h??ng trong secction
				model.addAttribute("thongbao", "C???m ??n b???n ???? mua h??ng");
				session.setAttribute("cart", null);
				for (Links links : payment.getLinks()) {
					if (links.getRel().equals("approval_url")) {
						return "redirect:" + links.getHref();
					}
				}
			}
		} catch (PayPalRESTException e) {
			log.error(e.getMessage());
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "redirect:/index";
	}
	@GetMapping(URL_PAYPAL_CANCEL)
	public String cancelPay(){
		return "cancel";
	}
	@GetMapping(URL_PAYPAL_SUCCESS)
	public String successPay(@RequestParam("paymentId") String paymentId, @RequestParam("PayerID") String payerId){
		try {
			Payment payment = paypalService.executePayment(paymentId, payerId);
			if(payment.getState().equals("approved")){
				return "success";
			}
		} catch (PayPalRESTException e) {
			log.error(e.getMessage());
		}
		return "redirect:/index";
	}
}