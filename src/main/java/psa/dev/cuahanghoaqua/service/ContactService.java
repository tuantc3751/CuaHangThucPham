package psa.dev.cuahanghoaqua.service;

import org.springframework.stereotype.Service;

import psa.dev.cuahanghoaqua.model.Contact;

@Service
public class ContactService extends BaseService<Contact>{
	@Override
	public Class<Contact> clazz() {
		// TODO Auto-generated method stub
		return Contact.class;
	}
}
