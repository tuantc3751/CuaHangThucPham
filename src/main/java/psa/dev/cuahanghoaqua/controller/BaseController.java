package psa.dev.cuahanghoaqua.controller;

import java.math.BigInteger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;

import psa.dev.cuahanghoaqua.dto.Cart;
import psa.dev.cuahanghoaqua.model.User;


@Controller
public class BaseController {
	
	@ModelAttribute("totalCartProducts")
	public BigInteger totalCartProducts(final HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("cart") == null) {
			return BigInteger.ZERO;
		}
		//Có giỏ hàng
		Cart cart = (Cart)session.getAttribute("cart");
		return cart.totalCartProduct();
	}
	
	
	//Lấy thông tin của user đăng nhập
	@ModelAttribute("loginedUser")
	public User getLoginedUser() {
		Object loginedUser = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(loginedUser != null && loginedUser instanceof UserDetails ) {
			User user = (User) loginedUser;
			return user;
		}
		return new User();
	}
	
	//Kiểm tra đã login hay chưa
	@ModelAttribute("isLogined")
	public boolean isLogined() {
		Object loginedUser = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(loginedUser != null && loginedUser instanceof UserDetails ) {
			return true;
		}
		return false;
	}
}
