<%--
  Created by IntelliJ IDEA.
  User: nhung
  Date: 10/11/2017
  Time: 07:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8"%>
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

                            <form action="#" class="comment-form">

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
                                            <input type="password" placeholder="Mật Khẩu Mới" name="newpassword" value="">
                                        </label>
                                    </p>
                                    <p class="contact-form-email">
                                        <label class="label-input">
                                            <span>Nhập Lại Mật Khẩu Mới<i class="required">*</i></span>
                                            <input type="password" placeholder="Nhập Lại Mật Khẩu Mới" name="rpnewpassword" value="">
                                        </label>
                                    </p>
                                    <p class="form-submit">
                                        <input name="submit" type="submit" id="submit" class="submit button pull-right" value="Thay Đổi">
                                    </p>
                                </div>
                                </div>
                            </form>

                        </div>


                    <!-- END .content-panel -->
                </div>

                <!-- END .content-block-single -->
            </div>


            <!-- BEGIN .sidebar -->


        </div>


        <!-- END .wrapper -->


    <!-- BEGIN .content -->
</section>