package psa.dev.cuahanghoaqua.model;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name="tbl_sale_order")
public class SaleOrder extends BaseModel{
	private String code;

	@Column(name="customer_address")
	private String customerAddress;

	@Column(name="customer_email")
	private String customerEmail;

	@Column(name="customer_mobile")
	private String customerMobile;

	@Column(name="customer_name")
	private String customerName;

	private BigDecimal total;
	
	//-----------Mapping many-to-one: saleorder-to-user------------------
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id")
	private User user;
	
	//-----------Mapping many-to-one: saleorder-to-user------------------
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "create_by")
	private User userCreateSaleOrder;
	
	//-----------Mapping many-to-one: saleorder-to-user------------------
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "update_by")
	private User userUpdateSaleOrder;
	
	//------------Nhận từ bảng khác
	//---------Mapping one-to-many: tbl_SaleOrder-to-tbl_SaleOrderProduct-----------	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "saleOrder")
	private List<SaleOrderProduct> saleOrderProducts = new ArrayList<SaleOrderProduct>();
	
	// Methods add and remove elements in relational product list
	public void addRelationalSaleOrderProduct(SaleOrderProduct saleOrderProduct) {
		saleOrderProducts.add(saleOrderProduct);
		saleOrderProduct.setSaleOrder(this);
	}

	public void removeRelationalSaleOrderProduct(SaleOrderProduct saleOrderProduct) {
		saleOrderProducts.remove(saleOrderProduct);
		saleOrderProduct.setSaleOrder(null);
	}

	//---------Mapping one-to-many: tbl_category-to-tbl_product-----------	
//	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "product")
//	private List<SaleOrderProduct> saleOrderProducts = new ArrayList<SaleOrderProduct>();
//
//	// Methods add and remove elements in relational product list
//	public void addRelationalSaleOrderProduct(SaleOrderProduct saleOrderProduct) {
//		products.add(product);
//		saleOrderProduct.setCategory(this);
//	}
//
//	public void removeRelationalProduct(Product product) {
//		products.remove(product);
//		product.setCategory(null);
//	}
	
	public SaleOrder() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SaleOrder(Integer id, Date createDate, Date updateDate, Boolean status) {
		super(id, createDate, updateDate, status);
		// TODO Auto-generated constructor stub
	}

	public SaleOrder(String code, String customerAddress, String customerEmail, String customerMobile,
			String customerName, BigDecimal total, User user, User userCreateSaleOrder, User userUpdateSaleOrder,
			List<SaleOrderProduct> saleOrderProducts) {
		super();
		this.code = code;
		this.customerAddress = customerAddress;
		this.customerEmail = customerEmail;
		this.customerMobile = customerMobile;
		this.customerName = customerName;
		this.total = total;
		this.user = user;
		this.userCreateSaleOrder = userCreateSaleOrder;
		this.userUpdateSaleOrder = userUpdateSaleOrder;
		this.saleOrderProducts = saleOrderProducts;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getCustomerAddress() {
		return customerAddress;
	}

	public void setCustomerAddress(String customerAddress) {
		this.customerAddress = customerAddress;
	}

	public String getCustomerEmail() {
		return customerEmail;
	}

	public void setCustomerEmail(String customerEmail) {
		this.customerEmail = customerEmail;
	}

	public String getCustomerMobile() {
		return customerMobile;
	}

	public void setCustomerMobile(String customerMobile) {
		this.customerMobile = customerMobile;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public BigDecimal getTotal() {
		return total;
	}

	public void setTotal(BigDecimal total) {
		this.total = total;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public User getUserCreateSaleOrder() {
		return userCreateSaleOrder;
	}

	public void setUserCreateSaleOrder(User userCreateSaleOrder) {
		this.userCreateSaleOrder = userCreateSaleOrder;
	}

	public User getUserUpdateSaleOrder() {
		return userUpdateSaleOrder;
	}

	public void setUserUpdateSaleOrder(User userUpdateSaleOrder) {
		this.userUpdateSaleOrder = userUpdateSaleOrder;
	}

	public List<SaleOrderProduct> getSaleOrderProducts() {
		return saleOrderProducts;
	}

	public void setSaleOrderProducts(List<SaleOrderProduct> saleOrderProducts) {
		this.saleOrderProducts = saleOrderProducts;
	}
}
