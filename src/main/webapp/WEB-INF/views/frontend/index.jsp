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
        
        <style>
        	.center{
        		display: flex; justify-content: center; align-items: center;
        	}
        	
        	.hoverName{
        		color: #45595b;
        	}
        	
        	.hoverName:hover{
        		color: #81c408;
        	}
        </style>
    </head>

    <body>

        <!-- Navbar -->
		<jsp:include page="/WEB-INF/views/frontend/layout/navbar.jsp"></jsp:include>

        <!-- Hero Start -->
        <div class="container-fluid py-5 mb-5 hero-header">
            <div class="container py-5">
                <div class="row g-5 align-items-center">
                    <div class="col-md-12 col-lg-7">
                        <h4 class="mb-3 text-secondary">100% Organic Foods</h4>
                        <h1 class="mb-5 display-3 text-primary">Organic Veggies &amp; Fruits Foods</h1>
                        <div class="position-relative mx-auto">
                            <input class="form-control border-2 border-secondary w-75 py-3 px-4 rounded-pill" type="number" placeholder="Search">
                            <button type="submit" class="btn btn-primary border-2 border-secondary py-3 px-4 position-absolute rounded-pill text-white h-100" style="top: 0; right: 25%;">Submit Now</button>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-5">
                        <div id="carouselId" class="carousel slide position-relative" data-bs-ride="carousel">
                            <div class="carousel-inner" role="listbox">
                                <div class="carousel-item active rounded">
                                    <img src="${pageContext.servletContext.contextPath}/frontend/img/hero-img-1.png" class="img-fluid w-100 h-100 bg-secondary rounded" alt="First slide">
                                    <a href="#" class="btn px-4 py-2 text-white rounded">Fruites</a>
                                </div>
                                <div class="carousel-item rounded">
                                    <img src="${pageContext.servletContext.contextPath}/frontend/img/hero-img-2.jpg" class="img-fluid w-100 h-100 rounded" alt="Second slide">
                                    <a href="#" class="btn px-4 py-2 text-white rounded">Vesitables</a>
                                </div>
                            </div>
                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselId" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carouselId" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Hero End -->


        <!-- Featurs Section Start -->
        <div class="container-fluid featurs py-5">
            <div class="container py-5">
                <div class="row g-4">
                    <div class="col-md-6 col-lg-3">
                        <div class="featurs-item text-center rounded bg-light p-4">
                            <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
                                <i class="fas fa-car-side fa-3x text-white"></i>
                            </div>
                            <div class="featurs-content text-center">
                                <h5>Free Shipping</h5>
                                <p class="mb-0">Free on order over $300</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <div class="featurs-item text-center rounded bg-light p-4">
                            <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
                                <i class="fas fa-user-shield fa-3x text-white"></i>
                            </div>
                            <div class="featurs-content text-center">
                                <h5>Security Payment</h5>
                                <p class="mb-0">100% security payment</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <div class="featurs-item text-center rounded bg-light p-4">
                            <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
                                <i class="fas fa-exchange-alt fa-3x text-white"></i>
                            </div>
                            <div class="featurs-content text-center">
                                <h5>30 Day Return</h5>
                                <p class="mb-0">30 day money guarantee</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <div class="featurs-item text-center rounded bg-light p-4">
                            <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
                                <i class="fa fa-phone-alt fa-3x text-white"></i>
                            </div>
                            <div class="featurs-content text-center">
                                <h5>24/7 Support</h5>
                                <p class="mb-0">Support every time fast</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Featurs Section End -->


        <!-- Fruits Shop Start-->
        <div class="container-fluid fruite py-5">
            <div class="container py-5">
                <div class="tab-class text-center">
                    <div class="row g-4">
                        <div class="col-lg-4 text-start">
                            <h1>Our Organic Products</h1>
                        </div>
                        <div class="col-lg-8 text-end">
                            <ul class="nav nav-pills d-inline-flex text-center mb-5">
                                <li class="nav-item">
                                    <a class="d-flex m-2 py-2 bg-light rounded-pill active" data-bs-toggle="pill" href="#tab-1">
                                        <span class="text-dark" style="width: 130px;">All Products</span>
                                    </a>
                                </li>
                                
                                <c:forEach items= "${categories}" var="category" varStatus="status">
                                	<li class="nav-item">
	                                    <a class="d-flex py-2 m-2 bg-light rounded-pill" data-bs-toggle="pill" href="#tab-${status.index + 2}">
	                                        <span class="text-dark" style="width: 130px;">${category.name}</span>
	                                    </a>
                                	</li>
                                </c:forEach>
                                
<!--                                 <li class="nav-item"> -->
<!--                                     <a class="d-flex m-2 py-2 bg-light rounded-pill" data-bs-toggle="pill" href="#tab-5"> -->
<!--                                         <span class="text-dark" style="width: 130px;">Meat</span> -->
<!--                                     </a> -->
<!--                                 </li> -->
                            </ul>
                        </div>
                    </div>
                    <div class="tab-content">
                        <div id="tab-1" class="tab-pane fade show p-0 active">
                            <div class="row g-4">
                                <div class="col-lg-12">
                                    <div class="row g-4">
                                    	<c:forEach items= "${products}" var="product">
                                    		<div class="col-md-6 col-lg-4 col-xl-3">
	                                            <div class="rounded position-relative fruite-item border border-secondary">
	                                                <div class="fruite-img">
	                                                	<a href="${resource}/product-detail/${product.id}">
	                                                    	<img src="${resource}/UploadFiles/${product.avatar}" class="img-fluid w-100 rounded-top" alt="" style="height: 214.2px">
	                                                	</a>
	                                                </div>
	                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">${product.category.name}</div>
<!-- 	                                                <div class="p-4 border border-secondary border-top-0 rounded-bottom"> -->
	                                                <div class="p-4">
	                                                    <h4>
	                                                    	<a href="${resource}/product-detail/${product.id}" class="hoverName">${product.name}</a>
	                                                    </h4>
	                                                    <p class="d-flex justify-content-center align-items-center" style="height: 72px; overflow: hidden;">${product.shortDescription}</p>
	                                                    <div class="d-flex justify-content-between flex-lg-wrap">
	                                                        <p class="text-dark fs-5 fw-bold mb-0 center"> 	                                                        	
															 	<span >
 																	<fmt:formatNumber value="${product.price}" minFractionDigits="0"></fmt:formatNumber> 
																</span> 
																<sup>đ</sup>
																<span>/ kg</span>
	                                                        </p>
	                                                   		<a onclick="addToCart(${product.id}, 1 , '${product.name}')" class="btn border border-secondary  px-3 text-primary"><i class="fa fa-shopping-bag text-primary"></i></a>                                                   	
	                                                    </div>
	                                                </div>
	                                            </div>
	                                        </div>
                                    	</c:forEach> 
                                    	 
