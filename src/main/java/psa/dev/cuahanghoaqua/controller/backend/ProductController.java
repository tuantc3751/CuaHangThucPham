package psa.dev.cuahanghoaqua.controller.backend;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.text.Normalizer;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import psa.dev.cuahanghoaqua.controller.BaseController;
import psa.dev.cuahanghoaqua.dto.Jw29Contant;
import psa.dev.cuahanghoaqua.dto.SearchModel;
import psa.dev.cuahanghoaqua.model.Category;
import psa.dev.cuahanghoaqua.model.Product;
import psa.dev.cuahanghoaqua.model.User;
import psa.dev.cuahanghoaqua.service.CategoryService;
import psa.dev.cuahanghoaqua.service.ProductImageService;
import psa.dev.cuahanghoaqua.service.ProductService;
import psa.dev.cuahanghoaqua.service.UserService;

@Controller
@RequestMapping("/admin/product/")
public class ProductController extends BaseController implements Jw29Contant{
	//Khai báo service
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ProductService productService;

	@Autowired
	private ProductImageService productImageService;
	
	//Test datatable có sử dụng paging
	@GetMapping("data")
    public ResponseEntity<Map<String, Object>> getData(
            @RequestParam("draw") int draw,
            @RequestParam("start") int start,
            @RequestParam("length") int length,
            @RequestParam("categoryId") int categoryId,
            @RequestParam("statusId") int statusId,
            @RequestParam(value = "beginDate", required = false) String beginDate,
            @RequestParam(value = "endDate", required = false) String endDate,
            @RequestParam(value = "order[0][column]" , required = false) Integer column,
            @RequestParam(value = "order[0][dir]" , required = false) String dir,
            @RequestParam(value = "search[value]") String search) {
		List<Product> products = productService.findAll();
		
		// Chuẩn hóa chuỗi tìm kiếm thành chữ thường và loại bỏ dấu
        String searchLower = normalize(search).toLowerCase();
        
        // Chuyển đổi chuỗi ngày tháng thành LocalDate
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        final LocalDate beginDateParsed = (beginDate != null && !beginDate.isEmpty()) ? LocalDate.parse(beginDate, formatter) : null;
        final LocalDate endDateParsed = (endDate != null && !endDate.isEmpty()) ? LocalDate.parse(endDate, formatter) : null;
        
        // Lọc sản phẩm dựa trên giá trị tìm kiếm
        products = products.stream()
        	.filter(p -> categoryId == 0 || p.getCategory().getId() == categoryId)
            .filter(p -> (p.getName() != null && normalize(p.getName()).toLowerCase().contains(searchLower)) ||
                         (p.getSeo() != null && normalize(p.getSeo()).toLowerCase().contains(searchLower)))
            .filter(p -> statusId == 0 || 
			            (statusId == 1 && p.getStatus() == true) || 
			            (statusId == 2 && p.getStatus() == false))
            .filter(p -> {
            	if (p.getCreateDate() == null) {
                    return true; // Bỏ qua lọc nếu getCreateDate là null
                }
                LocalDate productDate = p.getCreateDate().toInstant().atZone(ZoneId.systemDefault())
                                           .toLocalDate();
                return (beginDateParsed == null || !productDate.isBefore(beginDateParsed)) &&
                       (endDateParsed == null || !productDate.isAfter(endDateParsed));
            })
            .collect(Collectors.toList());
		
	    if (column != null && dir != null) {        
			// Chuyển đổi chỉ số cột thành tên thuộc tính sản phẩm
		    String sortColumn;
		    switch (column) {
		        case 0: sortColumn = "stt"; break;
		        case 1: sortColumn = "id"; break;
		        case 2: sortColumn = "category"; break;
		        case 3: sortColumn = "name"; break;
		        case 4: sortColumn = "price"; break;
		        case 5: sortColumn = "salePrice"; break;
		        case 6: sortColumn = "avatar"; break;
		        case 7: sortColumn = "shortDescription"; break;
		        case 8: sortColumn = "detailDescription"; break;
		        case 9: sortColumn = "userCreateProduct"; break;
		        case 10: sortColumn = "userUpdateProduct"; break;
		        case 11: sortColumn = "createDate"; break;
		        case 12: sortColumn = "updateDate"; break;
		        case 13: sortColumn = "status"; break;
		        case 14: sortColumn = "isHot"; break;
		        case 15: sortColumn = "seo"; break;
		        case 16: sortColumn = "origin"; break;
		        case 17: sortColumn = "unknown"; break; // Nếu không có cột tương ứng
		        case 18: sortColumn = "STT"; break; // Chú ý cột này đã được đổi tên
		        default: sortColumn = "name"; // Cột mặc định
		    }

		    // Sắp xếp theo hướng tăng dần hoặc giảm dần
		    boolean ascending = "asc".equalsIgnoreCase(dir);		    
		    
		    // Sắp xếp sản phẩm theo cột và hướng đã chọn
		    products.sort((p1, p2) -> {
		        int comparison = 0;
		        switch (sortColumn) {
		        case "stt":
		        case "id":
		            comparison = Integer.compare(p1.getId(), p2.getId());
		            break;
		        case "category":
		            comparison = compareNullable(p1.getCategory() != null ? p1.getCategory().getId() : null, 
		                                         p2.getCategory() != null ? p2.getCategory().getId() : null);
		            break;
		        case "name":
		            comparison = compareNullable(p1.getName(), p2.getName());
		            break;
		        case "price":
		            comparison = compareNullable(p1.getPrice(), p2.getPrice());
		            break;
		        case "salePrice":
		            comparison = compareNullable(p1.getSalePrice(), p2.getSalePrice());
		            break;
		        case "avatar":
		            comparison = compareNullable(p1.getAvatar(), p2.getAvatar());
		            break;
		        case "shortDescription":
		            comparison = compareNullable(p1.getShortDescription(), p2.getShortDescription());
		            break;
		        case "detailDescription":
		            comparison = compareNullable(p1.getDetailDescription(), p2.getDetailDescription());
		            break;
		        case "userCreateProduct":
		            comparison = compareNullable(p1.getUserCreateProduct() != null ? p1.getUserCreateProduct().getUsername() : null,
		                                         p2.getUserCreateProduct() != null ? p2.getUserCreateProduct().getUsername() : null);
		            break;
		        case "userUpdateProduct":
		            comparison = compareNullable(p1.getUserUpdateProduct() != null ? p1.getUserUpdateProduct().getUsername() : null,
		                                         p2.getUserUpdateProduct() != null ? p2.getUserUpdateProduct().getUsername() : null);
		            break;
		        case "createDate":
		            comparison = compareNullable(p1.getCreateDate(), p2.getCreateDate());
		            break;
		        case "updateDate":
		            comparison = compareNullable(p1.getUpdateDate(), p2.getUpdateDate());
		            break;
		        case "status":
		            comparison = compareNullable(p1.getStatus(), p2.getStatus());
		            break;
		        case "isHot":
		        	Boolean isHot1 = p1.getIsHot();
		            Boolean isHot2 = p2.getIsHot();
		            comparison = compareNullable(isHot1, isHot2);
		            break;
		        case "seo":
		            comparison = compareNullable(p1.getSeo(), p2.getSeo());
		            break;
		        case "origin":
		            comparison = compareNullable(p1.getOrigin(), p2.getOrigin());
		            break;
		        case "STT":
		            comparison = Integer.compare(p1.getId(), p2.getId()); // Sử dụng ID để so sánh cho STT
		            break;
		    }
		    return ascending ? comparison : -comparison;
		    });
	    }

		int stt= start+1;
		
        // Tạo dữ liệu giả
        List<Map<String, Object>> data = new ArrayList<>();
        
        int end = Math.min(start + length, products.size()); 
        for (int i = start; i < end; i++) {
            Map<String, Object> row = new HashMap<>();
            Product rowProduct = products.get(i);
            row.put("stt", stt++);
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
            row.put("origin", rowProduct.getOrigin());
            row.put("STT", i);
            data.add(row);
        }

        // Tạo kết quả trả về
        Map<String, Object> result = new HashMap<>();
        result.put("draw", draw);
        result.put("recordsTotal", products.size()); // Tổng số bản ghi
        result.put("recordsFiltered", products.size()); // Tổng số bản ghi sau khi lọc
        result.put("data", data);
        result.put("categoryId", categoryId);
        return ResponseEntity.ok(result);    
    }
	
