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
		
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
		<link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css"/>
		
		<style>        
            .swiper {
                width: 100%;
                height: 100%;
            }

            .swiper-slide {
                text-align: center;
                font-size: 18px;
                background: #fff;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .swiper-slide img {
                display: block;
                width: 100%;
                height: 100%;
                object-fit: cover;
            }
            
			/*reset css*/
			div,label{margin:0;padding:0;}
			body{margin:20px;}
			h1{font-size:1.5em;margin:10px;}
			/****** Style Star Rating Widget *****/
			#rating{border:none;float:left;}
			#rating>input{display:none;}/*ẩn input radio - vì chúng ta đã có label là GUI*/
			#rating>label:before{margin:5px;font-size:1.25em;font-family:FontAwesome;display:inline-block;content:"\f005";}/*1 ngôi sao*/
			#rating>.half:before{content:"\f089";position:absolute;}/*0.5 ngôi sao*/
			#rating>label{color:#ddd;float:right;}/*float:right để lật ngược các ngôi sao lại đúng theo thứ tự trong thực tế*/
			/*thêm màu cho sao đã chọn và các ngôi sao phía trước*/
			#rating>input:checked~label,
			#rating:not(:checked)>label:hover, 
			#rating:not(:checked)>label:hover~label{color:#FFD700;}
			/* Hover vào các sao phía trước ngôi sao đã chọn*/
			#rating>input:checked+label:hover,
			#rating>input:checked~label:hover,
			#rating>label:hover~input:checked~label,
			#rating>input:checked~label:hover~label{color:#FFED85;}
		</style>
    </head>

    <body>
    	<!-- Navbar -->
		<jsp:include page="/WEB-INF/views/frontend/layout/navbar.jsp"></jsp:include>

        <!-- Single Page Header start -->
        <div class="container-fluid page-header py-5">
            <h1 class="text-center text-white display-6">Shop Detail</h1>
            <ol class="breadcrumb justify-content-center mb-0">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <li class="breadcrumb-item"><a href="#">Pages</a></li>
                <li class="breadcrumb-item active text-white">Shop Detail</li>
            </ol>
        </div>
        <!-- Single Page Header End -->
        
        <!-- Single Product Start -->
        <div class="container-fluid py-5 mt-5">
            <div class="container py-5">
                <div class="row g-4">
                    <div class="col-lg-8 col-xl-9">
                        <div class="row g-4">
                            <div class="col-lg-6">
                                <div class="border rounded">
                                
									<div class="swiper mySwiper">
							            <div class="swiper-wrapper">
							            	<div class="swiper-slide">
							                	<img src="${resource }/UploadFiles/${product.avatar }" class="w-100" alt="" style="height:328.3px;">
							                </div>
							                							            	
							            	<c:forEach items="${productImages}" var="productImage">
                                             	<div class="swiper-slide">
                                                 	<img src="${resource }/UploadFiles/${productImage.path}" class="w-100" alt="" style="height:328.3px;" >
                                             	</div>
                                            </c:forEach>						                
							            </div>
							            <div class="swiper-button-next"></div>
							            <div class="swiper-button-prev"></div>
							            <div class="swiper-pagination"></div>
							        </div>
                                	
