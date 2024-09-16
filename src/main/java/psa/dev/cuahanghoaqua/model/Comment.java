package psa.dev.cuahanghoaqua.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_comment")
public class Comment extends BaseModel{
	@Column(name = "customer_name", length = 100, nullable = true)
	private String customerName;
	
	@Column(name = "customer_email", length = 250, nullable = true)
	private String customerEmail;
	
	@Column(name = "content", nullable = true)
	private String content;
	
	@Column(name = "star", nullable = true)
	private int star;
	
	//-----------Mapping many-to-one: comment-to-product------------------
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "product_id")
	private Product product;
	
	//-----------Mapping many-to-one: comment-to-user------------------
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "create_by")
	private User userCreateComment;
	
	//-----------Mapping many-to-one: comment-to-user------------------
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "update_by")
	private User userUpdateComment;
	
	public Comment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Comment(String customerName, String customerEmail, String content, int start, Product product,
			User userCreateComment, User userUpdateComment) {
		super();
		this.customerName = customerName;
		this.customerEmail = customerEmail;
		this.content = content;
		this.star = star;
		this.product = product;
		this.userCreateComment = userCreateComment;
		this.userUpdateComment = userUpdateComment;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getCustomerEmail() {
		return customerEmail;
	}

	public void setCustomerEmail(String customerEmail) {
		this.customerEmail = customerEmail;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public User getUserCreateComment() {
		return userCreateComment;
	}

	public void setUserCreateComment(User userCreateComment) {
		this.userCreateComment = userCreateComment;
	}

	public User getUserUpdateComment() {
		return userUpdateComment;
	}

	public void setUserUpdateComment(User userUpdateComment) {
		this.userUpdateComment = userUpdateComment;
	}

	public int getStar() {
		return star;
	}

	public void setStar(int start) {
		this.star = start;
	}
}
