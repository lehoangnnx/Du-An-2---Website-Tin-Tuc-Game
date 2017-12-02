$(document).ready(function () {
    var timeout1 = null;
    var page = 2;
    var checknull = false;
    $(window).scroll(function () {
        var hT = $('#xemthem').offset().top,
            hH = $('#xemthem').outerHeight(),
            wH = $(window).height(),
            wS = $(this).scrollTop();


        if (wS > (hT + hH - wH) && (hT > wS) && (wS + wH > hT + hH)) {
            {
                clearTimeout(timeout1);
                timeout1 = setTimeout(
                    function () {
                        if (page < 4) {
                            $("#LoadingGifSmall").show();
                            $('#_xemthem').hide();
                            $.ajax({
                                type: 'GET',
                                contentType: "application/json",
                                url: contextPath+'/getarticle?page=' + page,
                                success: function (result) {
                                        var n = Object.keys(result).length;
                                        var html = '';

                                        for (var i = 0; i < n; i++) {
                                            var articleCategory = "";
                                            for (var j = 0; j < Object.keys(result[i].articleCategories).length; j++) {
                                                articleCategory += "<a style=\"padding-right: 7px;\" href=\""+contextPath+"/" + result[i].articleCategories[j].slug + ".html \"> " + result[i].articleCategories[j].name + " </a>";
                                            }

                                            html += "<div class=\"item\">"

                                                + "<div class=\"item-header hover14 column\">\n"
                                                + "<a href=\""+contextPath+"/" + result[i].slug + ".html \"> <span class=\"comment-tag\"><i\n "
                                                + "class=\"fa fa-comment-o\"></i>" + result[i].views + "<i></i></span> <span\n"
                                                + "class=\"read-more-wrapper\"><span class=\"read-more\">Xem chi tiết<i></i>\n"
                                                + "</span></span> <figure><img style=\"height: 200px;\" title=\"" + result[i].title + "\" src=\""+contextPath+"/images/articles/" + result[i].imagesThumbnail + " \" alt=\"\" /></figure>\n"
                                                + "</a></div>\n"
                                                + "<div class=\"item-content\">\n"
                                                + "<strong class=\"category-link\">\n"
                                                + " " + articleCategory + "\n"
                                                + "</strong>\n"
                                                + "<h3>\n"
                                                + "<a title=\"" + result[i].title + "\" href=\""+contextPath+"/" + result[i].slug + ".html\">" + result[i].title + "</a>\n"
                                                + "</h3>\n"
                                                + "<span class=\"item-meta\">\n" +
                                                "<a style=\"font-weight: bold;\" href=\""+contextPath+"/" + result[i].slug + ".html\"><i\n" +
                                                "class=\"fa fa-user\"></i>" + result[i].user + "</a>\n" +
                                                "<a href=\""+contextPath+"/" + result[i].slug + "\"><i\n" +
                                                "class=\"fa fa-comment-o\"></i>"+result[i].countComment+" Bình luận</a> <a href=\""+console+"/" + result[i].slug + ".html\"><i\n" +
                                                "class=\"fa fa-clock-o\"></i>" + result[i].showDate + "</a>\n" +
                                                "</span>\n" +
                                                "<p>" + result[i].subContent + "</p>\n" +
                                                "</div></div>"

                                        }

                                        $('#posts').append(html);
                                        page = page + 1;
                                        $('#_xemthem').show();
                                        $("#LoadingGifSmall").hide();
                                    }
                            });
                        }
                    }, 200);
            }
        }
    });
    $('#_xemthem').click(function () {
        clearTimeout(timeout1);
        timeout1 = setTimeout(
            function () {

                    $("#LoadingGifSmall").show();
                    $('#_xemthem').hide();
                    $.ajax({
                        type: 'GET',
                        contentType: "application/json",
                        url: contextPath+'/getarticle?page=' + page,
                        success: function (result) {
                            if (result !== '') {
                                console.log(result + "Rssult");
                                var n = Object.keys(result).length;
                                var html = '';

                                for (var i = 0; i < n; i++) {
                                    var articleCategory = "";
                                    for (var j = 0; j < Object.keys(result[i].articleCategories).length; j++) {
                                        articleCategory += "<a style=\"padding-right: 7px;\" href=\""+contextPath+"/" + result[i].articleCategories[j].slug + ".html \"> " + result[i].articleCategories[j].name + " </a>";
                                    }

                                    html += "<div class=\"item\">"

                                        + "<div class=\"item-header hover14 column\">\n"
                                        + "<a href=\""+contextPath+"/" + result[i].slug + ".html \"> <span class=\"comment-tag\"><i\n "
                                        + "class=\"fa fa-comment-o\"></i>" + result[i].views + "<i></i></span> <span\n"
                                        + "class=\"read-more-wrapper\"><span class=\"read-more\">Xem chi tiết<i></i>\n"
                                        + "</span></span> <figure><img style=\"height: 200px;\" title=\"" + result[i].title + "\" src=\""+contextPath+"/images/articles/" + result[i].imagesThumbnail + " \" alt=\"\" /></figure>\n"
                                        + "</a></div>\n"
                                        + "<div class=\"item-content\">\n"
                                        + "<strong class=\"category-link\">\n"
                                        + " " + articleCategory + "\n"
                                        + "</strong>\n"
                                        + "<h3>\n"
                                        + "<a title=\"" + result[i].title + "\" href=\""+contextPath+"/" + result[i].slug + ".html\">" + result[i].title + "</a>\n"
                                        + "</h3>\n"
                                        + "<span class=\"item-meta\">\n" +
                                        "<a style=\"font-weight: bold;\" href=\""+contextPath+"/" + result[i].slug + ".html\"><i\n" +
                                        "class=\"fa fa-user\"></i>" + result[i].user + "</a>\n" +
                                        "<a href=\""+contextPath+"/" + result[i].slug + "\"><i\n" +
                                        "class=\"fa fa-comment-o\"></i>"+result[i].countComment+" Bình luận</a> <a href=\""+console+"/" + result[i].slug + ".html\"><i\n" +
                                        "class=\"fa fa-clock-o\"></i>" + result[i].showDate + "</a>\n" +
                                        "</span>\n" +
                                        "<p>" + result[i].subContent + "</p>\n" +
                                        "</div></div>"

                                }
                                if (Object.keys(result).length < 10) {
                                    $('#_xemthem').hide();
                                }
                                $('#posts').append(html);
                                page = page + 1;
                                $('#_xemthem').show();
                                $("#LoadingGifSmall").hide();
                            }
                        }
                    });

            }, 200);
    });
});


