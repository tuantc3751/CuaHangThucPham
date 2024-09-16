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
		      
		    .columnWidth1 {
		      	min-width: 130px;       /* Căn giữa theo chiều ngang */ 
		    }
		    
		    .columnWidthDescription {
		      	min-width: 200px;      
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
	                  							<h3 class="c-grey-900 mB-20 d-inline">List Product</h3>
	                  						</div>
	                  						
	                  						<div class="col-3">
	                  							<a href="/admin/product/add" class="btn btn-primary btn-color float-end">Add new product</a>
	                  						</div>
	                  					</div>
	                   					
	                   					<div class="card mt-2" style="color: #72777a;">
										  	<h6 class="card-header bg-success text-white text-sm">Search</h6>
										  	<div class="card-body mx-3 my-1">
										  		<!-- Tìm kiếm -->
												<div class="row">
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
				                                   	
				                                   	<div class="col-md-3">
														<div class="form-group">
					                                        <label for="sltCategory" class="form-label">Category</label>
					                                        <select class="form-select" id="sltCategory" name="categoryId">
																<option value="0">Select category</option>
																<c:forEach items="${categories}" var="category">
																	<option value="${category.id}">${category.name}</option>
																</c:forEach>
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
<!-- 														<div class="form-group"> -->
<!-- 					                                        <label for="" class="form-label">Time create</label> -->
<!-- 					                                        <input class="form-control" type="date" id="beginDate" name="beginDate"/>	 -->
<!-- 			                                      			<input class="form-control" type="date" id="endDate" name="endDate" /> -->
<!-- 			                                      		</div> -->
				                                   	</div>
													
<!-- 													<div class="col-md-3"> -->
<!-- 														<input class="form-control" type="date" id="beginDate" name="beginDate"/>		 -->
<!-- 													</div> -->
<!-- 													<div class="col-md-3"> -->
<!-- 														<input class="form-control" type="date" id="endDate" name="endDate" />		 -->
<!-- 													</div> -->
												</div>	
										  	</div>
										</div>
							
										                   					
	                   					
	                  					<table id="dataTable1" class="table table-striped table-bordered" cellspacing="0" width="100%">
						                    <thead>
						                        <tr>
						                          	<th scope="col">No.</th>
						                            <th scope="col">Id</th>
						                            <th scope="col">Category</th>
						                            <th scope="col">Name</th>
						                            <th scope="col">Price</th>
						                            <th scope="col">Sale price</th>
						                            <th scope="col">Avatar</th>
						                            <th scope="col">Description</th>
						                            <th scope="col">Details</th>
						                            <th scope="col">Create by</th>
						                            <th scope="col">Update by</th>
						                            <th scope="col">Create date</th>
						                            <th scope="col">Update date</th>
						                            <th scope="col">Status</th>
						                            <th scope="col">Is hot</th>
						                            <th scope="col">Seo</th>
						                            <th scope="col">Origin</th>
						                            <th scope="col">Actions</th>
<!-- 						                            <th scope="col">STT</th> -->
						                        </tr>
						                    </thead>
						                    <tbody>
	<%-- 	                                        	<c:forEach var="product" items="${products }" varStatus="loop"> --%>
	<!-- 	                                            <tr> -->
	<%-- 	                                            	<td scope="row">${loop.index + 1 }</td> --%>
	<%-- 	                                                <td>${product.id }</td> --%>
	<%-- 	                                                <td>${product.category.name }</td> --%>
	<%-- 	                                                <td>${product.name }</td> --%>
	<!-- 	                                                <td align="right"> -->
	<%-- 	                                                	<fmt:formatNumber value="${product.price }" minFractionDigits="0"></fmt:formatNumber> --%>
	<!-- 	                                                </td> -->
	<%-- 	                                                <td align="right">${product.salePrice }</td> --%>
	<!-- 	                                                <td></td> -->
	<!-- 	                                                <td> -->
	<!-- 	                                                	<img width="40px" height="40px"  -->
	<%-- 	                                                		src="${resource}/UploadFiles/${product.avatar }" class="light-logo"> --%>
	<!-- 	                                                </td> -->
		                                                
	<%-- 	                                                <td>${product.shortDescription }</td> --%>
	<%-- 	                                                <td>${product.detailDescription }</td> --%>
	<%-- 	                                                <td>${product.userCreateProduct.username }</td> --%>
	<%-- 	                                                <td>${product.userUpdateProduct.username }</td> --%>
		                                                
	<!-- 	                                                <td> -->
	<%-- 	                                                	<fmt:formatDate value="${product.createDate }" pattern="dd-MM-yyyy"/> --%>
	<!-- 	                                                </td> -->
	<!-- 	                                                <td> -->
	<%-- 	                                                	<fmt:formatDate value="${product.updateDate }" pattern="dd-MM-yyyy"/> --%>
	<!-- 	                                                </td> -->
		                                                
	<!-- 	                                                <td> -->
	<%-- 	                                                	<span id="_product_status_${product.id }"> --%>
	<%-- 	                                                		<c:choose> --%>
	<%-- 	                                                			<c:when test="${product.status }"> --%>
	<!-- 	                                                				<span>Active</span> -->
	<%-- 	                                                			</c:when> --%>
	<%-- 	                                                			<c:otherwise> --%>
	<!-- 	                                                				<span>Inactive</span> -->
	<%-- 	                                                			</c:otherwise> --%>
	<%-- 	                                                		</c:choose> --%>
	<!-- 	                                                	</span> -->
		                                                	
	<!-- 	                                                </td> -->
	<!-- 	                                                <td> -->
	<%-- 	                                                	<span id="_product_isHot_${product.id }"> --%>
	<%-- 	                                                		<c:choose> --%>
	<%-- 	                                                			<c:when test="${product.isHot }"> --%>
	<!-- 	                                                				<span>Yes</span> -->
	<%-- 	                                                			</c:when> --%>
	<%-- 	                                                			<c:otherwise> --%>
	<!-- 	                                                				<span>No</span> -->
	<%-- 	                                                			</c:otherwise> --%>
	<%-- 	                                                		</c:choose> --%>
	<!-- 	                                                	</span> -->
	<!-- 	                                                </td> -->
	<%-- 	                                               	<td>${product.seo }</td> --%>
	<!-- 	                                                <td> -->
	<!-- 	                                                	<div> -->
	<%-- 	                                                		<a href="${resource}/admin/product/edit/${product.id }" role="button" class="btn btn-primary">Edit</a> --%>
	<%-- 	                                                		<a href="${resource}/admin/product/delete/${product.id }" role="button" class="btn btn-secondary">Delete</a> --%>
	<!-- 	                                                	</div> -->
	<!-- 	                                                </td> -->
	<!-- 	                                            </tr> -->
	<%-- 	                                            </c:forEach> --%>
	                						</tbody>
		                    			</table>
		                  			</div>
		                		</div>
		              		</div>
		            	</div>
		          	</div>
		        </main>
	  
	        
	        	<script type="text/javascript">            
	//              $(document).ready(function() {
	//             $('#example').DataTable({
	//                 "processing": true,
	//                 "serverSide": true,
	//                 "ajax": {
	//                     "url": "/admin/product/data",
	//                     "type": "GET"
	//                 },
	//                 "columns": [
	//                     { "data": "id" },
	//                     { "data": "name" },
	//                     { "data": "email" }
	//                 ]
	//             });
			 
					$(document).ready(function() {
						var dataTable = $('#dataTable1').DataTable({
					    	"processing": true,
					        "serverSide": true,
					        "ajax": {
					            "url": "/admin/product/data",
					            "type": "GET",
					            "data": function(d) {
					                // You can add additional parameters here if needed
					                d.categoryId = $('#sltCategory').val();
					                d.statusId = $('#sltStatus').val();
					                d.beginDate = $('#beginDate').val();
					                d.endDate = $('#endDate').val();
					                console.log(d);
					            }
					        },
					        "columns": [
					            { "data": null, "render": function(data, type, row, meta) {
					                return meta.row + 1;
					            }},
					            { "data": "id" },
					            { "data": "category" },
					            { "data": "name" },
					            { "data": "price", "render": function(data) {
					                return $.fn.dataTable.render.number(',', '.', 0).display(data);
					            }},
					            { "data": "salePrice", "render": function(data) {
					                return $.fn.dataTable.render.number(',', '.', 0).display(data);
					            }},
					            { "data": "avatar", "render": function(data) {
					                //if(data == null) console.log('abc123');
					             	return data != null && data != '' ? '<img width="40px" height="40px" src="' + ${resource}/UploadFiles/ + data + '" class="light-logo">' : '';
					            }},
					            { "data": "shortDescription" },
					            { "data": "detailDescription" },
					            { "data": "userCreateProduct" },
					            { "data": "userUpdateProduct" },
					            { "data": "createDate", "render": function(data) {
					                return data != null ? moment(data).format('DD-MM-YYYY') : null;
					            }},
					            { "data": "updateDate", "render": function(data) {
					                return data != null ? moment(data).format('DD-MM-YYYY') : null;
					            }},
					            { "data": "status", "render": function(data) {
					                return data ? 'Active' : 'Inactive';
					            }},
					            { "data": "isHot", "render": function(data) {
					                return data ? 'Yes' : 'No';
					            }},
					            { "data": "seo" },
					            { "data": "origin" },
					            { "data": null, "render": function(data, type, row) {
					                return '<div>' + 
					                		'<a href="' + '${resource}/admin/product/edit/' + row.id + '" role="button" class="btn btn-primary me-1" style="display:inline;">Edit</a>' +
					                       	'<a href="' + '${resource}/admin/product/delete/' + row.id + '" role="button" class="btn btn-secondary" style="display:inline;">Delete</a>'+
					            			'</div>'
					            }},
// 					            { "data": "STT" }
					        ],
					        "scrollX": true,
// 					        "language": {
// 					            "sProcessing":   "Đang xử lý...",
// 					            "sLengthMenu":   "Hiển thị _MENU_ dòng trên trang",
// 					            "sZeroRecords":  "Không tìm thấy kết quả",
// 					            "sInfo":         "Hiển thị từ _START_ đến _END_ trong tổng số _TOTAL_ dòng",
// 					            "sInfoEmpty":    "Hiển thị từ 0 đến 0 trong tổng số 0 mục",
// 					            "sInfoFiltered": "(được lọc từ tổng số _MAX_ mục)",
// 					            "sInfoPostFix":  "",
// 					            "sSearch":       "Tìm kiếm:",
// 					            "sUrl":          "",
// 					            "sInfoThousands":  ",",
// 					            "sLoadingRecords": "Đang tải dữ liệu...",
// 					            "oAria": {
// 					                "sSortAscending":  ": sắp xếp cột theo thứ tự tăng dần",
// 					                "sSortDescending": ": sắp xếp cột theo thứ tự giảm dần"
// 					            }
// 					        },
					        "columnDefs": [
					            {
					                targets: [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16, 17],
					                className: 'dt-head-center1'
					            },
					            { "targets": [5,9,10,11,12], "className": "columnWidth1" },
					            { "targets": [7], "className": "columnWidthDescription" },
					          ]
					    });
						
						$('#sltCategory, #sltStatus, #beginDate, #endDate').on('change', function() {
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
