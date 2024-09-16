package psa.dev.cuahanghoaqua.controller.frontend;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.activation.CommandMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import psa.dev.cuahanghoaqua.controller.BaseController;
import psa.dev.cuahanghoaqua.dto.Jw29Contant;
import psa.dev.cuahanghoaqua.dto.SearchModel;
import psa.dev.cuahanghoaqua.service.CategoryService;
import psa.dev.cuahanghoaqua.service.CommentService;
import psa.dev.cuahanghoaqua.service.ProductImageService;
import psa.dev.cuahanghoaqua.service.ProductService;
import psa.dev.cuahanghoaqua.service.UserService;
import psa.dev.cuahanghoaqua.model.Category;
import psa.dev.cuahanghoaqua.model.Comment;
import psa.dev.cuahanghoaqua.model.Product;
import psa.dev.cuahanghoaqua.model.ProductImage;
import psa.dev.cuahanghoaqua.model.User;

@Controller
public class HomeController extends BaseController{
	@Autowired
	ProductService productService;
	
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	ProductImageService productImageService;
	
	@Autowired
	CommentService commentService;
	
	@Autowired
	UserService userService;
	
	//Action method cho index view
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String home(final Model model) {
		List<Product> products = productService.findAllActive();
		List<Product> lstBestsellerProduct = productService.findBestsellerProduct();
		List<Category> categories = categoryService.findAllActive();
		List<Comment> comments = commentService.findAll();
		
		
		model.addAttribute("products", products);
		model.addAttribute("lstBestsellerProduct", lstBestsellerProduct);
		model.addAttribute("categories", categories);
		model.addAttribute("comments", comments);
		return "frontend/index";
	}
	
	//Action method cho prouduct-detail view
	@RequestMapping(value ="/product-detail/{productId}", method = RequestMethod.GET)
	public String productDetail(final Model model, @PathVariable("productId") int productId) {
		//Lấy sản phẩm trong db
		Product product = productService.getById(productId);
		List<ProductImage> productImages = productImageService.getImageByProductId(productId);
		List<Category> categories = categoryService.findAllActive();
		List<Comment> comments = commentService.findAll();
		comments = comments.stream()
            .filter(comment -> comment.getProduct().getId() == productId)
            .collect(Collectors.toList());
		List<Product> lstProduct = productService.findAllActive();
		List<Product> lstProductHot = lstProduct.stream()
	            .filter(productItem -> productItem.getIsHot() == true)
	            .collect(Collectors.toList());
		
		model.addAttribute("product", product);
		model.addAttribute("productImages", productImages);
		model.addAttribute("categories", categories);
		model.addAttribute("comments", comments);
		model.addAttribute("lstProductHot", lstProductHot);
		return "frontend/product-detail";
	}
	
