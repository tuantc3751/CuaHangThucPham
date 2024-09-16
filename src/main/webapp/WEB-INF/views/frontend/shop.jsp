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

        <!-- Variables -->
		<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>

        <!-- Css -->
		<jsp:include page="/WEB-INF/views/frontend/layout/css.jsp"></jsp:include>
		
		<style type="text/css">
			.hoverName{
        		color: #45595b;
        	}
        	
        	.hoverName:hover{
        		color: #81c408;
        	}
		</style>
		
<!-- 		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/simplePagination.js/1.4/simplePagination.css"/> -->
    </head>

    <body>
		<!-- Navbar -->
		<jsp:include page="/WEB-INF/views/frontend/layout/navbar.jsp"></jsp:include>

        <!-- Single Page Header start -->
        <div class="container-fluid page-header py-5">
            <h1 class="text-center text-white display-6">Shop</h1>
            <ol class="breadcrumb justify-content-center mb-0">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <li class="breadcrumb-item"><a href="#">Pages</a></li>
                <li class="breadcrumb-item active text-white">Shop</li>
            </ol>
        </div>
        <!-- Single Page Header End -->

        <!-- Fruits Shop Start-->
        <div class="container-fluid fruite py-5">
            <div class="container py-5">
                <h1 class="mb-4">Fresh food shop</h1>
                <div class="row g-4">
                    <div class="col-lg-12">
                        <div class="row g-4">
                            <div class="col-xl-3">
<!--                                 <div class="input-group w-100 mx-auto d-flex"> -->
<!--                                     <input type="search" id="inpSearch" class="form-control p-3" placeholder="keywords" aria-describedby="search-icon-1"> -->
<!--                                     <span id="search-icon-1" class="input-group-text p-3"><i class="fa fa-search"></i></span> -->
<!--                                 </div> -->
                            </div>
                            <div class="col-6"></div>
                            <div class="col-xl-3">
                                <div class="bg-light ps-3 py-3 rounded d-flex justify-content-between mb-4">
                                    <label for="fruits">Default Sorting:</label>
                                    <select id="fruits" name="fruitlist" class="border-0 form-select-sm bg-light me-3" form="fruitform">
                                        <option value="0">Nothing</option>
                                        <option value="1">Name</option>
                                        <option value="2">Price</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row g-4">
                            <div class="col-lg-3">
                                <div class="row g-4">
                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                            <h4>Categories</h4>
                                            <ul class="list-unstyled fruite-categorie">
                                            	
                                            	<li>
											        <div class="justify-content-between fruite-name">
											            <input type="radio" id="category-0" name="category" class="category-radio me-2" data-category-id="0" checked>
											            <label for="category-0" class="">
											                <i class="fas fa-apple-alt me-2"></i>All
											            </label>
											            <span class= "float-end">(${products.size()})</span>
											        </div>
											    </li>
											    <c:forEach items="${categories}" var="category">
											        <li>
											            <div class="justify-content-between fruite-name">
											                <input type="radio" id="category-${category.id}" name="category" class="category-radio me-2" data-category-id="${category.id}">
											                <label for="category-${category.id}" class="">
											                    <i class="fas fa-apple-alt me-2"></i>${category.name}
											                </label>
											                <span class= "float-end">(${category.products.size()})</span>
											            </div>
											        </li>
											    </c:forEach>
                                            	
<!--                                             	<li> -->
<!-- 		                                            <div class="d-flex justify-content-between fruite-name"> -->
<!-- 		                                                <a href="#" class="category-link active" data-category-id="0"> -->
<!-- 		                                                	<i class="fas fa-apple-alt me-2"></i>All -->
<!-- 		                                                </a> -->
<%-- 		                                                <span>(${products.size()})</span> --%>
<!-- 		                                            </div> -->
<!-- 	                                        	</li> -->
<%--                                             	<c:forEach items="${categories}" var="category"> --%>
<!-- 		                                    		<li> -->
<!-- 			                                            <div class="d-flex justify-content-between fruite-name"> -->
<%-- 			                                                <a href="#" class="category-link" data-category-id="${category.id}"> --%>
<%-- 			                                                	<i class="fas fa-apple-alt me-2"></i>${category.name} --%>
<!-- 			                                                </a> -->
<%-- 			                                                <span>(${category.products.size()})</span> --%>
<!-- 			                                            </div> -->
<!-- 		                                        	</li> -->
<%-- 		                                    	</c:forEach> --%>
                                            
