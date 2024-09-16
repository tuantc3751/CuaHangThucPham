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
						  	<h5 class="card-header bg-primary text-white">Edit User</h5>
						  	<div class="card-body mx-3 my-2">
		                  		<sf:form class="form" action="/admin/user/edit-save" method="post" modelAttribute="user">
	                        		<div class="form-body">
										<sf:hidden path="id" />
										<!-- id > 0 -> Edit -->
		                        		 	
	                        			<div class="row">
		                       		 		<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="username" class="form-label">Username</label>
			                                        <sf:input path="username" type="text" class="form-control" id="username" name="username"></sf:input>
		                                      	</div>
		                                   	</div>
		                                   	
		                                   	<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="password" class="form-label" >Password</label>
			                                        <sf:input path="password" type="text" class="form-control" id="password" name="password" readonly="true"></sf:input>
		                                      	</div>
		                                   	</div>
										</div>
										
										<div class="row">
		                       		 		<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="name" class="form-label">Name</label>
			                                        <sf:input path="name" type="text" class="form-control" id="name" name="name"></sf:input>
		                                      	</div>
		                                   	</div>
		                                   	
		                                   	<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="mobile" class="form-label">Mobile</label>
			                                        <sf:input path="mobile" type="text" class="form-control" id="mobile" name="mobile"></sf:input>
		                                      	</div>
		                                   	</div>
										</div>
										
										<div class="row">
		                       		 		<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="email" class="form-label">Email</label>
			                                        <sf:input path="email" type="text" class="form-control" id="email" name="email"></sf:input>
		                                      	</div>
		                                   	</div>
		                                   	
		                                   	<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="address" class="form-label">Address</label>
			                                        <sf:input path="address" type="text" class="form-control" id="address" name="address"></sf:input>
		                                      	</div>
		                                   	</div>
										</div>
										
										<div class="row">
		                       		 		<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="create" class="form-label">Create by</label>
			                                        <sf:select path="userCreateUser.id" class="form-select" id="createBy">
			                                            <sf:options items="${users}" itemValue="id" itemLabel="username"></sf:options>
			                                        </sf:select>
		                                      	</div>
		                                   	</div>
									
											<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="update" class="form-label">Update by</label>
			                                        <sf:select path="userUpdateUser.id" class="form-select" id="updateBy">
			                                            <sf:options items="${users}" itemValue="id" itemLabel="username"></sf:options>
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
			                                        <label for="description" class="form-label">Description</label>
			                                        <sf:textarea path="description" id="shortDescription" name="shortDescription" class="form-control" rows="3" placeholder="Short desription..."></sf:textarea>
		                                      	</div>
		                                   	</div>
										</div>
										
										<div class="row">
		                       		 		<div class="col-md-5">
												<div class="form-group mb-4">
			                                        <label for="role" class="form-label">Role</label>
			                                        <select class="form-select" id="role" name="roleId">
				                                        <c:forEach var="role" items="${roles}">
	                										 <option value="${role.id}" <c:if test="${role.id == roleId}">selected</c:if>>
											                    ${role.name}
											                </option>
	            										</c:forEach>
			                                    	</select>
			                                    </div>
		                                   	</div>
										
		                       		 		<div class="col-md-5 d-flex align-items-center">
												<div class="form-group">
			                                        <label for="avatarFile" class="form-label">Choose user Avatar</label>
		                                  				<input id="avatarFile" name="avatarFile" type="file" class="form-control-file">
		                                      		</div>
		                                   	</div>
		                                   	
		                                   	<div class="col-md-2 d-flex align-items-center">
												<div class="form-group">
													<label for="status" class="form-label">&nbsp;&nbsp;&nbsp;&nbsp;</label>
													<sf:checkbox path="status" class="form-check-input" id="status" name="status"></sf:checkbox>
			                                        <label for="status">Active</label>
		                                      	</div>
		                                   	</div>
										</div>
										
										<div class="row">
		                       		 		<div class="col-md-12">
												<div class="form-group mb-4">
													<button type="submit" class="btn btn-primary btn-color float-end">Save add user</button>
			                                        <a href="/admin/user/view" class="btn btn-secondary active float-end me-1" role="button" aria-pressed="true">
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
