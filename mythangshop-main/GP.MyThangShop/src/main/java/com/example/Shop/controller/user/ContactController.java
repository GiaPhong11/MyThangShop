
package com.example.Shop.controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.example.Shop.entities.ContactEntity;
import com.example.Shop.service.impl.ContactService;




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
	
	@RequestMapping(value = { "/contact" }, method = RequestMethod.POST) // -> action
	public String saveContact(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			final @ModelAttribute("contact") ContactEntity contact)
			throws IOException {
		//b1: lay thong tin nguoi dung day len
		String firstName = contact.getFirstName();
		String lastName = contact.getLastName();
		
		//TODO b2: luu thong tin vao csdl
		contactService.save(contact);
		//b3: thong bao cho nguoi dung biet da luu thanh cong
		model.addAttribute("thongbao", "Cảm ơn bạn "+firstName + " "+lastName + " đã gửi liên hệ!");
		
		//return "WEB-INF/views/user/home.jsp";
		return "user/contact"; // -> duong dan toi VIEW.
	}
}
