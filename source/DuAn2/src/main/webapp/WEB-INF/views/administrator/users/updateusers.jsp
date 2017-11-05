<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<style>
.error {
	color: red;
}
</style>
<div class="container-fluid">
   <h4>Người Dùng</h4>
   <ol class="breadcrumb no-bg mb-1">
      <li class="breadcrumb-item"><a href="forms-material.html#">Home</a></li>
      <li class="breadcrumb-item"><a href="forms-material.html#">Forms</a></li>
      <li class="breadcrumb-item active">Material Form</li>
   </ol>
   <div class="box box-block bg-white">
      <h5>Sửa Người Dùng</h5>
      <form:form  action="${contextPath }/admin/users" method="patch" id="formUser"
         enctype="multipart/form-data" modelAttribute="user">
         <form:hidden path="userId" />
         <div class="form-group row">
            <label class="col-md-2 col-form-label">User Name</label>
            <div class="col-md-10">
               <input type="text" readonly="readonly" id="userName"
                  class="form-control" name="userName" value="${user.userName }"
                  placeholder="Disabled input">
            </div>
         </div>
         <%-- <div class="form-group row">
            <label style="padding-top: 2rem;" id="mat-label" for="inputEmail3"
            	class="col-sm-2 col-form-label">Email</label>
            <div class="col-sm-10">
            	<div id="divEmail"
            		class="form-group form-md-line-input form-md-floating-label">
            		<input type="text" class="form-control" value="${user.email }"
            			name="email" id="email" /> <label for="form_control_1">Email</label>
            		<span id="spanEmail" class="help-block">Nhập Email</span>
            	</div>
            </div>
            </div> --%>
         <div id="divEmail" class="form-group row">
            <label class="col-md-2 col-form-label" for="email">Email</label>
            <div class="col-md-10">
               <input type="email" class="form-control "
                  value="${user.email }" name="email" id="email">
               <label id="email-error" class="error" for="email"></label>
            </div>
         </div>
         <div class="form-group  row">
            <label class="col-md-2 col-form-label" for="email">Họ</label>
            <div class="col-md-10">
               <input type="text" class="form-control "
                  value="${user.firstName }" name="firstName" id="firstName">
                <label id="firstName-error" class="error" for="firstName"></label>
            </div>
         </div>
         <div class="form-group  row">
            <label class="col-md-2 col-form-label" for="email">Tên</label>
            <div class="col-md-10">
               <input type="text" class="form-control "
                  value="${user.lastName }" name="lastName" id="lastName">
                   <label id="lastName-error" class="error" for="lastName"></label>
            </div>
         </div>
         <div class="form-group  row">
            <label class="col-md-2 col-form-label" for="email">Số Điện
            Thoại</label>
            <div class="col-md-10">
               <input type="text" class="form-control "
                  value="${user.phoneNumber }" name="phoneNumber" id="phoneNumber">
                <label id="phoneNumber-error" class="error" for="phoneNumber"></label>
            </div>
         </div>
         <div class="form-group row">
            <label for="example-datetime-local-input"
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
            <label for="example-datetime-local-input"
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
            <label class="col-md-2 col-form-label">Trạng Thái</label>
            <div class="col-md-10">
               <div class="md-radio-inline">
                  <div class="md-radio">
                     <input type="radio" id="radio58" name="status" value="active"
                     ${user.status == 'active' ? 'checked' : '' } class="md-radiobtn">
                     <label for="radio58"> <span></span> <span class="check"></span>
                     <span class="box"></span>Kích Hoạt
                     </label>
                  </div>
                  <div class="md-radio has-info">
                     <input type="radio" id="radio55" name="status" value="inactive"
                     ${user.status == 'inactive' ? 'checked' : '' }
                     class="md-radiobtn"> <label for="radio55"> <span
                        class="inc"></span> <span class="check"></span> <span
                        class="box"></span> Chưa Kích Hoạt
                     </label>
                  </div>
                  <div class="md-radio has-warning">
                     <input type="radio" id="radio52" name="status" value="draft"
                     ${user.status == 'draft' ? 'checked' : '' } class="md-radiobtn">
                     <label for="radio52"> <span class="inc"></span> <span
                        class="check"></span> <span class="box"></span> Chờ Kích Hoạt
                     </label>
                  </div>
                  <div class="md-radio has-error">
                     <input type="radio" id="radio56" name="status" value="deleted"
                     ${user.status == 'deleted' ? 'checked' : '' }
                     class="md-radiobtn"> <label for="radio56"> <span></span>
                     <span class="check"></span> <span class="box"></span> Xóa
                     </label>
                  </div>
               </div>
            </div>
         </div>
         <!-- <div class="form-group row">
            <label style="padding-top: 2rem; " id="mat-label" for="inputEmail3"
            	class="col-sm-2 col-form-label">Primary</label>
            <div class="col-sm-10">
            	<div class="form-group form-md-line-input form-md-floating-label has-error">
            		<input type="text" class="form-control" id="form_control_1">
            		<label for="form_control_1">Input with help</label> <span
            			class="help-block">Some help goes here...</span>
            	</div>
            </div>
            </div> -->
         <div class="form-group row">
            <label class="col-md-2 col-form-label">Quyền</label>
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
            </div>
         </div>
         <!-- <div class="form-group row  ">
            <label for="inputEmail3" class="col-sm-2 col-form-label">Nội
            	Dung</label>
            <div class="col-sm-10">
            	<div id="summernote"></div>
            </div>
            </div>
            -->
         <div class="form-group row">
            <label class="col-md-2 control-label" for="form_control_1">Ảnh
            Đại Diện</label>
            <div class="col-md-10">
               <input name="avatar" type="file" id="input-file-max-fs"
                  value="${user.avatar}" class="dropify" data-max-file-size="15M"
                  data-default-file="${contextPath}/images/avatar/${user.avatar}">
            </div>
         </div>
         <input type="hidden" name="${_csrf.parameterName}"
            value="${_csrf.token}" />
         <div class="form-group row"
            style="border-top: 1px solid #e7ecf1; padding: 20px;">
            <input hidden="" id="msg" value="${msg }"></input>
            <div class="offset-sm-2 col-sm-10">
               <button type="button" class="btn default">Làm Mới</button>
               <button type="submit" class="btn btn-primary" id="btn-submit">Xác
               Nhận</button>
               <button type="submit" class="btn btn-danger pull-right">Hủy
               Bỏ</button>
            </div>
         </div>
      </form:form>
   </div>
</div>