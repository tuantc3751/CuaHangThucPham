package psa.dev.cuahanghoaqua.controller.backend;

import java.io.IOException;
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

import org.aspectj.apache.bcel.classfile.Module.Uses;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import psa.dev.cuahanghoaqua.controller.BaseController;
import psa.dev.cuahanghoaqua.model.User;
import psa.dev.cuahanghoaqua.model.UserRole;
import psa.dev.cuahanghoaqua.model.Role;
import psa.dev.cuahanghoaqua.service.RoleService;
import psa.dev.cuahanghoaqua.service.UserRoleService;
import psa.dev.cuahanghoaqua.service.UserService;

@Controller
@RequestMapping("/admin/user/")
public class UserController extends BaseController {
	// Khai báo service
	@Autowired
	private UserService userService;
	
	@Autowired
	private RoleService roleService;
	
	@Autowired
	private UserRoleService userRoleService;
	

	@RequestMapping(value ="getData",method= RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> viewUser(
		@RequestParam("draw") int draw,
        @RequestParam("start") int start,
        @RequestParam("length") int length,
        @RequestParam("statusId") int statusId,
        @RequestParam(value = "beginDate", required = false) String beginDate,
        @RequestParam(value = "endDate", required = false) String endDate,
        @RequestParam(value = "order[0][column]" , required = false) Integer column,
        @RequestParam(value = "order[0][dir]" , required = false) String dir,
        @RequestParam(value = "search[value]") String search) {
		List<User> users = userService.findAll();
		
		// Chuẩn hóa chuỗi tìm kiếm thành chữ thường và loại bỏ dấu
        String searchLower = normalize(search).toLowerCase();
        
        // Chuyển đổi chuỗi ngày tháng thành LocalDate
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        final LocalDate beginDateParsed = (beginDate != null && !beginDate.isEmpty()) ? LocalDate.parse(beginDate, formatter) : null;
        final LocalDate endDateParsed = (endDate != null && !endDate.isEmpty()) ? LocalDate.parse(endDate, formatter) : null;
        
        // Lọc sản phẩm dựa trên giá trị tìm kiếm
        users = users.stream()
            .filter(p -> (p.getName() != null && normalize(p.getName()).toLowerCase().contains(searchLower)) || 
            				(p.getUsername() != null && normalize(p.getUsername()).toLowerCase().contains(searchLower)))
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
		        case 2: sortColumn = "username"; break;
		        case 3: sortColumn = "password"; break;
		        case 4: sortColumn = "name"; break;
		        case 5: sortColumn = "mobile"; break;
		        case 6: sortColumn = "address"; break;
		        case 7: sortColumn = "avatar"; break;
		        case 8: sortColumn = "userCreateUser"; break;
		        case 9: sortColumn = "userUpdateUser"; break;
		        case 10: sortColumn = "createDate"; break;
		        case 11: sortColumn = "updateDate"; break;
		        case 12: sortColumn = "status"; break;
		        case 13: sortColumn = "description"; break;
		        default: sortColumn = "username"; // Cột mặc định
		    }

		    // Sắp xếp theo hướng tăng dần hoặc giảm dần
		    boolean ascending = "asc".equalsIgnoreCase(dir);		    
		    
		    //Sắp xếp sản phẩm theo cột và hướng đã chọn
		    users.sort((p1, p2) -> {
		        int comparison = 0;
		        switch (sortColumn) {
		        case "stt":
		        case "id":
		            comparison = Integer.compare(p1.getId(), p2.getId());
		            break;
		        case "username":
		            comparison = compareNullable(p1.getUsername(), p2.getUsername());
		            break;
		        case "password":
		            comparison = compareNullable(p1.getPassword(), p2.getPassword());
		            break;
		        case "name":
		            comparison = compareNullable(p1.getName(), p2.getName());
		            break;
		        case "moblie":
		            comparison = compareNullable(p1.getMobile(), p2.getMobile());
		            break;
		        case "address":
		            comparison = compareNullable(p1.getAddress(), p2.getAddress());
		            break;
		        case "avatar":
		            comparison = compareNullable(p1.getAvatar(), p2.getAvatar());
		            break;    
		        case "userCreateUser":
		            comparison = compareNullable(p1.getUserCreateUser() != null ? p1.getUserCreateUser().getUsername() : null,
		                                         p2.getUserCreateUser() != null ? p2.getUserCreateUser().getUsername() : null);
		            break;
		        case "userUpdateUser":
		            comparison = compareNullable(p1.getUserUpdateUser() != null ? p1.getUserUpdateUser().getUsername() : null,
		                                         p2.getUserUpdateUser() != null ? p2.getUserUpdateUser().getUsername() : null);
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
		        case "description":
		            comparison = compareNullable(p1.getDescription(), p2.getDescription());
		            break;    
		        }
		        return ascending ? comparison : -comparison;
		    });
	    }

		int stt= start+1;
        List<Map<String, Object>> data = new ArrayList<>();
        