<!--                                                 <li> -->
<!--                                                     <div class="d-flex justify-content-between fruite-name"> -->
<!--                                                         <a href="#"><i class="fas fa-apple-alt me-2"></i>Apples</a> -->
<!--                                                         <span>(3)</span> -->
<!--                                                     </div> -->
<!--                                                 </li> -->
<!--                                                 <li> -->
<!--                                                     <div class="d-flex justify-content-between fruite-name"> -->
<!--                                                         <a href="#"><i class="fas fa-apple-alt me-2"></i>Oranges</a> -->
<!--                                                         <span>(5)</span> -->
<!--                                                     </div> -->
<!--                                                 </li> -->
<!--                                                 <li> -->
<!--                                                     <div class="d-flex justify-content-between fruite-name"> -->
<!--                                                         <a href="#"><i class="fas fa-apple-alt me-2"></i>Strawbery</a> -->
<!--                                                         <span>(2)</span> -->
<!--                                                     </div> -->
<!--                                                 </li> -->
<!--                                                 <li> -->
<!--                                                     <div class="d-flex justify-content-between fruite-name"> -->
<!--                                                         <a href="#"><i class="fas fa-apple-alt me-2"></i>Banana</a> -->
<!--                                                         <span>(8)</span> -->
<!--                                                     </div> -->
<!--                                                 </li> -->
<!--                                                 <li> -->
<!--                                                     <div class="d-flex justify-content-between fruite-name"> -->
<!--                                                         <a href="#"><i class="fas fa-apple-alt me-2"></i>Pumpkin</a> -->
<!--                                                         <span>(5)</span> -->
<!--                                                     </div> -->
<!--                                                 </li> -->
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                            <h4 class="mb-2">Price</h4>
<!--                                             <input type="range" class="form-range w-100" id="rangeInput" name="rangeInput" min="0" max="50000" value="0" oninput="amount.value=rangeInput.value"> -->
                                            <input type="range" class="form-range w-100" id="rangeInput" name="rangeInput" min="0" max="200000" value="0" oninput="formatValue()">
                                            <output id="amount" name="amount" min-value="0" max-value="500" for="rangeInput">
                                            	0
                                            </output>                                             
                                            <sup>đ</sup>
                                            
                                            <script>
												function formatValue() {
												    var rangeInput = document.getElementById("rangeInput").value;
												    var formattedValue = new Intl.NumberFormat('vi-VN').format(rangeInput);
												    document.getElementById("amount").value = formattedValue;
												}
											</script>
                                        </div>
                                    </div>
