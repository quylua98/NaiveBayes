<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div class="preloader-wrap">
    <div class="berlin-cube-grid">
        <div class="berlin-cube berlin-cube1"></div>
        <div class="berlin-cube berlin-cube2"></div>
        <div class="berlin-cube berlin-cube3"></div>
        <div class="berlin-cube berlin-cube4"></div>
        <div class="berlin-cube berlin-cube5"></div>
        <div class="berlin-cube berlin-cube6"></div>
        <div class="berlin-cube berlin-cube7"></div>
        <div class="berlin-cube berlin-cube8"></div>
        <div class="berlin-cube berlin-cube9"></div>
    </div>
</div>
<!-- Header Starts -->
<header class="site-header d-none d-lg-block">
    <div class="container-fluid pl-lg--35 pr-lg--35">
        <div class="row justify-content-between align-items-center position-relative">
            <div class="col">
                <!-- Brand Logo -->
                <div class="brand-logo">
                    <a href="${pageContext.request.contextPath}/"><img src="img/main-logo.png" alt=""/></a>
                </div>
            </div>
            <!-- Menu Block -->
            <div class="col">
                <div class="main-navigation ">
                    <ul class="main-menu">
                        <li class="menu-item has-dropdown">
                            <a href="#">Tham khảo</a>
                            <ul class="menu-dropdown">
                                <li class="single-item">
                                    <a href="${pageContext.request.contextPath}/#kinhte">
                                        <h3>Kinh tế</h3>
                                        <p>Dành cho các bạn thích kinh doanh, quản trị</p>
                                    </a>
                                </li>
                                <li class="single-item">
                                    <a href="${pageContext.request.contextPath}/#kithuat">
                                        <h3>Kĩ thuật</h3>
                                        <p>Dành cho các bạn đam mê máy móc, công nghệ</p>
                                    </a>
                                </li>
                                <li class="single-item">
                                    <a href="${pageContext.request.contextPath}/#xahoi">
                                        <h3>Xã hội</h3>
                                        <p>Dành cho các bạn phản ứng nhanh, tính cách hòa đồng, khả năng thấu hiểu cao</p>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="menu-item"><a href="contact">Liên hệ - Góp ý</a></li>
                    </ul>
                </div>
                <div class="mobile-menu"></div>
            </div>

            <!-- Button Block -->
            <div class="col">
                <div class="header-btns">
                    <sec:authorize access="!isAuthenticated()">
                        <a href="/login" class="btn btn--transparent">Đăng nhập</a>
                    </sec:authorize>
                    <sec:authorize access="isAuthenticated()">
                        <a href="/admin/" class="btn btn--primary hvr-shine">Quản trị</a>
                        <a href="/logout" class="btn btn--transparent">Đăng xuất</a>
                    </sec:authorize>
                </div>
            </div>
        </div>
    </div>
</header>

<!-- Mobile menu Header Starts -->
<header class="mobile-header d-lg-none">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-md-4 col-7">
                <a href="index.html" class="site-brand">
                    <img src="./img/main-logo.png" alt="">
                </a>
            </div>
            <div class="col-md-8 col-5 text-right">
                <div class="header-top-widget">
                    <ul class="header-links">
                        <li class="single-link">
                            <a href="#" class="link-icon hamburger-icon off-canvas-btn"><i
                                    class="icon icon-menu-34"></i></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</header>
<!--Off Canvas Navigation Start-->
<aside class="off-canvas-wrapper">
    <div class="btn-close-off-canvas">
        <i class="icon icon-simple-remove"></i>
    </div>
    <div class="off-canvas-inner">
        <!-- mobile menu start -->
        <div class="mobile-navigation">
            <!-- mobile menu navigation start -->
            <nav class="off-canvas-nav">
                <ul class="mobile-menu">
                    <li class="menu-item-has-children">
                        <a href="#">Tham khảo <i class="icon icon-minimal-down"></i></a>
                        <ul class="sub-menu">
                            <li class="single-item">
                                <a href="">
                                    <h3>Kinh tế</h3>
                                    <p>Dành cho các bạn thích kinh doanh, quản trị</p>
                                </a>
                            </li>
                            <li class="single-item">
                                <a href="">
                                    <h3>Kĩ thuật</h3>
                                    <p>Dành cho các bạn đam mê máy móc, công nghệ</p>
                                </a>
                            </li>
                            <li class="single-item">
                                <a href="">
                                    <h3>Xã hội</h3>
                                    <p>Dành cho các bạn phản ứng nhanh, tính cách hòa đồng, khả năng thấu hiểu cao</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li><a href="#">Liên hệ</a></li>
                    <li><a href="contact.html">Góp ý</a></li>
                </ul>
            </nav>
            <!-- mobile menu navigation end -->
        </div>
        <!-- mobile menu end -->

        <!-- Header buttons start -->
        <div class="header-btns offcanvas">
            <div class="header-btns">
                <a href="#" class="btn btn-primary--opacity hvr-bounce-to-right">Đăng nhập</a>
            </div>
        </div>
        <!-- Header buttons end -->
    </div>
</aside>
<!--Off Canvas Navigation End-->