<!--                                     <a href="#"> -->
<%--                                         <img src="${resource}/UploadFiles/${product.avatar}" class="img-fluid rounded" alt="Image" style="width: 469.4px; height: 469.4px"> --%>
<%--                                     	<img src="${resource}/UploadFiles/${product.avatar}" class="img-fluid rounded" alt="Image"> --%>
<!--                                     </a> -->
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <h4 class="fw-bold mb-3">${product.name}</h4>
                                <p class="mb-3">Category: ${product.category.name}</p>
                                <h5 class="fw-bold mb-3">
                                	<span>
										<fmt:formatNumber value="${product.price}" minFractionDigits="0" ></fmt:formatNumber> 
									</span> 
									<sup>đ</sup>
                                </h5>
                                <div class="d-flex mb-4">
                                    <i class="fa fa-star text-secondary"></i>
                                    <i class="fa fa-star text-secondary"></i>
                                    <i class="fa fa-star text-secondary"></i>
                                    <i class="fa fa-star text-secondary"></i>
                                    <i class="fa fa-star"></i>
                                </div>
                                <p class="mb-4">The generated Lorem Ipsum is therefore always free from repetition injected humour, or non-characteristic words etc.</p>
                                <p class="mb-4">Susp endisse ultricies nisi vel quam suscipit. Sabertooth peacock flounder; chain pickerel hatchetfish, pencilfish snailfish</p>
                                <div class="row">
	                                <div class="input-group quantity mb-5 mt-1 col-3" style="width: 120px">
	                                    <div class="input-group-btn">
	                                        <button class="btn btn-sm btn-minus rounded-circle bg-light border" >
	                                            <i class="fa fa-minus"></i>
	                                        </button>
	                                    </div>
	                                    <input type="text" class="form-control form-control-sm text-center border-0" value="1" readonly="readonly" id="inpQuantity">
	                                    <div class="input-group-btn">
	                                        <button class="btn btn-sm btn-plus rounded-circle bg-light border">
	                                            <i class="fa fa-plus"></i>
	                                        </button>
	                                    </div>
	                                </div>
                                	
                                	<div class="col-8">
	                                	<a class="btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary float-end" onclick="addToCart( ${product.id} , '${product.name}')">
		                                	<i class="fa fa-shopping-bag me-2 text-primary"></i> 
		                                	Add to cart
		                                </a>
                                	</div>
                                </div>
                                
                                
                            </div>
                            <div class="col-lg-12 mt-0">
                                <nav>
                                    <div class="nav nav-tabs mb-3">
                                        <button class="nav-link active border-white border-bottom-0" type="button" role="tab"
                                            id="nav-about-tab" data-bs-toggle="tab" data-bs-target="#nav-about"
                                            aria-controls="nav-about" aria-selected="true">Description</button>
                                        <button class="nav-link border-white border-bottom-0" type="button" role="tab"
                                            id="nav-mission-tab" data-bs-toggle="tab" data-bs-target="#nav-mission"
                                            aria-controls="nav-mission" aria-selected="false">Reviews</button>
                                    </div>
                                </nav>
                                <div class="tab-content mb-5">
                                    <div class="tab-pane active" id="nav-about" role="tabpanel" aria-labelledby="nav-about-tab">
                                        <p>The generated Lorem Ipsum is therefore always free from repetition injected humour, or non-characteristic words etc. 
                                            Susp endisse ultricies nisi vel quam suscipit </p>
                                        <p>Sabertooth peacock flounder; chain pickerel hatchetfish, pencilfish snailfish filefish Antarctic 
                                            icefish goldeye aholehole trumpetfish pilot fish airbreathing catfish, electric ray sweeper.</p>
                                        <div class="px-2">
                                            <div class="row g-4">
                                                <div class="col-6">
                                                    <div class="row bg-light align-items-center text-center justify-content-center py-2">
                                                        <div class="col-6">
                                                            <p class="mb-0">Weight</p>
                                                        </div>
                                                        <div class="col-6">
                                                            <p class="mb-0">1 kg</p>
                                                        </div>
                                                    </div>
                                                    <div class="row text-center align-items-center justify-content-center py-2">
                                                        <div class="col-6">
                                                            <p class="mb-0">Country of Origin</p>
                                                        </div>
                                                        <div class="col-6">
                                                            <p class="mb-0">${product.origin}</p>
                                                        </div>
                                                    </div>
                                                    <div class="row bg-light text-center align-items-center justify-content-center py-2">
                                                        <div class="col-6">
                                                            <p class="mb-0">Quality</p>
                                                        </div>
                                                        <div class="col-6">
                                                            <p class="mb-0">Organic</p>
                                                        </div>
                                                    </div>
                                                    
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="nav-mission" role="tabpanel" aria-labelledby="nav-mission-tab">
                                        
						                <c:if test="${comments.size() > 0}">
						                	<c:forEach items= "${comments}" var="comment">
						                		<div class="d-flex">
		                                            <img src="${resource}/frontend/img/avatar.jpg" class="img-fluid rounded-circle p-3" style="width: 100px; height: 100px;" alt="">
		                                            <div class="" style="width: 100%;">
		                                                <p class="mb-2 createDate" style="font-size: 14px;" data-date="${comment.createDate}"></p>
		                                                <div class="d-flex justify-content-between">
		                                                    <h5>${comment.customerName}</h5>
		                                                    <div class="d-flex mb-3">
	                                                        	<!-- Lặp để hiển thị số sao được đánh giá -->
										                        <c:forEach begin="1" end="${comment.star}">
										                            <i class="fas fa-star text-secondary"></i>
										                        </c:forEach>
										                        <!-- Lặp để hiển thị số sao còn lại chưa được đánh giá -->
										                        <c:forEach begin="${comment.star + 1}" end="5">
										                            <i class="fas fa-star"></i>
										                        </c:forEach>
		                                                    </div>
		                                                </div>
		                                                <p style="width: 100%">${comment.content}</p>
		                                            </div>
		                                        </div>
						                    </c:forEach>
									    </c:if>
									    
									    <script>
										    // Lấy tất cả các phần tử có class 'createDate'
										    const dateElements = document.querySelectorAll('.createDate');
										
										    dateElements.forEach(function(element) {
										        // Lấy giá trị của data-date (ngày gốc từ JSP)
										        const dateString = element.getAttribute('data-date');
										        if (dateString) {
										            // Chuyển đổi ngày thành định dạng mong muốn
										            const createDate = new Date(dateString);
										            const options = { year: 'numeric', month: 'long', day: 'numeric' };
										            const formattedDate = createDate.toLocaleDateString('en-US', options);
										            
										            // Cập nhật nội dung của thẻ với ngày đã định dạng
										            element.innerText = formattedDate;
										        }
										    });
										</script>
                                        