<!--                                     <div class="col-lg-12"> -->
<!--                                         <h4 class="mb-3">Featured products</h4> -->
<!--                                         <div class="d-flex align-items-center justify-content-start"> -->
<!--                                             <div class="rounded me-4" style="width: 100px; height: 100px;"> -->
<%--                                                 <img src="${resource}/frontend/img/featur-1.jpg" class="img-fluid rounded" alt=""> --%>
<!--                                             </div> -->
<!--                                             <div> -->
<!--                                                 <h6 class="mb-2">Big Banana</h6> -->
<!--                                                 <div class="d-flex mb-2"> -->
<!--                                                     <i class="fa fa-star text-secondary"></i> -->
<!--                                                     <i class="fa fa-star text-secondary"></i> -->
<!--                                                     <i class="fa fa-star text-secondary"></i> -->
<!--                                                     <i class="fa fa-star text-secondary"></i> -->
<!--                                                     <i class="fa fa-star"></i> -->
<!--                                                 </div> -->
<!--                                                 <div class="d-flex mb-2"> -->
<!--                                                     <h5 class="fw-bold me-2">2.99 $</h5> -->
<!--                                                     <h5 class="text-danger text-decoration-line-through">4.11 $</h5> -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <div class="d-flex align-items-center justify-content-start"> -->
<!--                                             <div class="rounded me-4" style="width: 100px; height: 100px;"> -->
<%--                                                 <img src="${resource}/frontend/img/featur-2.jpg" class="img-fluid rounded" alt=""> --%>
<!--                                             </div> -->
<!--                                             <div> -->
<!--                                                 <h6 class="mb-2">Big Banana</h6> -->
<!--                                                 <div class="d-flex mb-2"> -->
<!--                                                     <i class="fa fa-star text-secondary"></i> -->
<!--                                                     <i class="fa fa-star text-secondary"></i> -->
<!--                                                     <i class="fa fa-star text-secondary"></i> -->
<!--                                                     <i class="fa fa-star text-secondary"></i> -->
<!--                                                     <i class="fa fa-star"></i> -->
<!--                                                 </div> -->
<!--                                                 <div class="d-flex mb-2"> -->
<!--                                                     <h5 class="fw-bold me-2">2.99 $</h5> -->
<!--                                                     <h5 class="text-danger text-decoration-line-through">4.11 $</h5> -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <div class="d-flex align-items-center justify-content-start"> -->
<!--                                             <div class="rounded me-4" style="width: 100px; height: 100px;"> -->
<%--                                                 <img src="${resource}/frontend/img/featur-3.jpg" class="img-fluid rounded" alt=""> --%>
<!--                                             </div> -->
<!--                                             <div> -->
<!--                                                 <h6 class="mb-2">Big Banana</h6> -->
<!--                                                 <div class="d-flex mb-2"> -->
<!--                                                     <i class="fa fa-star text-secondary"></i> -->
<!--                                                     <i class="fa fa-star text-secondary"></i> -->
<!--                                                     <i class="fa fa-star text-secondary"></i> -->
<!--                                                     <i class="fa fa-star text-secondary"></i> -->
<!--                                                     <i class="fa fa-star"></i> -->
<!--                                                 </div> -->
<!--                                                 <div class="d-flex mb-2"> -->
<!--                                                     <h5 class="fw-bold me-2">2.99 $</h5> -->
<!--                                                     <h5 class="text-danger text-decoration-line-through">4.11 $</h5> -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <div class="d-flex justify-content-center my-4"> -->
<!--                                             <a href="#" class="btn border border-secondary px-4 py-3 rounded-pill text-primary w-100">Vew More</a> -->
<!--                                         </div> -->
<!--                                     </div> -->
                                    <div class="col-lg-12">
                                        <div class="position-relative">
                                            <img src="${resource}/frontend/img/banner-fruits.jpg" class="img-fluid w-100 rounded" alt="">
                                            <div class="position-absolute" style="top: 50%; right: 10px; transform: translateY(-50%);">
                                                <h3 class="text-secondary fw-bold">Fresh <br> Fruits <br> Banner</h3>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-9">
                                <div class="row g-4 justify-content-center" id="products-container">
                                	
                                	<c:forEach items="${products}" var="product">
                                		<div class="col-md-6 col-lg-6 col-xl-4">
	                                        <div class="rounded position-relative fruite-item border border-secondary">
	                                            <div class="fruite-img">
	                                                <img src="${resource}/UploadFiles/${product.avatar}" class="img-fluid w-100 rounded-top" alt="" style="height: 214.2px">
	                                            </div>
	                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">${product.category.name}</div>
	                                            <div class="p-4">
	                                                <h4>
	                                                	<a href="${resource}/product-detail/${product.id}" class="hoverName">${product.name}</a>
	                                                </h4>
	                                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
	                                                <div class="d-flex justify-content-between flex-lg-wrap">
	                                                    <p class="text-dark fs-5 fw-bold mb-0">
	                                                    	<span >
																<fmt:formatNumber value="${product.price}" minFractionDigits="0"></fmt:formatNumber> 
															</span> 
															<sup>đ</sup>
															<span>/ kg</span>
	                                                    </p>
	                                                    <a onclick="addToCart(${product.id}, 1 , '${product.name}')" class="btn border border-secondary px-3 text-primary"><i class="fa fa-shopping-bag text-primary"></i></a>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </div>
                                	</c:forEach>
                                
                                    <div class="col-md-6 col-lg-6 col-xl-4">
                                        <div class="rounded position-relative fruite-item">
                                            <div class="fruite-img">
                                                <img src="${resource}/frontend/img/fruite-item-5.jpg" class="img-fluid w-100 rounded-top" alt="">
                                            </div>
                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div>
                                            <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                <h4>Grapes</h4>
                                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                                                <div class="d-flex justify-content-between flex-lg-wrap">
                                                    <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
                                                    <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-lg-6 col-xl-4">
                                        <div class="rounded position-relative fruite-item">
                                            <div class="fruite-img">
                                                <img src="${resource}/frontend/img/fruite-item-2.jpg" class="img-fluid w-100 rounded-top" alt="">
                                            </div>
                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div>
                                            <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                <h4>Raspberries</h4>
                                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                                                <div class="d-flex justify-content-between flex-lg-wrap">
                                                    <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
                                                    <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-lg-6 col-xl-4">
                                        <div class="rounded position-relative fruite-item">
                                            <div class="fruite-img">
                                                <img src="${resource}/frontend/img/fruite-item-4.jpg" class="img-fluid w-100 rounded-top" alt="">
                                            </div>
                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div>
                                            <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                <h4>Apricots</h4>
                                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                                                <div class="d-flex justify-content-between flex-lg-wrap">
                                                    <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
                                                    <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-lg-6 col-xl-4">
                                        <div class="rounded position-relative fruite-item">
                                            <div class="fruite-img">
                                                <img src="${resource}/frontend/img/fruite-item-3.jpg" class="img-fluid w-100 rounded-top" alt="">
                                            </div>
                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div>
                                            <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                <h4>Banana</h4>
                                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                                                <div class="d-flex justify-content-between flex-lg-wrap">
                                                    <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
                                                    <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-lg-6 col-xl-4">
                                        <div class="rounded position-relative fruite-item">
                                            <div class="fruite-img">
                                                <img src="${resource}/frontend/img/fruite-item-1.jpg" class="img-fluid w-100 rounded-top" alt="">
                                            </div>
                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div>
                                            <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                <h4>Oranges</h4>
                                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                                                <div class="d-flex justify-content-between flex-lg-wrap">
                                                    <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
                                                    <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-lg-6 col-xl-4">
                                        <div class="rounded position-relative fruite-item">
                                            <div class="fruite-img">
                                                <img src="${resource}/frontend/img/fruite-item-2.jpg" class="img-fluid w-100 rounded-top" alt="">
                                            </div>
                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div>
                                            <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                <h4>Raspberries</h4>
                                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                                                <div class="d-flex justify-content-between flex-lg-wrap">
                                                    <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
                                                    <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-lg-6 col-xl-4">
                                        <div class="rounded position-relative fruite-item">
                                            <div class="fruite-img">
                                                <img src="${resource}/frontend/img/fruite-item-5.jpg" class="img-fluid w-100 rounded-top" alt="">
                                            </div>
                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div>
                                            <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                <h4>Grapes</h4>
                                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                                                <div class="d-flex justify-content-between flex-lg-wrap">
                                                    <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
                                                    <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-lg-6 col-xl-4">
                                        <div class="rounded position-relative fruite-item">
                                            <div class="fruite-img">
                                                <img src="${resource}/frontend/img/fruite-item-1.jpg" class="img-fluid w-100 rounded-top" alt="">
                                            </div>
                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div>
                                            <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                <h4>Oranges</h4>
                                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                                                <div class="d-flex justify-content-between flex-lg-wrap">
                                                    <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
                                                    <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                </div>
                                
                                <div class="row">
                                	<div class="col-12">
                                    	<div class="pagination d-flex justify-content-center mt-5">
											<div id="paging"></div>
										</div>
									</div>
