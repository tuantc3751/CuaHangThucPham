package psa.dev.cuahanghoaqua.model;

import java.sql.Date;
import java.util.ArrayList;
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
@Table(name = "tbl_category")
public class Category extends BaseModel{
	@Column(name = "name", length = 300, nullable = false)
	private String name;

	@Column(name = "description", length = 500, nullable = true)
	private String description;
	
	//-----------Mapping many-to-one: category-to-user------------------
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "create_by")
	private User userCreateCategory;

	//-----------Mapping many-to-one: category-to-user------------------
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "update_by")
	private User userUpdateCategory;
	
	//Nhận từ bảng khác	
	//---------Mapping one-to-many: tbl_category-to-tbl_product-----------	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "category")
	private List<Product> products = new ArrayList<Product>();

	// Methods add and remove elements in relational product list
	public void addRelationalProduct(Product product) {
		products.add(product);
		product.setCategory(this);
	}

	public void removeRelationalProduct(Product product) {
		products.remove(product);
		product.setCategory(null);
	}
	
	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Category(Integer id, java.util.Date createDate, java.util.Date updateDate, Boolean status) {
		super(id, createDate, updateDate, status);
		// TODO Auto-generated constructor stub
	}

	public Category(String name, String description, User userCreateCategory, User userUpdateCategory,
			List<Product> products) {
		super();
		this.name = name;
		this.description = description;
		this.userCreateCategory = userCreateCategory;
		this.userUpdateCategory = userUpdateCategory;
		this.products = products;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public User getUserCreateCategory() {
		return userCreateCategory;
	}

	public void setUserCreateCategory(User userCreateCategory) {
		this.userCreateCategory = userCreateCategory;
	}

	public User getUserUpdateCategory() {
		return userUpdateCategory;
	}

	public void setUserUpdateCategory(User userUpdateCategory) {
		this.userUpdateCategory = userUpdateCategory;
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

}
