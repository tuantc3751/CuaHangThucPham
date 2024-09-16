package psa.dev.cuahanghoaqua.controller.backend;

import java.math.BigDecimal;
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
import psa.dev.cuahanghoaqua.model.SaleOrder;
import psa.dev.cuahanghoaqua.model.User;
import psa.dev.cuahanghoaqua.service.SaleOrderService;
import psa.dev.cuahanghoaqua.service.UserService;

@Controller
@RequestMapping("/admin/order/")
public class SaleOrderController extends BaseController {
	@Autowired
	private SaleOrderService saleOrderService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value ="getData",method= RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> viewSaleOrder(
		@RequestParam("draw") int draw,
        @RequestParam("start") int start,
        @RequestParam("length") int length,
        @RequestParam("statusId") int statusId,
        @RequestParam(value = "beginDate", required = false) String beginDate,
        @RequestParam(value = "endDate", required = false) String endDate,
        @RequestParam(value = "order[0][column]" , required = false) Integer column,
        @RequestParam(value = "order[0][dir]" , required = false) String dir,
        @RequestParam(value = "search[value]") String search) {
		List<SaleOrder> saleOrders = saleOrderService.findAll();
		
		// Chuẩn hóa chuỗi tìm kiếm thành chữ thường và loại bỏ dấu
        String searchLower = normalize(search).toLowerCase();
        
        // Chuyển đổi chuỗi ngày tháng thành LocalDate
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        final LocalDate beginDateParsed = (beginDate != null && !beginDate.isEmpty()) ? LocalDate.parse(beginDate, formatter) : null;
        final LocalDate endDateParsed = (endDate != null && !endDate.isEmpty()) ? LocalDate.parse(endDate, formatter) : null;
        
        // Lọc sản phẩm dựa trên giá trị tìm kiếm
        saleOrders = saleOrders.stream()
            .filter(p -> (p.getCode() != null && normalize(p.getCode()).toLowerCase().contains(searchLower)) ||
            				(p.getCustomerName() != null && normalize(p.getCustomerName()).toLowerCase().contains(searchLower)))
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
		        case 2: sortColumn = "userId"; break;
		        case 3: sortColumn = "code"; break;
		        case 4: sortColumn = "total"; break;
		        case 5: sortColumn = "customerName"; break;
		        case 6: sortColumn = "customerMoblie"; break;
		        case 7: sortColumn = "customerEmail"; break;
		        case 8: sortColumn = "customerAddress"; break;
		        case 9: sortColumn = "userCreateSaleOrder"; break;
		        case 10: sortColumn = "userUpdateSaleOrder"; break;
		        case 11: sortColumn = "createDate"; break;
		        case 12: sortColumn = "updateDate"; break;
		        case 13: sortColumn = "status"; break;
		        default: sortColumn = "userId"; // Cột mặc định
		    }

		    // Sắp xếp theo hướng tăng dần hoặc giảm dần
		    boolean ascending = "asc".equalsIgnoreCase(dir);		    
		    
