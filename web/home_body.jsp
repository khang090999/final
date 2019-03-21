<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <div class="hero-wrap js-fullheight" style="background-image: url('images/bg_1.jpg');" data-stellar-background-ratio="0.5">
            <div class="overlay"></div>
            <div class="container">
                <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-end" data-scrollax-parent="true">
                    <div class="col-md-7 ftco-animate mt-5" data-scrollax=" properties: { translateY: '70%' }">
                        <h1 class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Be a Traveler not a Tourist</h1>
                        <p class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Travel to the any corner of the world, without going around in circles</p>
                    </div>
                </div>
            </div>
        </div>

        <section class="ftco-section ftco-no-pb ftco-no-pt">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="search-wrap-1 ftco-animate p-4">
                            <form action="MainTourController" method="POST" class="search-property-1">
                                <div class="row">
                                    <div class="col-lg align-items-end">
                                        <div class="form-group">
                                            <label for="#">Destination</label>
                                            <div class="form-field">
                                                <div class="icon"><span class="ion-ios-search"></span></div>
                                                <input type="text" name="txtSearch" class="form-control" placeholder="Search place">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg align-items-end">
                                        <div class="form-group">
                                            <label for="#">Type</label>
                                            <div class="form-field">
                                                <div class="select-wrap">
                                                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                                                    <select name="cboType" class="form-control">
                                                        <<option <c:if test="${param.cboType eq 'Viet Nam Tour'}">selected="true"</c:if>>Viet Nam Tour</option>
                                                        <option <c:if test="${param.cboType eq 'World Tour'}">selected="true"</c:if>>World Tour</option>

                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg align-self-end">
                                        <div class="form-group">
                                            <div class="form-field">
                                                <input type="submit" name="action" value="Search" class="form-control btn btn-primary">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>

