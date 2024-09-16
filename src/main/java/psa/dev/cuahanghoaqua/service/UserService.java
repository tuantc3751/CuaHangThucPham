package psa.dev.cuahanghoaqua.service;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;


import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import psa.dev.cuahanghoaqua.dto.Jw29Contant;
import psa.dev.cuahanghoaqua.model.Category;
import psa.dev.cuahanghoaqua.model.Product;
import psa.dev.cuahanghoaqua.model.ProductImage;
import psa.dev.cuahanghoaqua.model.User;

@Service
public class UserService extends BaseService<User> implements Jw29Contant {
	
	@Override
	public Class<User> clazz() {
		// TODO Auto-generated method stub
		return User.class;
	}
	
	public List<User> findAllActive(){
		String sql = "SELECT * FROM tbl_User WHERE Status = 1";
		return super.executeNativeSql(sql);
	}
	
	//Phương thức kiểm tra file có được upload không
	public boolean isUploadFile (MultipartFile file) {
		if(file != null && !file.getOriginalFilename().isEmpty()) return true;
		return false;
	}
	
	//Phương thức để lưu user vào database
	@Transactional
	public void saveUser (User user, MultipartFile avatarFile) throws IllegalStateException, IOException {
		//user.setPassword(new BCryptPasswordEncoder(4).encode(user.getPassword());
		//Kiểm tra và lưu avatar
		if(isUploadFile(avatarFile)) {
			//Có upload avatar
			String path = FOLDER_UPLOAD + "User/Avatar/" + avatarFile.getOriginalFilename();
			File file = new File(path);
			avatarFile.transferTo(file);
			//Lưu đường dẫn vào db
			user.setAvatar("User/Avatar/" + avatarFile.getOriginalFilename());
		}
		
		super.saveOrUpdate(user);
	}
}
