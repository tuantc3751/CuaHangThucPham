<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Fruitables - Vegetable Website Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

		<!-- variables -->
		<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>

        <!-- css -->
		<jsp:include page="/WEB-INF/views/frontend/layout/css.jsp"></jsp:include>
    </head>

    <body>
        <!-- Navbar -->
		<jsp:include page="/WEB-INF/views/frontend/layout/navbar.jsp"></jsp:include>

        <!-- Single Page Header start -->
        <div class="container-fluid page-header py-5">
            <h1 class="text-center text-white display-6">Cart</h1>
            <ol class="breadcrumb justify-content-center mb-0">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <li class="breadcrumb-item"><a href="#">Pages</a></li>
                <li class="breadcrumb-item active text-white">Cart</li>
            </ol>
        </div>
        <!-- Single Page Header End -->
		
        <!-- Cart Page Start -->
        <div class="container-fluid py-3">
            <div class="container py-5">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                          <tr>
                            <th scope="col">Products</th>
                            <th scope="col">Name</th>
                            <th scope="col">Price</th>
                            <th scope="col">Quantity</th>
                            <th scope="col">Total</th>
                            <th scope="col">Handle</th>
                          </tr>
                        </thead>
                        <tbody>
                        	<c:if test="${cart.cartProducts.size() == 0}">
						        <tr class="text-center">
	                        		<td colspan="6" class="text-danger">Không có sản phẩm nào</td>
	                            </tr>
						    </c:if>
                        	<c:forEach var="cartProduct" items="${cart.cartProducts}" varStatus="loop">
	                        	<tr>
	                                <th scope="row">
	                                    <div class="d-flex align-items-center">
	                                        <img src="${resource}/UploadFiles/${cartProduct.avatar}" class="img-fluid me-5 rounded-circle" style="width: 80px; height: 80px;" alt="">
	                                    </div>
	                                </th>
	                                <td>
	                                    <p class="mb-0 mt-4">${cartProduct.name}</p>
	                                </td>
	                                <td>
	                                    <p class="mb-0 mt-4">
	                                    	<span>
												<fmt:formatNumber value="${cartProduct.price}" minFractionDigits="0" ></fmt:formatNumber> 
											</span> 
											<sup>đ</sup>
	                                    </p>
	                                </td>
	                                <td>
	                                    <div class="input-group quantity mt-4" style="width: 100px;">
	                                        <div class="input-group-btn">
	                                            <button class="btn btn-sm btn-minus rounded-circle bg-light border" onclick="updateProductQuantity(${cartProduct.id}, -1)">
	                                            	<i class="fa fa-minus"></i>
	                                            </button>
	                                        </div>
	                                        <input type="text" class="form-control form-control-sm text-center border-0" value="${cartProduct.quantity}" readonly="readonly">
	                                        <div class="input-group-btn"> 
	                                            <button class="btn btn-sm btn-plus rounded-circle bg-light border" onclick="updateProductQuantity(${cartProduct.id}, 1)">
	                                                <i class="fa fa-plus"></i>
	                                            </button>
	                                        </div>
	                                    </div>
	                                </td>
	                                <td>
	                                    <p class="mb-0 mt-4">
	                                    	<span id="totalPrice_${cartProduct.id}">
												<fmt:formatNumber value="${cartProduct.totalPrice()}" minFractionDigits="0"  ></fmt:formatNumber> 
											</span> 
											<sup>đ</sup>
	                                    </p>
	                                </td>
	                                <td>
	                                    <button class="btn btn-md rounded-circle bg-light border mt-4" onclick="deleteCartProduct(${cartProduct.id})">
	                                        <i class="fa fa-times text-danger"></i>
	                                    </button>
	                                </td>
	                            </tr>
	                        </c:forEach>