	//Xử lý khi người dùng nhấn post comment
	@RequestMapping(value ="/postComment", method = RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> postComment(final Model model,
			@RequestParam("name") String name,
	        @RequestParam("email") String email,
	        @RequestParam("content") String content,
	        @RequestParam("ratingValue") int ratingValue,
	        @RequestParam("productId") int productId,
	        @RequestParam("userId") int userId) {
		Map<String,Object> jsonResult = new HashMap<String, Object>();
		
		Comment comment = new Comment();
		comment.setCustomerName(name);
		comment.setCustomerEmail(email);
		comment.setContent(content);
		comment.setStar(ratingValue);
		comment.setProduct(productService.getById(productId));
		if(userId != 0) comment.setUserCreateComment(userService.getById(userId));
		comment.setCreateDate(new Date());
		
		commentService.saveOrUpdate(comment);
		//Lấy sản phẩm trong db
//		Product product = productService.getById(productId);
//		List<ProductImage> productImages = productImageService.getImageByProductId(productId);
//		List<Category> categories = categoryService.findAllActive();
//		
//		model.addAttribute("product", product);
//		model.addAttribute("productImages", productImages);
//		model.addAttribute("categories", categories);
		
		jsonResult.put("code", "200");
		jsonResult.put("message", "Gửi bình luận thành công");
//		jsonResult.put("message", "Đã thêm sản phẩm vào giỏ hàng");
//		jsonResult.put("totalCartProducts", cart.totalCartProduct());
		return ResponseEntity.ok(jsonResult);
	}
	
	//Action method cho prouduct-detail view
	@RequestMapping(value ="/shop", method = RequestMethod.GET)
	public String productDetail(final Model model) {
		//Lấy sản phẩm trong db
		List<Product> products = productService.findAllActive();
		List<Category> categories = categoryService.findAllActive();
		
//		SearchModel productSearch = new SearchModel();
		//Thông tin tìm kiếm theo status
//		productSearch.setStatus(2);  //Ban đầu luôn là all
//		String status = request.getParameter("status");
//		if(!StringUtils.isEmpty(status)) {
//			productSearch.setStatus(Integer.parseInt(status));
//		}
//		
//		//Thông tin tìm kiếm theo category
//		productSearch.setCategoryId(0); //Tất cả
//		String categoryId = request.getParameter("categoryId");
//		if(!StringUtils.isEmpty(categoryId)) {
//			productSearch.setCategoryId(Integer.parseInt(categoryId));
//		}
//		
//		//Thông tin tìm kiếm theo keyword
//		productSearch.setKeyword(null); //Tất cả
//		String keyword = request.getParameter("keyword");
//		if(keyword != null && !StringUtils.isEmpty(keyword)) {
//			productSearch.setKeyword(keyword);
//		}
//		
//		//Thông tin tìm kiếm theo keyword
//		productSearch.setBeginDate(null); //Tất cả
//		productSearch.setEndDate(null);
//		String beginDate = request.getParameter("beginDate");
//		String endDate = request.getParameter("endDate");
//		if(beginDate != null && endDate != null && !StringUtils.isEmpty(endDate) && !StringUtils.isEmpty(endDate)) {
//			productSearch.setBeginDate(beginDate);
//			productSearch.setEndDate(endDate);
//		}
		
//		List<Product> allProducts = products;
//		int SIZE_OF_PAGE = 3;
//		
//		//Xử lý phân trang
//		productSearch.setTotalItems(allProducts.size());
//		productSearch.setCurrentPage(1); //Ban đầu luôn là 1
//		//Kiểm tra xem có bấm nút phân trang không
//		if(!StringUtils.isEmpty(request.getParameter("currentPage"))){
//			productSearch.setCurrentPage(Integer.parseInt(request.getParameter("currentPage")));
//		}
//		//So ban ghi tren mot trang
//		productSearch.setSizeOfPage(SIZE_OF_PAGE);
//		//Tong so trang
//		int totalPages = allProducts.size() / SIZE_OF_PAGE;
//		if(allProducts.size() % SIZE_OF_PAGE != 0) totalPages++;
//		productSearch.setTotalPages(totalPages);
//		//Lấy danh sách trang hiện tại để hiển thị
//		int firstIndex = (productSearch.getCurrentPage() -1 ) * SIZE_OF_PAGE;
//		int lastIndex = firstIndex + SIZE_OF_PAGE;
//		if(lastIndex > allProducts.size()) lastIndex= allProducts.size();
//		List<Product> products1 = allProducts.subList(firstIndex, lastIndex);
//		
		model.addAttribute("products", products);
		model.addAttribute("categories", categories);
		return "frontend/shop";
	}
	
//	@RequestMapping(value ="/products-by-category", method = RequestMethod.GET)
	@GetMapping("/products-by-category")
	public ResponseEntity<Map<String, Object>> getProductsByCategory(@RequestParam("id") int categoryId,
			@RequestParam("price") int price,
	        @RequestParam("sort") int sort,
	        @RequestParam("currentPage") int currentPage) {
		Map<String,Object> jsonResult = new HashMap<String, Object>();
		List<Product> products = productService.findAllActive();
		
		// Lọc theo giá trị categoryId và price 
	    products = products.stream()
	            .filter(product -> (categoryId == 0 || product.getCategory().getId() == categoryId)
	            		&& product.getPrice().compareTo(BigDecimal.valueOf(price)) > 0)
	            .collect(Collectors.toList());

	    // Sắp xếp nếu sort != 0
	    if (sort == 1) {
	        products.sort(Comparator.comparing(Product::getName));
	    } else if (sort == 2) {
	        products.sort(Comparator.comparing(Product::getPrice));
	    }
	    
	    
		//Xử lý phân trang
	    int SIZE_OF_PAGE = 5;
	    SearchModel productSearch = new SearchModel();
		productSearch.setTotalItems(products.size());
		productSearch.setCurrentPage(1); //Ban đầu luôn là 1
		//Kiểm tra xem có bấm nút phân trang không
//		if(!StringUtils.isEmpty(request.getParameter("currentPage"))){
//			productSearch.setCurrentPage(Integer.parseInt(request.getParameter("currentPage")));
//		}
		if(currentPage > 0) productSearch.setCurrentPage(currentPage); 
		//So ban ghi tren mot trang
		productSearch.setSizeOfPage(SIZE_OF_PAGE);
		
		//Tong so trang
		int totalPages = products.size() / SIZE_OF_PAGE;
		if(products.size() % SIZE_OF_PAGE != 0) totalPages++;
		productSearch.setTotalPages(totalPages);
		
		//Lấy danh sách trang hiện tại để hiển thị
		int firstIndex = (productSearch.getCurrentPage() -1 ) * SIZE_OF_PAGE;
		int lastIndex = firstIndex + SIZE_OF_PAGE;
		if(lastIndex > products.size()) lastIndex= products.size();
		List<Product> resLstProduct = products.subList(firstIndex, lastIndex);
	    
		
		//Khởi tạo giá trị trả về
		List<Map<String, Object>> data = new ArrayList<>();
        for (int i = 0; i < resLstProduct.size(); i++) {
            Map<String, Object> row = new HashMap<>();
            Product rowProduct = resLstProduct.get(i);
            row.put("id", rowProduct.getId());
            row.put("category", rowProduct.getCategory().getName());
            row.put("name", rowProduct.getName());
            row.put("price", rowProduct.getPrice());
            row.put("salePrice", rowProduct.getSalePrice());
            row.put("avatar", rowProduct.getAvatar());
            row.put("shortDescription", rowProduct.getShortDescription());
            row.put("detailDescription", rowProduct.getDetailDescription());
            
            User userCreateProduct = rowProduct.getUserCreateProduct();
            row.put("userCreateProduct", userCreateProduct != null ? userCreateProduct.getUsername() : null);
            User userUpdateProduct = rowProduct.getUserUpdateProduct();
            row.put("userUpdateProduct", userUpdateProduct != null ? userUpdateProduct.getUsername() : null);
            row.put("createDate", rowProduct.getCreateDate());
            row.put("updateDate", rowProduct.getUpdateDate());
            row.put("status", rowProduct.getStatus());
            row.put("isHot", rowProduct.getIsHot());
            row.put("seo", rowProduct.getSeo());
            data.add(row);
        }
		
		jsonResult.put("code", "200");
		jsonResult.put("products", data);
		jsonResult.put("productSearch", productSearch);
	    return ResponseEntity.ok(jsonResult);
	}
	
	@RequestMapping(value = "/admin/index", method = RequestMethod.GET)
	public String homeBackend() {
		return "backend/index";
	}
}