<!--                                         <div class="col-md-6 col-lg-4 col-xl-3"> -->
<!--                                             <div class="rounded position-relative fruite-item border border-secondary"> -->
<!--                                                 <div class="fruite-img"> -->
<%--                                                     <img src="${pageContext.servletContext.contextPath}/frontend/img/fruite-item-5.jpg" class="img-fluid w-100 rounded-top" alt=""> --%>
<!--                                                 </div> -->
<!--                                                 <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div> -->
<!--                                                 <div class="p-4"> -->
<!--                                                     <h4>Grapes</h4> -->
<!--                                                     <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p> -->
<!--                                                     <div class="d-flex justify-content-between flex-lg-wrap"> -->
<!--                                                         <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p> -->
<!--                                                         <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a> -->
<!--                                                     </div> -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <div class="col-md-6 col-lg-4 col-xl-3"> -->
<!--                                             <div class="rounded position-relative fruite-item"> -->
<!--                                                 <div class="fruite-img"> -->
<%--                                                     <img src="${pageContext.servletContext.contextPath}/frontend/img/fruite-item-5.jpg" class="img-fluid w-100 rounded-top" alt=""> --%>
<!--                                                 </div> -->
<!--                                                 <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div> -->
<!--                                                 <div class="p-4 border border-secondary border-top-0 rounded-bottom"> -->
<!--                                                     <h4>Grapes</h4> -->
<!--                                                     <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p> -->
<!--                                                     <div class="d-flex justify-content-between flex-lg-wrap"> -->
<!--                                                         <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg1</p> -->
<!--                                                         <a class="btn border border-secondary rounded-pill px-3 text-primary" > -->
<!--                                                         	<i class="fa fa-shopping-bag me-2 text-primary"></i>  -->
<!--                                                         	Add to cart -->
<!--                                                         </a> -->
<!--                                                     </div> -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <div class="col-md-6 col-lg-4 col-xl-3"> -->
<!--                                             <div class="rounded position-relative fruite-item"> -->
<!--                                                 <div class="fruite-img"> -->
<%--                                                     <img src="${pageContext.servletContext.contextPath}/frontend/img/fruite-item-2.jpg" class="img-fluid w-100 rounded-top" alt=""> --%>
<!--                                                 </div> -->
<!--                                                 <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div> -->
<!--                                                 <div class="p-4 border border-secondary border-top-0 rounded-bottom"> -->
<!--                                                     <h4>Raspberries</h4> -->
<!--                                                     <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p> -->
<!--                                                     <div class="d-flex justify-content-between flex-lg-wrap"> -->
<!--                                                         <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p> -->
<!--                                                         <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a> -->
<!--                                                     </div> -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <div class="col-md-6 col-lg-4 col-xl-3"> -->
<!--                                             <div class="rounded position-relative fruite-item"> -->
<!--                                                 <div class="fruite-img"> -->
<%--                                                     <img src="${pageContext.servletContext.contextPath}/frontend/img/fruite-item-4.jpg" class="img-fluid w-100 rounded-top" alt=""> --%>
<!--                                                 </div> -->
<!--                                                 <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div> -->
<!--                                                 <div class="p-4 border border-secondary border-top-0 rounded-bottom"> -->
<!--                                                     <h4>Apricots</h4> -->
<!--                                                     <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p> -->
<!--                                                     <div class="d-flex justify-content-between flex-lg-wrap"> -->
<!--                                                         <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p> -->
<!--                                                         <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a> -->
<!--                                                     </div> -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <div class="col-md-6 col-lg-4 col-xl-3"> -->
<!--                                             <div class="rounded position-relative fruite-item"> -->
<!--                                                 <div class="fruite-img"> -->
<%--                                                     <img src="${pageContext.servletContext.contextPath}/frontend/img/fruite-item-3.jpg" class="img-fluid w-100 rounded-top" alt=""> --%>
<!--                                                 </div> -->
<!--                                                 <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div> -->
<!--                                                 <div class="p-4 border border-secondary border-top-0 rounded-bottom"> -->
<!--                                                     <h4>Banana</h4> -->
<!--                                                     <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p> -->
<!--                                                     <div class="d-flex justify-content-between flex-lg-wrap"> -->
<!--                                                         <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p> -->
<!--                                                         <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a> -->
<!--                                                     </div> -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <div class="col-md-6 col-lg-4 col-xl-3"> -->
<!--                                             <div class="rounded position-relative fruite-item"> -->
<!--                                                 <div class="fruite-img"> -->
<%--                                                     <img src="${pageContext.servletContext.contextPath}/frontend/img/fruite-item-1.jpg" class="img-fluid w-100 rounded-top" alt=""> --%>
<!--                                                 </div> -->
<!--                                                 <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div> -->
<!--                                                 <div class="p-4 border border-secondary border-top-0 rounded-bottom"> -->
<!--                                                     <h4>Oranges</h4> -->
<!--                                                     <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p> -->
<!--                                                     <div class="d-flex justify-content-between flex-lg-wrap"> -->
<!--                                                         <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p> -->
<!--                                                         <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a> -->
<!--                                                     </div> -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <div class="col-md-6 col-lg-4 col-xl-3"> -->
<!--                                             <div class="rounded position-relative fruite-item"> -->
<!--                                                 <div class="fruite-img"> -->
<%--                                                     <img src="${pageContext.servletContext.contextPath}/frontend/img/fruite-item-2.jpg" class="img-fluid w-100 rounded-top" alt=""> --%>
<!--                                                 </div> -->
<!--                                                 <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div> -->
<!--                                                 <div class="p-4 border border-secondary border-top-0 rounded-bottom"> -->
<!--                                                     <h4>Raspberries</h4> -->
<!--                                                     <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p> -->
<!--                                                     <div class="d-flex justify-content-between flex-lg-wrap"> -->
<!--                                                         <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p> -->
<!--                                                         <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a> -->
<!--                                                     </div> -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <div class="col-md-6 col-lg-4 col-xl-3"> -->
<!--                                             <div class="rounded position-relative fruite-item"> -->
<!--                                                 <div class="fruite-img"> -->
<%--                                                     <img src="${pageContext.servletContext.contextPath}/frontend/img/fruite-item-5.jpg" class="img-fluid w-100 rounded-top" alt=""> --%>
<!--                                                 </div> -->
<!--                                                 <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div> -->
<!--                                                 <div class="p-4 border border-secondary border-top-0 rounded-bottom"> -->
<!--                                                     <h4>Grapes</h4> -->
<!--                                                     <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p> -->
<!--                                                     <div class="d-flex justify-content-between flex-lg-wrap"> -->
<!--                                                         <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p> -->
<!--                                                         <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a> -->
<!--                                                     </div> -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div> -->
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <c:forEach items= "${categories}" var="category" varStatus="status">
                         	<div id="tab-${status.index + 2}" class="tab-pane fade show p-0">
	                            <div class="row g-4">
	                                <div class="col-lg-12">
	                                    <div class="row g-4">
	                                    
	                                    	<c:forEach items= "${products}" var="product">
		                                		<c:if test="${product.category.id == category.id}">
		                                    		<div class="col-md-6 col-lg-4 col-xl-3">
			                                            <div class="rounded position-relative fruite-item">
			                                                <div class="fruite-img">
			                                                	<img src="${resource}/UploadFiles/${product.avatar}" class="img-fluid w-100 rounded-top" alt="" style="height: 214.2px">
			                                                </div>
			                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">${product.category.name}</div>
			                                                <div class="p-4 border border-secondary border-top-0 rounded-bottom">
			                                                    <h4>
			                                                    	
			                                                    	<a href="${resource}/product-detail/${product.id}">${product.name}</a>
			                                                    </h4>
			                                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
			                                                    <div class="d-flex justify-content-between flex-lg-wrap">
			                                                        <p class="text-dark fs-5 fw-bold mb-0 center"> 	                                                        	
																	 	<span >
		 																	<fmt:formatNumber value="${product.price}" minFractionDigits="0"></fmt:formatNumber> 
																		</span> 
																		<sup>đ</sup>
																		<span>/ kg</span>
			                                                        </p>
			                                                   		<a onclick="addToCart(${product.id}, 1 , '${product.name}')" class="btn border border-secondary  px-3 text-primary"><i class="fa fa-shopping-bag text-primary"></i></a>                                                   	
			                                                    </div>
			                                                </div>
			                                            </div>
			                                        </div>
			                                    </c:if>
	                                    	</c:forEach>
	                                    
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
                        </c:forEach>
                        