	private String normalize(String text) {
        if (text == null) return null;
        String normalized = Normalizer.normalize(text, Normalizer.Form.NFD);
        return normalized.replaceAll("\\p{M}", ""); // Loại bỏ các dấu
    }
	
	private <T extends Comparable<T>> int compareNullable(T a, T b) {
	    if (a == null && b == null) return 0;
	    if (a == null) return 1; // null values go to the end
	    if (b == null) return -1; // null values go to the end
	    return a.compareTo(b);
	}
	
	
	//Test datatable có sử dụng paging với dataDEmo
	@GetMapping("dataDemo")
    public ResponseEntity<Map<String, Object>> getData1(
            @RequestParam("draw") int draw,
            @RequestParam("start") int start,
            @RequestParam("length") int length) {
		
		// Tạo danh sách các đối tượng để trả về
        List<Map<String, String>> data = new ArrayList<>();
        
     // Danh sách dữ liệu mẫu
        String[][] sampleData = {
            {"Tiger Nixon", "System Architect", "Edinburgh", "5421", "2011-04-25", "$320,800"},
            {"Garrett Winters", "Accountant", "Tokyo", "8422", "2011-07-25", "$170,750"},
            {"Ashton Cox", "Junior Technical Author", "San Francisco", "1562", "2009-01-12", "$86,000"},
            {"Cedric Kelly", "Senior Javascript Developer", "Edinburgh", "6224", "2012-03-29", "$433,060"},
            {"Airi Satou", "Accountant", "Tokyo", "5407", "2008-11-28", "$162,700"},
            {"Brielle Williamson", "Integration Specialist", "New York", "4804", "2012-12-02", "$372,000"},
            {"Herrod Chandler", "Sales Assistant", "San Francisco", "9608", "2012-08-06", "$137,500"},
            {"Rhona Davidson", "Integration Specialist", "Tokyo", "6200", "2010-10-14", "$327,900"},
            {"Colleen Hurst", "Javascript Developer", "San Francisco", "2360", "2009-09-15", "$205,500"},
            {"Sonya Frost", "Software Engineer", "Edinburgh", "1667", "2008-12-13", "$103,600"},
            {"Jena Gaines", "Office Manager", "London", "3814", "2009-03-11", "$90,560"},
            {"Quinn Flynn", "Support Lead", "Edinburgh", "9497", "2013-03-03", "$342,000"},
            {"Charde Marshall", "Regional Director", "San Francisco", "6741", "2008-10-16", "$470,600"},
            {"Haley Kennedy", "Senior Marketing Designer", "London", "3597", "2010-12-18", "$313,500"},
            {"Tatyana Fitzpatrick", "Regional Director", "London", "1965", "2011-03-17", "$385,750"},
            {"Michael Silva", "Marketing Designer", "London", "2015", "2012-11-27", "$198,500"},
            {"Paul Byrd", "Chief Financial Officer (CFO)", "New York", "3059", "2010-06-09", "$725,000"},
            {"Gloria Little", "Systems Administrator", "New York", "1721", "2009-04-10", "$237,500"},
            {"Bradley Greer", "Software Engineer", "London", "2552", "2012-10-13", "$132,000"},
            {"Diana Lawrence", "Marketing Coordinator", "New York", "3147", "2012-09-24", "$185,200"},
            {"Jason Daugherty", "System Architect", "San Francisco", "4543", "2013-05-14", "$279,700"},
            {"Donna Snider", "Customer Support", "New York", "4226", "2011-01-25", "$112,000"}
        };
        
     // Thêm dữ liệu vào danh sách
        for (int i = 0; i < sampleData.length; i++) {
            String[] item = sampleData[i];
            Map<String, String> entry = new HashMap<>();
            entry.put("id", String.valueOf(i + 1)); // Thêm ID nếu cần
            entry.put("name", item[0]);
            entry.put("position", item[1]);
            entry.put("office", item[2]);
            entry.put("extn", item[3]);
            entry.put("start_date", item[4]);
            entry.put("salary", item[5]);
            data.add(entry);
        }
        
        // Phân trang dữ liệu
        int end = Math.min(start + length, data.size());
        List<Map<String, String>> pagedData = data.subList(start, end);

        // Thay đổi các dữ liệu dưới đây để phù hợp với dữ liệu thực tế của bạn
//	        Map<String, String> item1 = new HashMap<>();
//	        item1.put("name", "Tiger Nixon");
//	        item1.put("position", "System Architect");
//	        item1.put("office", "Edinburgh");
//	        item1.put("extn", "5421");
//	        item1.put("start_date", "2011-04-25");
//	        item1.put("salary", "$320,800");
//	        data.add(item1);

        // Thêm các item khác vào danh sách data

        // Tạo map để chứa dữ liệu trả về
        Map<String, Object> response = new HashMap<>();
        response.put("draw", draw);
        response.put("recordsTotal", data.size()); 
        response.put("recordsFiltered", data.size()); 
        response.put("data", pagedData);

        return ResponseEntity.ok(response);
    }
	
	
	