<!--                                         <div class="d-flex"> -->
<%--                                             <img src="${resource}/frontend/img/avatar.jpg" class="img-fluid rounded-circle p-3" style="width: 100px; height: 100px;" alt=""> --%>
<!--                                             <div class=""> -->
<!--                                                 <p class="mb-2" style="font-size: 14px;">April 12, 2024</p> -->
<!--                                                 <div class="d-flex justify-content-between"> -->
<!--                                                     <h5>Sam Peters</h5> -->
<!--                                                     <div class="d-flex mb-3"> -->
<!--                                                         <i class="fa fa-star text-secondary"></i> -->
<!--                                                         <i class="fa fa-star text-secondary"></i> -->
<!--                                                         <i class="fa fa-star text-secondary"></i> -->
<!--                                                         <i class="fa fa-star"></i> -->
<!--                                                         <i class="fa fa-star"></i> -->
<!--                                                     </div> -->
<!--                                                 </div> -->
<!--                                                 <p class="text-dark">The generated Lorem Ipsum is therefore always free from repetition injected humour, or non-characteristic  -->
<!--                                                     words etc. Susp endisse ultricies nisi vel quam suscipit </p> -->
<!--                                             </div> -->
<!--                                         </div> -->
                                    </div>
                                    <div class="tab-pane" id="nav-vision" role="tabpanel">
                                        <p class="text-dark">Tempor erat elitr rebum at clita. Diam dolor diam ipsum et tempor sit. Aliqu diam
                                            amet diam et eos labore. 3</p>
                                        <p class="mb-0">Diam dolor diam ipsum et tempor sit. Aliqu diam amet diam et eos labore.
                                            Clita erat ipsum et lorem et sit</p>
                                    </div>
                                </div>
                            </div>
                            <form action="#">
                                <h4 class="mb-5 fw-bold">Leave a Reply</h4>
                                <div class="row g-4">
                                    <div class="col-lg-6">
                                        <div class="border-bottom rounded">
                                            <input type="text" class="form-control border-0 me-4" id="inpName" placeholder="Your Name *">
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="border-bottom rounded">
                                            <input type="email" class="form-control border-0" id="inpEmail" placeholder="Your Email *">
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="border-bottom rounded my-4">
                                            <textarea name="" id="inpContent" class="form-control border-0" cols="30" rows="8" placeholder="Your Review *" spellcheck="false"></textarea>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="d-flex justify-content-between py-3 mb-5">
                                            <div class="d-flex align-items-center">
                                                <p class="mb-0 me-3">Please rate:</p>