<!--                         <div id="tab-2" class="tab-pane fade show p-0"> -->
<!--                             <div class="row g-4"> -->
<!--                                 <div class="col-lg-12"> -->
<!--                                     <div class="row g-4"> -->
<!--                                         <div class="col-md-6 col-lg-4 col-xl-3"> -->
<!--                                             <div class="rounded position-relative fruite-item"> -->
<!--                                                 <div class="fruite-img"> -->
<%--                                                     <img src="${pageContext.servletContext.contextPath}/frontend/img/fruite-item-5.jpg" class="img-fluid w-100 rounded-top" alt=""> --%>
<!--                                                 </div> -->
<!--                                                 <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div> -->
<!--                                                 <div class="p-4 border border-secondary border-top-0 rounded-bottom"> -->
<!--                                                     <h4>Grapes</h4> -->
<!--                                                     <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p> -->
<!--                                                     <div class="d-flex justify-content-between flex-lg-wrap"> -->
<!--                                                         <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p> -->
<!--                                                         <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a> -->
<!--                                                     </div> -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <div class="col-md-6 col-lg-4 col-xl-3"> -->
<!--                                             <div class="rounded position-relative fruite-item"> -->
<!--                                                 <div class="fruite-img"> -->
<%--                                                     <img src="${pageContext.servletContext.contextPath}/frontend/img/fruite-item-2.jpg" class="img-fluid w-100 rounded-top" alt=""> --%>
<!--                                                 </div> -->
<!--                                                 <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div> -->
<!--                                                 <div class="p-4 border border-secondary border-top-0 rounded-bottom"> -->
<!--                                                     <h4>Raspberries</h4> -->
<!--                                                     <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p> -->
<!--                                                     <div class="d-flex justify-content-between flex-lg-wrap"> -->
<!--                                                         <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p> -->
<!--                                                         <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a> -->
<!--                                                     </div> -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         <div id="tab-3" class="tab-pane fade show p-0"> -->
<!--                             <div class="row g-4"> -->
<!--                                 <div class="col-lg-12"> -->
<!--                                     <div class="row g-4"> -->
<!--                                         <div class="col-md-6 col-lg-4 col-xl-3"> -->
<!--                                             <div class="rounded position-relative fruite-item"> -->
<!--                                                 <div class="fruite-img"> -->
<%--                                                     <img src="${pageContext.servletContext.contextPath}/frontend/img/fruite-item-1.jpg" class="img-fluid w-100 rounded-top" alt=""> --%>
<!--                                                 </div> -->
<!--                                                 <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div> -->
<!--                                                 <div class="p-4 border border-secondary border-top-0 rounded-bottom"> -->
<!--                                                     <h4>Oranges</h4> -->
<!--                                                     <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p> -->
<!--                                                     <div class="d-flex justify-content-between flex-lg-wrap"> -->
<!--                                                         <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p> -->
<!--                                                         <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a> -->
<!--                                                     </div> -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <div class="col-md-6 col-lg-4 col-xl-3"> -->
<!--                                             <div class="rounded position-relative fruite-item"> -->
<!--                                                 <div class="fruite-img"> -->
<%--                                                     <img src="${pageContext.servletContext.contextPath}/frontend/img/fruite-item-6.jpg" class="img-fluid w-100 rounded-top" alt=""> --%>
<!--                                                 </div> -->
<!--                                                 <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div> -->
<!--                                                 <div class="p-4 border border-secondary border-top-0 rounded-bottom"> -->
<!--                                                     <h4>Apple</h4> -->
<!--                                                     <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p> -->
<!--                                                     <div class="d-flex justify-content-between flex-lg-wrap"> -->
<!--                                                         <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p> -->
<!--                                                         <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a> -->
<!--                                                     </div> -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         <div id="tab-4" class="tab-pane fade show p-0"> -->
<!--                             <div class="row g-4"> -->
<!--                                 <div class="col-lg-12"> -->
<!--                                     <div class="row g-4"> -->
<!--                                         <div class="col-md-6 col-lg-4 col-xl-3"> -->
<!--                                             <div class="rounded position-relative fruite-item"> -->
<!--                                                 <div class="fruite-img"> -->
<%--                                                     <img src="${pageContext.servletContext.contextPath}/frontend/img/fruite-item-5.jpg" class="img-fluid w-100 rounded-top" alt=""> --%>
<!--                                                 </div> -->
<!--                                                 <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div> -->
<!--                                                 <div class="p-4 border border-secondary border-top-0 rounded-bottom"> -->
<!--                                                     <h4>Grapes</h4> -->
<!--                                                     <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p> -->
<!--                                                     <div class="d-flex justify-content-between flex-lg-wrap"> -->
<!--                                                         <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p> -->
<!--                                                         <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a> -->
<!--                                                     </div> -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <div class="col-md-6 col-lg-4 col-xl-3"> -->
<!--                                             <div class="rounded position-relative fruite-item"> -->
<!--                                                 <div class="fruite-img"> -->
<%--                                                     <img src="${pageContext.servletContext.contextPath}/frontend/img/fruite-item-4.jpg" class="img-fluid w-100 rounded-top" alt=""> --%>
<!--                                                 </div> -->
<!--                                                 <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div> -->
<!--                                                 <div class="p-4 border border-secondary border-top-0 rounded-bottom"> -->
<!--                                                     <h4>Apricots</h4> -->
<!--                                                     <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p> -->
<!--                                                     <div class="d-flex justify-content-between flex-lg-wrap"> -->
<!--                                                         <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p> -->
<!--                                                         <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a> -->
<!--                                                     </div> -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         <div id="tab-5" class="tab-pane fade show p-0"> -->
<!--                             <div class="row g-4"> -->
<!--                                 <div class="col-lg-12"> -->
<!--                                     <div class="row g-4"> -->
<!--                                         <div class="col-md-6 col-lg-4 col-xl-3"> -->
<!--                                             <div class="rounded position-relative fruite-item"> -->
<!--                                                 <div class="fruite-img"> -->
<%--                                                     <img src="${pageContext.servletContext.contextPath}/frontend/img/fruite-item-3.jpg" class="img-fluid w-100 rounded-top" alt=""> --%>
<!--                                                 </div> -->
<!--                                                 <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div> -->
<!--                                                 <div class="p-4 border border-secondary border-top-0 rounded-bottom"> -->
<!--                                                     <h4>Banana</h4> -->
<!--                                                     <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p> -->
<!--                                                     <div class="d-flex justify-content-between flex-lg-wrap"> -->
<!--                                                         <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p> -->
<!--                                                         <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a> -->
<!--                                                     </div> -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <div class="col-md-6 col-lg-4 col-xl-3"> -->
<!--                                             <div class="rounded position-relative fruite-item"> -->
<!--                                                 <div class="fruite-img"> -->
<%--                                                     <img src="${pageContext.servletContext.contextPath}/frontend/img/fruite-item-2.jpg" class="img-fluid w-100 rounded-top" alt=""> --%>
<!--                                                 </div> -->
<!--                                                 <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div> -->
<!--                                                 <div class="p-4 border border-secondary border-top-0 rounded-bottom"> -->
<!--                                                     <h4>Raspberries</h4> -->
<!--                                                     <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p> -->
<!--                                                     <div class="d-flex justify-content-between flex-lg-wrap"> -->
<!--                                                         <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p> -->
<!--                                                         <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a> -->
<!--                                                     </div> -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <div class="col-md-6 col-lg-4 col-xl-3"> -->
<!--                                             <div class="rounded position-relative fruite-item"> -->
<!--                                                 <div class="fruite-img"> -->
<%--                                                     <img src="${pageContext.servletContext.contextPath}/frontend/img/fruite-item-1.jpg" class="img-fluid w-100 rounded-top" alt=""> --%>
<!--                                                 </div> -->
<!--                                                 <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div> -->
<!--                                                 <div class="p-4 border border-secondary border-top-0 rounded-bottom"> -->
<!--                                                     <h4>Oranges</h4> -->
<!--                                                     <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p> -->
<!--                                                     <div class="d-flex justify-content-between flex-lg-wrap"> -->
<!--                                                         <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p> -->
<!--                                                         <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a> -->
<!--                                                     </div> -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
                    </div>
                </div>      
            </div>
        </div>
        <!-- Fruits Shop End-->


        <!-- Featurs Start -->
        <div class="container-fluid service py-5">
            <div class="container py-5">
                <div class="row g-4 justify-content-center">
                    <div class="col-md-6 col-lg-4">
                        <a href="#">
                            <div class="service-item bg-secondary rounded border border-secondary">
                                <img src="${pageContext.servletContext.contextPath}/frontend/img/featur-1.jpg" class="img-fluid rounded-top w-100" alt="">
                                <div class="px-4 rounded-bottom">
                                    <div class="service-content bg-primary text-center p-4 rounded">
                                        <h5 class="text-white">Fresh Apples</h5>
                                        <h3 class="mb-0">20% OFF</h3>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-6 col-lg-4">
                        <a href="#">
                            <div class="service-item bg-dark rounded border border-dark">
                                <img src="${pageContext.servletContext.contextPath}/frontend/img/featur-2.jpg" class="img-fluid rounded-top w-100" alt="">
                                <div class="px-4 rounded-bottom">
                                    <div class="service-content bg-light text-center p-4 rounded">
                                        <h5 class="text-primary">Tasty Fruits</h5>
                                        <h3 class="mb-0">Free delivery</h3>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-6 col-lg-4">
                        <a href="#">
                            <div class="service-item bg-primary rounded border border-primary">
                                <img src="${pageContext.servletContext.contextPath}/frontend/img/featur-3.jpg" class="img-fluid rounded-top w-100" alt="">
                                <div class="px-4 rounded-bottom">
                                    <div class="service-content bg-secondary text-center p-4 rounded">
                                        <h5 class="text-white">Exotic Vegitable</h5>
                                        <h3 class="mb-0">Discount 30$</h3>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Featurs End -->
		
		<c:forEach items= "${categories}" var="category" begin="0" end="0">
			<div class="container-fluid vesitable py-5">
	            <div class="container py-5">
	                <h1 class="mb-0">Fresh Organic ${category.name}</h1>
	                <div class="owl-carousel vegetable-carousel justify-content-center">
	                	<c:forEach items= "${products}" var="product"> 
	                		<c:if test="${product.category.id == category.id}">
	      						<div class="border border-primary rounded position-relative vesitable-item">
			                        <div class="vesitable-img">
			                        	<a href="${resource}/product-detail/${product.id}">
			                            	<img src="${resource}/UploadFiles/${product.avatar}" class="img-fluid w-100 rounded-top" alt="" style="height: 242.913px">
			                        	</a>
			                        </div>
			                        <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">${category.name}</div>
			                        <div class="p-4 rounded-bottom">
			                            <h4>
			                            	<a href="${resource}/product-detail/${product.id}">${product.name}</a>
			                            </h4>
			                            <p style="height: 72px; overflow: hidden;">${product.shortDescription}</p>
			                            <div class="d-flex justify-content-between flex-lg-wrap">
			                                <p class="text-dark fs-5 fw-bold mb-0 center"> 	                                                        	
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
			                </c:if>
      					</c:forEach>
	                </div>
	            </div>
	        </div>
		</c:forEach>		
			
        <!-- Vesitable Shop Start-->
