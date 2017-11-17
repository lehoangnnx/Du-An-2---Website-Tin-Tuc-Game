<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<script type="text/javascript"
        src="${contextPath}/js/js/jquery-latest.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/js/jquery.js"></script>
<script type="text/javascript"
        src="${contextPath}/js/js/bootstrap.min.js"></script>
<script type="text/javascript"
        src="${contextPath}/js/js/smoothscroll.js"></script>


<script src="${contextPath}/js/sliderengine/amazingslider.js"></script>
<script src="${contextPath}/js/sliderengine/initslider-1.js"></script>

<script src='${contextPath}/js/js/jquery.leanModal.min_.js'></script>
<script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>


<script>
    jQuery(".widget-tabbed > h3 span", ".sidebar").on(
        "click",
        function () {
            var thisel = jQuery(this);
            thisel.addClass("active").siblings(".active").removeClass(
                "active").parent().siblings("div").eq(thisel.index())
                .addClass("active").siblings(".active").removeClass(
                "active");
            return false;
        });
</script>
<script>
    if ($('#back-to-top').length) {
        var scrollTrigger = 100, // px
            backToTop = function () {
                var scrollTop = $(window).scrollTop();
                if (scrollTop > scrollTrigger) {
                    $('#back-to-top').addClass('show');
                } else {
                    $('#back-to-top').removeClass('show');
                }
            };
        backToTop();
        $(window).on('scroll', function () {
            backToTop();
        });
        $('#back-to-top').on('click', function (e) {
            e.preventDefault();
            $('html,body').animate({
                scrollTop: 0
            }, 700);
        });
    }
</script>
<script>
    (function ($) {
        "use strict";

        Array.prototype.forEach2 = function (a) {
            var l = this.length;
            for (var i = 0; i < l; i++)
                a(this[i], i)
        };

        jQuery(document)
            .on(
                "ready",
                function () {

                    // Breaking slider main function
                    function otBreakingSlide(item, direction,
                                             thisisbutton) {
                        if (item.data("breaking-hover") == true
                            && !thisisbutton) {
                            return false;
                        }
                        if (thisisbutton) {
                            clearInterval(item
                                .data("breaking-function"));
                        }
                        if (direction == "right"
                            && parseInt(item
                                .data("breaking-current"), 10) + 1 < parseInt(
                                item.data("breaking-size"), 10)) {
                            item
                                .find(
                                    ".ot-breaking-news-content .item")
                                .eq(0)
                                .css(
                                    "margin-left",
                                    "-"
                                    + (100 * (parseInt(
                                    item
                                        .data("breaking-current"),
                                    10) + 1))
                                    + "%");
                            item.data("breaking-current", parseInt(item
                                .data("breaking-current"), 10) + 1);
                        } else if (direction == "right") {
                            item
                                .find(
                                    ".ot-breaking-news-content .item")
                                .eq(0).css("margin-left", "0px");
                            item.data("breaking-current", "0");
                        }
                        if (direction == "left"
                            && parseInt(item
                                .data("breaking-current"), 10) - 1 >= 0) {
                            item
                                .find(
                                    ".ot-breaking-news-content .item")
                                .eq(0)
                                .css(
                                    "margin-left",
                                    "-"
                                    + (100 * (parseInt(
                                    item
                                        .data("breaking-current"),
                                    10) - 1))
                                    + "%");
                            item.data("breaking-current", parseInt(item
                                .data("breaking-current"), 10) - 1);
                        } else if (direction == "left") {
                            item
                                .find(
                                    ".ot-breaking-news-content .item")
                                .eq(0)
                                .css(
                                    "margin-left",
                                    "-"
                                    + (100 * (parseInt(
                                    item
                                        .data("breaking-size"),
                                    10) - 1))
                                    + "%");
                            item.data("breaking-current", parseInt(item
                                .data("breaking-size"), 10) - 1);
                        }
                    }

                    jQuery("a[href='#top']", "body").on("click",
                        function () {
                            jQuery("body,html").animate({
                                scrollTop: 0
                            }, 500);
                            return false;
                        });

                    jQuery(".ot-breaking-news-body", ".content")
                        .toArray()
                        .forEach2(
                            function (a) {
                                var thisel = jQuery(a), thiscontrol = thisel
                                    .find(
                                        ".ot-breaking-news-content .item")
                                    .eq(0), slidetimeout = (thisel
                                    .data("breaking-timeout") && parseInt(thisel
                                    .data("breaking-timeout")) >= 1000) ? parseInt(thisel
                                        .data("breaking-timeout"))
                                    : 2000;
                                thisel
                                    .data(
                                        "breaking-size",
                                        thisel
                                            .find(
                                                ".ot-breaking-news-content .item")
                                            .size())
                                    .data(
                                        "breaking-current",
                                        "0");

                                if (thisel
                                        .data("breaking-autostart") == true) {
                                    thisel
                                        .data(
                                            "breaking-function",
                                            setInterval(
                                                function () {
                                                    otBreakingSlide(
                                                        thisel,
                                                        "right");
                                                },
                                                slidetimeout));
                                }
                            });

                    jQuery(".ot-breaking-news-body", ".content").on(
                        "mouseenter",
                        function () {
                            jQuery(this).addClass("mouseenter")
                                .data("breaking-hover", true);
                        }).on(
                        "mouseleave",
                        function () {
                            jQuery(this).removeClass("mouseenter")
                                .data("breaking-hover", false);
                        });

                    jQuery("button[data-break-dir='right']",
                        ".ot-breaking-news-controls").on(
                        "click",
                        function () {
                            otBreakingSlide(jQuery(this).parent()
                                .parent(), "right", true);
                            return false;
                        });

                    jQuery("button[data-break-dir='left']",
                        ".ot-breaking-news-controls").on(
                        "click",
                        function () {
                            otBreakingSlide(jQuery(this).parent()
                                .parent(), "left", true);
                            return false;
                        });

                });

    })(jQuery);
