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
import psa.dev.cuahanghoaqua.model.Role;
import psa.dev.cuahanghoaqua.model.User;
import psa.dev.cuahanghoaqua.service.RoleService;
import psa.dev.cuahanghoaqua.service.UserService;

@Controller
@RequestMapping("/admin/role/")
public class RoleController extends BaseController {
	// Khai báo service
	@Autowired
	private RoleService roleService;

	@Autowired
	private UserService userService;

	@RequestMapping(value ="getData",method= RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> viewRole(
		@RequestParam("draw") int draw,
        @RequestParam("start") int start,
        @RequestParam("length") int length,
        @RequestParam("statusId") int statusId,
        @RequestParam(value = "beginDate", required = false) String beginDate,
        @RequestParam(value = "endDate", required = false) String endDate,
        @RequestParam(value = "order[0][column]" , required = false) Integer column,
        @RequestParam(value = "order[0][dir]" , required = false) String dir,
        @RequestParam(value = "search[value]") String search) {
		List<Role> categories = roleService.findAllActive();
		
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
		        case 2: sortColumn = "name"; break;
		        case 3: sortColumn = "userCreateRole"; break;
		        case 4: sortColumn = "userUpdateRole"; break;
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
		        case "userCreateRole":
		            comparison = compareNullable(p1.getUserCreateRole() != null ? p1.getUserCreateRole().getUsername() : null,
		                                         p2.getUserCreateRole() != null ? p2.getUserCreateRole().getUsername() : null);
		            break;
		        case "userUpdateRole":
		            comparison = compareNullable(p1.getUserUpdateRole() != null ? p1.getUserUpdateRole().getUsername() : null,
		                                         p2.getUserUpdateRole() != null ? p2.getUserUpdateRole().getUsername() : null);
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
            Role rowRole = categories.get(i);
            row.put("stt", stt++);
            row.put("id", rowRole.getId());
            row.put("name", rowRole.getName());
            User userCreateRole = rowRole.getUserCreateRole();
            row.put("userCreateRole", userCreateRole != null ? userCreateRole.getUsername() : null);
            User userUpdateRole = rowRole.getUserUpdateRole();
            row.put("createDate", rowRole.getCreateDate());
            row.put("updateDate", rowRole.getUpdateDate());
            row.put("userUpdateRole", userUpdateRole != null ? userUpdateRole.getUsername() : null);
            row.put("status", rowRole.getStatus());
            row.put("description", rowRole.getDescription());
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
	public String viewRole(final Model model) {
		List<Role> categories = new ArrayList<Role>();
		//categories = roleService.findAll();
		categories = roleService.findAllActive();
		model.addAttribute("categories",categories);
		return "backend/role-list"; 
	}

	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String addCategories(final Model model) {
		List<User> users = userService.findAll();
		Role role = new Role();
		role.setCreateDate(new Date());

		model.addAttribute("role", role);
		model.addAttribute("users", users);
		return "backend/role-add";
	}

	@RequestMapping(value = "add-save", method = RequestMethod.POST)
	public String saveAddCategories(final Model model, @ModelAttribute("role") Role role) {
		roleService.saveOrUpdate(role);
		return "redirect:/admin/role/view";
	}

	@RequestMapping(value = "edit/{roleId}", method = RequestMethod.GET)
	public String editCategories(final Model model, @PathVariable("roleId") int roleId) {
		Role role = roleService.getById(roleId);
		List<User> users = userService.findAll();

		model.addAttribute("role", role);
		model.addAttribute("users", users);
		return "backend/role-edit";
	}

	@RequestMapping(value = "edit-save", method = RequestMethod.POST)
	public String saveEditCategories(final Model model, @ModelAttribute("role") Role role) {
		roleService.saveOrUpdate(role);
		// return "backend/role-list";
		return "redirect:/admin/role/view";
	}

	/*
	 * @RequestMapping(value ="delete/{roleId}",method= RequestMethod.POST)
	 * public String deleteCategories(final Model model,
	 * 
	 * @PathVariable("roleId") int roleId) {
	 * roleService.deleteRole(roleId); return "backend/role-edit"; }
	 */

	// Inactive
	@RequestMapping(value = "delete/{roleId}", method = RequestMethod.GET)
	public String deleteCategories(final Model model, @PathVariable("roleId") int roleId) {
		Role role = roleService.getById(roleId);
		role.setStatus(false);
		roleService.saveOrUpdate(role);
		return "redirect:/admin/role/view";
	}
}
