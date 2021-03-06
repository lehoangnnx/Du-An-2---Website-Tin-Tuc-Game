<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="security"
           uri="http://www.springframework.org/security/tags" %>
<style>
    ul.gallery {
        margin-left: 3vw;
        margin-right: 3vw;
    }

    .zoom {
        -webkit-transition: all 0.35s ease-in-out;
        -moz-transition: all 0.35s ease-in-out;
        transition: all 0.35s ease-in-out;
        cursor: -webkit-zoom-in;
        cursor: -moz-zoom-in;
        cursor: zoom-in;
    }

    .zoom:hover,
    .zoom:active,
    .zoom:focus {
        /**adjust scale to desired size,
        add browser prefixes**/
        -ms-transform: scale(4);
        -moz-transform: scale(4);
        -webkit-transform: scale(4);
        -o-transform: scale(4);
        transform: scale(4);
        position: relative;
        z-index: 100;
    }

    /**To keep upscaled images visible on mobile,
    increase left & right margins a bit**/
    @media only screen and (max-width: 768px) {
        ul.gallery {
            margin-left: 15vw;
            margin-right: 15vw;
        }

        /**TIP: Easy escape for touch screens,
        give gallery's parent container a cursor: pointer.**/
        .DivName {
            cursor: pointer
        }
    }

</style>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<input hidden="" id="msg" value="${msg }"></input>
<div class="content-area py-1">
    <div class="container-fluid">
        <h4>Game</h4>

        <ol class="breadcrumb no-bg mb-1">
            <li class="breadcrumb-item"><a
                    href="${contextPath }/admin/index">Trang Chủ</a></li>
            <li class="breadcrumb-item active">Danh Sách Games</li>
        </ol>
        <div class="tab">
            <a href="${contextPath }/admin/games?status=active">
                <button class="tablinks ${param.status == 'active' ? 'active' : '' }">
                    Đã Kích Hoạt
                </button>
            </a>
            <a href="${contextPath }/admin/games?status=inactive">
                <button class="tablinks ${param.status == 'inactive' ? 'active' : '' }">Chưa Kích Hoạt</button>
            </a>
            <a href="${contextPath }/admin/games?status=draft">
                <button class="tablinks ${param.status == 'draft' ? 'active' : '' }">Bản Nháp</button>
            </a>
            <a href="${contextPath }/admin/games?status=deleted">
                <button class="tablinks ${param.status == 'deleted' ? 'active' : '' }">Đã Xóa</button>
            </a>

        </div>

        <div id="showAllUsers" class="tabcontent" style="display: block;">
            <div class="box box-block bg-white">
                <h5 class="mb-1">Danh Sách Games</h5>

                <div class="overflow-x-auto">

                    <div id="jqcc">
                        <table class="table table-striped table-bordered dataTable"
                               id="table-3">
                            <thead>
                            <tr>
                                <security:authorize access="hasRole('ADMIN')">
                                    <th id="thcb" class="cbDeleteAll"><input type="checkbox"
                                                                             id="allcb" name="cb"/></th>
                                </security:authorize>
                                <th>Tên</th>
                                <th>Đường Dẫn</th>
                                <th>Trạng Thái</th>
                                <th class="add"><a href="${contextPath}/admin/games/addgames"><i
                                        style="color: green;" class="fa fa-plus fa-2x" title="Thêm"></i></a></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="gl" items="${gameList}">
                                <tr>
                                    <security:authorize access="hasRole('ADMIN')">
                                        <td class="cbDeleteAll"><input type="checkbox"
                                                                       value="${gl.gameId}" name="cb"/></td>
                                    </security:authorize>
                                    <td>${gl.name} </td>
                                    <td>${gl.slug} </td>
                                    <td>${gl.status} </td>

                                    <td class="updateAndDelete"><a
                                            href="${contextPath }/admin/games/${gl.gameId}"><i
                                            style="color: blue;" class="fa fa-pencil fa-lg"
                                            aria-hidden="true" title="Sửa"></i></a>
                                        <security:authorize access="hasRole('ADMIN')">
                                            <a onclick="deleteOne(${gl.gameId});" href="#"
                                               data-toggle="modal" data-target="#myModal"
                                               style="color: red; margin-left: 10px;"> <i
                                                    class="fa fa-trash-o fa-lg" aria-hidden="true" title="Xóa"></i>
                                            </a>
                                        </security:authorize></td>
                                </tr>
                            </c:forEach>


                            </tbody>
                            <tfoot>
                            <tr>
                                <security:authorize access="hasRole('ADMIN')">
                                    <td>
                                        <div style="text-align: center;">
                                            <button onclick="deleteAll();" data-toggle="modal"
                                                    data-target="#myModal" class="btn btn-danger">Xóa
                                                Nhiều
                                            </button>
                                        </div>
                                    </td>
                                </security:authorize>

                                <th>Tên</th>
                                <th>Đường Dẫn</th>
                                <th>Trạng Thái</th>

                                <td></td>
                            </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>


    </div>
</div>

<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 style="text-align: center; font-weight: bold; color: red;"
                    class="modal-title">Bạn Muốn Xóa ?</h4>
            </div>

            <div class="modal-footer">
                <form:form action="" method="delete">
                    <input type="hidden" name="${_csrf.parameterName}"
                           value="${_csrf.token}"/>
                    <input value="" id="arrayId" hidden="" name="arrayId"/>
                    <button class="btn btn-danger" style="float: left;">Xóa</button>
                </form:form>


                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>

    </div>
</div>


