
package com.example.Shop.controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.example.Shop.entities.ContactEntity;
import com.example.Shop.service.impl.ContactService;

import antlr.StringUtils;




@Controller
public class ContactController extends BaseController {
	
	@Autowired
	private ContactService contactService;
	@RequestMapping(value = { "/contact" }, method = RequestMethod.GET) // -> action
	public String contact(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response){
		
		
		
		model.addAttribute("contact",new ContactEntity());
		
		// cac views se duoc dat tai thu muc: 
		return "user/contact"; // -> duong dan toi VIEW.
	}
	public static final Pattern VALID_EMAIL_ADDRESS_REGEX = 
		    Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$", Pattern.CASE_INSENSITIVE);

	
	@RequestMapping(value = { "/contact" }, method = RequestMethod.POST) // -> action
	public String saveContact(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			final @ModelAttribute("contact") ContactEntity contact)
			throws IOException {
		//b1: lay thong tin nguoi dung day len
		String firstName = contact.getFirstName();
		String lastName = contact.getLastName();
		
		if(contact.getFirstName().equals("")) {
			model.addAttribute("thongbao", "First name không được để trống");
			return "user/contact";
		}
		
		if(contact.getLastName().equals("")) {
			model.addAttribute("thongbao", "Last name không được để trống");
			return "user/contact";
		}
		
		if(contact.getEmail().equals("")) {
			model.addAttribute("thongbao", "Email không được để trống");
			return "user/contact";
		}
		
		if(!contact.getEmail().equals("")){
			Matcher matcher = VALID_EMAIL_ADDRESS_REGEX.matcher(contact.getEmail());
	        if(!matcher.find()) {
	        	model.addAttribute("thongbao", "Email không đúng định dạng");
				return "user/contact";
	        }
			
		}
		
		if(contact.getRequestType().equals("")) {
			model.addAttribute("thongbao", "Tiêu đề không được để trống");
			return "user/contact";
		}
		
		
		
		if(contact.getMessage().equals("")) {
			model.addAttribute("thongbao", "Nội dung không được để trống");
			return "user/contact";
		}
		
		
			contactService.save(contact);
			//b3: thong bao cho nguoi dung biet da luu thanh cong
			model.addAttribute("thongbao", "Cảm ơn bạn "+firstName + " "+lastName + " đã gửi liên hệ!");
		
		//return "WEB-INF/views/user/home.jsp";
		return "user/contact"; // -> duong dan toi VIEW.
	}
}
