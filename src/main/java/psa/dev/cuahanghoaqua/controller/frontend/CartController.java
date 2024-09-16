package psa.dev.cuahanghoaqua.controller.frontend;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import psa.dev.cuahanghoaqua.controller.BaseController;
import psa.dev.cuahanghoaqua.dto.Cart;
import psa.dev.cuahanghoaqua.dto.CartProduct;
import psa.dev.cuahanghoaqua.model.Product;
import psa.dev.cuahanghoaqua.model.SaleOrder;
import psa.dev.cuahanghoaqua.model.SaleOrderProduct;
import psa.dev.cuahanghoaqua.model.User;
import psa.dev.cuahanghoaqua.service.ProductService;
import psa.dev.cuahanghoaqua.service.SaleOrderService;

@Controller
public class CartController extends BaseController{
	@Autowired
	private ProductService productService;
	
	@Autowired
	private SaleOrderService saleOrderService;
	
	@RequestMapping(value ="/add-to-cart", method = RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> addToCart(
			final Model model, @RequestBody CartProduct cartProduct, final HttpServletRequest request){
		Map<String,Object> jsonResult = new HashMap<String, Object>();
		if(cartProduct.getQuantity().intValue() <= 0) jsonResult.put("message", "Số lượng không hợp lệ");
		else {
			//Sản phẩm hợp lệ, thêm vào giỏ hàng
			//Kiểm tra xem có giả hàng hay chưa?
			Cart cart = null;
			HttpSession session = request.getSession();
			if(session.getAttribute("cart") == null) {//Chưa tạo giỏ hàng
				cart = new Cart();
				session.setAttribute("cart", cart); //Tạo giỏ hàng mới cho khách
			}
			
			//Lấy giỏ hàng để xử lý
			cart = (Cart) session.getAttribute("cart");
			
			//Kiểm tra xem sản phẩm có trong gio hang hay chưa
			int index = cart.findProductById(cartProduct.getId());
			if(index != -1) {
				cart.getCartProducts().get(index).updateQuantity(cartProduct.getQuantity());
			}else {
				//Lấy sản phẩm trong db
				Product dbProduct = productService.getById(cartProduct.getId());
				cartProduct.setAvatar(dbProduct.getAvatar());
				cartProduct.setPrice(dbProduct.getPrice());
				cart.getCartProducts().add(cartProduct);
			}
			jsonResult.put("code", "200");
			jsonResult.put("message", "Đã thêm sản phẩm vào giỏ hàng");
			jsonResult.put("totalCartProducts", cart.totalCartProduct());
		}
		return ResponseEntity.ok(jsonResult);
	}
	
	@RequestMapping(value = "/cart-view", method = RequestMethod.GET)
	public String cartView(final Model model, final HttpServletRequest request){
		HttpSession session = request.getSession();
		if(session.getAttribute("cart") != null) {
			Cart cart = (Cart) session.getAttribute("cart");
			String message = "Có " + cart.getCartProducts().size() + " loại sản phẩm với tổng cộng" + cart.totalCartProduct() + " sản phẩm";
			model.addAttribute("message", message);
			
			BigDecimal totalCartPrice = cart.totalCartPrice();
			model.addAttribute("totalCartPrice", totalCartPrice);
			
		}
		return "frontend/cart";
	}
	
	public StringBuilder toCurrency(BigDecimal num) {
		StringBuilder str = new StringBuilder(""+ num.longValue());
		int i = str.length();
		int j = 0;
		while(i > 1) {
			i--;
			j++;
			if(j % 3 == 0) {
				str.insert(i,',' );
			}
		}
		return str;
	}
	
	@RequestMapping(value = "/update-product-quantity", method = RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> updateProductQuantity(
			final Model model, @RequestBody CartProduct cartProduct, final HttpServletRequest request){
		Map<String,Object> jsonResult = new HashMap<String, Object>();
		HttpSession session = request.getSession();
		if(session.getAttribute("cart") != null) {
			Cart cart = (Cart) session.getAttribute("cart");
			int index = cart.findProductById(cartProduct.getId());
			if(index != -1) {
				//Kiểm tra trường hợp bấm nút - (giảm)
				if(cartProduct.getQuantity().intValue() == -1) {
					if(cart.getCartProducts().get(index).getQuantity().intValue() > 1) {
						cart.getCartProducts().get(index).updateQuantity(cartProduct.getQuantity());
					}
				}else {
					//Bam nut +
					cart.getCartProducts().get(index).updateQuantity(cartProduct.getQuantity());
				}
				jsonResult.put("newQuantity", cart.getCartProducts().get(index).getQuantity());
				jsonResult.put("totalPrice", toCurrency(cart.getCartProducts().get(index).totalPrice()));
				jsonResult.put("totalCartProducts", cart.totalCartProduct());
				jsonResult.put("totalCartPrice", toCurrency(cart.totalCartPrice()) );
				jsonResult.put("productId", cartProduct.getId());
			}
		}
		
		return ResponseEntity.ok(jsonResult);
	}
	
	@RequestMapping(value = "/deleteCartProduct", method = RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> deleteCartProduct(
			@RequestBody Map<String, Object> requestBody, final HttpServletRequest request){
		Map<String,Object> jsonResult = new HashMap<String, Object>();
		
		Integer cartProductId = (Integer)requestBody.get("cartProductId");
		HttpSession session = request.getSession();
		if(session.getAttribute("cart") != null) {
			Cart cart = (Cart) session.getAttribute("cart");
			int index = cart.findProductById(cartProductId);
			//Nếu có trong giỏ hàng
			if(index != -1) {
				cart.getCartProducts().remove(index);
			}
		}
		
		return ResponseEntity.ok(jsonResult);
	}
	
	@RequestMapping(value = "/place-order", method = RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> placeOrder(
			@RequestBody User user, final HttpServletRequest request){
		Map<String,Object> jsonResult = new HashMap<String, Object>();
		String regex = "^(\\+84|0)(3[2-9]|5[6|8|9]|7[0|6-9]|8[1-5]|9[0-9])[0-9]{7}$";
		String mobile = user.getMobile().trim();
		
		if(user.getName().trim() == null || user.getName().trim().length() <= 0) {
			jsonResult.put("message", "Bạn chưa nhập tên");
			jsonResult.put("code", "404");
		}else if(mobile == null || mobile.isEmpty() || !mobile.matches(regex)) {
			jsonResult.put("message", "Bạn chưa nhập đúng số điện thoại");
			jsonResult.put("code", "404");
		}else if(user.getAddress() == null || user.getAddress() == "" ) {
			jsonResult.put("message", "Bạn chưa nhập địa chỉ");
			jsonResult.put("code", "404");
		}else {
			//Lấy giỏ hàng
			HttpSession session = request.getSession();
			if(session.getAttribute("cart") == null) {
				jsonResult.put("message", "Bạn chưa có giỏ hàng");
			}else {
				Cart cart = (Cart)session.getAttribute("cart");
				SaleOrder saleOrder = new SaleOrder();
				for(CartProduct cartProduct : cart.getCartProducts()) {
					//Lấy sản phẩm trong db
					Product product = productService.getById(cartProduct.getId());
					SaleOrderProduct saleOrderProduct = new SaleOrderProduct();
					saleOrderProduct.setProduct(product);
					saleOrderProduct.setQuantity(cartProduct.getQuantity().intValue());
					saleOrderProduct.setProductName(product.getName());
					saleOrder.addRelationalSaleOrderProduct(saleOrderProduct);
				}
				
				//Lưu đơn hàng vào db
				Calendar cal = Calendar.getInstance();
				String code = user.getMobile() + cal.get(Calendar.YEAR) +
						cal.get(Calendar.MONTH) + cal.get(Calendar.DATE) + 
						cal.get(Calendar.HOUR) + cal.get(Calendar.MINUTE) +
						cal.get(Calendar.SECOND);
				saleOrder.setCode(code);
				
				user.setId(1);
				saleOrder.setUser(user);
				saleOrder.setCreateDate(new Date());
				saleOrder.setCustomerName(user.getName());
				saleOrder.setCustomerMobile(user.getMobile());
				saleOrder.setCustomerEmail(user.getEmail());
				saleOrder.setCustomerAddress(user.getAddress());
				saleOrder.setTotal(cart.totalCartPrice().add(new BigDecimal(50000)));
				saleOrderService.saveOrder(saleOrder);
				jsonResult.put("message", "Giỏ hàng của bạn đã được lưu");
				jsonResult.put("code", "200");
				
				//Xóa giỏ hàng
				cart = new Cart();
				session.setAttribute("cart", cart);				
			}
		}
		
		return ResponseEntity.ok(jsonResult);
	}
}
