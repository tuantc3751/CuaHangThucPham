package psa.dev.cuahanghoaqua.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import psa.dev.cuahanghoaqua.model.Comment;

@Service
public class CommentService extends BaseService<Comment> {
	
	@Override
	public Class<Comment> clazz() {
		// TODO Auto-generated method stub
		return Comment.class;
	}
	
	public List<Comment> findAllActive(){
		String sql = "SELECT * FROM tbl_Category WHERE Status = 1";
		return super.executeNativeSql(sql);
	}
	
	@Transactional
	public void deleteCategory(int id) {
		super.deleteById(id);
	}
}