</script>


<script>
    // Plugin options and our code

    $(".modal_trigger").leanModal({
        top: 100,
        overlay: 0.6,
        closeButton: ".modal_close"

    });
    $(".modal_trigger").click(function () {
        $(".user_forgot").hide();
        $(".user_login").hide();
        $(".user_register").hide();
        $(".social_login").show();
    });
    $(function () {
        // Calling Login Form
        $("#login_form").click(function () {
            $(".social_login").hide();

            $(".user_login").show();
            return false;
        });

        // Calling Register Form
        $("#register_form").click(function () {
            $(".social_login").hide();
            $(".user_register").show();
            $(".header_title").text('Register');
            return false;
        });
        // Calling Forgot Password Form
        $("#forgot_password").click(function () {
            $(".social_login").hide();
            $(".user_login").hide();
            $(".user_register").hide();
            $(".user_forgot").show();
            $(".header_title").text('Lấy Lại Mật Khẩu');
            return false;
        });
        // Going back to Social Forms
        $(".back_btn").click(function () {
            $(".user_login").hide();
            $(".user_register").hide();
            $(".user_forgot").hide();
            $(".social_login").show();
            $(".header_title").text('Login');
            return false;
        });
    });
</script>


<!-- Controller Form Login Ajax -->
<script>
    var timeout = null;

    function login() {

        console.log(($('#login-form').serialize()));
        clearTimeout(timeout);
        timeout = setTimeout(
            function () {

                var token = $("meta[name='_csrf']").attr("content");
                var header = $("meta[name='_csrf_header']").attr("content");
                $(document).ajaxSend(function (e, xhr, options) {
                    xhr.setRequestHeader(header, token);
                });
                $
                    .ajax({

                        type: "POST",
                        //contentType : "application/json",
                        url: "${pageContext.request.contextPath}/login",
                        data: $('#login-form').serialize(),
                        //dataType: 'json',
                        // timeout: 600000,
                        success: function (result) {
                            $("#LoadingImage").hide();

                            if (result == 'Bad credentials') {
                                $('#msgerror')
                                    .text(
                                        '* Sai Tên Đăng Nhập Hoặc Mật Khẩu');
                            } else if (result == 'User account is locked') {
                                $('#msgerror').text(
                                    '* Tài Khoản Đã Bị Khóa');
                            } else if (result == 'success') {
                                $('#msgerror').text('');
                                location.reload();

                            }

                        },
                        error: function (e) {
                            alert("Lỗi ! Vui Lòng Kiểm Tra Lại");
                        }
                    });
            }, 1000);
    };

    function register() {
        clearTimeout(timeout);
        timeout = setTimeout(function () {

            var users = {};
            users["userName"] = $("#userNamer").val();
            users["email"] = $("#emailr").val();
            users["password"] = $("#rppasswordr").val();
            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");
            $(document).ajaxSend(function (e, xhr, options) {
                xhr.setRequestHeader(header, token);
            });
            $
                .ajax({

                    type: "POST",
                    contentType: "application/json",
                    url: "${pageContext.request.contextPath}/register",
                    data: JSON.stringify(users),
                    //dataType: 'json',
                    // timeout: 600000,
                    success: function (result) {
                        $("#LoadingImage").hide();
                        console.log(result);
                        if (result == 'errorUserNameAndEmail') {
                            $("#userNamer").focus();
                            $('#msgerror-r').text('* Tên Đăng Nhập Và Email Đã Tồn Tại');
                        } else if (result == 'errorUserName') {

                            $("#userNamer").focus();
                            $('#msgerror-r').text('* Tên Đăng Nhập Đã Tồn Tại');
                        } else if (result == 'errorEmail') {

                            $("#emailr").focus();
                            $('#msgerror-r').text('* Email Đã Tồn Tại');
                        } else if (result == 'error') {
                            $('#msgerror-r').text('* Đăng Ký Thất Bại');
                        } else {
                            location.reload();
                        }

                    },
                    error: function (e) {
                        alert("Lỗi ! Vui Lòng Kiểm Tra Lại");
                    }
                });
        }, 1000);
    };

    function forgotpassword() {
        clearTimeout(timeout);
        timeout = setTimeout(function () {

            var userName = $('#userNamef').val();
            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");
            $(document).ajaxSend(function (e, xhr, options) {
                xhr.setRequestHeader(header, token);
            });
            $
                .ajax({
                    type: "POST",
                    contentType: "application/json",
                    url: "${pageContext.request.contextPath}/user/forgotpassword",
                    data: userName,
                    //dataType: 'json',
                    // timeout: 600000,
                    success: function (result) {
                        $("#LoadingImage").hide();
                        console.log(result);
                        if (result == 'error') {
                            $('#msgerror-f').text("* Tài Khoản Không Tồn Tại");
                        } else {
                            $('#msgerror-f').text(result);
                        }


                    },
                    error: function (e) {
                        alert("Lỗi ! Vui Lòng Kiểm Tra Lại");
                    }
                });
        }, 1000);
    };
