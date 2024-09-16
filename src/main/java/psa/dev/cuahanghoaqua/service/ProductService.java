package psa.dev.cuahanghoaqua.service;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.transaction.Transactional;

import java.io.File;
import java.io.IOException;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import psa.dev.cuahanghoaqua.dto.Jw29Contant;
import psa.dev.cuahanghoaqua.dto.SearchModel;
import psa.dev.cuahanghoaqua.model.Product;
import psa.dev.cuahanghoaqua.model.ProductImage;

@Service
public class ProductService extends BaseService<Product> implements Jw29Contant {
	@Override
	public Class<Product> clazz(){
		// TODO Auto-generated method stub
		return Product.class;
	} 
	
	public List<Product> findAllActive(){
		String sql = "SELECT * FROM tbl_product WHERE status=1";
		return super.executeNativeSql(sql);
	}
	
	public List<Product> findBestsellerProduct(){
		String sql = "SELECT p.*\n" +
                "FROM tbl_product p\n" +
                "JOIN (\n" +
                "    SELECT product_id\n" +
                "    FROM tbl_sale_order_product\n" +
                "    GROUP BY product_id\n" +
                "    ORDER BY SUM(quantity) DESC\n" +
                "    LIMIT 6\n" +
                ") AS tp ON p.id = tp.product_id;";
		return super.executeNativeSql(sql);
	}
	
	public List<Product> findProductsByCategory(int categoryId){
		String sql="";
		if(categoryId == 0) {
			sql = "SELECT * FROM tbl_product WHERE status = 1";
		}else {
			sql = "SELECT * FROM tbl_product WHERE status = 1 AND category_id = " + categoryId;
		}
		return super.executeNativeSql(sql);
	}
	
	//Phương thức kiểm tra file có được upload không
	public boolean isUploadFile (MultipartFile file) {
		if(file != null && !file.getOriginalFilename().isEmpty()) return true;
		return false;
	}
	
	//Phương thức kiểm tra danh sách file có được upload không
	public boolean isUploadFiles (MultipartFile[] files) {
		if(files != null && files.length > 0) return true;
		return false;
	}
	
	//Phương thức để lưu sản phẩm vào database
	@Transactional
	public void saveProduct (Product product, MultipartFile avatarFile , MultipartFile[] imageFiles) throws IllegalStateException, IOException {
		//Kiểm tra và lưu avatar
		if(isUploadFile(avatarFile)) {
			//Có upload avatar
			String path = FOLDER_UPLOAD + "Product/Avatar/" + avatarFile.getOriginalFilename();
			File file = new File(path);
			avatarFile.transferTo(file);
			//Lưu đường dẫn vào db
			product.setAvatar("Product/Avatar/" + avatarFile.getOriginalFilename());
		}
		
		//Kiểm tra và lưu danh sách file ảnh
		if(isUploadFiles(imageFiles)) {
			//Có upload file ảnh
			for(MultipartFile imageFile: imageFiles) {
				if(isUploadFile(imageFile)){
					//Lưu file ảnh và thư mục Product/Image trên server
					String path = FOLDER_UPLOAD + "Product/Image/" + imageFile.getOriginalFilename();
					File file = new File(path);
					imageFile.transferTo(file);
					//Lưu đường dẫn vào bảng tblImageProduct trong db
					ProductImage productImage = new ProductImage();
					productImage.setTitle(imageFile.getOriginalFilename());
					productImage.setCreateDate(new Date());
					productImage.setPath("Product/Image/" + imageFile.getOriginalFilename());
					
					product.addRelationalProductImage(productImage);
				}
			}
		}
		super.saveOrUpdate(product);
	}
	
	@Transactional
	public void saveEditProduct (Product product, MultipartFile avatarFile , MultipartFile[] imageFiles) throws IllegalStateException, IOException {
		Product dbProduct = super.getById(product.getId());
		
		//Kiểm tra và lưu avatar
		if(isUploadFile(avatarFile)) {
			//Có upload avatar thì xóa avatar cũ 
			String path = FOLDER_UPLOAD + "Product/Avatar/" + dbProduct.getAvatar();
			File file = new File(path);
			file.delete();
			//Và lưu avatar mới
			path = FOLDER_UPLOAD + "Product/Avatar/" + avatarFile.getOriginalFilename();
			file = new File(path);
			avatarFile.transferTo(file);
			//Lưu đường dẫn vào db
			product.setAvatar("Product/Avatar/" + avatarFile.getOriginalFilename());
		}else {	
			product.setAvatar(dbProduct.getAvatar());
		}	
		
		//Kiểm tra và lưu danh sách file ảnh
		if(isUploadFiles(imageFiles)) {
			//Có upload file ảnh
			for(MultipartFile imageFile: imageFiles) {
				if(isUploadFile(imageFile)){
					//Lưu file ảnh và thư mục Product/Image trên server
					String path = FOLDER_UPLOAD + "Product/Image/" + imageFile.getOriginalFilename();
					File file = new File(path);
					imageFile.transferTo(file);
					//Lưu đường dẫn vào bảng tblImageProduct trong db
					ProductImage productImage = new ProductImage();
					productImage.setTitle(imageFile.getOriginalFilename());
					productImage.setCreateDate(new Date());
					productImage.setPath("Product/Image/" + imageFile.getOriginalFilename());
					
					product.addRelationalProductImage(productImage);
				}
			}
		}
		super.saveOrUpdate(product);
	}
	
	
	public List<Product> searchProduct (SearchModel productSearch){
		String sql = "SELECT * FROM tbl_product p WHERE 1=1";
		//Tìm theo status
		if(productSearch.getStatus() != 2) {
			sql += " AND p.status = " + productSearch.getStatus(); 
		}
		
		//Tìm theo categoryId
		if(productSearch.getCategoryId() != 0) {
			sql += " AND p.category_id = " + productSearch.getCategoryId();
		}
		
		//Tìm theo keyword
		String keyword = productSearch.getKeyword();
		if(keyword != null) {
			sql += " AND (p.name LIKE '%" + keyword +"%'" + " OR p.short_description LIKE '%" + keyword + "%'" + " OR p.seo LIKE '%" + keyword + "%')";
		}
		
		//Tìm tu ngay den ngay
		String beginDate = productSearch.getBeginDate();
		String endDate = productSearch.getEndDate();
		if(beginDate != null && endDate != null) {
			sql += " AND (p.create_date BETWEEN '"+ beginDate + "' AND '" + endDate +"')";
		}		
		
		//SELECT * from tbl_product p WHERE p.create_date BETWEEN '2024-7-10' AND '2024-7-20';
		return super.executeNativeSql(sql);
	}
}