<!--                                 	<div class="col-12"> -->
<!--                                         <div class="pagination d-flex justify-content-center mt-5"> -->
<!--                                             <a href="#" class="rounded">&laquo;</a> -->
<!--                                             <a href="#" class="active rounded">1</a> -->
<!--                                             <a href="#" class="rounded">2</a> -->
<!--                                             <a href="#" class="rounded">3</a> -->
<!--                                             <a href="#" class="rounded">4</a> -->
<!--                                             <a href="#" class="rounded">5</a> -->
<!--                                             <a href="#" class="rounded">6</a> -->
<!--                                             <a href="#" class="rounded">&raquo;</a> -->
<!--                                         </div> -->
<!--                                     </div> -->
                                    
<!--                                     <div class="col-12"> -->
<!--                                         <nav aria-label="Page navigation example"> -->
<!-- 										  <ul class="pagination"> -->
<!-- 										    <li class="page-item"> -->
<!-- 										      <a class="page-link" href="#" aria-label="Previous"> -->
<!-- 										        <span aria-hidden="true">&laquo;</span> -->
<!-- 										      </a> -->
<!-- 										    </li> -->
<!-- 										    <li class="page-item"><a class="page-link" href="#">1</a></li> -->
<!-- 										    <li class="page-item"><a class="page-link" href="#">2</a></li> -->
<!-- 										    <li class="page-item"><a class="page-link" href="#">3</a></li> -->
<!-- 										    <li class="page-item"> -->
<!-- 										      <a class="page-link" href="#" aria-label="Next"> -->
<!-- 										        <span aria-hidden="true">&raquo;</span> -->
<!-- 										      </a> -->
<!-- 										    </li> -->
<!-- 										  </ul> -->
<!-- 										</nav> -->
<!--                                     </div> -->
                                    