</script>
<script>
    $('#btn-login').click(function () {

        var userName = $('#userName').val();
        var password = $('#password').val();
        if (userName == '' && password == '') {
            $('#msgerror').text('* Vui Lòng Nhập Đủ Thông Tin');
        } else if (userName == '') {
            $('#msgerror').text('* Vui Lòng Nhập UserName');
        } else if (password == '') {
            $('#msgerror').text('* Vui Lòng Nhập Mật Khẩu');
        } else {
            $("#LoadingImage").show();
            $('#msgerror').text('');
            login();
        }
    });
    $('#btn-register').click(function () {
        $("#LoadingImage").show();
        register();
    });
    $('#btn-forgot').click(function () {
        var userNamef = $('#userNamef').val();
        if (userNamef == '') {
            $('#msgerror-f').text("* Vui Lòng Nhập Tên Tài Khoản");
        } else {
            $("#LoadingImage").show();
            forgotpassword();
        }

    });
    $('#btn-forgotpassword').click(function () {
        var passwordfg = $('#passwordfg').val();
        var rppasswordfg = $('#rppasswordfg').val();
        console.log(passwordfg + rppasswordfg)
        if (passwordfg == '') {

            $('#msgerror-fp').text("* Vui Lòng Nhập Mật Khẩu Mới");
        }
        else if (rppasswordfg == '') {

            $('#msgerror-fp').text("* Vui Lòng Nhập Nhập Lại Mật Khẩu Mới");
        }
        else if (passwordfg != rppasswordfg) {
            $('#msgerror-fp').text("* Nhập Lại Mật Khẩu Không Trùng Khớp");
        } else {
            $('#btn-forgotpassword').attr("type", "submit");


        }

    });

    $('#register-form').on('keyup keydown', function () {
        $('#btn-register').prop("disabled", true);
        var userName = $('#userNamer').val();
        var email = $('#emailr').val();
        var password = $('#passwordr').val();
        var rppassword = $('#rppasswordr').val();
        var email_regex = /[A-Z0-9._%+-]+@[A-Z0-9-]+.+.[A-Z]{2,4}/igm;
        console.log(email);
        if (userName == '') {
            $('#msgerror-r').text('* Vui Lòng Nhập UserName');
        } else if (email == '') {
            $('#msgerror-r').text('* Vui Lòng Nhập Email');
        } else if (!email.match(email_regex)) {
            $('#msgerror-r').text('* Vui Lòng Nhập Đúng Email');
        } else if (password == '') {
            $('#msgerror-r').text('* Vui Lòng Nhập Mật Khẩu');
        } else if (rppassword == '') {
            $('#msgerror-r').text('* Vui Lòng Nhập Nhập Lại Mật Khẩu');
        } else if (rppassword != password) {
            $('#msgerror-r').text('* Nhập Lại Mật Khẩu Không Khớp');
        } else {
            $('#btn-register').prop("disabled", false);
            //$("#LoadingImage").show();
            $('#msgerror-r').text('');

        }
    });