<!--         <div class="container-fluid vesitable py-5"> -->
<!--             <div class="container py-5"> -->
<!--                 <h1 class="mb-0">Fresh Organic Vegetables</h1> -->
<!--                 <div class="owl-carousel vegetable-carousel justify-content-center"> -->
<!--                     <div class="border border-primary rounded position-relative vesitable-item"> -->
<!--                         <div class="vesitable-img"> -->
<%--                             <img src="${pageContext.servletContext.contextPath}/frontend/img/vegetable-item-6.jpg" class="img-fluid w-100 rounded-top" alt=""> --%>
<!--                         </div> -->
<!--                         <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">Vegetable</div> -->
<!--                         <div class="p-4 rounded-bottom"> -->
<!--                             <h4>Parsely</h4> -->
<!--                             <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p> -->
<!--                             <div class="d-flex justify-content-between flex-lg-wrap"> -->
<!--                                 <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p> -->
<!--                                 <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     <div class="border border-primary rounded position-relative vesitable-item"> -->
<!--                         <div class="vesitable-img"> -->
<%--                             <img src="${pageContext.servletContext.contextPath}/frontend/img/vegetable-item-1.jpg" class="img-fluid w-100 rounded-top" alt=""> --%>
<!--                         </div> -->
<!--                         <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">Vegetable</div> -->
<!--                         <div class="p-4 rounded-bottom"> -->
<!--                             <h4>Parsely</h4> -->
<!--                             <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p> -->
<!--                             <div class="d-flex justify-content-between flex-lg-wrap"> -->
<!--                                 <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p> -->
<!--                                 <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     <div class="border border-primary rounded position-relative vesitable-item"> -->
<!--                         <div class="vesitable-img"> -->
<%--                             <img src="${pageContext.servletContext.contextPath}/frontend/img/vegetable-item-3.png" class="img-fluid w-100 rounded-top bg-light" alt=""> --%>
<!--                         </div> -->
<!--                         <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">Vegetable</div> -->
<!--                         <div class="p-4 rounded-bottom"> -->
<!--                             <h4>Banana</h4> -->
<!--                             <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p> -->
<!--                             <div class="d-flex justify-content-between flex-lg-wrap"> -->
<!--                                 <p class="text-dark fs-5 fw-bold mb-0">$7.99 / kg</p> -->
<!--                                 <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     <div class="border border-primary rounded position-relative vesitable-item"> -->
<!--                         <div class="vesitable-img"> -->
<%--                             <img src="${pageContext.servletContext.contextPath}/frontend/img/vegetable-item-4.jpg" class="img-fluid w-100 rounded-top" alt=""> --%>
<!--                         </div> -->
<!--                         <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">Vegetable</div> -->
<!--                         <div class="p-4 rounded-bottom"> -->
<!--                             <h4>Bell Papper</h4> -->
<!--                             <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p> -->
<!--                             <div class="d-flex justify-content-between flex-lg-wrap"> -->
<!--                                 <p class="text-dark fs-5 fw-bold mb-0">$7.99 / kg</p> -->
<!--                                 <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     <div class="border border-primary rounded position-relative vesitable-item"> -->
<!--                         <div class="vesitable-img"> -->
<%--                             <img src="${pageContext.servletContext.contextPath}/frontend/img/vegetable-item-5.jpg" class="img-fluid w-100 rounded-top" alt=""> --%>
<!--                         </div> -->
<!--                         <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">Vegetable</div> -->
<!--                         <div class="p-4 rounded-bottom"> -->
<!--                             <h4>Potatoes</h4> -->
<!--                             <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p> -->
<!--                             <div class="d-flex justify-content-between flex-lg-wrap"> -->
<!--                                 <p class="text-dark fs-5 fw-bold mb-0">$7.99 / kg</p> -->
<!--                                 <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     <div class="border border-primary rounded position-relative vesitable-item"> -->
<!--                         <div class="vesitable-img"> -->
<%--                             <img src="${pageContext.servletContext.contextPath}/frontend/img/vegetable-item-6.jpg" class="img-fluid w-100 rounded-top" alt=""> --%>
<!--                         </div> -->
<!--                         <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">Vegetable</div> -->
<!--                         <div class="p-4 rounded-bottom"> -->
<!--                             <h4>Parsely</h4> -->
<!--                             <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p> -->
<!--                             <div class="d-flex justify-content-between flex-lg-wrap"> -->
<!--                                 <p class="text-dark fs-5 fw-bold mb-0">$7.99 / kg</p> -->
<!--                                 <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     <div class="border border-primary rounded position-relative vesitable-item"> -->
<!--                         <div class="vesitable-img"> -->
<%--                             <img src="${pageContext.servletContext.contextPath}/frontend/img/vegetable-item-5.jpg" class="img-fluid w-100 rounded-top" alt=""> --%>
<!--                         </div> -->
<!--                         <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">Vegetable</div> -->
<!--                         <div class="p-4 rounded-bottom"> -->
<!--                             <h4>Potatoes</h4> -->
<!--                             <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p> -->
<!--                             <div class="d-flex justify-content-between flex-lg-wrap"> -->
<!--                                 <p class="text-dark fs-5 fw-bold mb-0">$7.99 / kg</p> -->
<!--                                 <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     <div class="border border-primary rounded position-relative vesitable-item"> -->
<!--                         <div class="vesitable-img"> -->
<%--                             <img src="${pageContext.servletContext.contextPath}/frontend/img/vegetable-item-6.jpg" class="img-fluid w-100 rounded-top" alt=""> --%>
<!--                         </div> -->
<!--                         <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">Vegetable</div> -->
<!--                         <div class="p-4 rounded-bottom"> -->
<!--                             <h4>Parsely</h4> -->
<!--                             <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p> -->
<!--                             <div class="d-flex justify-content-between flex-lg-wrap"> -->
<!--                                 <p class="text-dark fs-5 fw-bold mb-0">$7.99 / kg</p> -->
<!--                                 <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
        <!-- Vesitable Shop End -->


        <!-- Banner Section Start-->
        <div class="container-fluid banner bg-secondary my-5">
            <div class="container py-5">
                <div class="row g-4 align-items-center">
                    <div class="col-lg-6">
                        <div class="py-4">
                            <h1 class="display-3 text-white">Fresh Exotic Fruits</h1>
                            <p class="fw-normal display-3 text-dark mb-4">in Our Store</p>
                            <p class="mb-4 text-dark">The generated Lorem Ipsum is therefore always free from repetition injected humour, or non-characteristic words etc.</p>
                            <a href="#" class="banner-btn btn border-2 border-white rounded-pill text-dark py-3 px-5">BUY</a>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="position-relative">
                            <img src="${pageContext.servletContext.contextPath}/frontend/img/baner-1.png" class="img-fluid w-100 rounded" alt="">
                            <div class="d-flex align-items-center justify-content-center bg-white rounded-circle position-absolute" style="width: 140px; height: 140px; top: 0; left: 0;">
                                <h1 style="font-size: 100px;">1</h1>
                                <div class="d-flex flex-column">
                                    <span class="h2 mb-0">50$</span>
                                    <span class="h4 text-muted mb-0">kg</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Banner Section End -->


        <!-- Bestsaler Product Start -->
        <div class="container-fluid py-5">
            <div class="container py-5">
                <div class="text-center mx-auto mb-5" style="max-width: 700px;">
                    <h1 class="display-4">Bestseller Products</h1>
                    <p>Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable.</p>
                </div>
                <div class="row g-4">
                	
                	<c:forEach items= "${lstBestsellerProduct}" var="bestsellerProduct">
                		<div class="col-lg-6 col-xl-4">
	                        <div class="p-4 rounded bg-light">
	                            <div class="row align-items-center">
	                                <div class="col-6">
	                                	<img src="/UploadFiles/${bestsellerProduct.avatar}" style="height:171.988px" class="img-fluid rounded-circle w-100" alt="">
	                                </div>
	                                <div class="col-6">
	                                    <a href="/product-detail/${bestsellerProduct.id}" class="h5">${bestsellerProduct.name}</a>
	                                    <div class="d-flex my-3">
	                                        <i class="fas fa-star text-primary"></i>
	                                        <i class="fas fa-star text-primary"></i>
	                                        <i class="fas fa-star text-primary"></i>
	                                        <i class="fas fa-star text-primary"></i>
	                                        <i class="fas fa-star"></i>
	                                    </div>
	                                    <h4 class="mb-3">
	                                    	<span >
												<fmt:formatNumber value="${bestsellerProduct.price}" minFractionDigits="0"></fmt:formatNumber> 
											</span> 
											<sup>đ</sup>
	                                    </h4>
	                                    <a onclick="addToCart(${bestsellerProduct.id}, 1 , '${bestsellerProduct.name}')" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
                	</c:forEach>
                
