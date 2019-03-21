<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>

<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('images/bg_2.jpg');" data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-center">
            <div class="col-md-9 ftco-animate pb-5 mb-5 text-center">
                <h1 class="mb-3 bread">Places to Travel</h1>
                <p class="breadcrumbs"><span class="mr-2"><a href="FirstController">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Destination <i class="ion-ios-arrow-forward"></i></span></p>
            </div>
        </div>
    </div>
</section>
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
                                                        <option <c:if test="${param.cboType eq 'Viet Nam Tour'}">selected="true"</c:if>>Viet Nam Tour</option>
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
<span class="error">
     ${requestScope.INVALID.deleteError}
</span>
<section class="ftco-section">
    <div class="container">
        <div class="row justify-content-center pb-5">
            <div class="col-md-12 heading-section text-center ftco-animate">
                <h2 class="mb-4">Best Place to Travel</h2>
                <p>A journey of a thousand miles begins with a single step</p>
            </div>
        </div>
<c:if test="${sessionScope.USER eq 'admin'}">
    <a href="insert_tour.jsp" style="float: right"><button class="btn btn-toolbar btn-dark"><i class="fa fa-plus" aria-hidden="true"></button></i></a>
    <br/>
    <br/>
</c:if>
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
                                    <h4 class="price"><form action="MainTourController" method="POST" >
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
                                        <c:if test="${sessionScope.USER eq 'admin'}">
                                            <div class="float-right">
                                                <span class="rate">
                                                    <c:url var="DeleteLink" value="MainTourController">
                                                        <c:param name="txtSearch" value="${param.txtSearch}"/>
                                                        <c:param name="id" value="${dto.tourID}"/>
                                                        <c:param name="action" value="Delete"/>
                                                    </c:url>
                                                    <a href="${DeleteLink}" onclick="return getConfirmationDelete(this)"><button class="btn-toolbar btn btn-light"><i class="fa fa-trash" aria-hidden="true"></i></button></a>
                                                </span>
                                                <span class="rate"><form action="MainTourController" method="POST">
                                                        <input type="hidden" name="id" value="${dto.tourID}"/>
                                                        <button type="submit" name="action" value="Edit" class="btn-toolbar btn btn-light"><i class='fas fa-edit'></i></button>
                                                    </form></span>
                                                
                                            </div>
                                        </c:if>    

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