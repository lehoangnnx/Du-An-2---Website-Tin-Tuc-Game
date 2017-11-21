<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<script type="text/javascript"
        src="${contextPath}/js/js/jquery-latest.min.js"></script>
<%--<script type="text/javascript" src="${contextPath}/js/js/jquery.js"></script>--%>
<script type="text/javascript"
        src="${contextPath}/js/js/bootstrap.min.js"></script>

<script type="text/javascript"
        src="${contextPath}/js/js/smoothscroll.js"></script>


<script src="${contextPath}/js/sliderengine/amazingslider.js"></script>
<script src="${contextPath}/js/sliderengine/initslider-1.js"></script>

<script src='${contextPath}/js/js/jquery.leanModal.min_.js'></script>

<script src='${contextPath}/js/js/rvslider.js'></script>

<script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>
<script src='https://www.google.com/recaptcha/api.js'></script>

<script src="${contextPath}/js/js/classie-search.js"></script>


<script>


</script>
<script>
    jQuery(function($){
        $('.rvs-container').rvslider();
    });
</script>
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


<%--Xóa sửa bình luận--%>
<script>
    function myFunction(commentId) {
        document.getElementById("myDropdown"+commentId).classList.toggle("show");
    }

    // Close the dropdown if the user clicks outside of it
    window.onclick = function(event) {
        if (!event.target.matches('.dropbtn')) {

            var dropdowns = document.getElementsByClassName("dropdown-content");
            var i;
            for (i = 0; i < dropdowns.length; i++) {
                var openDropdown = dropdowns[i];
                if (openDropdown.classList.contains('show')) {
                    openDropdown.classList.remove('show');
                }
            }
        }
    }
</script>
<%--Banner video mới--%>
<script>
    $(document).ready(function(ev){
        $('#custom_carousel').on('slide.bs.carousel', function (evt) {
            $('#custom_carousel .controls li.active').removeClass('active');
            $('#custom_carousel .controls li:eq('+$(evt.relatedTarget).index()+')').addClass('active');
        })
    });
</script>
<script>
    $(document).ready(function() {
        var $btnSets = $('#responsive'),
            $btnLinks = $btnSets.find('a');

        $btnLinks.click(function(e) {
            e.preventDefault();
            $(this).siblings('a.active').removeClass("active");
            $(this).addClass("active");
            var index = $(this).index();
            $("div.user-menu>div.user-menu-content").removeClass("active");
            $("div.user-menu>div.user-menu-content").eq(index).addClass("active");
        });
    });

    $( document ).ready(function() {
        $("[rel='tooltip']").tooltip();

        $('.view').hover(
            function(){
                $(this).find('.caption').slideDown(250); //.fadeIn(250)
            },
            function(){
                $(this).find('.caption').slideUp(250); //.fadeOut(205)
            }
        );
    });
