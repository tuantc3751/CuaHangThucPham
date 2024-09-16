<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
  	<head>
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width,initial-scale=1,shrink-to-fit=no">
	    <title>Forms</title>
	    
	    <!-- variables -->
		<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
		<!-- css -->
		<jsp:include page="/WEB-INF/views/backend/layout/css.jsp"></jsp:include>
	    
	    <style>
	      	#loader {
	        	transition: all 0.3s ease-in-out;
		        opacity: 1;
		        visibility: visible;
		        position: fixed;
		        height: 100vh;
		        width: 100%;
		        background: #fff;
		        z-index: 90000;
	      	}
	
	      	#loader.fadeOut {
	        	opacity: 0;
	        	visibility: hidden;
	        }
	
	
	      	.spinner {
		        width: 40px;
		        height: 40px;
		        position: absolute;
		        top: calc(50% - 20px);
		        left: calc(50% - 20px);
		        background-color: #333;
		        border-radius: 100%;
		        -webkit-animation: sk-scaleout 1.0s infinite ease-in-out;
		        animation: sk-scaleout 1.0s infinite ease-in-out;
	      	}
	
	      	@-webkit-keyframes sk-scaleout {
	        	0% { -webkit-transform: scale(0) }
	        	100% {
		          -webkit-transform: scale(1.0);
		          opacity: 0;
	        	}
	      	}
	
	      	@keyframes sk-scaleout {
	        	0% {
	          		-webkit-transform: scale(0);
	          		transform: scale(0);
	        	} 
	        	
	        	100% {
		          -webkit-transform: scale(1.0);
		          transform: scale(1.0);
		          opacity: 0;
	        	}
	      	}
	    </style>
	    
	    <!-- js -->
		<jsp:include page="/WEB-INF/views/backend/layout/js.jsp"></jsp:include>
  	</head>
  	<body class="app">
    	<!-- loader -->
	    <jsp:include page="/WEB-INF/views/backend/layout/loader.jsp"></jsp:include>

	    <div>
	    	<!-------- Left Sidebar ----->
		    <jsp:include page="/WEB-INF/views/backend/layout/left-sidebar.jsp"></jsp:include>	      
	
	     	<!-- #Main ============================ -->
	      	<div class="page-container">
	        	<!--------- Topbar ------->
	        	<jsp:include page="/WEB-INF/views/backend/layout/header.jsp"></jsp:include>
	
		        <!-- ### $App Screen Content ### -->
		        <main class="main-content bgc-grey-100">
		          	<div id="mainContent">
		          		<div class="card" style="color: #72777a;">
						  	<h5 class="card-header bg-primary text-white">Create Product</h5>
						  	<div class="card-body mx-3 my-2">
	                  			<sf:form class="form" action="${resource}/admin/product/add-save" method="post" modelAttribute="product" enctype="multipart/form-data">
	                     		 	<div class="form-body">
	                       				<div class="row">
		                       		 		<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="category" class="form-label">Select category</label>
			                                        <sf:select path="category.id" class="form-select" id="category">
			                                            <sf:options items="${categories}" itemValue="id" itemLabel="name"></sf:options>
			                                        </sf:select>
		                                      		</div>
		                                   	</div>
										
		                       		 		<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="name" class="form-label">Product name</label>
			                                        <sf:input path="name" type="text" class="form-control" id="name" name="name"></sf:input>
		                                      		</div>
		                                   	</div>
										</div>
										
										<div class="row">
		                       		 		<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="price" class="form-label">Price</label>
			                                        <sf:input path="price" type="number" autocomplete="off" id="price" name="price" class="form-control"></sf:input>
		                                      		</div>
		                                   	</div>
										
		                       		 		<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="salePrice" class="form-label">Sale price</label>
			                                        <sf:input path="salePrice" type="number" autocomplete="off" id="salePrice" name="salePrice" class="form-control"></sf:input>
		                                      		</div>
		                                   	</div>
										</div>
										
										<div class="row">
		                       		 		<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="create" class="form-label">Create by</label>
			                                        <sf:select path="userCreateProduct.id" class="form-select" id="createBy">
			                                            <sf:options items="${users }" itemValue="id" itemLabel="username"></sf:options>
			                                        </sf:select>
		                                      		</div>
		                                   	</div>
									
											<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="update" class="form-label">Update by</label>
			                                        <sf:select path="userUpdateProduct.id" class="form-select" id="updateBy">
			                                            <sf:options items="${users }" itemValue="id" itemLabel="username"></sf:options>
			                                        </sf:select>
		                                      		</div>
		                                   	</div>
										</div>
										
										<div class="row">
		                       		 		<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="createdate" class="form-label">Create date</label>
			                                        <sf:input path="createDate" class="form-control" type="date" id="createDate" name="createDate"></sf:input>
		                                      		</div>
		                                   	</div>
									
											<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="updatedate" class="form-label">Update date</label>
			                                        <sf:input path="updateDate" class="form-control" type="date" id="updateDate" name="updateDate"></sf:input>
		                                      		</div>
		                                   	</div>
										</div>
										
										<div class="row">
		                       		 		<div class="col-md-12">
												<div class="form-group mb-4">
			                                        <label for="description" class="form-label">Description</label>
			                                        <sf:textarea path="shortDescription" id="shortDescription" name="shortDescription"
																class="form-control" rows="3" placeholder="Short desription..."></sf:textarea>
		                                      		</div>
		                                   	</div>
										</div>
										
										<div class="row">
		                       		 		<div class="col-md-12">
												<div class="form-group mb-4">
			                                        <label for="detailDescription" class="form-label">Detail description</label>
			                                        <sf:textarea path="detailDescription" id="detailDescription" name="detailDescription"
																class="form-control" rows="3" placeholder="detail desription..."></sf:textarea>
		                                      		</div>
		                                   	</div>
										</div>
										
										<div class="row">
		                       		 		<div class="col-md-2">
												<div class="form-group mb-4">
													<label for="isHot" class="form-label">&nbsp;&nbsp;&nbsp;&nbsp;</label>
													<sf:checkbox path="isHot" class="form-check-input" id="isHot" name="isHot"></sf:checkbox>
			                                        <label for="isHot">Is a hot product?</label>
			                                       
		                                      		</div>
		                                   	</div>
		                                   	
		                                   	<div class="col-md-10">
												<div class="form-group mb-4">
													<label for="status" class="form-label">&nbsp;&nbsp;&nbsp;&nbsp;</label>
													<sf:checkbox path="status" class="form-check-input" id="status" name="status"></sf:checkbox>
			                                        <label for="status">Active</label>
			                                       
		                                      		</div>
		                                   	</div>
		                                   	
										</div>
										
										<div class="row">
		                       		 		<div class="col-md-12">
												<div class="form-group mb-4">
			                                        <label for="avatarFile" class="form-label">Choose product Avatar</label>
		                                  				<input id="avatarFile" name="avatarFile" type="file" class="form-control-file" multiple="multiple" >
		                                      		</div>
		                                   	</div>
										</div>
										
										<div class="row">
		                       		 		<div class="col-md-12">
												<div class="form-group mb-4">
			                                        <label for="image" class="form-label">Choose product Image</label>
		                                  				<input id="imageFiles" name="imageFiles" type="file" class="form-control-file" multiple="multiple" >
		                                      		</div>
		                                   	</div>
										</div>
										
										<div class="row">
		                       		 		<div class="col-md-12">
												<div class="form-group mb-4">
			                                        <label for="image">Choose product Image</label>
		                                  				<input id="imageFiles" name="imageFiles" type="file" class="form-control-file" multiple="multiple" >
		                                      		</div>
		                                   	</div>
										</div>
										
										<div class="row">
		                       		 		<div class="col-md-12">
												<div class="form-group mb-4">
			                                        <label for="image">Choose product Image</label>
		                                  				<input id="imageFiles" name="imageFiles" type="file" class="form-control-file" multiple="multiple" >
		                                      		</div>
		                                   	</div>
										</div>
										
										<div class="row">
		                       		 		<div class="col-md-12">
												<div class="form-group mb-4">
			                                        <label for="image">Choose product Image</label>
		                                  				<input id="imageFiles" name="imageFiles" type="file" class="form-control-file" multiple="multiple" >
		                                      		</div>
		                                   	</div>
										</div>
										
										<div class="row">
		                       		 		<div class="col-md-12">
												<div class="form-group mb-4">
													<button type="submit" class="btn btn-primary btn-color float-end">Save add product</button>
			                                        <a href="/admin/product/view" class="btn btn-secondary active float-end me-1" role="button" aria-pressed="true">
			                                        	Back to list
			                                        </a>
		                                      	</div>
		                                   	</div>
										</div>
                       				</div>
             					</sf:form>	
					  		</div>
						</div>
	          		</div>
	        	</main>
	
		        <!-- ### $App Screen Footer ### -->
		        <footer class="bdT ta-c p-30 lh-0 fsz-sm c-grey-600">
		          <span>Copyright Â© 2021 Designed by <a href="https://colorlib.com" target="_blank" title="Colorlib">Colorlib</a>. All rights reserved.</span>
		        </footer>
	      </div>
	    </div>
  	</body>
