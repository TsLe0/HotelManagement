<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
    <head>
        <meta charset="utf-8">
        <title> Santa Villa Hội An </title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/newcss.css">
        <link rel="preload" as="style" href="https://santavillahoian.com/build-web/assets/app.05cf7a4e.css" />
        <link rel="stylesheet" href="https://santavillahoian.com/build-web/assets/app.05cf7a4e.css" />
    </head>
    <body>
        <div id="top-header">
            <div class="container">
                <div class="row">
                    <div class="col-xs-6">
                        <div class="th-text pull-left">
                            <div class="th-item">
                                <a href="#">
                                    <i class="fa-solid fa-phone"></i> 091 949 0330
                                </a>
                            </div>
                            <div class="th-item">
                                <a href="#">
                                    <i class="fa-solid fa-envelope"></i> santavillahoian@gmail.com
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-6">
                        <div class="th-text pull-right">
                            <div class="th-item">
                                <div class="social-icons">
                                    <a target="_blank" href="https://www.facebook.com/santaseavillahoian/">
                                        <i class="fa-brands fa-facebook"></i>
                                    </a>
                                    <a target="_blank" href="https://www.facebook.com/santaseavillahoian/">
                                        <i class="fa-brands fa-twitter"></i>
                                    </a>
                                    <a target="_blank" href="https://www.facebook.com/santaseavillahoian/">
                                        <i class="fa-brands fa-youtube"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <header>
            <div class="navbar yamm navbar-default" id="sticky">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" data-toggle="collapse" data-target="#navbar-collapse-grid" class="navbar-toggle">
                            <span class="icon-bar"></span> <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>

                        <a href="https://santavillahoian.com" class="navbar-brand">
                            <div id="logo">
                                <img id="default-logo" src="https://santavillahoian.com/storage/medias/2023/11/2/b2j8G1gsc1E9EXscakFLaJdTj5uN8O54hJcG7uka.png" alt="Santa Sea Villa Hoi An - The Best Villa In Hoi An" style="height:44px;">
                                <img id="retina-logo" src="https://santavillahoian.com/storage/medias/2023/11/2/b2j8G1gsc1E9EXscakFLaJdTj5uN8O54hJcG7uka.png" alt="Santa Sea Villa Hoi An - The Best Villa In Hoi An" style="height:44px;">
                            </div>
                        </a>
                    </div>

                    <div id="navbar-collapse-grid" class="navbar-collapse collapse">
                        <ul class="nav navbar-nav">
                            <li class="dropdown active">
                                <a href="https://santavillahoian.com">Home</a>
                            </li>
                            <li>
                                <a href="https://santavillahoian.com/room">Room</a>
                            </li>
                            <li class="dropdown">
                                <a href="#" data-toggle="dropdown" class="dropdown-toggle js-activated">
                                    Blog<b class="caret"></b>
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a href="https://santavillahoian.com/blog/category/news">News</a></li>
                                    <li><a href="https://santavillahoian.com/blog/category/service">Service</a></li>
                                    <li><a href="https://santavillahoian.com/blog/category/promotion">Promotion</a></li>
                                    <li><a href="https://santavillahoian.com/blog/category/explore">Explore</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="https://santavillahoian.com/gallery">Gallery</a>
                            </li>
                            <li>
                                <a href="https://santavillahoian.com/contact">Contact</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </header>

        <section id="reservation-form">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <form class="form-inline reservation-horizontal clearfix ajaxForm" method="post" action="https://santavillahoian.com/room/api/room/order">
                            <input type="hidden" name="_token" value="${sessionScope.token}" autocomplete="off">
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label for="email" accesskey="E">E-mail</label>
                                        <input name="email" type="text" id="email" class="form-control" placeholder="Please enter your E-mail"/>
                                    </div>
                                </div>
                                <div class="col-sm-2">
                                    <div class="form-group">
                                        <label for="phone" accesskey="E">Phone</label>
                                        <input name="phone" type="text" id="phone" class="form-control" placeholder="Please enter phone Number"/>
                                    </div>
                                </div>
                                <div class="col-sm-2">
                                    <div class="form-group">
                                        <label for="room">Room Type</label>
                                        <div class="popover-icon" data-container="body" data-toggle="popover" data-trigger="hover" data-placement="right" data-content="Vivamus sagittis lacus vel augue laoreet rutrum faucibus.">
                                            <i class="fa fa-info-circle fa-lg"></i>
                                        </div>
                                        <select class="form-control" name="room_id" id="room">
                                            <option value="1">Fishermen’s room</option>
                                            <option value="2">Navigator’s room</option>
                                            <option value="3">Trader’s room</option>
                                            <option value="4">Sailor’s room</option>
                                            <option value="5">Captain’s room</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-2">
                                    <div class="form-group">
                                        <label for="checkin">Check-in</label>
                                        <div class="popover-icon" data-container="body" data-toggle="popover" data-trigger="hover" data-placement="right" data-content="Check-In is from 11:00">
                                            <i class="fa fa-info-circle fa-lg"></i>
                                        </div>
                                        <i class="fa fa-calendar infield"></i>
                                        <input name="checkin" type="text" id="checkin" class="form-control" placeholder="Check-in"/>
                                    </div>
                                </div>
                                <div class="col-sm-2">
                                    <div class="form-group">
                                        <label for="checkout">Check-out</label>
                                        <div class="popover-icon" data-container="body" data-toggle="popover" data-trigger="hover" data-placement="right" data-content="Check-out is from 12:00">
                                            <i class="fa fa-info-circle fa-lg"></i>
                                        </div>
                                        <i class="fa fa-calendar infield"></i>
                                        <input name="checkout" type="text" id="checkout" class="form-control" placeholder="Check-out"/>
                                    </div>
                                </div>
                                <div class="col-sm-1">
                                    <div class="form-group">
                                        <div class="guests-select">
                                            <label>Guests</label>
                                            <i class="fa fa-user infield"></i>
                                            <div class="total form-control" id="test">1</div>
                                            <div class="guests">
                                                <div class="form-group adults">
                                                    <label for="adults">Adults</label>
                                                    <div class="popover-icon" data-container="body" data-toggle="popover" data-trigger="hover" data-placement="right" data-content="+18 years">
                                                        <i class="fa fa-info-circle fa-lg"></i>
                                                    </div>
                                                    <select name="adults" id="adults" class="form-control">
                                                        <option value="1">1 adult</option>
                                                        <option value="2">2 adults</option>
                                                        <option value="3">3 adults</option>
                                                    </select>
                                                </div>
                                                <div class="form-group children">
                                                    <label for="children">Children</label>
                                                    <div class="popover-icon" data-container="body" data-toggle="popover" data-trigger="hover" data-placement="right" data-content="0 till 18 years">
                                                        <i class="fa fa-info-circle fa-lg"></i>
                                                    </div>
                                                    <select name="children" id="children" class="form-control">
                                                        <option value="0">0 children</option>
                                                        <option value="1">1 child</option>
                                                        <option value="2">2 children</option>
                                                        <option value="3">3 children</option>
                                                    </select>
                                                </div>
                                                <button type="button" class="btn btn-default button-save btn-block">Save</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-12 mt20 text-center">
                                    <button type="submit" class="btn btn-primary ladda-button" data-style="slide-up">Book Now</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>

        <section class="rooms mt50">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <h2 class="lined-heading"><span>Guests Favorite Rooms</span></h2>
                    </div>
                   <c:forEach items="${list}" var="l">
                        <div class="col-sm-4">
                            <div class="room-thumb">
                                <img src="${l.roomtype.imagePath}" alt="${l.roomtype.name}" class="img-responsive"/>
                                <div class="mask">
                                    <div class="main">
                                        <h5>${l.roomtype.name}</h5>
                                        <div class="price"></div>
                                    </div>
                                    <div class="content">
                                        <p>
                                            <span>A modern hotel room in Santa Villa</span>
                                            ${l.roomtype.description}
                                        </p>
                                        <div>
                                            <ul class="list-unstyled row">
                                                <li class="col-xs-6"><i class="fa fa-check-circle"></i> Private balcony</li>
                                                <li class="col-xs-6"><i class="fa fa-check-circle"></i> Free Internet</li>
                                                <li class="col-xs-6"><i class="fa fa-check-circle"></i> Free Newspaper</li>
                                                <li class="col-xs-6"><i class="fa fa-check-circle"></i> 60 square meter</li>
                                                <li class="col-xs-6"><i class="fa fa-check-circle"></i> Garden view</li>
                                                <li class="col-xs-6"><i class="fa fa-check-circle"></i> 2 persons</li>
                                            </ul>
                                        </div>
                                        <a href="https://santavillahoian.com/room/fishermens-room" class="btn btn-primary btn-block">Book Now</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>           
                    <!--                <div class="col-sm-4">
                                        <div class="room-thumb">
                                            <img src="https://santavillahoian.com/storage/medias/2023/11/2/RStQ7ZOqNlqnMZ3O7jSOi3gr2ka6edd0nFpbaiRk.jpg" alt="Navigator’s room" class="img-responsive"/>
                                            <div class="mask">
                                                <div class="main">
                                                    <h5>Navigator’s room</h5>
                                                    <div class="price"></div>
                                                </div>
                                                <div class="content">
                                                    <p>
                                                        <span>A modern hotel room in Santa Villa</span>
                                                        Navigator rooms: - 40 m2 - Ocean view - Private balcony with table & chair - King size bed.
                                                    </p>
                                                    <div>
                                                        <ul class="list-unstyled row">
                                                            <li class="col-xs-6"><i class="fa fa-check-circle"></i> Double Bed</li>
                                                            <li class="col-xs-6"><i class="fa fa-check-circle"></i> Private balcony</li>
                                                            <li class="col-xs-6"><i class="fa fa-check-circle"></i> Free Newspaper</li>
                                                            <li class="col-xs-6"><i class="fa fa-check-circle"></i> 60 square meter</li>
                                                            <li class="col-xs-6"><i class="fa fa-check-circle"></i> Sea view</li>
                                                            <li class="col-xs-6"><i class="fa fa-check-circle"></i> 2 persons</li>
                                                        </ul>
                                                    </div>
                                                    <a href="https://santavillahoian.com/room/navigators-room" class="btn btn-primary btn-block">Book Now</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>-->
                    <!--                <div class="col-sm-4">
                                        <div class="room-thumb">
                                            <img src="https://santavillahoian.com/storage/medias/2023/11/2/n5TBaEKo8B4IfCc6q5SCOt6ONxTMClmFCtp15Xol.jpg" alt="Trader’s room" class="img-responsive"/>
                                            <div class="mask">
                                                <div class="main">
                                                    <h5>Trader’s room</h5>
                                                    <div class="price"></div>
                                                </div>
                                                <div class="content">
                                                    <p>
                                                        <span>A modern hotel room in Santa Villa</span>
                                                        Trader rooms: - 40m2. Room at corner so command both view of ocean and pool/ street view, large wind...
                                                    </p>
                                                    <div>
                                                        <ul class="list-unstyled row">
                                                            <li class="col-xs-6"><i class="fa fa-check-circle"></i> Double Bed</li>
                                                            <li class="col-xs-6"><i class="fa fa-check-circle"></i> Free Internet</li>
                                                            <li class="col-xs-6"><i class="fa fa-check-circle"></i> Free Newspaper</li>
                                                            <li class="col-xs-6"><i class="fa fa-check-circle"></i> 60 square meter</li>
                                                            <li class="col-xs-6"><i class="fa fa-check-circle"></i> Beach view</li>
                                                            <li class="col-xs-6"><i class="fa fa-check-circle"></i> 2 persons</li>
                                                        </ul>
                                                    </div>
                                                    <a href="https://santavillahoian.com/room/traders-room" class="btn btn-primary btn-block">Book Now</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>-->
                </div>
            </div>
        </section>

        <section class="usp mt100">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <h2 class="lined-heading"><span>Services</span></h2>
                    </div>
                    <div class="col-sm-3 bounceIn animated" data-start="0">
                        <div class="box-icon">
                            <div class="circle"><i class="fa-solid fa-martini-glass-citrus fa-lg"></i></div>
                            <h3>Beverages included</h3>
                            <p>
                                The price includes breakfast and besides we have serve lunch, dinner with many traditional
                                and local food … We also have Asian and European food. We will try best service while you
                                are here, you will enjoy the delicious food and romantic space at our restaurant.
                            </p>
                        </div>
                    </div>
                    <div class="col-sm-3 bounceIn animated" data-start="400">
                        <div class="box-icon">
                            <div class="circle"><i class="fa-solid fa-credit-card fa-lg"></i></div>
                            <h3>Stay First, Pay After!</h3>
                            <p>
                                Come to with us, you do not need to pay in advance, you stay until when you check out
                                you pay everything, we don’t need deposit from you, for us make you happy and
                                comfortable when stay here, this is our successful.
                            </p>
                        </div>
                    </div>
                    <div class="col-sm-3 bounceIn animated" data-start="800">
                        <div class="box-icon">
                            <div class="circle"><i class="fa-solid fa-utensils fa-lg"></i></div>
                            <h3>24 Hour Restaurant</h3>
                            <p>
                                We got service 24-hour, restaurant which has room service, we wish you would enjoy
                                the food here. We will try to cook the best food for you.
                            </p>
                        </div>
                    </div>
                    <div class="col-sm-3 bounceIn animated