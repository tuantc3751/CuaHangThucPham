package psa.dev.cuahanghoaqua.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import psa.dev.cuahanghoaqua.model.Category;

@Service
public class CategoryService extends BaseService<Category> {
	
	@Override
	public Class<Category> clazz() {
		// TODO Auto-generated method stub
		return Category.class;
	}
	
	public List<Category> findAllActive(){
		String sql = "SELECT * FROM tbl_Category WHERE Status = 1";
		return super.executeNativeSql(sql);
	}
	
	@Transactional
	public void deleteCategory(int id) {
		super.deleteById(id);
	}
}
