package psa.dev.cuahanghoaqua.service;

import org.springframework.stereotype.Service;

import psa.dev.cuahanghoaqua.model.SaleOrderProduct;

@Service
public class SaleOrderProductService extends BaseService<SaleOrderProduct> {
	@Override
	public Class<SaleOrderProduct> clazz() {
		// TODO Auto-generated method stub
		return SaleOrderProduct.class;
	}
}