<!--                             <tr> -->
<!--                                 <th scope="row"> -->
<!--                                     <div class="d-flex align-items-center"> -->
<%--                                         <img src="${resource}/frontend/img/vegetable-item-3.png" class="img-fluid me-5 rounded-circle" style="width: 80px; height: 80px;" alt=""> --%>
<!--                                     </div> -->
<!--                                 </th> -->
<!--                                 <td> -->
<!--                                     <p class="mb-0 mt-4">Big Banana</p> -->
<!--                                 </td> -->
<!--                                 <td> -->
<!--                                     <p class="mb-0 mt-4">2.99 $</p> -->
<!--                                 </td> -->
<!--                                 <td> -->
<!--                                     <div class="input-group quantity mt-4" style="width: 100px;"> -->
<!--                                         <div class="input-group-btn"> -->
<!--                                             <button class="btn btn-sm btn-minus rounded-circle bg-light border" > -->
<!--                                             <i class="fa fa-minus"></i> -->
<!--                                             </button> -->
<!--                                         </div> -->
<!--                                         <input type="text" class="form-control form-control-sm text-center border-0" value="1"> -->
<!--                                         <div class="input-group-btn"> -->
<!--                                             <button class="btn btn-sm btn-plus rounded-circle bg-light border"> -->
<!--                                                 <i class="fa fa-plus"></i> -->
<!--                                             </button> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </td> -->
<!--                                 <td> -->
<!--                                     <p class="mb-0 mt-4">2.99 $</p> -->
<!--                                 </td> -->
<!--                                 <td> -->
<!--                                     <button class="btn btn-md rounded-circle bg-light border mt-4" > -->
<!--                                         <i class="fa fa-times text-danger"></i> -->
<!--                                     </button> -->
<!--                                 </td> -->
                            
<!--                             </tr> -->
<!--                             <tr> -->
<!--                                 <th scope="row"> -->
<!--                                     <div class="d-flex align-items-center"> -->
<%--                                         <img src="${resource}/frontend/img/vegetable-item-5.jpg" class="img-fluid me-5 rounded-circle" style="width: 80px; height: 80px;" alt="" alt=""> --%>
<!--                                     </div> -->
<!--                                 </th> -->
<!--                                 <td> -->
<!--                                     <p class="mb-0 mt-4">Potatoes</p> -->
<!--                                 </td> -->
<!--                                 <td> -->
<!--                                     <p class="mb-0 mt-4">2.99 $</p> -->
<!--                                 </td> -->
<!--                                 <td> -->
<!--                                     <div class="input-group quantity mt-4" style="width: 100px;"> -->
<!--                                         <div class="input-group-btn"> -->
<!--                                             <button class="btn btn-sm btn-minus rounded-circle bg-light border" > -->
<!--                                             <i class="fa fa-minus"></i> -->
<!--                                             </button> -->
<!--                                         </div> -->
<!--                                         <input type="text" class="form-control form-control-sm text-center border-0" value="1"> -->
<!--                                         <div class="input-group-btn"> -->
<!--                                             <button class="btn btn-sm btn-plus rounded-circle bg-light border"> -->
<!--                                                 <i class="fa fa-plus"></i> -->
<!--                                             </button> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </td> -->
<!--                                 <td> -->
<!--                                     <p class="mb-0 mt-4">2.99 $</p> -->
<!--                                 </td> -->
<!--                                 <td> -->
<!--                                     <button class="btn btn-md rounded-circle bg-light border mt-4" > -->
<!--                                         <i class="fa fa-times text-danger"></i> -->
<!--                                     </button> -->
<!--                                 </td> -->
<!--                             </tr> -->
<!--                             <tr> -->
<!--                                 <th scope="row"> -->
<!--                                     <div class="d-flex align-items-center"> -->
<%--                                         <img src="${resource}/frontend/img/vegetable-item-2.jpg" class="img-fluid me-5 rounded-circle" style="width: 80px; height: 80px;" alt="" alt=""> --%>
<!--                                     </div> -->
<!--                                 </th> -->
<!--                                 <td> -->
<!--                                     <p class="mb-0 mt-4">Awesome Brocoli</p> -->
<!--                                 </td> -->
<!--                                 <td> -->
<!--                                     <p class="mb-0 mt-4">2.99 $</p> -->
<!--                                 </td> -->
<!--                                 <td> -->
<!--                                     <div class="input-group quantity mt-4" style="width: 100px;"> -->
<!--                                         <div class="input-group-btn"> -->
<!--                                             <button class="btn btn-sm btn-minus rounded-circle bg-light border" > -->
<!--                                             <i class="fa fa-minus"></i> -->
<!--                                             </button> -->
<!--                                         </div> -->
<!--                                         <input type="text" class="form-control form-control-sm text-center border-0" value="1"> -->
<!--                                         <div class="input-group-btn"> -->
<!--                                             <button class="btn btn-sm btn-plus rounded-circle bg-light border"> -->
<!--                                                 <i class="fa fa-plus"></i> -->
<!--                                             </button> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </td> -->
<!--                                 <td> -->
<!--                                     <p class="mb-0 mt-4">2.99 $</p> -->
<!--                                 </td> -->
<!--                                 <td> -->
<!--                                     <button class="btn btn-md rounded-circle bg-light border mt-4" > -->
<!--                                         <i class="fa fa-times text-danger"></i> -->
<!--                                     </button> -->
<!--                                 </td> -->
<!--                             </tr> -->
                        </tbody>
                    </table>
                </div>
                
                <!-- Cart Total -->
                <div class="row g-4 justify-content-end">
                    <div class="col-8"></div>
                    <div class="col-sm-8 col-md-7 col-lg-6 col-xl-4">
                        <div class="bg-light rounded">
                            <div class="p-4">
                                <h1 class="display-6 mb-4">Cart <span class="fw-normal">Total</span></h1>
                                <div class="d-flex justify-content-between mb-4">
                                    <h5 class="mb-0 me-4">Subtotal:</h5>
                                    <p class="mb-0">
                                    	<span id="subTotalCartPrice">
											<fmt:formatNumber value="${totalCartPrice}" minFractionDigits="0" ></fmt:formatNumber> 
										</span> 
										<sup>đ</sup>
                                    </p>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <h5 class="mb-0 me-4">Shipping</h5>
                                    <div class="">
                                        <p class="mb-0">50,000 <sup>đ</sup></p>
                                    </div>
                                </div>
