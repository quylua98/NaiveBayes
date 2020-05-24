<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Tư vấn chọn ngành trực tuyến</title>
    <link rel="shortcut icon" href="image/title.ico"/>
    <!-- Plugins CSS -->
    <link rel="stylesheet" href="./plugins/bootstrap-4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="./plugins/fancybox-master/jquery.fancybox.min.css">
    <link rel="stylesheet" href="./plugins/aos-animation/aos.css">
    <!-- fonts -->
    <link rel="stylesheet" href="./fonts/ep-icon-fonts/css/style.css">
    <link rel="stylesheet" href="./fonts/fontawesome-5/css/all.min.css">
    <link rel="stylesheet" href="./fonts/typography-font/typo-fonts.css">
    <!-- Custom Stylesheet -->
    <link rel="stylesheet" href="./css/settings.css">
    <link rel="stylesheet" href="./css/style.css">
</head>

<body>
<div class="site-wrapper">
    <jsp:include page="_page_header.jsp"></jsp:include>

    <!-- Banner Section -->
    <section class="hero-area">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-7 col-lg-8 col-md-10">
                    <form id="contact-form">
                        <div class="hero-content">
                            <h2 class="title h2">Đóng góp ý kiến</h2>
                            <div class="form-contact">
                                <label class="label-contact" for="name">Họ tên</label>
                                <input class="input-contact" name="name" id="name" type="text" placeholder="Nguyễn Văn A">
                                <label class="label-contact" for="content">Ý kiến của bạn</label>
                                <textarea class="textarea-contact" name="content" id="content" placeholder="Mời bạn cho ý kiến ( tối đa 255 kí tự )"></textarea>
                            </div>
                            <div class="hero-btn">
                                <button class="btn btn--primary hvr-shine">Gửi</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="hero-shape"><img src="img/hero-shape.png" alt=""></div>
    </section>

    <jsp:include page="_page_footer.jsp"></jsp:include>
</div>
<!-- Vendor JS-->
<script src="./plugins/jquery/jquery.min.js"></script>
<script src="./plugins/jquery/jquery-migrate.min.js"></script>
<script src="./plugins/bootstrap-4.3.1/js/bootstrap.bundle.js"></script>

<!-- Plugins JS -->
<script src="./plugins/fancybox-master/jquery.fancybox.min.js"></script>
<script src="./plugins/aos-animation/aos.js"></script>

<!-- Custom JS -->
<script src="./js/active.js"></script>
<script src="./js/sweetalert.min.js"></script>
<script>
    $(document).ready(function() {
        /* Submit form */
        $("#contact-form").submit(function (e) {
            e.preventDefault();
            var form = $(this);
            var url = "/contact"
            $.ajax({
                type: "POST",
                url: url,
                data: form.serialize(),
                success: function (data) {
                    swal("Thank you!", "Rất hân hạnh khi được bạn góp ý.", "success").then(function() {
                        window.location = "/";
                    });
                },
                error: function (xhr) {
                    if(xhr.responseText == "QL01") {
                        swal("Thất bại!", "Tên bạn nhập quá dài", "error");
                    }else if(xhr.responseText == "QL02") {
                        swal("Thất bại!", "Nội dung không quá 255 kí tự. ", "error");
                    }else {
                        swal("Thất bại!", "Có lỗi xảy ra. ", "error");
                    }
                }
            });
        });
        /***************/
    })
</script>
</body>

</html>