<section class="ftco-section">
    	<div class="container">
    		<div class="row justify-content-center pb-5">
          <div class="col-md-12 heading-section text-center ftco-animate">
            <h2 class="mb-4">Best Place to Travel</h2>
            <p>A journey of a thousand miles begins with a single step</p>
          </div>
        </div>
            
    		<div class="row">
                    <c:if test="${requestScope.INFO != null}">
                        <c:if test="${not empty requestScope.INFO}">
                            <c:forEach items="${requestScope.INFO}" var="dto">
    			<div class="col-md-6 col-lg-3 ftco-animate">
    				<div class="project">
    					<div class="img">
		    				<img src="${dto.imgPath}" class="img-fluid" alt="Colorlib Template">
	    				</div>
	    				<div class="text">
	    					<h4 class="price"><form action="MainTourController" method="POST">
                                        <input type="hidden" name="id" value="${dto.tourID}"/>
                                        <input type="hidden" name="place" value="${dto.place}"/>
                                        <input type="hidden" name="description" value="${dto.description}"/>
                                        <input type="hidden" name="transport" value="${dto.transport}"/>
                                        <input type="hidden" name="image" value="${dto.imgPath}"/>
                                        <input type="submit" name="action" value="View"/>
                                    </form></h4>
	    					<span>${dto.type}</span>
	    					<h3>${dto.place}</h3>
	    					<div class="star d-flex clearfix">
	    						<div class="mr-auto float-left">
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
	    						</div>
	    						
	    					</div>
	    				</div>
	    				<a href="${dto.imgPath}" class="icon image-popup d-flex justify-content-center align-items-center">
	    					<span class="icon-expand"></span>
	    				</a>
    				</div>
    			</div>
                        </c:forEach>
                            </c:if>
                        </c:if>
    			
    			
    		</div>
    	</div>
    </section>

    <section class="ftco-section services-section bg-light">
      <div class="container">
        <div class="row d-flex">
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block">
              <div class="icon"><span class="flaticon-yatch"></span></div>
              <div class="media-body">
                <h3 class="heading mb-3">Activities</h3>
                <p>	2nd Floor, Innovation Building, Block 24 - Quang Trung Software Park - Tan Chanh Hiep Ward, District 12, HCMC</p>
              </div>
            </div>      
          </div>
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block">
              <div class="icon"><span class="flaticon-around"></span></div>
              <div class="media-body">
                <h3 class="heading mb-3">Travel Arrangements</h3>
                <p>Book a flight.<br/>
                    Make a hotel reservation.<br/>
                    Enjoy your vacation.
                </p>
              </div>
            </div>    
          </div>
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block">
              <div class="icon"><span class="flaticon-compass"></span></div>
              <div class="media-body">
                <h3 class="heading mb-3">Private Guide</h3>
                <p>Check the price.<br/>
                    Make more friends. <br/>
                    Always on time.
                </p>
              </div>
            </div>      
          </div>
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block">
              <div class="icon"><span class="flaticon-map-of-roads"></span></div>
              <div class="media-body">
                <h3 class="heading mb-3">Location Manager</h3>
                <p>Nguyen Do Nhat Khang <br/> SE130148 <br/> khangndnse130148@fpt.edu.vn</p>
              </div>
            </div>      
          </div>
        </div>
      </div>
    </section>
   	
    <section class="ftco-counter img" id="section-counter">
    	<div class="container">
    		<div class="row d-flex">
    			<div class="col-md-6 d-flex">
    				<div class="img d-flex align-self-stretch" style="background-image:url(images/about.jpg);"></div>
    			</div>
    			<div class="col-md-6 pl-md-5 py-5">
    				<div class="row justify-content-start pb-3">
		          <div class="col-md-12 heading-section ftco-animate">
		            <h2 class="mb-4">About Traveland</h2>
		            <p>Adventure may hurt you but monotony will kill you</p>
		          </div>
		        </div>
		    		<div class="row">
		          <div class="col-md-6 justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center py-5 bg-light mb-4">
		              <div class="text">
		                <strong class="number" data-number="30">0</strong>
		                <span>Amazing Deals</span>
		              </div>
		            </div>
		          </div>
		          <div class="col-md-6 justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center py-5 bg-light mb-4">
		              <div class="text">
		                <strong class="number" data-number="200">0</strong>
		                <span>Sold Tours</span>
		              </div>
		            </div>
		          </div>
		          <div class="col-md-6 justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center py-5 bg-light mb-4">
		              <div class="text">
		                <strong class="number" data-number="50">0</strong>
		                <span>New Tours</span>
		              </div>
		            </div>
		          </div>
		          <div class="col-md-6 justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center py-5 bg-light mb-4">
		              <div class="text">
		                <strong class="number" data-number="40">0</strong>
		                <span>Happy Customers</span>
		              </div>
		            </div>
		          </div>
		        </div>
	        </div>
        </div>
    	</div>
    </section>


    <section class="ftco-counter img" id="section-counter">
    	<div class="container">
    		<div class="row d-flex">
    			<div class="col-md-6 order-md-last d-flex">
    				<div class="img d-flex align-self-stretch" style="background-image:url(images/about-1.jpg);"></div>
    			</div>
    			<div class="col-md-6 pr-md-5 py-5">
    				<div class="row justify-content-start pb-3">
		          <div class="col-md-12 heading-section ftco-animate">
		            <h2 class="mb-4">Things to Know Before Traveling to other Places</h2>
		            <p>Better to see something once than hear about it a thousand times</p>
		          </div>
		        </div>
		        <div class="row">
		        	<div class="col-md-12">
		        		<p class="ftco-animate tips"><span>1.</span> A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
		        		<p class="ftco-animate tips"><span>2.</span> A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
		        		<p class="ftco-animate tips"><span>3.</span> It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
		        		
		        	</div>
		        </div>
	        </div>
        </div>
    	</div>
    </section>
		

    <section class="ftco-section ftco-no-pb testimony-section" style="background-image: url(images/bg_1.jpg);">
    	<div class="overlay"></div>
      <div class="container">
        <div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 text-center heading-section heading-section-white ftco-animate">
            <h2 class="mb-4">Happy Traveler Says</h2>
          </div>
        </div>
        <div class="row ftco-animate">
          <div class="col-md-12 testimonial">
            <div class="carousel-testimony owl-carousel ftco-owl">
              <div class="item">
                <div class="testimony-wrap img" style="background-image: url(images/traveler-1.jpg);">
                	<div class="overlay"></div>
                  <div class="text">
                    <p class="mb-4">Twenty years from now you will be more disappointed by the things you did not do than by the ones you did do. So throw off the bowlines, sail away from the safe harbor. Catch the trade winds in your sails.</p>
                    <p class="name">Mark Twain</p>
                    <span class="position"> American writer</span>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap" style="background-image: url(images/traveler-2.jpg);">
                	<div class="overlay"></div>
                  <div class="text">
                    <p class="mb-4">We live in a wonderful world that is full of beauty, charm and adventure. There is no end to the adventures we can have if only we seek them with our eyes open.</p>
                    <p class="name">Jawaharial Nehru</p>
                    <span class="position">The first Prime Minister of India </span>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap" style="background-image: url(images/traveler-3.jpg);">
                	<div class="overlay"></div>
                  <div class="text">
                    <p class="mb-4">Traveling ? it leaves you speechless, then turns you into a storyteller.</p>
                    <p class="name">Ibn Battuta</p>
                    <span class="position">Moroccan Muslim scholar and traveler</span>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap" style="background-image: url(images/traveler-4.jpg);">
                	<div class="overlay"></div>
                  <div class="text">
                    <p class="mb-4">If you wish to travel far and fast, travel light. Take off all your envies, jealousies, unforgiveness, selfishness and fears.</p>
                    <p class="name">Cesare Pavese</p>
                    <span class="position">Italian poet</span>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap" style="background-image: url(images/traveler-5.jpg);">
                	<div class="overlay"></div>
                  <div class="text">
                    <p class="mb-4">The gladdest moment in human life, me thinks, is a departure into unknown lands.</p>
                    <p class="name">Sir Richard Burton</p>
                    <span class="position">British explorer, geographer</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    