		    //Sắp xếp sản phẩm theo cột và hướng đã chọn
		    saleOrders.sort((p1, p2) -> {
		        int comparison = 0;
		        switch (sortColumn) {
		        case "stt":
		        case "id":
		            comparison = Integer.compare(p1.getId(), p2.getId());
		            break;
		        case "userId":
		            comparison = Integer.compare(p1.getUser().getId(), p2.getUser().getId());
		            break;
		        case "code":
		            comparison = compareNullable(p1.getCode(), p2.getCode());
		            break;
		        case "total":
		            //comparison = BigDecimal.compare(p1.getTotal(), p2.getTotal());
		            break;
		        case "customerName":
		        	comparison = compareNullable(p1.getCustomerName(), p2.getCustomerName());
		            break;
		        case "customerMobile":
		        	comparison = compareNullable(p1.getCustomerMobile(), p2.getCustomerMobile());
		            break;     
		        case "customerEmail":
		        	comparison = compareNullable(p1.getCustomerEmail(), p2.getCustomerEmail());
		            break;     
		        case "customerAdress":
		        	comparison = compareNullable(p1.getCustomerAddress(), p2.getCustomerAddress());
		            break;       		            
		        case "userCreateSaleOrder":
		            comparison = compareNullable(p1.getUserCreateSaleOrder() != null ? p1.getUserCreateSaleOrder().getUsername() : null,
		                                         p2.getUserCreateSaleOrder() != null ? p2.getUserCreateSaleOrder().getUsername() : null);
		            break;
		        case "userUpdateSaleOrder":
		            comparison = compareNullable(p1.getUserUpdateSaleOrder() != null ? p1.getUserUpdateSaleOrder().getUsername() : null,
		                                         p2.getUserUpdateSaleOrder() != null ? p2.getUserUpdateSaleOrder().getUsername() : null);
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
		        }
		        return ascending ? comparison : -comparison;
		    });
	    }

		int stt= start+1;
        List<Map<String, Object>> data = new ArrayList<>();
        
        int end = Math.min(start + length, saleOrders.size()); 
        for (int i = start; i < end; i++) {
            Map<String, Object> row = new HashMap<>();
            SaleOrder rowSaleOrder = saleOrders.get(i);
            row.put("stt", stt++);
            row.put("id", rowSaleOrder.getId());
            row.put("userId", rowSaleOrder.getUser().getId());
            row.put("code", rowSaleOrder.getCode());
            row.put("total", rowSaleOrder.getTotal());
            row.put("customerName", rowSaleOrder.getCustomerName());
            row.put("customerMobile", rowSaleOrder.getCustomerMobile());
            row.put("customerEmail", rowSaleOrder.getCustomerEmail());
            row.put("customerAddress", rowSaleOrder.getCustomerAddress());
            User userCreateSaleOrder = rowSaleOrder.getUserCreateSaleOrder();
            row.put("userCreateSaleOrder", userCreateSaleOrder != null ? userCreateSaleOrder.getUsername() : null);
            User userUpdateSaleOrder = rowSaleOrder.getUserUpdateSaleOrder();
            row.put("userUpdateSaleOrder", userUpdateSaleOrder != null ? userUpdateSaleOrder.getUsername() : null);
            row.put("createDate", rowSaleOrder.getCreateDate());
            row.put("updateDate", rowSaleOrder.getUpdateDate());
            row.put("status", rowSaleOrder.getStatus());
            data.add(row);
        }

        // Tạo kết quả trả về
        Map<String, Object> result = new HashMap<>();
        result.put("draw", draw);
        result.put("recordsTotal", saleOrders.size()); // Tổng số bản ghi
        result.put("recordsFiltered", saleOrders.size()); // Tổng số bản ghi sau khi lọc
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
	
	@RequestMapping(value = "view", method = RequestMethod.GET)
	public String saleOrderView(final Model model) {
		List<SaleOrder> saleOrders = saleOrderService.findAllActive();
		//Tổng tiền của tất cả hóa đơn
		BigDecimal totalSales = BigDecimal.ZERO;
		for(SaleOrder order: saleOrders) {
			totalSales = totalSales.add(order.getTotal());
		}
		model.addAttribute( "saleOrders", saleOrders);
		model.addAttribute( "totalSales", totalSales);
		return "backend/order-list";
	}
	

	@RequestMapping(value = "edit/{saleOrderId}", method = RequestMethod.GET)
	public String editCategories(final Model model, @PathVariable("saleOrderId") int saleOrderId) {
		SaleOrder saleOrder = saleOrderService.getById(saleOrderId);
		List<User> users = userService.findAll();

		model.addAttribute("saleOrder", saleOrder);
		model.addAttribute("users", users);
		return "backend/order-edit";
	}

	@RequestMapping(value = "edit-save", method = RequestMethod.POST)
	public String saveEditCategories(final Model model, @ModelAttribute("saleOrder") SaleOrder saleOrder) {
		saleOrderService.saveOrUpdate(saleOrder);
		// return "backend/saleOrder-list";
		return "redirect:/admin/order/view";
	}

	/*
	 * @RequestMapping(value ="delete/{saleOrderId}",method= RequestMethod.POST)
	 * public String deleteCategories(final Model model,
	 * 
	 * @PathVariable("saleOrderId") int saleOrderId) {
	 * saleOrderService.deleteSaleOrder(saleOrderId); return "backend/saleOrder-edit"; }
	 */

	// Inactive
	@RequestMapping(value = "delete/{saleOrderId}", method = RequestMethod.GET)
	public String deleteCategories(final Model model, @PathVariable("saleOrderId") int saleOrderId) {
		SaleOrder saleOrder = saleOrderService.getById(saleOrderId);
		saleOrder.setStatus(false);
		saleOrderService.saveOrUpdate(saleOrder);
		return "redirect:/admin/saleOrder/view";
	}
}