<!--                                                 <div class="d-flex align-items-center" style="font-size: 12px;"> -->
<!--                                                     <i class="fa fa-star text-muted"></i> -->
<!--                                                     <i class="fa fa-star"></i> -->
<!--                                                     <i class="fa fa-star"></i> -->
<!--                                                     <i class="fa fa-star"></i> -->
<!--                                                     <i class="fa fa-star"></i> -->
<!--                                                 </div> -->
                                                
                                               <div id="rating">
												    <input type="radio" id="star5" name="rating" value="5" />
												    <label class = "full" for="star5" title="Awesome - 5 stars"></label>
												 
												    <input type="radio" id="star4" name="rating" value="4" />
												    <label class = "full" for="star4" title="Pretty good - 4 stars"></label>
												 
												    <input type="radio" id="star3" name="rating" value="3" />
												    <label class = "full" for="star3" title="Meh - 3 stars"></label>
												 
												    <input type="radio" id="star2" name="rating" value="2" />
												    <label class = "full" for="star2" title="Kinda bad - 2 stars"></label>
												 
												    <input type="radio" id="star1" name="rating" value="1" />
												    <label class = "full" for="star1" title="Sucks big time - 1 star"></label>
												</div>
                                                
                                            </div>
                                            <a href="#" id="btnPostComment" class="btn border border-secondary text-primary rounded-pill px-4 py-3"> Post Comment</a>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="col-lg-4 col-xl-3">
                        <div class="row g-4 fruite">
                            <div class="col-lg-12">
<!--                                 <div class="input-group w-100 mx-auto d-flex mb-4"> -->
<!--                                     <input type="search" class="form-control p-3" placeholder="keywords" aria-describedby="search-icon-1"> -->
<!--                                     <span id="search-icon-1" class="input-group-text p-3"><i class="fa fa-search"></i></span> -->
<!--                                 </div> -->
                                <div class="mb-4">
                                    <h4>Categories</h4>
                                    <ul class="list-unstyled fruite-categorie">
                                    	<c:forEach items="${categories}" var="category">
                                    		<li>
	                                            <div class="d-flex justify-content-between fruite-name">
	                                                <a href="/shop"><i class="fas fa-apple-alt me-2"></i>${category.name}</a>
	                                                <span>(${category.products.size()})</span>
	                                            </div>
                                        	</li>
                                    	</c:forEach>
<!--                                         <li> -->
<!--                                             <div class="d-flex justify-content-between fruite-name"> -->
<!--                                                 <a href="#"><i class="fas fa-apple-alt me-2"></i>Apples</a> -->
<!--                                                 <span>(3)</span> -->
<!--                                             </div> -->
<!--                                         </li> -->
<!--                                         <li> -->
<!--                                             <div class="d-flex justify-content-between fruite-name"> -->
<!--                                                 <a href="#"><i class="fas fa-apple-alt me-2"></i>Oranges</a> -->
<!--                                                 <span>(5)</span> -->
<!--                                             </div> -->
<!--                                         </li> -->
<!--                                         <li> -->
<!--                                             <div class="d-flex justify-content-between fruite-name"> -->
<!--                                                 <a href="#"><i class="fas fa-apple-alt me-2"></i>Strawbery</a> -->
<!--                                                 <span>(2)</span> -->
<!--                                             </div> -->
<!--                                         </li> -->
<!--                                         <li> -->
<!--                                             <div class="d-flex justify-content-between fruite-name"> -->
<!--                                                 <a href="#"><i class="fas fa-apple-alt me-2"></i>Banana</a> -->
<!--                                                 <span>(8)</span> -->
<!--                                             </div> -->
<!--                                         </li> -->
<!--                                         <li> -->
<!--                                             <div class="d-flex justify-content-between fruite-name"> -->
<!--                                                 <a href="#"><i class="fas fa-apple-alt me-2"></i>Pumpkin</a> -->
<!--                                                 <span>(5)</span> -->
<!--                                             </div> -->
<!--                                         </li> -->
                                    </ul>
                                </div>
                            </div>
