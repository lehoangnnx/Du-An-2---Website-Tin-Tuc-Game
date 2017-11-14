<%--
  Created by IntelliJ IDEA.
  User: nhung
  Date: 10/11/2017
  Time: 07:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<section class="content">

    <!-- BEGIN .wrapper -->
    <div class="wrapper">

        <div class="content-block has-sidebar">

            <!-- BEGIN .content-block-single -->


                <!-- BEGIN .content-panel -->


                <!-- BEGIN .content-panel -->
                <div class="content-panel" id="writecomment">
                    <%--<div class="content-panel-title">
                        <a href="${contextPath}/" class="right">Quay Lại Trang Chủ</a>
                        <h2>Lấy Lại Mật Khẩu</h2>
                    </div>--%>

                        <div id="respond" class="comment-respond">

                            <form:form action="${contextPath}/forgotpassword" method="post" class="comment-form">
                                <input hidden value="${key}" name="key" />
                                <div class="alert-message alert-green text-center">
                                    <strong>Nhập Mật Khẩu Mới Cho Tài Khoản Của Bạn</strong>
                                </div>
                                <!-- <div class="alert-message alert-red">
                                    <strong>Error! This an error message</strong>
                                </div>
                                <div class="alert-message">
                                    <strong>Warning! This a warning message</strong>
                                </div> -->
                                <div class="col-md-6 col-md-push-3">
                                <div class="contact-form-content">
                                    <p class="contact-form-user">
                                        <label class="label-input">
                                            <span>Mật Khẩu Mới<i class="required">*</i></span>
                                            <input type="password" placeholder="Mật Khẩu Mới" id="passwordfg" name="passwordfg" />
                                        </label>
                                    </p>
                                    <p class="contact-form-email">
                                        <label class="label-input">
                                            <span>Nhập Lại Mật Khẩu Mới<i class="required">*</i></span>
                                            <input type="password" placeholder="Nhập Lại Mật Khẩu Mới" name="rppasswordfg"
                                                   id="rppasswordfg" />
                                        </label>
                                    </p>
                                    <label id="msgerror-fp" class="msgerror"></label> <br/>
                                    <p class="form-submit">
                                        <button  name="submit" type="button" id="btn-forgotpassword" class="submit button pull-right">Thay Đổi</button>

                                    </p>
                                </div>
                                </div>
                            </form:form>

                        </div>


                    <!-- END .content-panel -->
                </div>

                <!-- END .content-block-single -->
            </div>


            <!-- BEGIN .sidebar -->


        </div>

</section>