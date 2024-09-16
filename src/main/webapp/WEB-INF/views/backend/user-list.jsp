<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width,initial-scale=1,shrink-to-fit=no">
	    <title>Data Tables</title>
	    
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
		        }m
	      	}
		
	      	@keyframes sk-scaleout {
		        0% {
			        -webkit-transform: scale(0);
			        transform: scale(0);
		        } 100% {
			        -webkit-transform: scale(1.0);
			        transform: scale(1.0);
			        opacity: 0;
		        }
	      	}
		      
		    .dt-head-center1 {
		      	text-align: center !important;       
		    	vertical-align: middle !important;
		    }
		    
		    .dt-centerVertical{
		    	vertical-align: middle !important;
		    }
		      
		    .columnWidth1 {
		      	min-width: 130px;       /* Căn giữa theo chiều ngang */ 
		    }
		    
		    .columnWidthPasword {
/* 		      	max-width: 200px !important; /* Giới hạn chiều rộng tối đa của cột */ */
/* 			    overflow-wrap: break-word; /* Cho phép nội dung dài xuống dòng */ */
/* 			    white-space: normal; /* Cho phép nội dung xuống dòng tự nhiên */        */
		    }
    	</style>
	    <script src="http://localhost:35729/livereload.js"></script>
	  	<jsp:include page="/WEB-INF/views/backend/layout/js.jsp"></jsp:include>
	</head>
	
	<body class="app">
		<!-- loader -->
	    <jsp:include page="/WEB-INF/views/backend/layout/loader.jsp"></jsp:include>
	    
	    <div>
	   		<!-------- Left Sidebar ----->
	      	<jsp:include page="/WEB-INF/views/backend/layout/left-sidebar.jsp"></jsp:include>
	
	      	<!--------  Main ----------->
	      	<div class="page-container">
	        	<!--------- Topbar ------->
	        	<jsp:include page="/WEB-INF/views/backend/layout/header.jsp"></jsp:include>
	
	        	<!----- App Screen Content ----->
	        	<main class="main-content bgc-grey-100">
	          		<div id="mainContent">
	            		<div class="container-fluid">
	<!--               		<h4 class="c-grey-900 mT-10 mB-30">Danh sách sản phẩm</h4> -->
	              			<div class="row">
	                			<div class="col-md-12">
	                  				<div class="bgc-white bd bdrs-3 p-20 mB-20">
	                  					<div class="row">
	                  						<div class="col-9">
	                  							<h3 class="c-grey-900 mB-20 d-inline">List User</h3>
	                  						</div>
	                  						
	                  						<div class="col-3">
	                  							<a href="/admin/user/add" class="btn btn-primary btn-color float-end">Add new user</a>
	                  						</div>
	                  					</div>
	                  				
	                  					<div class="card mt-2" style="color: #72777a;">
										  	<h6 class="card-header bg-success text-white text-sm">Search</h6>
										  	<div class="card-body mx-3 my-1 ">
										  		<!-- Tìm kiếm -->
												<div class="row d-flex justify-content-center align-items-center ">
													<div class="col-md-3">
														<div class="form-group">
					                                        <label for="sltStatus" class="form-label">Status</label>
					                                        <select class="form-select" id="sltStatus" name="status">
																<option value="0">All</option>
																<option value="1" selected>Active</option>
																<option value="2">Inactive</option>
															</select>
			                                      		</div>
				                                   	</div>
				                                   	
				                                   	<div class="col-md-6">
				                                   		<label for="" class="form-label d-flex justify-content-center">Time create</label>
				                                   		<div class="row">
				                                   			<div class="col-md-6">
																<input class="form-control" type="date" id="beginDate" name="beginDate"/>		
															</div>
															<div class="col-md-6">
																<input class="form-control" type="date" id="endDate" name="endDate" />		
															</div>
				                                   		</div>
				                                   	</div>
												</div>	
										  	</div>
										</div>
	                  					
	                  					<table id="dataTable1" class="table table-striped table-bordered" cellspacing="0" width="100%">
						                    <thead>
						                        <tr>
						                          	<th scope="col">No.</th>
						                            <th scope="col">Id</th>
						                            <th scope="col">Username</th>
						                            <th scope="col">Password</th>
						                            <th scope="col">Name</th>
						                            <th scope="col">Moblie</th>
						                            <th scope="col">Email</th>
						                            <th scope="col">Address</th>
						                            <th scope="col">Avatar</th>
						                            <th scope="col">Create by</th>
						                            <th scope="col">Update by</th>
						                            <th scope="col">Create date</th>
						                            <th scope="col">Update date</th>
						                            <th scope="col">Status</th>
						                            <th scope="col">Description</th>
						                            <th scope="col">Actions</th>
						                        </tr>
						                    </thead>
						                    <tbody>
	                						</tbody>
		                    			</table>
		                  			</div>
		                		</div>
		              		</div>
		            	</div>
		          	</div>
		        </main>
	        
	        	<script type="text/javascript">            
					$(document).ready(function() {
						var dataTable = $('#dataTable1').DataTable({
					    	"processing": true,
					        "serverSide": true,
					        "ajax": {
					            "url": "/admin/user/getData",
					            "type": "GET",
					            "data": function(d) {
					            	d.statusId = $('#sltStatus').val();
					                d.beginDate = $('#beginDate').val();
					                d.endDate = $('#endDate').val();
					            }
					        },
					        "columns": [
					            { "data": null, "render": function(data, type, row, meta) {
					                return meta.row + 1;
					            }},
					            { "data": "id" },
					            { "data": "username" },
					            { "data": "password" },
					            { "data": "name" },
					            { "data": "moblie" },
					            { "data": "email" },
					            { "data": "address" },
					            { "data": "avatar", "render": function(data) {
					             	return data != null && data != '' ? '<img width="40px" height="40px" src="' + ${resource}/UploadFiles/ + data + '" class="light-logo">' : '';
					            }},
					            { "data": "userCreateUser" },
					            { "data": "userUpdateUser" },
					            { "data": "createDate", "render": function(data) {
					                return data != null ? moment(data).format('DD-MM-YYYY') : null;
					            }},
					            { "data": "updateDate", "render": function(data) {
					                return data != null ? moment(data).format('DD-MM-YYYY') : null;
					            }},
					            { "data": "status", "render": function(data) {
					                return data ? 'Active' : 'Inactive';
					            }},
					            { "data": "description" },					            
					            { "data": null, "render": function(data, type, row) {
					                return '<div>' + 
					                		'<a href="' + '${resource}/admin/user/edit/' + row.id + '" role="button" class="btn btn-primary me-1" style="display:inline;">Edit</a>' +
					                       	'<a href="' + '${resource}/admin/user/delete/' + row.id + '" role="button" class="btn btn-secondary" style="display:inline;">Delete</a>'+
					            			'</div>'
					            }}
					        ],
					        "scrollX": true,
					        "columnDefs": [
					        	{ className: "dt-centerVertical", targets: "_all" },
					            {
					                targets: [0,1,11,12,13],
					                className: 'dt-head-center1'
					            },
 					            { "targets": [2,9,10,11,12], "className": "columnWidth1" },
 					           { "targets": [3], "className": "columnWidthPasword" },
					          ]
					    });
					    
					    $('#sltStatus, #beginDate, #endDate').on('change', function() {
							dataTable.ajax.reload(); 
					    });
					    
					});
	        	</script>
	
		        <!----- App Screen Footer ------>
		        <jsp:include page="/WEB-INF/views/backend/layout/footer.jsp"></jsp:include>
	      	</div>
	    </div> 
	</body>
</html>