</script>
<script>
    // Starrr plugin (https://github.com/dobtco/starrr)
    var __slice = [].slice;

    (function($, window) {
        var Starrr;

        Starrr = (function() {
            Starrr.prototype.defaults = {
                rating: void 0,
                numStars: 5,
                change: function(e, value) {}
            };

            function Starrr($el, options) {
                var i, _, _ref,
                    _this = this;

                this.options = $.extend({}, this.defaults, options);
                this.$el = $el;
                _ref = this.defaults;
                for (i in _ref) {
                    _ = _ref[i];
                    if (this.$el.data(i) != null) {
                        this.options[i] = this.$el.data(i);
                    }
                }
                this.createStars();
                this.syncRating();
                this.$el.on('mouseover.starrr', 'span', function(e) {
                    return _this.syncRating(_this.$el.find('span').index(e.currentTarget) + 1);
                });
                this.$el.on('mouseout.starrr', function() {
                    return _this.syncRating();
                });
                this.$el.on('click.starrr', 'span', function(e) {
                    return _this.setRating(_this.$el.find('span').index(e.currentTarget) + 1);
                });
                this.$el.on('starrr:change', this.options.change);
            }

            Starrr.prototype.createStars = function() {
                var _i, _ref, _results;

                _results = [];
                for (_i = 1, _ref = this.options.numStars; 1 <= _ref ? _i <= _ref : _i >= _ref; 1 <= _ref ? _i++ : _i--) {
                    _results.push(this.$el.append("<span class='glyphicon .glyphicon-star-empty'></span>"));
                }
                return _results;
            };

            Starrr.prototype.setRating = function(rating) {
                if (this.options.rating === rating) {
                    rating = void 0;
                }
                this.options.rating = rating;
                this.syncRating();
                return this.$el.trigger('starrr:change', rating);
            };

            Starrr.prototype.syncRating = function(rating) {
                var i, _i, _j, _ref;

                rating || (rating = this.options.rating);
                if (rating) {
                    for (i = _i = 0, _ref = rating - 1; 0 <= _ref ? _i <= _ref : _i >= _ref; i = 0 <= _ref ? ++_i : --_i) {
                        this.$el.find('span').eq(i).removeClass('glyphicon-star-empty').addClass('glyphicon-star');
                    }
                }
                if (rating && rating < 5) {
                    for (i = _j = rating; rating <= 4 ? _j <= 4 : _j >= 4; i = rating <= 4 ? ++_j : --_j) {
                        this.$el.find('span').eq(i).removeClass('glyphicon-star').addClass('glyphicon-star-empty');
                    }
                }
                if (!rating) {
                    return this.$el.find('span').removeClass('glyphicon-star').addClass('glyphicon-star-empty');
                }
            };

            return Starrr;

        })();
        return $.fn.extend({
            starrr: function() {
                var args, option;

                option = arguments[0], args = 2 <= arguments.length ? __slice.call(arguments, 1) : [];
                return this.each(function() {
                    var data;

                    data = $(this).data('star-rating');
                    if (!data) {
                        $(this).data('star-rating', (data = new Starrr($(this), option)));
                    }
                    if (typeof option === 'string') {
                        return data[option].apply(data, args);
                    }
                });
            }
        });
    })(window.jQuery, window);

    $(function() {
        return $(".starrr").starrr();
    });

    $( document ).ready(function() {

        var correspondence=["","Game rất tệ","Game không hay","Game chơi được","Game hay","Game tuyệt vời"];

        $('.ratable').on('starrr:change', function(e, value){

            $(this).closest('.evaluation').children('#count').html(value);
            $(this).closest('.evaluation').children('#meaning').html(correspondence[value]);

            var currentval=  $(this).closest('.evaluation').children('#count').html();

            var target=  $(this).closest('.evaluation').children('.indicators');
            target.css("color","black");
            target.children('.rateval').val(currentval);
            target.children('#textwr').html(' ');


            if(value<3){
                target.css("color","red").show();
                target.children('#textwr').text('Vote cao tao cho chịch >.<');
            }else{
                if(value>3){
                    target.css("color","green").show();
                    target.children('#textwr').html('I love you chịch chịch <3');
                }else{
                    target.hide();
                }
            }

        });





        $('#hearts-existing').on('starrr:change', function(e, value){
            $('#count-existing').html(value);
        });
    });





    $(function () {
        $('.button-checkbox').each(function () {

            // Settings
            var $widget = $(this),
                $button = $widget.find('button'),
                $checkbox = $widget.find('input:checkbox'),
                color = $button.data('color'),
                settings = {
                    on: {
                        icon: 'glyphicon glyphicon-check'
                    },
                    off: {
                        icon: 'fa fa-square-o'
                    }
                };

            // Event Handlers
            $button.on('click', function () {
                $checkbox.prop('checked', !$checkbox.is(':checked'));
                $checkbox.triggerHandler('change');
                updateDisplay();
            });
            $checkbox.on('change', function () {
                updateDisplay();
            });

            // Actions
            function updateDisplay() {
                var isChecked = $checkbox.is(':checked');

                // Set the button's state
                $button.data('state', (isChecked) ? "on" : "off");

                // Set the button's icon
                $button.find('.state-icon')
                    .removeClass()
                    .addClass('state-icon ' + settings[$button.data('state')].icon);

                // Update the button's color
                if (isChecked) {
                    $button
                        .removeClass('btn-default')
                        .addClass('btn-' + color + ' active');
                }
                else {
                    $button
                        .removeClass('btn-' + color + ' active')
                        .addClass('btn-default');
                }
            }

            // Initialization
            function init() {

                updateDisplay();

                // Inject the icon if applicable
                if ($button.find('.state-icon').length == 0) {
                    $button.prepend('<i class="state-icon ' + settings[$button.data('state')].icon + '"></i> ');
                }
            }
            init();
        });
    });

</script>

