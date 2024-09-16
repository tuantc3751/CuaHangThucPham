package psa.dev.cuahanghoaqua.dto;

import java.math.BigDecimal;
import java.math.BigInteger;

public class CartProduct {
	private int id;
	private String name;
	private BigInteger quantity;
	private BigDecimal price;
	private String avatar;
	
	//Phuong thức tính thành tiền = số lượng * đơn giá
	public BigDecimal totalPrice() {
		return this.price.multiply(new BigDecimal(this.quantity));
	}
	
	//Phương thức tăng/giảm thêm số lượng của sản phẩm
	public void updateQuantity (BigInteger quantity) {
		this.quantity = this.quantity.add(quantity);
	} 
	
	public CartProduct() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CartProduct(int id, String name, BigInteger quantity, BigDecimal price, String avatar) {
		super();
		this.id = id;
		this.name = name;
		this.quantity = quantity;
		this.price = price;
		this.avatar = avatar;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public BigInteger getQuantity() {
		return quantity;
	}

	public void setQuantity(BigInteger quantity) {
		this.quantity = quantity;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	
}