<!--                     <div class="col-lg-6 col-xl-4"> -->
<!--                         <div class="p-4 rounded bg-light"> -->
<!--                             <div class="row align-items-center"> -->
<!--                                 <div class="col-6"> -->
<%--                                     <img src="${pageContext.servletContext.contextPath}/frontend/img/best-product-1.jpg" class="img-fluid rounded-circle w-100" alt=""> --%>
<!--                                 </div> -->
<!--                                 <div class="col-6"> -->
<!--                                     <a href="#" class="h5">Organic Tomato</a> -->
<!--                                     <div class="d-flex my-3"> -->
<!--                                         <i class="fas fa-star text-primary"></i> -->
<!--                                         <i class="fas fa-star text-primary"></i> -->
<!--                                         <i class="fas fa-star text-primary"></i> -->
<!--                                         <i class="fas fa-star text-primary"></i> -->
<!--                                         <i class="fas fa-star"></i> -->
<!--                                     </div> -->
<!--                                     <h4 class="mb-3">3.12 $</h4> -->
<!--                                     <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     <div class="col-lg-6 col-xl-4"> -->
<!--                         <div class="p-4 rounded bg-light"> -->
<!--                             <div class="row align-items-center"> -->
<!--                                 <div class="col-6"> -->
<%--                                     <img src="${pageContext.servletContext.contextPath}/frontend/img/best-product-2.jpg" class="img-fluid rounded-circle w-100" alt=""> --%>
<!--                                 </div> -->
<!--                                 <div class="col-6"> -->
<!--                                     <a href="#" class="h5">Organic Tomato</a> -->
<!--                                     <div class="d-flex my-3"> -->
<!--                                         <i class="fas fa-star text-primary"></i> -->
<!--                                         <i class="fas fa-star text-primary"></i> -->
<!--                                         <i class="fas fa-star text-primary"></i> -->
<!--                                         <i class="fas fa-star text-primary"></i> -->
<!--                                         <i class="fas fa-star"></i> -->
<!--                                     </div> -->
<!--                                     <h4 class="mb-3">3.12 $</h4> -->
<!--                                     <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     <div class="col-lg-6 col-xl-4"> -->
<!--                         <div class="p-4 rounded bg-light"> -->
<!--                             <div class="row align-items-center"> -->
<!--                                 <div class="col-6"> -->
<%--                                     <img src="${pageContext.servletContext.contextPath}/frontend/img/best-product-3.jpg" class="img-fluid rounded-circle w-100" alt=""> --%>
<!--                                 </div> -->
<!--                                 <div class="col-6"> -->
<!--                                     <a href="#" class="h5">Organic Tomato</a> -->
<!--                                     <div class="d-flex my-3"> -->
<!--                                         <i class="fas fa-star text-primary"></i> -->
<!--                                         <i class="fas fa-star text-primary"></i> -->
<!--                                         <i class="fas fa-star text-primary"></i> -->
<!--                                         <i class="fas fa-star text-primary"></i> -->
<!--                                         <i class="fas fa-star"></i> -->
<!--                                     </div> -->
<!--                                     <h4 class="mb-3">3.12 $</h4> -->
<!--                                     <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     <div class="col-lg-6 col-xl-4"> -->
<!--                         <div class="p-4 rounded bg-light"> -->
<!--                             <div class="row align-items-center"> -->
<!--                                 <div class="col-6"> -->
<%--                                     <img src="${pageContext.servletContext.contextPath}/frontend/img/best-product-4.jpg" class="img-fluid rounded-circle w-100" alt=""> --%>
<!--                                 </div> -->
<!--                                 <div class="col-6"> -->
<!--                                     <a href="#" class="h5">Organic Tomato</a> -->
<!--                                     <div class="d-flex my-3"> -->
<!--                                         <i class="fas fa-star text-primary"></i> -->
<!--                                         <i class="fas fa-star text-primary"></i> -->
<!--                                         <i class="fas fa-star text-primary"></i> -->
<!--                                         <i class="fas fa-star text-primary"></i> -->
<!--                                         <i class="fas fa-star"></i> -->
<!--                                     </div> -->
<!--                                     <h4 class="mb-3">3.12 $</h4> -->
<!--                                     <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     <div class="col-lg-6 col-xl-4"> -->
<!--                         <div class="p-4 rounded bg-light"> -->
<!--                             <div class="row align-items-center"> -->
<!--                                 <div class="col-6"> -->
<%--                                     <img src="${pageContext.servletContext.contextPath}/frontend/img/best-product-5.jpg" class="img-fluid rounded-circle w-100" alt=""> --%>
<!--                                 </div> -->
<!--                                 <div class="col-6"> -->
<!--                                     <a href="#" class="h5">Organic Tomato</a> -->
<!--                                     <div class="d-flex my-3"> -->
<!--                                         <i class="fas fa-star text-primary"></i> -->
<!--                                         <i class="fas fa-star text-primary"></i> -->
<!--                                         <i class="fas fa-star text-primary"></i> -->
<!--                                         <i class="fas fa-star text-primary"></i> -->
<!--                                         <i class="fas fa-star"></i> -->
<!--                                     </div> -->
<!--                                     <h4 class="mb-3">3.12 $</h4> -->
<!--                                     <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     <div class="col-lg-6 col-xl-4"> -->
<!--                         <div class="p-4 rounded bg-light"> -->
<!--                             <div class="row align-items-center"> -->
<!--                                 <div class="col-6"> -->
<%--                                     <img src="${pageContext.servletContext.contextPath}/frontend/img/best-product-6.jpg" class="img-fluid rounded-circle w-100" alt=""> --%>
<!--                                 </div> -->
<!--                                 <div class="col-6"> -->
<!--                                     <a href="#" class="h5">Organic Tomato</a> -->
<!--                                     <div class="d-flex my-3"> -->
<!--                                         <i class="fas fa-star text-primary"></i> -->
<!--                                         <i class="fas fa-star text-primary"></i> -->
<!--                                         <i class="fas fa-star text-primary"></i> -->
<!--                                         <i class="fas fa-star text-primary"></i> -->
<!--                                         <i class="fas fa-star"></i> -->
<!--                                     </div> -->
<!--                                     <h4 class="mb-3">3.12 $</h4> -->
<!--                                     <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
					
					<c:forEach items= "${lstBestsellerProduct}" var="bestsellerProduct" begin="0" end="3">
						<div class="col-md-6 col-lg-6 col-xl-3">
	                        <div class="text-center">
	                            <img src="UploadFiles/${bestsellerProduct.avatar}" style="height:214.2px" class="img-fluid rounded w-100" alt="">
	                            <div class="py-4">
	                                <a href="/product-detail/${bestsellerProduct.id}" class="h5">${bestsellerProduct.name}</a>
	                                <div class="d-flex my-3 justify-content-center">
	                                    <i class="fas fa-star text-primary"></i>
	                                    <i class="fas fa-star text-primary"></i>
	                                    <i class="fas fa-star text-primary"></i>
	                                    <i class="fas fa-star text-primary"></i>
	                                    <i class="fas fa-star"></i>
	                                </div>
	                                <h4 class="mb-3">
	                                	<span >
											<fmt:formatNumber value="${bestsellerProduct.price}" minFractionDigits="0"></fmt:formatNumber> 
										</span> 
										<sup>đ</sup>
	                                </h4>
	                                <a onclick="addToCart(${bestsellerProduct.id}, 1 , '${bestsellerProduct.name}')" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
	                            </div>
	                        </div>
	                    </div>
					</c:forEach>