<!--                             <div class="col-lg-12"> -->
<!--                                 <h4 class="mb-4">Featured products</h4> -->
<!--                                 <div class="d-flex align-items-center justify-content-start"> -->
<!--                                     <div class="rounded" style="width: 100px; height: 100px;"> -->
<%--                                         <img src="${resource}/frontend/img/featur-1.jpg" class="img-fluid rounded" alt="Image"> --%>
<!--                                     </div> -->
<!--                                     <div> -->
<!--                                         <h6 class="mb-2">Big Banana</h6> -->
<!--                                         <div class="d-flex mb-2"> -->
<!--                                             <i class="fa fa-star text-secondary"></i> -->
<!--                                             <i class="fa fa-star text-secondary"></i> -->
<!--                                             <i class="fa fa-star text-secondary"></i> -->
<!--                                             <i class="fa fa-star text-secondary"></i> -->
<!--                                             <i class="fa fa-star"></i> -->
<!--                                         </div> -->
<!--                                         <div class="d-flex mb-2"> -->
<!--                                             <h5 class="fw-bold me-2">2.99 $</h5> -->
<!--                                             <h5 class="text-danger text-decoration-line-through">4.11 $</h5> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 <div class="d-flex align-items-center justify-content-start"> -->
<!--                                     <div class="rounded" style="width: 100px; height: 100px;"> -->
<%--                                         <img src="${resource}/frontend/img/featur-2.jpg" class="img-fluid rounded" alt=""> --%>
<!--                                     </div> -->
<!--                                     <div> -->
<!--                                         <h6 class="mb-2">Big Banana</h6> -->
<!--                                         <div class="d-flex mb-2"> -->
<!--                                             <i class="fa fa-star text-secondary"></i> -->
<!--                                             <i class="fa fa-star text-secondary"></i> -->
<!--                                             <i class="fa fa-star text-secondary"></i> -->
<!--                                             <i class="fa fa-star text-secondary"></i> -->
<!--                                             <i class="fa fa-star"></i> -->
<!--                                         </div> -->
<!--                                         <div class="d-flex mb-2"> -->
<!--                                             <h5 class="fw-bold me-2">2.99 $</h5> -->
<!--                                             <h5 class="text-danger text-decoration-line-through">4.11 $</h5> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 <div class="d-flex align-items-center justify-content-start"> -->
<!--                                     <div class="rounded" style="width: 100px; height: 100px;"> -->
<%--                                         <img src="${resource}/frontend/img/featur-3.jpg" class="img-fluid rounded" alt=""> --%>
<!--                                     </div> -->
<!--                                     <div> -->
<!--                                         <h6 class="mb-2">Big Banana</h6> -->
<!--                                         <div class="d-flex mb-2"> -->
<!--                                             <i class="fa fa-star text-secondary"></i> -->
<!--                                             <i class="fa fa-star text-secondary"></i> -->
<!--                                             <i class="fa fa-star text-secondary"></i> -->
<!--                                             <i class="fa fa-star text-secondary"></i> -->
<!--                                             <i class="fa fa-star"></i> -->
<!--                                         </div> -->
<!--                                         <div class="d-flex mb-2"> -->
<!--                                             <h5 class="fw-bold me-2">2.99 $</h5> -->
<!--                                             <h5 class="text-danger text-decoration-line-through">4.11 $</h5> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 <div class="d-flex align-items-center justify-content-start"> -->
<!--                                     <div class="rounded me-4" style="width: 100px; height: 100px;"> -->
<%--                                         <img src="${resource}/frontend/img/vegetable-item-4.jpg" class="img-fluid rounded" alt=""> --%>
<!--                                     </div> -->
<!--                                     <div> -->
<!--                                         <h6 class="mb-2">Big Banana</h6> -->
<!--                                         <div class="d-flex mb-2"> -->
<!--                                             <i class="fa fa-star text-secondary"></i> -->
<!--                                             <i class="fa fa-star text-secondary"></i> -->
<!--                                             <i class="fa fa-star text-secondary"></i> -->
<!--                                             <i class="fa fa-star text-secondary"></i> -->
<!--                                             <i class="fa fa-star"></i> -->
<!--                                         </div> -->
<!--                                         <div class="d-flex mb-2"> -->
<!--                                             <h5 class="fw-bold me-2">2.99 $</h5> -->
<!--                                             <h5 class="text-danger text-decoration-line-through">4.11 $</h5> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 <div class="d-flex align-items-center justify-content-start"> -->
<!--                                     <div class="rounded me-4" style="width: 100px; height: 100px;"> -->
<%--                                         <img src="${resource}/frontend/img/vegetable-item-5.jpg" class="img-fluid rounded" alt=""> --%>
<!--                                     </div> -->
<!--                                     <div> -->
<!--                                         <h6 class="mb-2">Big Banana</h6> -->
<!--                                         <div class="d-flex mb-2"> -->
<!--                                             <i class="fa fa-star text-secondary"></i> -->
<!--                                             <i class="fa fa-star text-secondary"></i> -->
<!--                                             <i class="fa fa-star text-secondary"></i> -->
<!--                                             <i class="fa fa-star text-secondary"></i> -->
<!--                                             <i class="fa fa-star"></i> -->
<!--                                         </div> -->
<!--                                         <div class="d-flex mb-2"> -->
<!--                                             <h5 class="fw-bold me-2">2.99 $</h5> -->
<!--                                             <h5 class="text-danger text-decoration-line-through">4.11 $</h5> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 <div class="d-flex align-items-center justify-content-start"> -->
<!--                                     <div class="rounded me-4" style="width: 100px; height: 100px;"> -->
<%--                                         <img src="${resource}/frontend/img/vegetable-item-6.jpg" class="img-fluid rounded" alt=""> --%>
<!--                                     </div> -->
<!--                                     <div> -->
<!--                                         <h6 class="mb-2">Big Banana</h6> -->
<!--                                         <div class="d-flex mb-2"> -->
<!--                                             <i class="fa fa-star text-secondary"></i> -->
<!--                                             <i class="fa fa-star text-secondary"></i> -->
<!--                                             <i class="fa fa-star text-secondary"></i> -->
<!--                                             <i class="fa fa-star text-secondary"></i> -->
<!--                                             <i class="fa fa-star"></i> -->
<!--                                         </div> -->
<!--                                         <div class="d-flex mb-2"> -->
<!--                                             <h5 class="fw-bold me-2">2.99 $</h5> -->
<!--                                             <h5 class="text-danger text-decoration-line-through">4.11 $</h5> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 <div class="d-flex justify-content-center my-4"> -->
<!--                                     <a href="#" class="btn border border-secondary px-4 py-3 rounded-pill text-primary w-100">Vew More</a> -->
<!--                                 </div> -->
<!--                             </div> -->
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
                </div>
                
                
                <h1 class="fw-bold mb-0">Related products</h1>
                <div class="vesitable">
                    <div class="owl-carousel vegetable-carousel justify-content-center">
                    
                    	<c:forEach items= "${lstProductHot}" var="product">
	                        <div class="border border-primary rounded position-relative vesitable-item">
	                            <div class="vesitable-img">
	                            	<a href="${resource}/product-detail/${product.id}">
		                            	<img src="${resource}/UploadFiles/${product.avatar}" class="img-fluid w-100 rounded-top" alt="" style="height: 242.913px">
		                        	</a>
	                            </div>
	                            <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">Vegetable</div>
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
	                                    <a onclick="addToCartRelatedProduct(${product.id} , 1, '${product.name}')" class="btn border border-secondary px-3 text-primary"><i class="fa fa-shopping-bag text-primary"></i></a>
	                                </div>
	                            </div>
	                        </div>
                        </c:forEach>
                        