</script>

<script type="text/javascript">

    var firstLogin = 0;

    $('#btn-google').click(function () {
        firstLogin = 1;
    });

    function onSignIn(googleUser) {

        // window.location.href='success.jsp';

        // The ID token you need to pass to your backend:
        var id_token = googleUser.getAuthResponse().id_token;
        console.log("id_token: " + id_token);
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
        $(document).ajaxSend(function (e, xhr, options) {
            xhr.setRequestHeader(header, token);

        });
        $.ajax({

            type: "POST",
            contentType: "application/json",
            url: "${pageContext.request.contextPath}/signin-google",
            data: id_token,
            //dataType: 'json',
            // timeout: 600000,
            success: function (result) {
                $("#LoadingImage").hide();
                console.log(result);
                if (firstLogin == 1) {
                    firstLogin = 0;
                    console.log(firstLogin);
                    location.reload();
                }

            },
            error: function (e) {
                alert("Lỗi ! Vui Lòng Kiểm Tra Lại");
            }
        });


    }

</script>

<script>

    function signOut() {
        var auth2 = gapi.auth2.getAuthInstance();
        auth2.signOut().then(function () {
            console.log('User signed out.');
            firstLogin = 0;
            location.reload();
        });
    }

</script>

<script type="text/javascript">
    $(document).ready(function () {
        $("#LoadingImage").show();
    });
    $(window).load(function () {
        // Animate loader off screen
        $("#LoadingImage").hide();
    });

</script>