<!--                     <div class="col-md-6 col-lg-6 col-xl-3"> -->
<!--                         <div class="text-center"> -->
<%--                             <img src="${pageContext.servletContext.contextPath}/frontend/img/fruite-item-1.jpg" class="img-fluid rounded" alt=""> --%>
<!--                             <div class="py-4"> -->
<!--                                 <a href="#" class="h5">Organic Tomato</a> -->
<!--                                 <div class="d-flex my-3 justify-content-center"> -->
<!--                                     <i class="fas fa-star text-primary"></i> -->
<!--                                     <i class="fas fa-star text-primary"></i> -->
<!--                                     <i class="fas fa-star text-primary"></i> -->
<!--                                     <i class="fas fa-star text-primary"></i> -->
<!--                                     <i class="fas fa-star"></i> -->
<!--                                 </div> -->
<!--                                 <h4 class="mb-3">3.12 $</h4> -->
<!--                                 <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     <div class="col-md-6 col-lg-6 col-xl-3"> -->
<!--                         <div class="text-center"> -->
<%--                             <img src="${pageContext.servletContext.contextPath}/frontend/img/fruite-item-2.jpg" class="img-fluid rounded" alt=""> --%>
<!--                             <div class="py-4"> -->
<!--                                 <a href="#" class="h5">Organic Tomato</a> -->
<!--                                 <div class="d-flex my-3 justify-content-center"> -->
<!--                                     <i class="fas fa-star text-primary"></i> -->
<!--                                     <i class="fas fa-star text-primary"></i> -->
<!--                                     <i class="fas fa-star text-primary"></i> -->
<!--                                     <i class="fas fa-star text-primary"></i> -->
<!--                                     <i class="fas fa-star"></i> -->
<!--                                 </div> -->
<!--                                 <h4 class="mb-3">3.12 $</h4> -->
<!--                                 <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     <div class="col-md-6 col-lg-6 col-xl-3"> -->
<!--                         <div class="text-center"> -->
<%--                             <img src="${pageContext.servletContext.contextPath}/frontend/img/fruite-item-3.jpg" class="img-fluid rounded" alt=""> --%>
<!--                             <div class="py-4"> -->
<!--                                 <a href="#" class="h5">Organic Tomato</a> -->
<!--                                 <div class="d-flex my-3 justify-content-center"> -->
<!--                                     <i class="fas fa-star text-primary"></i> -->
<!--                                     <i class="fas fa-star text-primary"></i> -->
<!--                                     <i class="fas fa-star text-primary"></i> -->
<!--                                     <i class="fas fa-star text-primary"></i> -->
<!--                                     <i class="fas fa-star"></i> -->
<!--                                 </div> -->
<!--                                 <h4 class="mb-3">3.12 $</h4> -->
<!--                                 <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     <div class="col-md-6 col-lg-6 col-xl-3"> -->
<!--                         <div class="text-center"> -->
<%--                             <img src="${pageContext.servletContext.contextPath}/frontend/img/fruite-item-4.jpg" class="img-fluid rounded" alt=""> --%>
<!--                             <div class="py-2"> -->
<!--                                 <a href="#" class="h5">Organic Tomato</a> -->
<!--                                 <div class="d-flex my-3 justify-content-center"> -->
<!--                                     <i class="fas fa-star text-primary"></i> -->
<!--                                     <i class="fas fa-star text-primary"></i> -->
<!--                                     <i class="fas fa-star text-primary"></i> -->
<!--                                     <i class="fas fa-star text-primary"></i> -->
<!--                                     <i class="fas fa-star"></i> -->
<!--                                 </div> -->
<!--                                 <h4 class="mb-3">3.12 $</h4> -->
<!--                                 <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
                </div>
            </div>
        </div>
        <!-- Bestsaler Product End -->


        <!-- Fact Start -->
        <div class="container-fluid py-5">
            <div class="container">
                <div class="bg-light p-5 rounded">
                    <div class="row g-4 justify-content-center">
                        <div class="col-md-6 col-lg-6 col-xl-3">
                            <div class="counter bg-white rounded p-5">
                                <i class="fa fa-users text-secondary"></i>
                                <h4>satisfied customers</h4>
                                <h1>1963</h1>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-6 col-xl-3">
                            <div class="counter bg-white rounded p-5">
                                <i class="fa fa-users text-secondary"></i>
                                <h4>quality of service</h4>
                                <h1>99%</h1>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-6 col-xl-3">
                            <div class="counter bg-white rounded p-5">
                                <i class="fa fa-users text-secondary"></i>
                                <h4>quality certificates</h4>
                                <h1>33</h1>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-6 col-xl-3">
                            <div class="counter bg-white rounded p-5">
                                <i class="fa fa-users text-secondary"></i>
                                <h4>Available Products</h4>
                                <h1>789</h1>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Fact Start -->


        <!-- Tastimonial Start -->
        <div class="container-fluid testimonial py-5">
            <div class="container py-5">
                <div class="testimonial-header text-center">
                    <h4 class="text-primary">Our Testimonial</h4>
                    <h1 class="display-5 mb-5 text-dark">Our Client Saying!</h1>
                </div>
                <div class="owl-carousel testimonial-carousel">
                
                	<c:forEach items= "${comments}" var="comment">
	                    <div class="testimonial-item img-border-radius bg-light rounded p-4">
	                        <div class="position-relative">
	                            <i class="fa fa-quote-right fa-2x text-secondary position-absolute" style="bottom: 30px; right: 0;"></i>
	                            <div class="mb-4 pb-4 border-bottom border-secondary">
	                                <p class="mb-0 d-flex justify-content-center align-items-center"" style="height: 48px; overflow: hidden">${comment.content}
	                                </p>
	                            </div>
	                            <div class="d-flex align-items-center flex-nowrap">
	                                <div class="rounded">
	                                    <img src="${resource}/frontend/img/testimonial-avatar.png" class="img-fluid rounded" style="width: 100px; height: 100px;" alt="">
	                                </div>
	                                <div class="ms-4 d-block">
	                                    <h4 class="text-dark">${comment.customerName}</h4>
	                                    <p class="m-0 pb-3">Guest</p>
	                                    <div class="d-flex pe-5">
	                                        <!-- Lặp để hiển thị số sao được đánh giá -->
					                        <c:forEach begin="1" end="${comment.star}">
					                            <i class="fas fa-star text-primary"></i>
					                        </c:forEach>
					                        <!-- Lặp để hiển thị số sao còn lại chưa được đánh giá -->
					                        <c:forEach begin="${comment.star + 1}" end="5">
					                            <i class="fas fa-star"></i>
					                        </c:forEach>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
                    </c:forEach>
                    