<!--                         <div class="border border-primary rounded position-relative vesitable-item"> -->
<!--                             <div class="vesitable-img"> -->
<%--                                 <img src="${resource}/frontend/img/vegetable-item-1.jpg" class="img-fluid w-100 rounded-top" alt=""> --%>
<!--                             </div> -->
<!--                             <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">Vegetable</div> -->
<!--                             <div class="p-4 pb-0 rounded-bottom"> -->
<!--                                 <h4>Parsely</h4> -->
<!--                                 <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p> -->
<!--                                 <div class="d-flex justify-content-between flex-lg-wrap"> -->
<!--                                     <p class="text-dark fs-5 fw-bold">$4.99 / kg</p> -->
<!--                                     <a href="#" class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         <div class="border border-primary rounded position-relative vesitable-item"> -->
<!--                             <div class="vesitable-img"> -->
<%--                                 <img src="${resource}/frontend/img/vegetable-item-3.png" class="img-fluid w-100 rounded-top bg-light" alt=""> --%>
<!--                             </div> -->
<!--                             <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">Vegetable</div> -->
<!--                             <div class="p-4 pb-0 rounded-bottom"> -->
<!--                                 <h4>Banana</h4> -->
<!--                                 <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p> -->
<!--                                 <div class="d-flex justify-content-between flex-lg-wrap"> -->
<!--                                     <p class="text-dark fs-5 fw-bold">$7.99 / kg</p> -->
<!--                                     <a href="#" class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         <div class="border border-primary rounded position-relative vesitable-item"> -->
<!--                             <div class="vesitable-img"> -->
<%--                                 <img src="${resource}/frontend/img/vegetable-item-4.jpg" class="img-fluid w-100 rounded-top" alt=""> --%>
<!--                             </div> -->
<!--                             <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">Vegetable</div> -->
<!--                             <div class="p-4 pb-0 rounded-bottom"> -->
<!--                                 <h4>Bell Papper</h4> -->
<!--                                 <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p> -->
<!--                                 <div class="d-flex justify-content-between flex-lg-wrap"> -->
<!--                                     <p class="text-dark fs-5 fw-bold">$7.99 / kg</p> -->
<!--                                     <a href="#" class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         <div class="border border-primary rounded position-relative vesitable-item"> -->
<!--                             <div class="vesitable-img"> -->
<%--                                 <img src="${resource}/frontend/img/vegetable-item-5.jpg" class="img-fluid w-100 rounded-top" alt=""> --%>
<!--                             </div> -->
<!--                             <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">Vegetable</div> -->
<!--                             <div class="p-4 pb-0 rounded-bottom"> -->
<!--                                 <h4>Potatoes</h4> -->
<!--                                 <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p> -->
<!--                                 <div class="d-flex justify-content-between flex-lg-wrap"> -->
<!--                                     <p class="text-dark fs-5 fw-bold">$7.99 / kg</p> -->
<!--                                     <a href="#" class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         <div class="border border-primary rounded position-relative vesitable-item"> -->
<!--                             <div class="vesitable-img"> -->
<%--                                 <img src="${resource}/frontend/img/vegetable-item-6.jpg" class="img-fluid w-100 rounded-top" alt=""> --%>
<!--                             </div> -->
<!--                             <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">Vegetable</div> -->
<!--                             <div class="p-4 pb-0 rounded-bottom"> -->
<!--                                 <h4>Parsely</h4> -->
<!--                                 <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p> -->
<!--                                 <div class="d-flex justify-content-between flex-lg-wrap"> -->
<!--                                     <p class="text-dark fs-5 fw-bold">$7.99 / kg</p> -->
<!--                                     <a href="#" class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         <div class="border border-primary rounded position-relative vesitable-item"> -->
<!--                             <div class="vesitable-img"> -->
<%--                                 <img src="${resource}/frontend/img/vegetable-item-5.jpg" class="img-fluid w-100 rounded-top" alt=""> --%>
<!--                             </div> -->
<!--                             <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">Vegetable</div> -->
<!--                             <div class="p-4 pb-0 rounded-bottom"> -->
<!--                                 <h4>Potatoes</h4> -->
<!--                                 <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p> -->
<!--                                 <div class="d-flex justify-content-between flex-lg-wrap"> -->
<!--                                     <p class="text-dark fs-5 fw-bold">$7.99 / kg</p> -->
<!--                                     <a href="#" class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         <div class="border border-primary rounded position-relative vesitable-item"> -->
<!--                             <div class="vesitable-img"> -->
<%--                                 <img src="${resource}/frontend/img/vegetable-item-6.jpg" class="img-fluid w-100 rounded-top" alt=""> --%>
<!--                             </div> -->
<!--                             <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">Vegetable</div> -->
<!--                             <div class="p-4 pb-0 rounded-bottom"> -->
<!--                                 <h4>Parsely</h4> -->
<!--                                 <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p> -->
<!--                                 <div class="d-flex justify-content-between flex-lg-wrap"> -->
<!--                                     <p class="text-dark fs-5 fw-bold">$7.99 / kg</p> -->
<!--                                     <a href="#" class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
                    </div>
                </div>
            </div>
        </div>
        <!-- Single Product End -->

		<!-- Footer -->
		<jsp:include page="/WEB-INF/views/frontend/layout/footer.jsp"></jsp:include>

        <!-- Back to Top -->
        <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i class="fa fa-arrow-up"></i></a>   

        <!-- Js -->
		<jsp:include page="/WEB-INF/views/frontend/layout/js.jsp"></jsp:include>
		
		<!-- Swiper JS -->
        <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

        <!-- Initialize Swiper -->
        <script>
            var swiper = new Swiper(".mySwiper", {
                rewind: true,
                navigation: {
                    nextEl: ".swiper-button-next",
                    prevEl: ".swiper-button-prev",
                },
                pagination: {
                	el: ".swiper-pagination",
                },
            });
        </script>
		
		<script type="text/javascript">
			$('#btnPostComment').click(function(e) {
				e.preventDefault();
				var name = $("#inpName").val();
				var email = $("#inpEmail").val();
				var content = $("#inpContent").val();
				var ratingValue = $('input[name="rating"]:checked').val();
				var productId = ${product.id};
				var userId = ${isLogined ? loginedUser.id : 0};
				
				// Kiểm tra các trường thông tin rỗng
			    if (!name) {
			        alert("Vui lòng nhập tên!");
			        return;
			    }
			    
			    if (!email) {
			        alert("Vui lòng nhập email!");
			        return;
			    }
			    
			    if (!content) {
			        alert("Vui lòng nhập nội dung bình luận!");
			        return;
			    }
			    
			    if (!ratingValue) {
			        alert("Vui lòng chọn đánh giá!");
			        return;
			    }

				$.ajax({
					url : "/postComment",
					type : "POST",
					data: { name : name, email : email, content : content, ratingValue : ratingValue, productId : productId, userId : userId },
					dataType : "json", //Kieu du lieu tra ve tu controller la json
					success : function(jsonResult) {
						alert(jsonResult.message);
						location.reload();
					},
					
					error : function(jqXhr, textStatus, errorMessage) {
						alert(jsonResult.code + ': Đã có lỗi xay ra...!')
					},
				});
				
	        });
		
			//Xử khi nhấn thêm vào giỏ hàng
			function addToCart(_productId, _productName) {
				let _quantity = $("#inpQuantity").val();
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
			
			addToCartRelatedProduct = function(_productId, _quantity, _productName) {		
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