	//Test datatable không dùng paging
	@GetMapping("data2")
    public ResponseEntity<Map<String, Object>> getData() {

        // Tạo dữ liệu giả
        List<Map<String, Object>> data = new ArrayList<>();
        for (int i = 1; i <= 1000000; i++) {
            Map<String, Object> row = new HashMap<>();
            row.put("id", i);
            row.put("name", "Name " + i);
            row.put("email", "email" + i + "@example.com");
            data.add(row);
        }

        // Tạo kết quả trả về
        Map<String, Object> result = new HashMap<>();
        result.put("data", data);

        return ResponseEntity.ok(result);
    }
    
	
	@RequestMapping(value ="view1",method= RequestMethod.GET)
	public String viewProduct1(final Model model,
			final HttpServletRequest request) {
		return "backend/product-list1"; 
	}
	
	@RequestMapping(value ="view2",method= RequestMethod.GET)
	public String viewProduct3(final Model model,
			final HttpServletRequest request) {
		return "backend/test"; 
	}
	
	//Datatable bình thường của template
	@RequestMapping(value ="datatable",method= RequestMethod.GET)
	public String viewProduct2(final Model model,
			final HttpServletRequest request) {
		return "backend/datatable"; 
	}
	
	//Test Datatable độ rộng của cột
	@RequestMapping(value ="testdt",method= RequestMethod.GET)
	public String dataTable(final Model model,
			final HttpServletRequest request) {
		return "backend/testDatatable"; 
	}
	
