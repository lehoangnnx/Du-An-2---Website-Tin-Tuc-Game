<%@ page pageEncoding="UTF-8" %>
<script>
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


                        if (checknull == false) {
                            $("#LoadingGifSmall").show();
                            $.ajax({
                                type: 'GET',
                                contentType: "application/json",
                                url: '${pageContext.request.contextPath}/getarticle?page=' + page,

                                success: function (result) {
                                    if (result !== '') {
                                        console.log(result + "Rssult");
                                        var n = Object.keys(result).length;
                                        var html = '';

                                        for (var i = 0; i < n; i++) {
                                            var articleCategory = "";
                                            for (var j = 0; j < Object.keys(result[i].articleCategories).length; j++) {
                                                articleCategory += "<a style=\"padding-right: 7px;\" href=\" ${pageContext.request.contextPath}/" + result[i].articleCategories[j].slug + " \"> " + result[i].articleCategories[j].name + " </a>";
                                            }

                                            html += "<div class=\"item\">"

                                                + "<div class=\"item-header hover14 column\">\n"
                                                + "<a href=\"${pageContext.request.contextPath}/" + result[i].slug + " \"> <span class=\"comment-tag\"><i\n "
                                                + "class=\"fa fa-comment-o\"></i>" + result[i].views + "<i></i></span> <span\n"
                                                + "class=\"read-more-wrapper\"><span class=\"read-more\">Xem chi tiết<i></i>\n"
                                                + "</span></span> <figure><img title=\"" + result[i].title + "\" src=\"${pageContext.request.contextPath}/images/articles/" + result[i].imagesThumbnail + " \" alt=\"\" /></figure>\n"
                                                + "</a></div>\n"
                                                + "<div class=\"item-content\">\n"
                                                + "<strong class=\"category-link\">\n"

                                                + " " + articleCategory + "\n"
                                                + "</strong>\n"
                                                + "<h3>\n"
                                                + "<a title=\"" + result[i].title + "\" href=\" ${pageContext.request.contextPath}/" + result[i].slug + "\">" + result[i].title + "</a>\n"
                                                + "</h3>\n"
                                                + "<span class=\"item-meta\">\n" +
                                                "<a style=\"font-weight: bold;\" href=\" ${pageContext.request.contextPath}/" + result[i].slug + "\"><i\n" +
                                                "class=\"fa fa-user\"></i>" + result[i].user + "</a>\n" +
                                                "<a href=\"" + ${pageContext.request.contextPath} +"/" + result[i].slug + "\"><i\n" +
                                                "class=\"fa fa-comment-o\"></i>82 Bình luận</a> <a href=\" ${pageContext.request.contextPath}/" + result[i].slug + "\"><i\n" +
                                                "class=\"fa fa-clock-o\"></i>" + result[i].showDate + "</a>\n" +
                                                "</span>\n" +
                                                "<p>" + result[i].subContent + "</p>\n" +
                                                "</div></div>"

                                        }

                                        $('#posts').append(html);
                                        page = page + 1;
                                        $("#LoadingGifSmall").hide();
                                    } else {
                                        checknull = true;
                                        var xemthem = "<a class=\"page-numbers col-md-12 \" href=\"${pageContext.request.contextPath}/articles?sorted=news \">Xem Thêm</a>";
                                        $('#xemthem').html(xemthem);
                                        $("#LoadingGifSmall").hide();
                                    }
                                }
                            });
                        }
                    }, 500);
            }
        }
    });

</script>