<script>

    function replysubcomment(subCommentId, usersBySubUserId, usersBySubUserName) {
        console.log(subCommentId + "--" + usersBySubUserId + "-" + usersBySubUserName);

        $('#usersBySubUserId').val(usersBySubUserId);
        $('#subCommentId').val(subCommentId);
        $('#msgsubcomment').text('Bạn Đang Trả Lời ' + usersBySubUserName);
        $('#cancelsubcomment').show();
        $('html, body').animate({
            scrollTop: $(".xemthem").offset().top
        }, 500);
        console.log($('#usersBySubUserId').val() + $('#subCommentId').val());
    };

    $('#cancelsubcomment').click(function () {
        $('#usersBySubUserId').val(0);
        $('#subCommentId').val(0);
        $('#msgsubcomment').text('');
        $('#cancelsubcomment').hide();

    });
    $('.btn-postcomment').click(function () {
        clearTimeout(timeout);
        timeout = setTimeout(function () {
            console.log(123);
            $("#LoadingImage").show();

            var usersBySubUserId = $('#usersBySubUserId').val();
            var subCommentId = $('#subCommentId').val();
            var articleId = $('#articleId').val();
            var content = $('#content').val();
            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");
            $(document).ajaxSend(function (e, xhr, options) {
                xhr.setRequestHeader(header, token);

            });
            $.ajax({

                type: "POST",
                //contentType: "application/json",
                url: "${pageContext.request.contextPath}/comment",
                data: {
                    subCommentId: subCommentId,
                    articleId: articleId,
                    content: content,
                    usersBySubUserId: usersBySubUserId
                },
                //dataType: 'json',
                // timeout: 600000,
                success: function (result) {
                    var html = '';
                    $("#LoadingImage").hide();
                    $('#content').val('');
                    for (var i = 0; i < Object.keys(result.commentparent).length; i++) {
                        if(result.commentparent[i].subCommentId === 0){
                            var childcomment = "";
                            for (var j = 0; j < Object.keys(result.commentchild).length; j++) {
                                if (result.commentchild[j].subCommentId !== 0 && result.commentchild[j].subCommentId === result.commentparent[i].commentId){
                                    var checkuserIdLoginCommentChild = '';
                                    if(result.userIdLogin != result.commentchild[j].usersByUserId ){
                                        checkuserIdLoginCommentChild = " <span class=\"item-meta\"> <a href=\"#\"><i\n" +
                                            "      class=\"fa fa-thumbs-o-up\"></i> Thích</a>\n" +
                                            "       <a class=\"replycomment\"\n" +
                                            "       onclick=\"replysubcomment("+result.commentparent[i].commentId+","+result.commentchild[j].usersByUserId+",'"+result.commentchild[j].usersByUserUserName+"' );\"\n" +
                                            "        href=\"#\"><i\n" +
                                            "       class=\"fa fa-comment-o\"\n" +
                                            "      style=\"margin-left: 25px;\"></i> \n" +
                                            "Bình luận</a>\n" +
                                            "</span> \n" ;
                                    }

                                    childcomment += "<ul class=\"children\">\n" +
                                        "   <li class=\"comment\">\n" +
                                        "    <div class=\"comment-block\">\n" +
                                        "    <a href=\"#\" class=\"image-avatar\"> <img\n" +
                                        "    src=\"" + result.commentchild[j].usersByUserAvatar + "\"\n" +
                                        "    data-ot-retina=\"" + result.commentchild[j].usersByUserAvatar + "\"\n" +
                                        "     alt=\"\"\n" +
                                        "     title=\"\">\n" +
                                        "     </a>\n" +
                                        "     <div class=\"comment-text\">\n" +
                                        "     <span class=\"time-stamp right\">"+result.commentchild[j].modifiedDate+"</span>\n" +
                                        "     <strong\n" +
                                        "     class=\"user-nick\"><a\n" +
                                        "      href=\"#\">"+result.commentchild[j].usersByUserUserName +"</a><span\n" +
                                        "       class=\"user-label\">Admin</span></strong>\n" +
                                        "        <div class=\"shortcode-content\">\n" +
                                        "         <p style=\"color: #ABABAB\">\n" +
                                        "        <a style=\"color: #0c91e5;\"\n" +
                                        "      href=\"\">@"+result.commentchild[j].usersBySubUserUserName +"</a>\n" +
                                        "          "+result.commentchild[j].content +"</p>\n" +
                                        "         </div>\n" +
                                        checkuserIdLoginCommentChild +
                                        " </div>\n" +
                                        " </div>\n" +
                                        "  </li>\n" +
                                        "    </ul>\n" ;
                                }
                            }
                            var checkuserIdLoginCommentParemt = '';
                            if(result.userIdLogin != result.commentparent[i].usersByUserId ){
                                checkuserIdLoginCommentParemt = " <span class=\"item-meta\"> <a href=\"#\"><i\n" +
                                    "    class=\"fa fa-thumbs-o-up\"></i> Thích</a>\n" +
                                    "    <a class=\"replycomment\" href=\"#\"\n" +
                                    "     onclick=\"replysubcomment("+result.commentparent[i].commentId+","+result.commentparent[i].usersByUserId+",'"+result.commentparent[i].usersByUserUserName+"');\">\n" +
                                    "     <i class=\"fa fa-comment-o\" style=\"margin-left: 25px;\"></i> Bình\n" +
                                    "luận</a>\n" +
                                    "</span>\n" ;
                            }
                            html += "  <li class=\"comment\">\n" +
                                " <div class=\"comment-block\">\n" +
                                "  <a href=\"#\" class=\"image-avatar\"> <img\n" +
                                "  src=\"" + result.commentparent[i].usersByUserAvatar + " \" \n" +
                                "   data-ot-retina=\"" + result.commentparent[i].usersByUserAvatar + " \"\n" +
                                "   alt=\"\"\n" +
                                "   title=\"\">\n" +
                                "    </a>\n" +
                                "   <div class=\"comment-text\">\n" +
                                "   <span class=\"time-stamp right\">"+result.commentparent[i].modifiedDate+"</span> <strong\n" +
                                "      class=\"user-nick\"><a\n" +
                                "      href=\"#\"> "+result.commentparent[i].usersByUserUserName +" </a></strong>\n" +
                                "       <div class=\"shortcode-content\">\n" +
                                "      <p>"+result.commentparent[i].content +"</p>\n" +
                                "    </div>\n" +
                                checkuserIdLoginCommentParemt +
                                "   </div>\n" +

                                "  </div>\n" +
                                ""+childcomment+"" +
                                "   </li>\n" ;

                        }

                    }
                    $('#comments').html(html);
                    $('html, body').animate({
                        scrollTop: $(".article-main-next-prev").offset().top
                    }, 500);

                },
                error: function (e) {
                    alert("Lỗi ! Vui Lòng Kiểm Tra Lại");
                }
            });


        }, 1000);

    });