<!--                                     <div class="col-12"> -->
<!--                                     	<nav aria-label="Abc123"> -->
<!-- 										  	<ul class="pagination"> -->
<!-- 											    <li class="page-item disabled"> -->
<!-- 											      	<a class="page-link">Previous</a> -->
<!-- 											    </li> -->
<!-- 											    <li class="page-item"><a class="page-link" href="#">1</a></li> -->
<!-- 											    <li class="page-item active" aria-current="page"> -->
<!-- 											      	<a class="page-link" href="#">2</a> -->
<!-- 											    </li> -->
<!-- 											    <li class="page-item"><a class="page-link" href="#">3</a></li> -->
<!-- 											    <li class="page-item"> -->
<!-- 											      	<a class="page-link" href="#">Next</a> -->
<!-- 											    </li> -->
<!-- 										  	</ul> -->
<!-- 										</nav> -->
<!--                                     </div> -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Fruits Shop End-->
        
        <input id="currentPage" value="1" type="hidden">
        

        <!-- Footer -->
		<jsp:include page="/WEB-INF/views/frontend/layout/footer.jsp"></jsp:include>

        <!-- Back to Top -->
        <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i class="fa fa-arrow-up"></i></a>   

        <!-- Js -->
		<jsp:include page="/WEB-INF/views/frontend/layout/js.jsp"></jsp:include>
		
