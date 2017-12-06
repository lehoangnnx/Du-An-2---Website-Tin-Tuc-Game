<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<style>
._error , .error {
	color: red;
}
</style>
<div class="container-fluid">
   <h4>Người Dùng</h4>
   <ol class="breadcrumb no-bg mb-1">
      <li class="breadcrumb-item"><a href="${contextPath}/admin/index">Trang Chủ</a></li>
      <li class="breadcrumb-item"><a href="forms-material.html#">Sửa Người Dùng</a></li>

   </ol>
   <div class="box box-block bg-white">
      <h5>Sửa Người Dùng</h5>
      <form:form  action="${contextPath }/admin/users" method="patch" id="formUser"
         enctype="multipart/form-data" >

         <input hidden value="${user.userId}" id="userId" name="userId" />
         <div class="form-group row">
            <label class="col-md-2 col-form-label">User Name<span class="error"> *</span></label>
            <div class="col-md-10">
               <input type="text" readonly="readonly" id="userName"
                  class="form-control" name="userName" value="${user.userName }"
                  placeholder="Disabled input">
            </div>
         </div>

         <div id="divEmail" class="form-group row">
            <label class="col-md-2 col-form-label" for="email">Email<span class="error"> *</span></label>
            <div class="col-md-10">
               <input type="email" class="form-control " maxlength="255"
                  value="${user.email }" name="email" id="email">
               <label id="email-error" class="_error" for="email"></label>
            </div>
         </div>
         <div class="form-group  row">
            <label class="col-md-2 col-form-label" for="firstName">Họ</label>
            <div class="col-md-10">
               <input type="text" class="form-control " maxlength="255"
                  value="${user.firstName }" name="firstName" id="firstName">
                <label id="firstName-error" class="_error" for="firstName"></label>

            </div>
         </div>
         <div class="form-group  row">
            <label class="col-md-2 col-form-label" for="lastName">Tên</label>
            <div class="col-md-10">
               <input type="text" class="form-control " maxlength="255"
                  value="${user.lastName }" name="lastName" id="lastName">
                   <label id="lastName-error" class="_error" for="lastName"></label>
            </div>
         </div>
         <div class="form-group  row">
            <label class="col-md-2 col-form-label" for="phoneNumber">Số Điện
            Thoại</label>
            <div class="col-md-10">
               <input type="text" class="form-control " maxlength="15"
                  value="${user.phoneNumber }" name="phoneNumber" id="phoneNumber">
                <label id="phoneNumber-error" class="_error" for="phoneNumber"></label>
            </div>
         </div>
         <div class="form-group row">
            <label
               class="col-md-2 col-form-label">Ngày Tạo</label>
            <div class="col-md-10">
               <input class="form-control" type="datetime-local"
                readonly="readonly"
               name="createdDate"
               value="<fmt:formatDate pattern="yyyy-MM-dd'T'HH:mm" value="${user.createdDate}"/>"
               id="createdDate">
            </div>
         </div>
         <div class="form-group row">
            <label
               class="col-md-2 col-form-label">Ngày Đăng Nhập</label>
            <div class="col-md-10">
               <input class="form-control" type="datetime-local"
               readonly="readonly" name="loggedInDate"
               value="<fmt:formatDate pattern="yyyy-MM-dd'T'HH:mm" value="${user.loggedInDate}"/>"
               id="loggedInDate">
            </div>
         </div>
         <div class="form-group row">
            <label class="col-md-2 col-form-label">Địa Chỉ Đăng Nhập</label>
            <div class="col-md-10">
               <input class="form-control" type="text" disabled="disabled"
                  name="ip" value="${user.ip}" id="ip"
                  placeholder="Địa Chỉ Đăng Nhập">
            </div>
         </div>
         <div class="form-group row">
            <label class="col-md-2 col-form-label">Online</label>
            <div class="col-md-10">
               <div class="md-radio-inline">
                  <div class="md-radio">
                     <input disabled="disabled" type="radio" id="radio53" name="isOnline"
                     value="1" ${user.isOnline == 1 ? 'checked' : '' }
                     class="md-radiobtn"> <label for="radio53"> <span></span>
                     <span class="check"></span> <span class="box"></span>Đang Online
                     </label>
                  </div>
                  <div class="md-radio has-error">
                     <input disabled="disabled"  type="radio" id="radio54" name="isOnline"
                     value="0" ${user.isOnline == 0 ? 'checked' : '' }
                     class="md-radiobtn"> <label for="radio54"> <span></span>
                     <span class="check"></span> <span class="box"></span> Không
                     Online
                     </label>
                  </div>
               </div>
            </div>
         </div>
         <div class="form-group row">
            <label class="col-md-2 col-form-label">Trạng Thái<span class="error"> *</span></label>
            <div class="col-md-10">
               <div class="md-radio-inline">
                  <div class="md-radio">
                     <input type="radio" id="statusactive" name="status" value="active"
                     ${user.status == 'active' ? 'checked' : '' } class="md-radiobtn">
                     <label for="statusactive"> <span></span> <span class="check"></span>
                     <span class="box"></span>Kích Hoạt
                     </label>
                  </div>
                  <div class="md-radio has-info">
                     <input type="radio" id="statusinactive" name="status" value="inactive"
                     ${user.status == 'inactive' ? 'checked' : '' }
                     class="md-radiobtn"> <label for="statusinactive"> <span
                        class="inc"></span> <span class="check"></span> <span
                        class="box"></span> Chưa Kích Hoạt
                     </label>
                  </div>
                  <div class="md-radio has-warning">
                     <input type="radio" id="statusdraft" name="status" value="draft"
                     ${user.status == 'draft' ? 'checked' : '' } class="md-radiobtn">
                     <label for="statusdraft"> <span class="inc"></span> <span
                        class="check"></span> <span class="box"></span> Bản Nháp
                     </label>
                  </div>
                  <div class="md-radio has-error">
                     <input type="radio" id="statusdeleted" name="status" value="deleted"
                     ${user.status == 'deleted' ? 'checked' : '' }
                     class="md-radiobtn"> <label for="statusdeleted"> <span></span>
                     <span class="check"></span> <span class="box"></span> Xóa
                     </label>
                  </div>
               </div>
            </div>
         </div>

         <div class="form-group row">
            <label class="col-md-2 col-form-label">Quyền<span class="_error"> *</span></label>
            <div class="col-md-10">
               <div class="md-checkbox-inline">
                  <c:forEach var="lr" items="${rolesList }">
                     <c:set var="found" value="fasle" />
                     <c:forEach var="lrou" items="${user.roleses}">
                        <c:choose>
                           <c:when test="${lrou == lr }">
                              <c:set var="found" value="true" />
                              <div class="md-checkbox">
                                 <input name="roleses" value="${lr.name }" type="checkbox"
                                    id="${lr.roleId }" class="md-check" checked> <label
                                    for="${lr.roleId }"> <span></span> <span
                                    class="check"></span> <span class="box"></span> ${lr.name }
                                 </label>
                              </div>
                           </c:when>
                        </c:choose>
                     </c:forEach>
                     <c:choose>
                        <c:when test="${!found}">
                           <div class="md-checkbox">
                              <input name="roleses" value="${lr.name }" type="checkbox"
                                 id="${lr.roleId }" class="md-check"> <label
                                 for="${lr.roleId }"> <span></span> <span
                                 class="check"></span> <span class="box"></span> ${lr.name }
                              </label>
                           </div>
                        </c:when>
                     </c:choose>
                  </c:forEach>
               </div>

               <label id="roleses-error" class="error" for="roleses"></label>
            </div>
         </div>
         <div class="form-group row">
            <label class="col-md-2 control-label" >Ảnh
            Đại Diện<span class="_error"> *</span></label>
            <div class="col-md-10">
               <input name="avatar" type="file" id="input-file-max-fs" accept="image/*"
                  value="${user.avatar}" class="dropify" data-max-file-size="15M"
                  data-default-file="${contextPath}/images/avatar/${user.avatar}">

               <label id="input-file-max-fs-error" class="_error" for="input-file-max-fs"></label>
            </div>
         </div>
         <input type="hidden" name="${_csrf.parameterName}"
            value="${_csrf.token}" />
         <div class="form-group row"
            style="border-top: 1px solid #e7ecf1; padding: 20px;">
            <input hidden="" id="msg" value="${msg }" />
            <div class="offset-sm-2 col-sm-10">

               <button type="submit" class="btn btn-primary" id="btn-submit">Xác
               Nhận</button>
               <a href="${contextPath}/admin/users?status=active" class="btn btn-danger pull-right" >Quay Lại</a>
            </div>
         </div>
      </form:form>
   </div>
</div>