</script>

<script>
    $('#morecomment').click(function () {
        morecomment();
    });
    var page = 0;
    $(document).ready(function () {
        morecomment();
    });
    function morecomment() {

        clearTimeout(timeout);
        timeout = setTimeout(function () {
            $('#morecomment').hide();
            $("#LoadingGifSmall").show();
            $.ajax({

                type: "GET",
                //contentType: "application/json",
                url: "${pageContext.request.contextPath}/getcomment?page=" + page,

                //dataType: 'json',
                // timeout: 600000,
                success: function (result) {
                    var html = '';

                    if(result.userIdLogin != 0 ){
                        for (var i = 0; i < Object.keys(result.commentparent).length; i++) {
                            if(result.commentparent[i].subCommentId === 0){
                                var childcomment = "";
                                for (var j = 0; j < Object.keys(result.commentchild).length; j++) {
                                    if (result.commentchild[j].subCommentId !== 0 && result.commentchild[j].subCommentId === result.commentparent[i].commentId){
                                            var checkuserIdLoginCommentChild = '';
                                            if(result.userIdLogin != result.commentchild[j].usersByUserId ){
                                                checkuserIdLoginCommentChild = " <span class=\"item-meta\"> <a href=\"#\"><i\n" +
                                                    "      class=\"fa fa-thumbs-o-up\"></i> Thích</a>\n" +
                                                    "       <a class=\"replycomment\"\n" +
                                                    "       onclick=\"replysubcomment("+result.commentparent[i].commentId+","+result.commentchild[j].usersByUserId+",'"+result.commentchild[j].usersByUserUserName+"' );\"\n" +
                                                    "        href=\"#\"><i\n" +
                                                    "       class=\"fa fa-comment-o\"\n" +
                                                    "      style=\"margin-left: 25px;\"></i> \n" +
                                                    "Bình luận</a>\n" +
                                                    "</span> \n" ;
                                            }

                                        childcomment += "<ul class=\"children\">\n" +
                                            "   <li class=\"comment\">\n" +
                                            "    <div class=\"comment-block\">\n" +
                                            "    <a href=\"#\" class=\"image-avatar\"> <img\n" +
                                            "    src=\"" + result.commentchild[j].usersByUserAvatar + "\"\n" +
                                            "    data-ot-retina=\"" + result.commentchild[j].usersByUserAvatar + "\"\n" +
                                            "     alt=\"\"\n" +
                                            "     title=\"\">\n" +
                                            "     </a>\n" +
                                            "     <div class=\"comment-text\">\n" +
                                            "     <span class=\"time-stamp right\">"+result.commentchild[j].modifiedDate+"</span>\n" +
                                            "     <strong\n" +
                                            "     class=\"user-nick\"><a\n" +
                                            "      href=\"#\">"+result.commentchild[j].usersByUserUserName +"</a><span\n" +
                                            "       class=\"user-label\">Admin</span></strong>\n" +
                                            "        <div class=\"shortcode-content\">\n" +
                                            "         <p style=\"color: #ABABAB\">\n" +
                                            "        <a style=\"color: #0c91e5;\"\n" +
                                            "      href=\"\">@"+result.commentchild[j].usersBySubUserUserName +"</a>\n" +
                                            "          "+result.commentchild[j].content +"</p>\n" +
                                            "         </div>\n" +
                                            checkuserIdLoginCommentChild +
                                            " </div>\n" +
                                            " </div>\n" +
                                            "  </li>\n" +
                                            "    </ul>\n" ;
                                    }
                                }
                                var checkuserIdLoginCommentParemt = '';
                                if(result.userIdLogin != result.commentparent[i].usersByUserId ){
                                    checkuserIdLoginCommentParemt = " <span class=\"item-meta\"> <a href=\"#\"><i\n" +
                                        "    class=\"fa fa-thumbs-o-up\"></i> Thích</a>\n" +
                                        "    <a class=\"replycomment\" href=\"#\"\n" +
                                        "     onclick=\"replysubcomment("+result.commentparent[i].commentId+","+result.commentparent[i].usersByUserId+",'"+result.commentparent[i].usersByUserUserName+"');\">\n" +
                                        "     <i class=\"fa fa-comment-o\" style=\"margin-left: 25px;\"></i> Bình\n" +
                                        "luận</a>\n" +
                                        "</span>\n" ;
                                }
                                html += "  <li class=\"comment\">\n" +
                                    " <div class=\"comment-block\">\n" +
                                    "  <a href=\"#\" class=\"image-avatar\"> <img\n" +
                                    "  src=\" " + result.commentparent[i].usersByUserAvatar + " \" \n" +
                                    "   data-ot-retina=\"" + result.commentparent[i].usersByUserAvatar + " \"\n" +
                                    "   alt=\"\"\n" +
                                    "   title=\"\">\n" +
                                    "    </a>\n" +
                                    "   <div class=\"comment-text\">\n" +
                                    "   <span class=\"time-stamp right\">"+result.commentparent[i].modifiedDate+"</span> <strong\n" +
                                    "      class=\"user-nick\"><a\n" +
                                    "      href=\"#\"> "+result.commentparent[i].usersByUserUserName +" </a></strong>\n" +
                                    "       <div class=\"shortcode-content\">\n" +
                                    "      <p>"+result.commentparent[i].content +"</p>\n" +
                                    "    </div>\n" +
                                    checkuserIdLoginCommentParemt +
                                    "   </div>\n" +

                                    "  </div>\n" +
                                    ""+childcomment+"" +
                                    "   </li>\n" ;

                            }

                        }

                    } else {
                            for (var i = 0; i < Object.keys(result.commentparent).length; i++) {
                                if(result.commentparent[i].subCommentId === 0){
                                    var childcomment = "";
                                    for (var j = 0; j < Object.keys(result.commentchild).length; j++) {
                                        if (result.commentchild[j].subCommentId !== 0 && result.commentchild[j].subCommentId === result.commentparent[i].commentId){

                                            childcomment += "<ul class=\"children\">\n" +
                                                "   <li class=\"comment\">\n" +
                                                "    <div class=\"comment-block\">\n" +
                                                "    <a href=\"#\" class=\"image-avatar\"> <img\n" +
                                                "    src=\"" + result.commentchild[j].usersByUserAvatar + "\"\n" +
                                                "    data-ot-retina=\"" + result.commentchild[j].usersByUserAvatar + "\"\n" +
                                                "     alt=\"\"\n" +
                                                "     title=\"\">\n" +
                                                "     </a>\n" +
                                                "     <div class=\"comment-text\">\n" +
                                                "     <span class=\"time-stamp right\">"+result.commentchild[j].modifiedDate+"</span>\n" +
                                                "     <strong\n" +
                                                "     class=\"user-nick\"><a\n" +
                                                "      href=\"#\">"+result.commentchild[j].usersByUserUserName +"</a><span\n" +
                                                "       class=\"user-label\">Admin</span></strong>\n" +
                                                "        <div class=\"shortcode-content\">\n" +
                                                "         <p style=\"color: #ABABAB\">\n" +
                                                "        <a style=\"color: #0c91e5;\"\n" +
                                                "      href=\"\">@"+result.commentchild[j].usersBySubUserUserName +"</a>\n" +
                                                "          "+result.commentchild[j].content +"</p>\n" +
                                                "         </div>\n" +
                                                " </div>\n" +
                                                " </div>\n" +
                                                "  </li>\n" +
                                                "    </ul>\n" ;
                                        }
                                    }
                                    html += "  <li class=\"comment\">\n" +
                                        " <div class=\"comment-block\">\n" +
                                        "  <a href=\"#\" class=\"image-avatar\"> <img\n" +
                                        "  src=\"" + result.commentparent[i].usersByUserAvatar + " \" \n" +
                                        "   data-ot-retina=\"" + result.commentparent[i].usersByUserAvatar + " \"\n" +
                                        "   alt=\"\"\n" +
                                        "   title=\"\">\n" +
                                        "    </a>\n" +
                                        "   <div class=\"comment-text\">\n" +
                                        "   <span class=\"time-stamp right\">"+result.commentparent[i].modifiedDate+"</span> <strong\n" +
                                        "      class=\"user-nick\"><a\n" +
                                        "      href=\"#\"> "+result.commentparent[i].usersByUserUserName +" </a></strong>\n" +
                                        "       <div class=\"shortcode-content\">\n" +
                                        "      <p>"+result.commentparent[i].content +"</p>\n" +
                                        "    </div>\n" +
                                        "   </div>\n" +
                                        "  </div>\n" +
                                        ""+childcomment+"" +
                                        "   </li>\n" ;

                                }

                            }

                        }
                    $('#comments').append(html);
                    page = page + 1;
                    if(Object.keys(result.commentparent).length < 10){
                        $('.xemthem').hide();
                    }

                    $("#LoadingGifSmall").hide();
                    $('#morecomment').show();
                },
                error: function (e) {
                    $("#LoadingGifSmall").hide();
                    $('#morecomment').show();
                    alert("Lỗi ! Vui Lòng Kiểm Tra Lại");
                }
            });
        }, 1000);
    };
</script>


