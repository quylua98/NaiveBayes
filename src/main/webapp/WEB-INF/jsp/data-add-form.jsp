<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/image/apple-icon.png">
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/image/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>
        Quản trị trang
    </title>
    <meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport'/>
    <!--     Fonts and icons     -->
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/fonts/Roboto.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/fonts/font-awesome-4.7.0/css/font-awesome.css">
    <!-- CSS Files -->
    <link href="${pageContext.request.contextPath}/css/material-dashboard.css?v=2.1.2" rel="stylesheet"/>
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="${pageContext.request.contextPath}/css/demo.css" rel="stylesheet"/>
</head>
<body class="">
<div class="wrapper ">
    <div class="sidebar" data-color="purple" data-background-color="white"
         data-image="${pageContext.request.contextPath}/image/sidebar-1.jpg">
        <div class="logo"><a href="${pageContext.request.contextPath}/admin/" class="simple-text logo-normal">
            Nguyễn Thị Quỳnh
        </a></div>
        <div class="sidebar-wrapper">
            <ul class="nav">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/admin/">
                        <i class="material-icons">dashboard</i>
                        <p>Dashboard</p>
                    </a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="data-table">
                        <i class="material-icons">content_paste</i>
                        <p>Bảng dữ liệu</p>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <div class="main-panel">
        <!-- Navbar -->
        <jsp:include page="_dashboard_nav.jsp" />
        <!-- End Navbar -->
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header card-header-primary">
                                <c:if test="${q != ''}">
                                    <h4 class="card-title">Thêm mới dữ liệu - ngành ${q}</h4>
                                </c:if>
                                <c:if test="${q == ''}">
                                    <h4 class="card-title">Thêm mới dữ liệu</h4>
                                </c:if>
                            </div>
                            <div class="card-body">
                                <form id="add-form" action="data/" method="post">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="bmd-label-floating label-style">Ngành học</label>
                                                <c:if test="${q == ''}">
                                                    <select name="result" class="custom-select">
                                                        <c:forEach var="nganh" items="${listNganh}" varStatus="loop">
                                                            <c:if test="${q == ''}">
                                                                <c:if test="${loop.index == 0}">
                                                                    <option value="${nganh}" selected>${nganh}</option>
                                                                </c:if>
                                                                <c:if test="${loop.index != 0}">
                                                                    <option value="${nganh}">${nganh}</option>
                                                                </c:if>
                                                            </c:if>
                                                        </c:forEach>
                                                    </select>
                                                </c:if>
                                                <c:if test="${q != ''}">
                                                    <select class="custom-select" disabled>
                                                        <c:forEach var="nganh" items="${listNganh}">
                                                            <c:if test="${nganh == q}">
                                                                <option value="${nganh}" selected>${nganh}</option>
                                                            </c:if>
                                                            <c:if test="${nganh != q}">
                                                                <option value="${nganh}">${nganh}</option>
                                                            </c:if>
                                                        </c:forEach>
                                                    </select>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label class="bmd-label-floating label-style">Học lực</label>
                                            <div class="form-group">
                                                <div class="custom-control custom-radio custom-control-inline">
                                                    <input type="radio"
                                                           name="hocLuc"
                                                           value="Giỏi"
                                                           id="hocLucGioi"
                                                           class="custom-control-input" checked>
                                                    <label class="custom-control-label" for="hocLucGioi">Giỏi</label>
                                                </div>
                                                <div class="custom-control custom-radio custom-control-inline">
                                                    <input type="radio"
                                                           name="hocLuc"
                                                           value="Khá"
                                                           id="hocLucKha"
                                                           class="custom-control-input">
                                                    <label class="custom-control-label" for="hocLucKha">Khá</label>
                                                </div>
                                                <div class="custom-control custom-radio custom-control-inline">
                                                    <input type="radio"
                                                           name="hocLuc"
                                                           id="hocLucTB"
                                                           value="Trung bình"
                                                           class="custom-control-input">
                                                    <label class="custom-control-label" for="hocLucTB">Trung
                                                        bình</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label class="bmd-label-floating label-style">Sức khoẻ</label>
                                            <div class="form-group">
                                                <div class="custom-control custom-radio custom-control-inline">
                                                    <input type="radio"
                                                           name="sucKhoe"
                                                           value="Tốt"
                                                           id="sk1"
                                                           class="custom-control-input" checked>
                                                    <label class="custom-control-label" for="sk1">Tốt</label>
                                                </div>
                                                <div class="custom-control custom-radio custom-control-inline">
                                                    <input type="radio"
                                                           name="sucKhoe"
                                                           value="Bình thường"
                                                           id="sk2"
                                                           class="custom-control-input">
                                                    <label class="custom-control-label" for="sk2">Bình thường</label>
                                                </div>
                                                <div class="custom-control custom-radio custom-control-inline">
                                                    <input type="radio"
                                                           name="sucKhoe"
                                                           value="Yếu"
                                                           id="sk3"
                                                           class="custom-control-input">
                                                    <label class="custom-control-label" for="sk3">Yếu</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label class="bmd-label-floating label-style">Tuổi</label>
                                            <div class="form-group">
                                                <div class="custom-control custom-radio custom-control-inline">
                                                    <input type="radio"
                                                           name="tuoi"
                                                           value="18-20"
                                                           id="tuoi1"
                                                           class="custom-control-input" checked>
                                                    <label class="custom-control-label" for="tuoi1">18-20 tuổi</label>
                                                </div>
                                                <div class="custom-control custom-radio custom-control-inline">
                                                    <input type="radio"
                                                           name="tuoi"
                                                           value="21-24"
                                                           id="tuoi2"
                                                           class="custom-control-input">
                                                    <label class="custom-control-label" for="tuoi2">21-24 tuổi</label>
                                                </div>
                                                <div class="custom-control custom-radio custom-control-inline">
                                                    <input type="radio"
                                                           name="tuoi"
                                                           value="25-30"
                                                           id="tuoi3"
                                                           class="custom-control-input">
                                                    <label class="custom-control-label" for="tuoi3">25-30 tuổi</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label class="bmd-label-floating label-style">Giới tính</label>
                                            <div class="form-group">
                                                <div class="custom-control custom-radio custom-control-inline">
                                                    <input type="radio"
                                                           name="gioiTinh"
                                                           value="Nam"
                                                           id="gender1"
                                                           class="custom-control-input" checked>
                                                    <label class="custom-control-label" for="gender1">Nam</label>
                                                </div>
                                                <div class="custom-control custom-radio custom-control-inline">
                                                    <input type="radio"
                                                           name="gioiTinh"
                                                           value="Nữ"
                                                           id="gender2"
                                                           class="custom-control-input">
                                                    <label class="custom-control-label" for="gender2">Nữ</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label class="bmd-label-floating label-style">Ngoại hình</label>
                                            <div class="form-group">
                                                <div class="custom-control custom-radio custom-control-inline">
                                                    <input type="radio"
                                                           name="ngoaiHinh"
                                                           value="Có"
                                                           id="nh1"
                                                           class="custom-control-input" checked>
                                                    <label class="custom-control-label" for="nh1">Có</label>
                                                </div>
                                                <div class="custom-control custom-radio custom-control-inline">
                                                    <input type="radio"
                                                           name="ngoaiHinh"
                                                           value="Không"
                                                           id="nh2"
                                                           class="custom-control-input">
                                                    <label class="custom-control-label" for="nh2">Khống</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label class="bmd-label-floating label-style">Tính cách</label>
                                            <div class="form-group">
                                                <div class="custom-control custom-radio custom-control-inline">
                                                    <input type="radio"
                                                           name="tinhCach"
                                                           value="Hướng nội"
                                                           id="tc1"
                                                           class="custom-control-input" checked>
                                                    <label class="custom-control-label" for="tc1">Hướng nội</label>
                                                </div>
                                                <div class="custom-control custom-radio custom-control-inline">
                                                    <input type="radio"
                                                           name="tinhCach"
                                                           value="Hướng ngoại"
                                                           id="tc2"
                                                           class="custom-control-input">
                                                    <label class="custom-control-label" for="tc2">Hướng ngoại</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label class="bmd-label-floating label-style">Kinh tế</label>
                                            <div class="form-group">
                                                <div class="custom-control custom-radio custom-control-inline">
                                                    <input type="radio"
                                                           name="kinhTe"
                                                           value="Bình thường"
                                                           id="kt1"
                                                           class="custom-control-input" checked>
                                                    <label class="custom-control-label" for="kt1">Bình thường</label>
                                                </div>
                                                <div class="custom-control custom-radio custom-control-inline">
                                                    <input type="radio"
                                                           name="kinhTe"
                                                           value="Giàu có"
                                                           id="kt2"
                                                           class="custom-control-input">
                                                    <label class="custom-control-label" for="kt2">Giàu có</label>
                                                </div>
                                                <div class="custom-control custom-radio custom-control-inline">
                                                    <input type="radio"
                                                           name="kinhTe"
                                                           value="Khó khăn"
                                                           id="kt3"
                                                           class="custom-control-input">
                                                    <label class="custom-control-label" for="kt3">Khó khăn</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label class="bmd-label-floating label-style">Hướng ngành</label>
                                            <div class="form-group">
                                                <div class="custom-control custom-radio custom-control-inline">
                                                    <input type="radio"
                                                           name="huongNganh"
                                                           value="Kĩ thuật"
                                                           id="huongNganh1"
                                                           class="custom-control-input" checked>
                                                    <label class="custom-control-label" for="huongNganh1">Kĩ
                                                        thuật</label>
                                                </div>
                                                <div class="custom-control custom-radio custom-control-inline">
                                                    <input type="radio"
                                                           name="huongNganh"
                                                           value="Kinh tế"
                                                           id="huongNganh2"
                                                           class="custom-control-input">
                                                    <label class="custom-control-label" for="huongNganh2">Kinh
                                                        tế</label>
                                                </div>
                                                <div class="custom-control custom-radio custom-control-inline">
                                                    <input type="radio"
                                                           name="huongNganh"
                                                           value="Xã hội"
                                                           id="huongNganh3"
                                                           class="custom-control-input">
                                                    <label class="custom-control-label" for="huongNganh3">Xã hội</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-primary pull-right">Submit</button>
                                    <div class="clearfix"></div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="_dashboard_footer.jsp" />
    </div>