<script>
    // Mở Load Gif Trang
    $(document).ready(function () {
        $("#LoadingImage").show();
    });
    $(window).load(function () {
        // Animate loader off screen
        $("#LoadingImage").hide();
    });
    // Đóng Lòa Gif Trang

    // Mở Captcha
    function recaptchaCallback() {

        $('#btn-forgot').removeAttr('disabled');
    };
    // Đóng Captcha

    // Mở Quay Lại Top
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
    // Đóng Quay Lại Top

    // Mở Tìm Kiếm
    (function() {
        var morphSearch = document.getElementById( 'morphsearch' ),
            input = morphSearch.querySelector( 'input.morphsearch-input' ),
            ctrlClose = morphSearch.querySelector( 'span.morphsearch-close' ),
            isOpen = isAnimating = false,
            // show/hide search area
            toggleSearch = function(evt) {

                // return if open and the input gets focused
                if( evt.type.toLowerCase() === 'focus' && isOpen )  return false;

                var offsets = morphsearch.getBoundingClientRect();
                if( isOpen ) {
                    $('#morphsearch').removeAttr("style");
                    classie.remove( morphSearch, 'open' );

                    // trick to hide input text once the search overlay closes
                    // todo: hardcoded times, should be done after transition ends
                    if( input.value !== '' ) {
                        setTimeout(function() {
                            classie.add( morphSearch, 'hideInput' );
                            setTimeout(function() {
                                classie.remove( morphSearch, 'hideInput' );
                                input.value = '';
                            }, 300 );
                        }, 500);
                    }

                    input.blur();
                }
                else {
                    $('#morphsearch').css("position", "fixed");
                    classie.add( morphSearch, 'open' );
                }
                isOpen = !isOpen;
            };

        // events
        input.addEventListener( 'focus', toggleSearch );
        ctrlClose.addEventListener( 'click', toggleSearch );
        // esc key closes search overlay
        // keyboard navigation events
        document.addEventListener( 'keydown', function( ev ) {

            var keyCode = ev.keyCode || ev.which;
            if( keyCode === 27 && isOpen ) {
                toggleSearch(ev);

            }
        } );

        /***** for demo purposes only: don't allow to submit the form *****/
        morphSearch.querySelector( 'button[type="submit"]' ).addEventListener( 'click', function(ev) { ev.preventDefault(); } );
    })();

    $('#inputsearch').keypress(function (e) {
        if (e.which == 13) {
            $('#formsearch').submit();
            return false;
        }
    });
    $('#btnsearch').click(function (){
        $('#formsearch').submit();
        return false;
    });

    // Đóng Tìm Kiếm

    // Form Đăng Nhập
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

    // Đóng Form Đăng Nhập

    // Mở Xử Lý Đăng Nhập , Đăng Ký, Quên Mật Khẩu Bằng Ajax
    var timeout = null;
    // Mở Đăng Nhập Bằng Ajax
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
    // Đóng Đăng Nhập Bằng Ajax

    // Mở Đăng Ký Bằng Ajax
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
    // Đóng Đăng Ký Bằng Ajax

    // Mở Quên Mật Khẩu Bằng Ajax
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

                        grecaptcha.reset();

                        console.log(result);
                        if (result == 'error') {
                            $('#msgerror-f').text("* Tài Khoản Không Tồn Tại");
                        } else {
                            $('#msgerror-f').text(result);
                        }
                        var v = grecaptcha.getResponse();
                        if(v.length == 0)
                        {
                            $('#btn-forgot').attr('disabled', 'disabled');
                        }
                        $("#LoadingImage").hide();

                    },
                    error: function (e) {
                        alert("Lỗi ! Vui Lòng Kiểm Tra Lại");
                    }
                });
        }, 1000);
    };
    // Đóng Quên Mật Khẩu Bằng Ajax
    // Đóng Xử Lý Đăng Nhập , Đăng Ký, Quên Mật Khẩu Bằng Ajax

    // Mở Validate Form Đăng Nhập, Đăng Ký, Quên Mật Khẩu
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
        var regularExpression = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,16}$/;
        console.log(email);
        if (userName == '') {
            $('#msgerror-r').text('* Vui Lòng Nhập UserName');
        }else if(userName.length < 6){
            $('#msgerror-r').text('* Tên Đăng Nhập Phải Lớn Hơn 6 Ký Tự');
        } else if (email == '') {
            $('#msgerror-r').text('* Vui Lòng Nhập Email');
        } else if (!email.match(email_regex)) {
            $('#msgerror-r').text('* Vui Lòng Nhập Đúng Email');
        } else if (password == '') {
            $('#msgerror-r').text('* Vui Lòng Nhập Mật Khẩu');
        } else if(!password.match(regularExpression)){
            $('#msgerror-r').text('* Mật Khẩu Từ 6 -16 Ký Tự Bao Gồm Chữ, Số Và Ký Tự Đặc Biệt');
        }
        else if (rppassword == '') {
            $('#msgerror-r').text('* Vui Lòng Nhập Nhập Lại Mật Khẩu');
        } else if (rppassword != password) {
            $('#msgerror-r').text('* Nhập Lại Mật Khẩu Không Khớp');
        } else {
            $('#btn-register').prop("disabled", false);
            //$("#LoadingImage").show();
            $('#msgerror-r').text('');

        }
    });
    // Đóng Validate Form Đăng Nhập, Đăng Ký, Quên Mật Khẩu

    // Mở Đăng Nhập Bằng Google
    var firstLogin = 0;

    $('#btn-google').click(function () {
        firstLogin = 1;
    });

    function onSignIn(googleUser) {

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
                    location.reload();
                }
            },
            error: function (e) {
                alert("Lỗi ! Vui Lòng Kiểm Tra Lại");
            }
        });

    }
    // ĐÓng Đăng Nhập Bằng Google

    // Mở Đăng Xuất Bằng Google

    function signOut() {
        firstLogin = 0;
        var auth2 = gapi.auth2.getAuthInstance();
        auth2.signOut().then(function () {
            console.log('User signed out.');

            location.reload();
        });
    }
    // ĐÓng Đăng Xuất Bằng Google

</script>