	@RequestMapping(value ="view",method= RequestMethod.GET)
	public String viewProduct(final Model model,
			final HttpServletRequest request) {
		List<Category> categories = categoryService.findAll();
		
		SearchModel productSearch = new SearchModel();
		//Thông tin tìm kiếm theo status
		productSearch.setStatus(2);  //Ban đầu luôn là all
		String status = request.getParameter("status");
		if(!StringUtils.isEmpty(status)) {
			productSearch.setStatus(Integer.parseInt(status));
		}
		
		//Thông tin tìm kiếm theo category
		productSearch.setCategoryId(0); //Tất cả
		String categoryId = request.getParameter("categoryId");
		if(!StringUtils.isEmpty(categoryId)) {
			productSearch.setCategoryId(Integer.parseInt(categoryId));
		}
		
		//Thông tin tìm kiếm theo keyword
		productSearch.setKeyword(null); //Tất cả
		String keyword = request.getParameter("keyword");
		if(keyword != null && !StringUtils.isEmpty(keyword)) {
			productSearch.setKeyword(keyword);
		}
		
		List<Product> products = productService.searchProduct(productSearch);
		model.addAttribute("products",products);
		model.addAttribute("productSearch",productSearch);
		model.addAttribute("categories",categories);
		return "backend/product-list"; 
	}
	