<!--                     <div class="testimonial-item img-border-radius bg-light rounded p-4"> -->
<!--                         <div class="position-relative"> -->
<!--                             <i class="fa fa-quote-right fa-2x text-secondary position-absolute" style="bottom: 30px; right: 0;"></i> -->
<!--                             <div class="mb-4 pb-4 border-bottom border-secondary"> -->
<!--                                 <p class="mb-0">Lorem Ipsum is simply dummy text of the printing Ipsum has been the industry's standard dummy text ever since the 1500s, -->
<!--                                 </p> -->
<!--                             </div> -->
<!--                             <div class="d-flex align-items-center flex-nowrap"> -->
<!--                                 <div class="bg-secondary rounded"> -->
<%--                                     <img src="${pageContext.servletContext.contextPath}/frontend/img/testimonial-1.jpg" class="img-fluid rounded" style="width: 100px; height: 100px;" alt=""> --%>
<!--                                 </div> -->
<!--                                 <div class="ms-4 d-block"> -->
<!--                                     <h4 class="text-dark">Client Name</h4> -->
<!--                                     <p class="m-0 pb-3">Profession</p> -->
<!--                                     <div class="d-flex pe-5"> -->
<!--                                         <i class="fas fa-star text-primary"></i> -->
<!--                                         <i class="fas fa-star text-primary"></i> -->
<!--                                         <i class="fas fa-star text-primary"></i> -->
<!--                                         <i class="fas fa-star text-primary"></i> -->
<!--                                         <i class="fas fa-star text-primary"></i> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     <div class="testimonial-item img-border-radius bg-light rounded p-4"> -->
<!--                         <div class="position-relative"> -->
<!--                             <i class="fa fa-quote-right fa-2x text-secondary position-absolute" style="bottom: 30px; right: 0;"></i> -->
<!--                             <div class="mb-4 pb-4 border-bottom border-secondary"> -->
<!--                                 <p class="mb-0">Lorem Ipsum is simply dummy text of the printing Ipsum has been the industry's standard dummy text ever since the 1500s, -->
<!--                                 </p> -->
<!--                             </div> -->
<!--                             <div class="d-flex align-items-center flex-nowrap"> -->
<!--                                 <div class="bg-secondary rounded"> -->
<%--                                     <img src="${pageContext.servletContext.contextPath}/frontend/img/testimonial-1.jpg" class="img-fluid rounded" style="width: 100px; height: 100px;" alt=""> --%>
<!--                                 </div> -->
<!--                                 <div class="ms-4 d-block"> -->
<!--                                     <h4 class="text-dark">Client Name</h4> -->
<!--                                     <p class="m-0 pb-3">Profession</p> -->
<!--                                     <div class="d-flex pe-5"> -->
<!--                                         <i class="fas fa-star text-primary"></i> -->
<!--                                         <i class="fas fa-star text-primary"></i> -->
<!--                                         <i class="fas fa-star text-primary"></i> -->
<!--                                         <i class="fas fa-star text-primary"></i> -->
<!--                                         <i class="fas fa-star text-primary"></i> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
                </div>
            </div>
        </div>
        <!-- Tastimonial End -->

        <!-- Footer -->
		<jsp:include page="/WEB-INF/views/frontend/layout/footer.jsp"></jsp:include>

        <!-- Back to Top -->
        <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i class="fa fa-arrow-up"></i></a>   
        
	    <!-- js -->
		<jsp:include page="/WEB-INF/views/frontend/layout/js.jsp"></jsp:include>
    
	    <script type="text/javascript">
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
		</script>
    </body>

</html>