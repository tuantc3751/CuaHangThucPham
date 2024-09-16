package psa.dev.cuahanghoaqua.model;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="tbl_sale_order_product")
public class SaleOrderProduct extends BaseModel {
	@Column(name="product_name")
	private String productName;

	private int quantity;
	
	private String description;

	//-----------Mapping many-to-one: saleorder-to-user------------------
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "sale_order_id")
	private SaleOrder saleOrder;
	
	//-----------Mapping many-to-one: saleorder-to-user------------------
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "product_id")
	private Product product;

	//-----------Mapping many-to-one: saleOrderProduct-to-user------------------
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "create_by")
	private User userCreateSaleOrderProduct;
		
	//-----------Mapping many-to-one: saleOrderProduct-to-user------------------
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "update_by")
	private User userUpdateSaleOrderProduct;

	public SaleOrderProduct() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SaleOrderProduct(Integer id, Date createDate, Date updateDate, Boolean status) {
		super(id, createDate, updateDate, status);
		// TODO Auto-generated constructor stub
	}

	public SaleOrderProduct(String productName, int quantity, String description, SaleOrder saleOrder, Product product,
			User userCreateSaleOrderProduct, User userUpdateSaleOrderProduct) {
		super();
		this.productName = productName;
		this.quantity = quantity;
		this.description = description;
		this.saleOrder = saleOrder;
		this.product = product;
		this.userCreateSaleOrderProduct = userCreateSaleOrderProduct;
		this.userUpdateSaleOrderProduct = userUpdateSaleOrderProduct;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public SaleOrder getSaleOrder() {
		return saleOrder;
	}

	public void setSaleOrder(SaleOrder saleOrder) {
		this.saleOrder = saleOrder;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public User getUserCreateSaleOrderProduct() {
		return userCreateSaleOrderProduct;
	}

	public void setUserCreateSaleOrderProduct(User userCreateSaleOrderProduct) {
		this.userCreateSaleOrderProduct = userCreateSaleOrderProduct;
	}

	public User getUserUpdateSaleOrderProduct() {
		return userUpdateSaleOrderProduct;
	}

	public void setUserUpdateSaleOrderProduct(User userUpdateSaleOrderProduct) {
		this.userUpdateSaleOrderProduct = userUpdateSaleOrderProduct;
	}
	
//	//---------Mapping one-to-many: tbl_category-to-tbl_product-----------	
//		@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "product")
//		private List<Product> products = new ArrayList<Product>();
//
//		// Methods add and remove elements in relational product list
//		public void addRelationalSaleOrderProduct(Product product) {
//			products.add(product);
//			product.setCategory(this);
//		}
//
//		public void removeRelationalProduct(Product product) {
//			products.remove(product);
//			product.setCategory(null);
//		}
}
