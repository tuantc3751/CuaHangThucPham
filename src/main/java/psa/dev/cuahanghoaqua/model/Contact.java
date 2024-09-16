package psa.dev.cuahanghoaqua.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name = "tbl_contact")
public class Contact extends BaseModel{
	private String address;

	private String email;

	private String firstname;

	private String lastname;

	private String message;

	private String mobile;

	@Column(name="request_type")
	private String requestType;

	//bi-directional many-to-one association to User
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="create_by")
	private User userCreateContact;

	//bi-directional many-to-one association to User
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="update_by")
	private User userUpdateContact;

	public Contact() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Contact(String address, String email, String firstname, String lastname, String message, String mobile,
			String requestType, User userCreateContact, User userUpdateContact) {
		super();
		this.address = address;
		this.email = email;
		this.firstname = firstname;
		this.lastname = lastname;
		this.message = message;
		this.mobile = mobile;
		this.requestType = requestType;
		this.userCreateContact = userCreateContact;
		this.userUpdateContact = userUpdateContact;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getRequestType() {
		return requestType;
	}

	public void setRequestType(String requestType) {
		this.requestType = requestType;
	}

	public User getUserCreateContact() {
		return userCreateContact;
	}

	public void setUserCreateContact(User userCreateContact) {
		this.userCreateContact = userCreateContact;
	}

	public User getUserUpdateContact() {
		return userUpdateContact;
	}

	public void setUserUpdateContact(User userUpdateContact) {
		this.userUpdateContact = userUpdateContact;
	}

	
}
