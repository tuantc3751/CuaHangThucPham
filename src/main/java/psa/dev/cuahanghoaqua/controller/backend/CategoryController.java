package psa.dev.cuahanghoaqua.controller.backend;

import java.text.Normalizer;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import psa.dev.cuahanghoaqua.controller.BaseController;
import psa.dev.cuahanghoaqua.model.Category;
import psa.dev.cuahanghoaqua.model.Product;
import psa.dev.cuahanghoaqua.model.User;
import psa.dev.cuahanghoaqua.service.CategoryService;
import psa.dev.cuahanghoaqua.service.UserService;

@Controller
@RequestMapping("/admin/category/")
public class CategoryController extends BaseController {
	// Khai báo service
	@Autowired
	private CategoryService categoryService;

	@Autowired
	private UserService userService;

	@RequestMapping(value ="getData",method= RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> viewCategory(
		@RequestParam("draw") int draw,
        @RequestParam("start") int start,
        @RequestParam("length") int length,
        @RequestParam("statusId") int statusId,
        @RequestParam(value = "beginDate", required = false) String beginDate,
        @RequestParam(value = "endDate", required = false) String endDate,
        @RequestParam(value = "order[0][column]" , required = false) Integer column,
        @RequestParam(value = "order[0][dir]" , required = false) String dir,
        @RequestParam(value = "search[value]") String search) {
		List<Category> categories = categoryService.findAll();
		
		// Chuẩn hóa chuỗi tìm kiếm thành chữ thường và loại bỏ dấu
        String searchLower = normalize(search).toLowerCase();
        
        // Chuyển đổi chuỗi ngày tháng thành LocalDate
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        final LocalDate beginDateParsed = (beginDate != null && !beginDate.isEmpty()) ? LocalDate.parse(beginDate, formatter) : null;
        final LocalDate endDateParsed = (endDate != null && !endDate.isEmpty()) ? LocalDate.parse(endDate, formatter) : null;
        
        // Lọc sản phẩm dựa trên giá trị tìm kiếm
        categories = categories.stream()
            .filter(p -> (p.getName() != null && normalize(p.getName()).toLowerCase().contains(searchLower)))
            .filter(p -> statusId == 0 || 
			            (statusId == 1 && p.getStatus() == true) || 
			            (statusId == 2 && p.getStatus() == false))
			.filter(p -> {
				if (p.getCreateDate() == null) {
                    return true; // Bỏ qua lọc nếu getCreateDate là null
                }
			    LocalDate productDate = p.getCreateDate().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
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
		        case 2: sortColumn = "name"; break;
		        case 3: sortColumn = "userCreateCategory"; break;
		        case 4: sortColumn = "userUpdateCategory"; break;
		        case 5: sortColumn = "createDate"; break;
		        case 6: sortColumn = "updateDate"; break;
		        case 7: sortColumn = "status"; break;
		        case 8: sortColumn = "description"; break;
		        default: sortColumn = "name"; // Cột mặc định
		    }

		    // Sắp xếp theo hướng tăng dần hoặc giảm dần
		    boolean ascending = "asc".equalsIgnoreCase(dir);		    
		    
		    //Sắp xếp sản phẩm theo cột và hướng đã chọn
		    categories.sort((p1, p2) -> {
		        int comparison = 0;
		        switch (sortColumn) {
		        case "stt":
		        case "id":
		            comparison = Integer.compare(p1.getId(), p2.getId());
		            break;
		        case "name":
		            comparison = compareNullable(p1.getName(), p2.getName());
		            break;
		        case "userCreateCategory":
		            comparison = compareNullable(p1.getUserCreateCategory() != null ? p1.getUserCreateCategory().getUsername() : null,
		                                         p2.getUserCreateCategory() != null ? p2.getUserCreateCategory().getUsername() : null);
		            break;
		        case "userUpdateCategory":
		            comparison = compareNullable(p1.getUserUpdateCategory() != null ? p1.getUserUpdateCategory().getUsername() : null,
		                                         p2.getUserUpdateCategory() != null ? p2.getUserUpdateCategory().getUsername() : null);
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
		        case "detailDescription":
		            comparison = compareNullable(p1.getDescription(), p2.getDescription());
		            break;    
		        }
		        return ascending ? comparison : -comparison;
		    });
	    }

		int stt= start+1;
        List<Map<String, Object>> data = new ArrayList<>();
        
        int end = Math.min(start + length, categories.size()); 
        for (int i = start; i < end; i++) {
            Map<String, Object> row = new HashMap<>();
            Category rowCategory = categories.get(i);
            row.put("stt", stt++);
            row.put("id", rowCategory.getId());
            row.put("name", rowCategory.getName());
            User userCreateCategory = rowCategory.getUserCreateCategory();
            row.put("userCreateCategory", userCreateCategory != null ? userCreateCategory.getUsername() : null);
            User userUpdateCategory = rowCategory.getUserUpdateCategory();
            row.put("createDate", rowCategory.getCreateDate());
            row.put("updateDate", rowCategory.getUpdateDate());
            row.put("userUpdateCategory", userUpdateCategory != null ? userUpdateCategory.getUsername() : null);
            row.put("status", rowCategory.getStatus());
            row.put("description", rowCategory.getDescription());
            data.add(row);
        }

        // Tạo kết quả trả về
        Map<String, Object> result = new HashMap<>();
        result.put("draw", draw);
        result.put("recordsTotal", categories.size()); // Tổng số bản ghi
        result.put("recordsFiltered", categories.size()); // Tổng số bản ghi sau khi lọc
        result.put("data", data);
        return ResponseEntity.ok(result);
	}

	private String normalize(String text) {
		if (text == null)
			return null;
		String normalized = Normalizer.normalize(text, Normalizer.Form.NFD);
		return normalized.replaceAll("\\p{M}", ""); // Loại bỏ các dấu
	}

	private <T extends Comparable<T>> int compareNullable(T a, T b) {
		if (a == null && b == null)
			return 0;
		if (a == null)
			return 1; // null values go to the end
		if (b == null)
			return -1; // null values go to the end
		return a.compareTo(b);
	}

	@RequestMapping(value ="view",method= RequestMethod.GET)
	public String viewCategory(final Model model) {
		List<Category> categories = new ArrayList<Category>();
		//categories = categoryService.findAll();
		categories = categoryService.findAllActive();
		model.addAttribute("categories",categories);
		return "backend/category-list"; 
	}

	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String addCategories(final Model model) {
		List<User> users = userService.findAll();
		Category category = new Category();
		category.setCreateDate(new Date());

		model.addAttribute("category", category);
		model.addAttribute("users", users);
		return "backend/category-add";
	}

	@RequestMapping(value = "add-save", method = RequestMethod.POST)
	public String saveAddCategories(final Model model, @ModelAttribute("category") Category category) {
		categoryService.saveOrUpdate(category);
		return "redirect:/admin/category/view";
	}

	@RequestMapping(value = "edit/{categoryId}", method = RequestMethod.GET)
	public String editCategories(final Model model, @PathVariable("categoryId") int categoryId) {
		Category category = categoryService.getById(categoryId);
		List<User> users = userService.findAll();

		model.addAttribute("category", category);
		model.addAttribute("users", users);
		return "backend/category-edit";
	}

	@RequestMapping(value = "edit-save", method = RequestMethod.POST)
	public String saveEditCategories(final Model model, @ModelAttribute("category") Category category) {
		categoryService.saveOrUpdate(category);
		// return "backend/category-list";
		return "redirect:/admin/category/view";
	}

	/*
	 * @RequestMapping(value ="delete/{categoryId}",method= RequestMethod.POST)
	 * public String deleteCategories(final Model model,
	 * 
	 * @PathVariable("categoryId") int categoryId) {
	 * categoryService.deleteCategory(categoryId); return "backend/category-edit"; }
	 */

	// Inactive
	@RequestMapping(value = "delete/{categoryId}", method = RequestMethod.GET)
	public String deleteCategories(final Model model, @PathVariable("categoryId") int categoryId) {
		Category category = categoryService.getById(categoryId);
		category.setStatus(false);
		categoryService.saveOrUpdate(category);
		return "redirect:/admin/category/view";
	}
}