	@RequestMapping(value ="add",method= RequestMethod.GET)
	public String addProduct(final Model model) {
		List<User> users = userService.findAll();
		List<Category> categories = categoryService.findAllActive();
		Product product = new Product();
		product.setCreateDate(new Date());
		product.setUpdateDate(new Date());
		
		model.addAttribute("product",product);
		model.addAttribute("users",users);
		model.addAttribute("categories",categories);
		return "backend/product-add"; 
	}
	
	@RequestMapping(value ="add-save",method= RequestMethod.POST)
	public String saveAddProduct(final Model model, 
			@ModelAttribute("product") Product product,
			@RequestParam("avatarFile") MultipartFile avatarFile,
			@RequestParam("imageFiles") MultipartFile[] imageFiles) 
				throws IOException{
		productService.saveProduct(product, avatarFile, imageFiles);
		return "redirect:/admin/product/view"; 
	}
	
	@RequestMapping(value ="edit/{productId}",method= RequestMethod.GET)
	public String editCategories(final Model model,
			@PathVariable("productId") int productId) {
		Product product = productService.getById(productId);
		product.setUpdateDate(new Date());
		List<User> users = userService.findAll();
		List<Category> categories = categoryService.findAll();
		
		model.addAttribute("product",product);
		model.addAttribute("users",users);
		model.addAttribute("categories",categories);
		return "backend/product-edit"; 
	}
	
	@RequestMapping(value ="edit-save",method= RequestMethod.POST)
	public String saveEditProduct(final Model model, 
			@ModelAttribute("product") Product product,
			@RequestParam("avatarFile") MultipartFile avatarFile,
			@RequestParam("imageFiles") MultipartFile[] imageFiles) 
				throws IOException{
		productService.saveEditProduct(product, avatarFile, imageFiles);
		return "redirect:/admin/product/view"; 
	}
	
//	@RequestMapping(value ="delete/{productId}",method= RequestMethod.GET)
//	public String deleteProduct(final Model model, @PathVariable("productId") int productId) {
//		Product product = productService.getById(productId);
//		if(product.getAvatar() !=null && !product.getAvatar().isEmpty()) {
//			//Có avatar thì xóa file đi
//			String path = FOLDER_UPLOAD + product.getAvatar();
//			File file = new File(path);
//			file.delete();
//			//Xóa đường dẫn lưu trong db (không cần vì xóa luôn trong database)
//		}
//		
//		//Xóa các file ảnh trong thư mục Product/Image
//		List<ProductImage> productImages = productImageService.getImageByProductId(productId);
//		for(ProductImage productImage : productImages) {
//			String path = FOLDER_UPLOAD + productImage.getPath();
//			File file = new File(path);
//			file.delete();
//		}
//		
//		productService.delete(product);
//		return "redirect:/admin/product/view"; 
//	}
	 
	//Làm thêm cái inactive product
	@RequestMapping(value ="delete/{productId}",method= RequestMethod.GET)
	public String inactiveProduct(final Model model, @PathVariable("productId") int productId) {
		Product product = productService.getById(productId);
		product.setStatus(false);
		productService.saveOrUpdate(product);
		return "redirect:/admin/product/view"; 
	}
}