<!--                                 <p class="mb-0 text-end">Shipping to Ukraine.</p> -->
                            </div>
                            <div class="py-4 mb-4 border-top border-bottom d-flex justify-content-between">
                                <h5 class="mb-0 ps-4 me-4">Total</h5>
                                <p class="mb-0 pe-4">
                                	<span id="totalCartPrice">
										<fmt:formatNumber value="${totalCartPrice+50000}" minFractionDigits="0" ></fmt:formatNumber> 
									</span> 
									<sup>đ</sup>
                                </p>
                            </div>
<!--                             <button class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4 ms-4" type="button">Proceed Checkout</button> -->
                        </div>
                    </div>
                </div>                             
                
                <div class="card border-primary border-3 mb-3 mt-0">
				  <div class="card-header p-2 fs-5 bg-primary text-uppercase text-center fw-bold text-white">Customer Information</div>
				  <div class="card-body px-4 py-3">
				  	<!-- Thông tin khách hàng -->
			        <div class="container-fluid p-0">
		                <form action="#">
		                    <div class="row">
		                        <div class="col-md-12 col-lg-12">
		                        	<div class="row">
			                            <div class="form-item col-md-6">
			                                <label class="form-label my-2">Full Name <sup>*</sup></label>
			                                <input type="text" class="form-control" id="txtName" value="${isLogined == true ? loginedUser.mobile : ''}">
			                            </div>
		                            </div>
		                            
		                            <div class="row">
		                                <div class="col-md-12 col-lg-6">
		                                    <div class="form-item w-100">
		                                        <label class="form-label my-2">Phone Number<sup>*</sup></label>
		                                        <input type="text" class="form-control" id="txtMobile" value="${isLogined == true ? loginedUser.mobile : ''}">
		                                    </div>
		                                </div>
		                                <div class="col-md-12 col-lg-6">
		                                    <div class="form-item w-100">
		                                        <label class="form-label my-2">Email</label>
		                                        <input type="text" class="form-control" id="txtEmail" value="${isLogined == true ? loginedUser.email : ''}">
		                                    </div>
		                                </div>
		                            </div>
		                            <div class="form-item">
		                                <label class="form-label my-3">Address<sup>*</sup></label>
		                                <input type="text" class="form-control" id="txtAddress" value="${isLogined == true ? loginedUser.address : ''}">
		                            </div>
		                        </div>
		                    </div>
		                    
		                    <div class="row">
	                            <div class="col-12 pt-3">
	                                <button type="button" class="btn btn-outline-primary py-2 px-3 float-end" onclick="_placeOrder()">Place Order</button>
	                            	<a type="button" href="${resource}/index" class="btn btn-outline-secondary py-2 px-3 float-end me-2">Back to shop</a>
	                            </div>
	                        </div>       
		                </form>
			        </div>
				  </div>
				</div>   
            </div>
        </div>
        <!-- Cart Page End -->

        <!-- Footer -->
		<jsp:include page="/WEB-INF/views/frontend/layout/footer.jsp"></jsp:include>


        <!-- Back to Top -->
        <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i class="fa fa-arrow-up"></i></a>   
        
    	<!-- js -->
		<jsp:include page="/WEB-INF/views/frontend/layout/js.jsp"></jsp:include>
		
		<script type="text/javascript">
			//Cập nhật số lượng sản phẩm khi nhấn +, -
			updateProductQuantity = function(_productId, _quantity) {
				let data = {
					id : _productId, //lay theo id
					quantity : _quantity
				};
	
				//$ === jQuery
				$.ajax({
					url : "/update-product-quantity",
					type : "POST",
					contentType : "application/json",
					data : JSON.stringify(data),
					dataType : "json", //Kieu du lieu tra ve tu controller la json
	
					success : function(jsonResult) {
						//Cộng thêm phí ship vào
					    let subTotalCartPrice = parseFloat(jsonResult.totalCartPrice.replace(/,/g, ''));
					    let additionalPrice = 50000;
					    let newTotalCartPrice = subTotalCartPrice + additionalPrice;
						
						//Viet lai so luong sau khi bam nut -, +
						$("#productQuantity_" + jsonResult.productId).html(jsonResult.newQuantity); 					
						$("#subTotalCartPrice").html(jsonResult.totalCartPrice);
						$("#totalCartPrice").html(newTotalCartPrice.toLocaleString());
						$("#totalPrice_" + jsonResult.productId).html(jsonResult.totalPrice);
						$("#totalCartProducts").html(jsonResult.totalCartProducts);
					},
	
					error : function(jqXhr, textStatus, errorMessage) {
						alert("An error occur");
					}
				});
			}
			
			//Xóa 1 sản phẩm trong giỏ hàng
			function deleteCartProduct(cartProductId) {				
				$.ajax({
					url : "/deleteCartProduct",
					type : "POST",
					contentType : "application/json",
					data : JSON.stringify({cartProductId: cartProductId}),
					dataType : "json",
					success : function(jsonResult) {
						console.log("succes done");
						location.reload();
					},
	
					error : function(jqXhr, textStatus, errorMessage) {
						alert("An error occur");
					}
				});
		    }
			
			//Xử khi nhấn đặt hàng
			function _placeOrder() {
				//javascript object
				let data = {				
					name : jQuery("#txtName").val(),
					email : jQuery("#txtEmail").val(), //Get by Id
					mobile : jQuery("#txtMobile").val(),
					address : jQuery("#txtAddress").val(),
				};
				
				if(${cart.cartProducts.size()} == 0){
					alert('Giỏ hàng của bạn trống. Hãy thêm hàng vào giỏ');
				}else{
					$.ajax({
						url : "/place-order",
						type : "POST",
						contentType: "application/json",
						data : JSON.stringify(data),
						dataType : "json", //Kieu du lieu tra ve tu controller la json
						
						success : function(jsonResult) {
							alert(jsonResult.message);
							//Nếu mã code trả về thành công 
							if(jsonResult.code == 200) location.reload();
							//alert(jsonResult.code + ": " + jsonResult.message);
							//$("#placeOrderSuccess").html(jsonResult.message);
						},
						
						error : function(jqXhr, textStatus, errorMessage) {
							alert("An error occur");
						}
					});
				}
			}
		</script>
    </body>
</html>