</div>
<!--   Core JS Files   -->
<script src="${pageContext.request.contextPath}/js/core/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/core/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/js/core/bootstrap-material-design.min.js"></script>
<script src="${pageContext.request.contextPath}/js/plugins/perfect-scrollbar.jquery.min.js"></script>
<!-- Plugin for the momentJs  -->
<script src="${pageContext.request.contextPath}/js/plugins/moment.min.js"></script>
<!--  Plugin for Sweet Alert -->
<script src="${pageContext.request.contextPath}/js/plugins/sweetalert2.js"></script>
<!-- Forms Validations Plugin -->
<script src="${pageContext.request.contextPath}/js/plugins/jquery.validate.min.js"></script>
<!-- Plugin for the Wizard, full documentation here: https://github.com/VinceG/twitter-bootstrap-wizard -->
<script src="${pageContext.request.contextPath}/js/plugins/jquery.bootstrap-wizard.js"></script>
<!--	Plugin for Select, full documentation here: http://silviomoreto.github.io/bootstrap-select -->
<script src="${pageContext.request.contextPath}/js/plugins/bootstrap-selectpicker.js"></script>
<!--  Plugin for the DateTimePicker, full documentation here: https://eonasdan.github.io/bootstrap-datetimepicker/ -->
<script src="${pageContext.request.contextPath}/js/plugins/bootstrap-datetimepicker.min.js"></script>
<!--  DataTables.net Plugin, full documentation here: https://datatables.net/  -->
<script src="${pageContext.request.contextPath}/js/plugins/jquery.dataTables.min.js"></script>
<!--	Plugin for Tags, full documentation here: https://github.com/bootstrap-tagsinput/bootstrap-tagsinputs  -->
<script src="${pageContext.request.contextPath}/js/plugins/bootstrap-tagsinput.js"></script>
<!-- Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
<script src="${pageContext.request.contextPath}/js/plugins/jasny-bootstrap.min.js"></script>
<!--  Full Calendar Plugin, full documentation here: https://github.com/fullcalendar/fullcalendar    -->
<script src="${pageContext.request.contextPath}/js/plugins/fullcalendar.min.js"></script>
<!-- Vector Map plugin, full documentation here: http://jvectormap.com/documentation/ -->
<script src="${pageContext.request.contextPath}/js/plugins/jquery-jvectormap.js"></script>
<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
<script src="${pageContext.request.contextPath}/js/plugins/nouislider.min.js"></script>
<!-- Include a polyfill for ES6 Promises (optional) for IE11, UC Browser and Android browser support SweetAlert -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"></script>
<!-- Library for adding dinamically elements -->
<script src="${pageContext.request.contextPath}/js/plugins/arrive.min.js"></script>
<!-- Chartist JS -->
<script src="${pageContext.request.contextPath}/js/plugins/chartist.min.js"></script>
<!--  Notifications Plugin    -->
<script src="${pageContext.request.contextPath}/js/plugins/bootstrap-notify.js"></script>
<!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
<script src="${pageContext.request.contextPath}/js/material-dashboard.js?v=2.1.2" type="text/javascript"></script>
<!-- Material Dashboard DEMO methods, don't include it in your project! -->
<script src="${pageContext.request.contextPath}/js/demo.js"></script>
<!--  SweetAlert  -->
<script src="${pageContext.request.contextPath}/js/sweetalert.min.js"></script>
<script>
    $(document).ready(function () {
        $().ready(function () {
            $sidebar = $('.sidebar');

            $sidebar_img_container = $sidebar.find('.sidebar-background');

            $full_page = $('.full-page');

            $sidebar_responsive = $('body > .navbar-collapse');

            window_width = $(window).width();

            fixed_plugin_open = $('.sidebar .sidebar-wrapper .nav li.active a p').html();

            if (window_width > 767 && fixed_plugin_open == 'Dashboard') {
                if ($('.fixed-plugin .dropdown').hasClass('show-dropdown')) {
                    $('.fixed-plugin .dropdown').addClass('open');
                }

            }

            $('.fixed-plugin a').click(function (event) {
                // Alex if we click on switch, stop propagation of the event, so the dropdown will not be hide, otherwise we set the  section active
                if ($(this).hasClass('switch-trigger')) {
                    if (event.stopPropagation) {
                        event.stopPropagation();
                    } else if (window.event) {
                        window.event.cancelBubble = true;
                    }
                }
            });

            $('.fixed-plugin .active-color span').click(function () {
                $full_page_background = $('.full-page-background');

                $(this).siblings().removeClass('active');
                $(this).addClass('active');

                var new_color = $(this).data('color');

                if ($sidebar.length != 0) {
                    $sidebar.attr('data-color', new_color);
                }

                if ($full_page.length != 0) {
                    $full_page.attr('filter-color', new_color);
                }

                if ($sidebar_responsive.length != 0) {
                    $sidebar_responsive.attr('data-color', new_color);
                }
            });

            $('.fixed-plugin .background-color .badge').click(function () {
                $(this).siblings().removeClass('active');
                $(this).addClass('active');

                var new_color = $(this).data('background-color');

                if ($sidebar.length != 0) {
                    $sidebar.attr('data-background-color', new_color);
                }
            });

            $('.fixed-plugin .img-holder').click(function () {
                $full_page_background = $('.full-page-background');

                $(this).parent('li').siblings().removeClass('active');
                $(this).parent('li').addClass('active');


                var new_image = $(this).find("img").attr('src');

                if ($sidebar_img_container.length != 0 && $('.switch-sidebar-image input:checked').length != 0) {
                    $sidebar_img_container.fadeOut('fast', function () {
                        $sidebar_img_container.css('background-image', 'url("' + new_image + '")');
                        $sidebar_img_container.fadeIn('fast');
                    });
                }

                if ($full_page_background.length != 0 && $('.switch-sidebar-image input:checked').length != 0) {
                    var new_image_full_page = $('.fixed-plugin li.active .img-holder').find('img').data('src');

                    $full_page_background.fadeOut('fast', function () {
                        $full_page_background.css('background-image', 'url("' + new_image_full_page + '")');
                        $full_page_background.fadeIn('fast');
                    });
                }

                if ($('.switch-sidebar-image input:checked').length == 0) {
                    var new_image = $('.fixed-plugin li.active .img-holder').find("img").attr('src');
                    var new_image_full_page = $('.fixed-plugin li.active .img-holder').find('img').data('src');

                    $sidebar_img_container.css('background-image', 'url("' + new_image + '")');
                    $full_page_background.css('background-image', 'url("' + new_image_full_page + '")');
                }

                if ($sidebar_responsive.length != 0) {
                    $sidebar_responsive.css('background-image', 'url("' + new_image + '")');
                }
            });

            $('.switch-sidebar-image input').change(function () {
                $full_page_background = $('.full-page-background');

                $input = $(this);

                if ($input.is(':checked')) {
                    if ($sidebar_img_container.length != 0) {
                        $sidebar_img_container.fadeIn('fast');
                        $sidebar.attr('data-image', '#');
                    }

                    if ($full_page_background.length != 0) {
                        $full_page_background.fadeIn('fast');
                        $full_page.attr('data-image', '#');
                    }

                    background_image = true;
                } else {
                    if ($sidebar_img_container.length != 0) {
                        $sidebar.removeAttr('data-image');
                        $sidebar_img_container.fadeOut('fast');
                    }

                    if ($full_page_background.length != 0) {
                        $full_page.removeAttr('data-image', '#');
                        $full_page_background.fadeOut('fast');
                    }

                    background_image = false;
                }
            });

            $('.switch-sidebar-mini input').change(function () {
                $body = $('body');

                $input = $(this);

                if (md.misc.sidebar_mini_active == true) {
                    $('body').removeClass('sidebar-mini');
                    md.misc.sidebar_mini_active = false;

                    $('.sidebar .sidebar-wrapper, .main-panel').perfectScrollbar();

                } else {

                    $('.sidebar .sidebar-wrapper, .main-panel').perfectScrollbar('destroy');

                    setTimeout(function () {
                        $('body').addClass('sidebar-mini');

                        md.misc.sidebar_mini_active = true;
                    }, 300);
                }

                // we simulate the window Resize so the charts will get updated in realtime.
                var simulateWindowResize = setInterval(function () {
                    window.dispatchEvent(new Event('resize'));
                }, 180);

                // we stop the simulation of Window Resize after the animations are completed
                setTimeout(function () {
                    clearInterval(simulateWindowResize);
                }, 1000);

            });
        });
    });
</script>
<script>
    $(document).ready(function () {
        // Javascript method's body can be found in assets/js/demos.js
        md.initDashboardPageCharts();

        /* Submit form */
        $("#add-form").submit(function (e) {
            e.preventDefault();
            var form = $(this);
            var url = form.attr('action');
            $.ajax({
                type: "POST",
                url: url,
                data: form.serialize(),
                success: function (data) {
                    swal("Thành công!", "Dữ liệu của bạn đã được thêm.", "success");
                },
                error: function () {
                    swal("Thất bại!", "Dữ liệu của bạn chưa được lưu.", "error");
                }
            });
        });
        /***************/
    });
</script>
</body>

</html>