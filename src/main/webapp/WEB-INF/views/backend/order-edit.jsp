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
	
	     	<!--------- Main ---------->
	      	<div class="page-container">
	        	<!--------- Topbar ------->
	        	<jsp:include page="/WEB-INF/views/backend/layout/header.jsp"></jsp:include>
	
		        <!-- ### $App Screen Content ### -->
		        <main class="main-content bgc-grey-100">
		          	<div id="mainContent">
		          		<div class="card" style="color: #72777a;">
						  	<h5 class="card-header bg-primary text-white">Edit SaleOrder</h5>
						  	<div class="card-body mx-3 my-2">
		                  		<sf:form class="form" action="/admin/saleOrder/edit-save" method="post" modelAttribute="saleOrder">
	                        		<div class="form-body">
										<sf:hidden path="id" />
										<!-- id > 0 -> Edit -->
		                        		 	
	                        			<div class="row">
	                        				<div class="col-md-3">
												<div class="form-group mb-4">
			                                        <label for="userId" class="form-label">User Id</label>
			                                        <sf:input path="user.id" type="text" class="form-control" id="userId" name="userId" readonly="true"></sf:input>
		                                      	</div>
		                                   	</div>
	                        			
		                                   	<div class="col-md-3">
												<div class="form-group mb-4">
			                                        <label for="code" class="form-label">Code</label>
			                                        <sf:input path="code" type="text" class="form-control" id="code" name="code"></sf:input>
		                                      	</div>
		                                   	</div>
		                                   	
		                                   	<div class="col-md-3">
												<div class="form-group mb-4">
			                                        <label for="total" class="form-label">Total</label>
			                                        <sf:input path="total" type="text" class="form-control" id="total" name="total" readonly="true"></sf:input>
		                                      	</div>
		                                   	</div>
		                                   	
		                                   	<div class="col-md-3 d-flex align-items-center">
												<div class="form-group">
													<label for="status" class="form-label">&nbsp;&nbsp;&nbsp;&nbsp;</label>
													<sf:checkbox path="status" class="form-check-input" id="status" name="status"></sf:checkbox>
			                                        <label for="status">Active</label>
		                                      	</div>
	                                   		</div>
										</div>
										
										<div class="row">
		                                   	<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="customerName" class="form-label">Customer Name</label>
			                                        <sf:input path="customerName" type="text" class="form-control" id="customerName" name="customerName"></sf:input>
		                                      	</div>
		                                   	</div>
		                                   	
		                                   	<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="customerMobile" class="form-label">Customer Mobile</label>
			                                        <sf:input path="customerMobile" type="text" class="form-control" id="customerMobile" name="customerMobile"></sf:input>
		                                      	</div>
		                                   	</div>
										</div>
										
										<div class="row">
		                                   	<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="customerEmail" class="form-label">Customer Email</label>
			                                        <sf:input path="customerEmail" type="text" class="form-control" id="customerEmail" name="customerEmail"></sf:input>
		                                      	</div>
		                                   	</div>
		                                   	
		                                   	<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="customerAddress" class="form-label">Customer Address</label>
			                                        <sf:input path="customerAddress" type="text" class="form-control" id="customerAddress" name="customerAddress"></sf:input>
		                                      	</div>
		                                   	</div>
										</div>
										
										<div class="row">
		                       		 		<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="create" class="form-label">Create by</label>
			                                        <sf:select path="userCreateSaleOrder.id" class="form-select" id="createBy">
			                                            <sf:options items="${users }" itemValue="id" itemLabel="username"></sf:options>
			                                        </sf:select>
		                                      	</div>
		                                   	</div>
									
											<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="update" class="form-label">Update by</label>
			                                        <sf:select path="userUpdateSaleOrder.id" class="form-select" id="updateBy">
			                                            <sf:options items="${users }" itemValue="id" itemLabel="username"></sf:options>
			                                        </sf:select>
		                                      	</div>
		                                   	</div>
										</div>
										
										<div class="row">
		                       		 		<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="createDate" class="form-label">Create date</label>
			                                        <sf:input path="createDate" class="form-control" type="date" id="createDate" name="createDate"></sf:input>
		                                      	</div>
		                                   	</div>
									
											<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="updateDate" class="form-label">Update date</label>
			                                        <sf:input path="updateDate" class="form-control" type="date" id="updateDate" name="updateDate"></sf:input>
		                                      	</div>
		                                   	</div>
										</div>
										
										
										
										<div class="row">
		                       		 		<div class="col-md-12">
												<div class="form-group mb-4">
													<button type="submit" class="btn btn-primary btn-color float-end">Save edit saleOrder</button>
			                                        <a href="/admin/order/view" class="btn btn-secondary active float-end me-1" role="button" aria-pressed="true">
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