</html>


<!--                     <form> -->
<!--                       <div class="row"> -->
<!--                         <div class="mb-3 col-md-6"> -->
<!--                           <label class="form-label" for="inputEmail4">Email</label> -->
<!--                           <input type="email" class="form-control" id="inputEmail4" placeholder="Email"> -->
<!--                         </div> -->
<!--                         <div class="mb-3 col-md-6"> -->
<!--                           <label class="form-label" for="inputPassword4">Password</label> -->
<!--                           <input type="password" class="form-control" id="inputPassword4" placeholder="Password"> -->
<!--                         </div> -->
<!--                       </div> -->
<!--                       <div class="mb-3"> -->
<!--                         <label class="form-label" for="inputAddress">Address</label> -->
<!--                         <input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St"> -->
<!--                       </div> -->
<!--                       <div class="mb-3"> -->
<!--                         <label class="form-label" for="inputAddress2">Address 2</label> -->
<!--                         <input type="text" class="form-control" id="inputAddress2" placeholder="Apartment, studio, or floor"> -->
<!--                       </div> -->
<!--                       <div class="row"> -->
<!--                         <div class="mb-3 col-md-6"> -->
<!--                           <label class="form-label" for="inputCity">City</label> -->
<!--                           <input type="text" class="form-control" id="inputCity"> -->
<!--                         </div> -->
<!--                         <div class="mb-3 col-md-4"> -->
<!--                           <label class="form-label" for="inputState">State</label> -->
<!--                           <select id="inputState" class="form-control"> -->
<!--                             <option selected="selected">Choose...</option> -->
<!--                             <option>...</option> -->
<!--                           </select> -->
<!--                         </div> -->
<!--                         <div class="mb-3 col-md-2"> -->
<!--                           <label class="form-label" for="inputZip">Zip</label> -->
<!--                           <input type="text" class="form-control" id="inputZip"> -->
<!--                         </div> -->
<!--                       </div> -->
<!--                       <div class="row"> -->
<!--                         <div class="mb-3 col-md-6"> -->
<!--                           <label class="form-label fw-500">Birthdate</label> -->
<!--                           <div class="timepicker-input input-icon mb-3"> -->
<!--                             <div class="input-group"> -->
<!--                               <div class="input-group-text bgc-white bd bdwR-0"> -->
<!--                                 <i class="ti-calendar"></i> -->
<!--                               </div> -->
<!--                               <input type="text" class="form-control bdc-grey-200 start-date" placeholder="Datepicker" data-provide="datepicker"> -->
<!--                             </div> -->
<!--                           </div> -->
<!--                         </div> -->
<!--                       </div> -->
<!--                       <div class="mb-3"> -->
<!--                         <div class="checkbox checkbox-circle checkbox-info peers ai-c"> -->
<!--                           <input type="checkbox" id="inputCall2" name="inputCheckboxesCall" class="peer"> -->
<!--                           <label for="inputCall2" class="form-label peers peer-greed js-sb ai-c"> -->
<!--                             <span class="peer peer-greed">Call John for Dinner</span> -->
<!--                           </label> -->
<!--                         </div> -->
<!--                       </div> -->
<!--                       <button type="submit" class="btn btn-primary btn-color">Sign in</button> -->
<!--                     </form> -->