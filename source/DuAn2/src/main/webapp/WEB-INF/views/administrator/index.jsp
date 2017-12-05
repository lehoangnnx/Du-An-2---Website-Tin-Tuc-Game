<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<div class="content-area py-1">
    <div class="container-fluid">
        <div class="row row-md">
            <div class="col-lg-3 col-md-6 col-xs-12">
                <div class="box box-block bg-white tile tile-1 mb-2">
                    <div class="t-icon right"><span class="bg-danger"></span><i class="ti-shopping-cart-full"></i></div>
                    <div class="t-content">
                        <h6 class="text-uppercase mb-1">Bài Viết</h6>
                        <h1 class="mb-1">${articleList}</h1>

                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-xs-12">
                <div class="box box-block bg-white tile tile-1 mb-2">
                    <div class="t-icon right"><span class="bg-success"></span><i class="ti-bar-chart"></i></div>
                    <div class="t-content">
                        <h6 class="text-uppercase mb-1">Game</h6>
                        <h1 class="mb-1">${gamesList}</h1>

                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-xs-12">
                <div class="box box-block bg-white tile tile-1 mb-2">
                    <div class="t-icon right"><span class="bg-primary"></span><i class="ti-package"></i></div>
                    <div class="t-content">
                        <h6 class="text-uppercase mb-1">Thành Viên</h6>
                        <h1 class="mb-1">${usersServiceList}</h1>

                    </div>
                </div>
            </div>

        </div>




    </div>

</div>