        int end = Math.min(start + length, users.size()); 
        for (int i = start; i < end; i++) {
            Map<String, Object> row = new HashMap<>();
            User rowUser = users.get(i);
            row.put("stt", stt++);
            row.put("id", rowUser.getId());    
            row.put("username", rowUser.getUsername());
            row.put("password", rowUser.getPassword());
            row.put("name", rowUser.getName());          
            row.put("moblie", rowUser.getMobile());
            row.put("email", rowUser.getEmail());
            row.put("address", rowUser.getAddress());
            row.put("avatar", rowUser.getAvatar());            
            User userCreateUser = rowUser.getUserCreateUser();
            row.put("userCreateUser", userCreateUser != null ? userCreateUser.getUsername() : null);
            User userUpdateUser = rowUser.getUserUpdateUser();
            row.put("userUpdateUser", userUpdateUser != null ? userUpdateUser.getUsername() : null);
            row.put("createDate", rowUser.getCreateDate());
            row.put("updateDate", rowUser.getUpdateDate());
            row.put("status", rowUser.getStatus());
            row.put("description", rowUser.getDescription());
            data.add(row);
        }

        // Tạo kết quả trả về
        Map<String, Object> result = new HashMap<>();
        result.put("draw", draw);
        result.put("recordsTotal", users.size()); // Tổng số bản ghi
        result.put("recordsFiltered", users.size()); // Tổng số bản ghi sau khi lọc
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
	public String viewUser(final Model model) {
		List<User> users = new ArrayList<User>();
		//users = userService.findAll();
		users = userService.findAllActive();
		model.addAttribute("users",users);
		return "backend/user-list"; 
	}

	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String addCategories(final Model model) {
		List<User> users = userService.findAll();
		List<Role> roles = roleService.findAll();
		User user = new User();
		user.setCreateDate(new Date());

		model.addAttribute("user", user);
		model.addAttribute("users", users);
		model.addAttribute("roles", roles);
		return "backend/user-add";
	}

	@RequestMapping(value = "add-save", method = RequestMethod.POST)
	public String saveAddCategories(final Model model, @ModelAttribute("user") User user,
			@RequestParam("roleId") Integer roleId,
			@RequestParam("avatarFile") MultipartFile avatarFile) throws IOException{
		//userService.saveOrUpdate(user);		
		// Tìm đối tượng Role dựa trên roleId
	    Role role = roleService.getById(roleId);
	    if (role != null) {
	        user.addRelationalUserRole(role);
	    }
	
		userService.saveUser(user, avatarFile);
		return "redirect:/admin/user/view";
	}

	@RequestMapping(value = "edit/{userId}", method = RequestMethod.GET)
	public String editCategories(final Model model, @PathVariable("userId") int userId) {
		User user = userService.getById(userId);
		List<User> users = userService.findAll();
		List<Role> roles = roleService.findAll();
		List<Role> rolesOfUser = userService.getById(userId).getRoles();
		int roleId = 0;
		if(rolesOfUser != null && rolesOfUser.size() > 0) {
			Role roleOfUser = rolesOfUser.get(0);
			roleId = roleOfUser.getId();
		}
		
		model.addAttribute("user", user);
		model.addAttribute("users", users);
		model.addAttribute("roleId", roleId);
		model.addAttribute("roles", roles);
		return "backend/user-edit";
	}

	@RequestMapping(value = "edit-save", method = RequestMethod.POST)
	public String saveEditCategories(final Model model, @ModelAttribute("user") User user,
			@RequestParam("roleId") Integer roleId) {
		Role role = roleService.getById(roleId);
		if (role != null) {
			//Xóa các role cũ
			User userTemp = userService.getById(user.getId());
			List<Role> rolesOfUserTemp = userTemp.getRoles();
			List<User> users = new ArrayList<User>();
			users.add(userTemp);
			for (Role roleIndex : rolesOfUserTemp) {
				//roleIndex.setUsers(users);
				userTemp.removeRelationalUserRole(roleIndex);
			}
			userService.saveOrUpdate(userTemp);
			
			
			//Thêm role hiện tại
	        user.addRelationalUserRole(role);
	    }
		
		userService.saveOrUpdate(user);
		// return "backend/user-list";
		return "redirect:/admin/user/view";
	}

	/*
	 * @RequestMapping(value ="delete/{userId}",method= RequestMethod.POST)
	 * public String deleteCategories(final Model model,
	 * 
	 * @PathVariable("userId") int userId) {
	 * userService.deleteUser(userId); return "backend/user-edit"; }
	 */

	// Inactive
	@RequestMapping(value = "delete/{userId}", method = RequestMethod.GET)
	public String deleteCategories(final Model model, @PathVariable("userId") int userId) {
		User user = userService.getById(userId);
		user.setStatus(false);
		userService.saveOrUpdate(user);
		return "redirect:/admin/user/view";
	}
}