<!-- 		<script src="https://cdnjs.cloudflare.com/ajax/libs/simplePagination.js/1.4/jquery.simplePagination.js"></script> -->
<!-- 		<script src="https://cdnjs.cloudflare.com/ajax/libs/simplePagination.js/1.6/jquery.simplePagination.min.js"></script> -->
		<script src="${resource}/frontend/js/jquery.simplePagination.js"></script>
		
		
		<script type="text/javascript">
			//Xử khi nhấn thêm vào giỏ hàng
			addToCart = function(_productId, _quantity, _productName) {		
				alert("Đã thêm "  + _quantity + " sản phẩm '" + _productName + "' vào giỏ hàng ");
				let data = {
					id: _productId, //lay theo id
					quantity: _quantity,
					name: _productName,
				};
					
				//$ === jQuery
				$.ajax({
					url : "/add-to-cart",
					type : "POST",
					contentType: "application/json",
					data : JSON.stringify(data),
					dataType : "json", //Kieu du lieu tra ve tu controller la json
					
					success : function(jsonResult) {
						//alert(jsonResult.code + ": " + jsonResult.message);
						let totalProducts = jsonResult.totalCartProducts;
						$("#totalCartProducts").html(totalProducts);
					},
					
					error : function(jqXhr, textStatus, errorMessage) {
						alert(jsonResult.code + ': Đã có lỗi xay ra...!')
					},
				});
			}
	
			$(document).ready(function() {
			    // Gọi hàm khi trang vừa load
			    $('.category-radio, #rangeInput, #fruits').trigger('change');
			});
		
			//Xử lý khi thay đổi category, price, sort
			$('.category-radio, #rangeInput, #fruits').on('change', function(e) {
			    e.preventDefault();
			    
			    // Lấy categoryId hiện tại
			    var selectedCategory = $('input[name="category"]:checked');
			    var categoryId = selectedCategory.data('category-id') || 0; 
			    var price = $('#rangeInput').val(); // Lấy giá trị range hiện tại
			    var sort = $('#fruits').val(); // Lấy giá trị sorting
				
			    
			    $("#currentPage").val(1);
			    loadProducts(categoryId, price, sort, 1);
			});

			function loadProducts(categoryId, price, sort, currentPage) {
			    $.ajax({
			        url: '/products-by-category', // URL tới controller xử lý yêu cầu
			        type: 'GET',
			        contentType: "application/json",
			        data: { id: categoryId, price: price, sort: sort, currentPage: currentPage},
			        dataType: "json",
			        success: function(data) {
			            var products = data.products;
			            var productSearch = data.productSearch;
			            var productsContainer = $('#products-container');
			            
			            productsContainer.empty(); // Xóa các sản phẩm cũ

			            $.each(products, function(index, product) {
			                var productHtml = `
			                    <div class="col-md-6 col-lg-6 col-xl-4">
			                        <div class="rounded position-relative fruite-item border border-secondary">
			                            <div class="fruite-img">
			                                <img src="${resource}/UploadFiles/` + product.avatar + `" class="img-fluid w-100 rounded-top" alt="" style="height: 214.2px">
			                            </div>
			                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">` + product.category + `</div>
			                            <div class="p-4">
			                                <h4>
			                                    <a href="${resource}/product-detail/` + product.id + `" class="hoverName">` + product.name + `</a>
			                                </h4>
			                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
			                                <div class="d-flex justify-content-between flex-lg-wrap">
			                                    <p class="text-dark fs-5 fw-bold mb-0">
			                                        <span>` + product.price + `</span> 
			                                        <sup>đ</sup>
			                                        <span>/ kg</span>
			                                    </p>
			                                    <a onclick="addToCart(` + product.id + `, 1 , '` + product.name + `')" class="btn border border-secondary px-3 text-primary">
			                                        <i class="fa fa-shopping-bag text-primary"></i>
			                                    </a>
			                                </div>
			                            </div>
			                        </div>
			                    </div>`;
			                productsContainer.append(productHtml);
			            });

			            // Cấu hình phân trang
			            $("#paging").pagination({
			                currentPage: productSearch.currentPage, //Trang hien tai
			                items: productSearch.totalItems, //Tổng số sản phẩm
			                itemsOnPage: productSearch.sizeOfPage, //Số sản phẩm mỗi trang
			                cssStyle: 'light-theme',
			                onPageClick: function(pageNumber, event) {
			                    $("#currentPage").val(pageNumber); // Cập nhật trang hiện tại
			                    loadProducts(categoryId, price, sort, pageNumber); // Chỉ truyền currentPage khi onPageClick
			                },
			            });

			            $('#paging ul').addClass('pagination');
			            $('#paging ul li').addClass('page-item');
			            $('#paging ul li span').addClass('page-link');
			            $('#paging a').click(function(event) {
			                event.preventDefault();
			            });
			        }
			    });
			}
			
				
		</script>
    </body>
</html>