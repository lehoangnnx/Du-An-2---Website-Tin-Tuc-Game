<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<input hidden="" id="msg" value="${msg }"></input>
<div class="content-area py-1">
	<div class="container-fluid">
		<h4>Bảng Dữ Liệu</h4>

		<ol class="breadcrumb no-bg mb-1">
			<li class="breadcrumb-item"><a
				href="${contextPath }/admin/index">Trang Chủ</a></li>
			<li class="breadcrumb-item"><a href="tables-datatable.html#">Bảng</a></li>
			<li class="breadcrumb-item active">Bảng Dữ Liệu</li>
		</ol>
		<div class="tab">
			<button class="tablinks active"
				onclick="openTab(event, 'showAllUsers')">All</button>
			<button id="abold" class="tablinks"
				onclick="openTab(event, 'showUsersInactive')">Inactive</button>

		</div>

		<div id="showAllUsers" class="tabcontent" style="display: block;">
			<div class="box box-block bg-white">
				<h5 class="mb-1">Danh Sách Người Dùng</h5>

				<div class="overflow-x-auto">
					
					<div id="jqcc">
						<table class="table table-striped table-bordered dataTable"
							id="table-3">
							<thead>
								<tr>
									<th id="thcb" class="cbDeleteAll" ><input type="checkbox" id="allcb"
										name="allcb" />
										
										</th>

									<th >User Name</th>

									<th >Quyền</th>
									<%--<th class="add"><a href="${contextPath}/admin/addusers"><i
											style="color: green;" class="fa fa-plus fa-2x" title="Thêm"></i></a></th>--%>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="lu" items="${usersList}">
									<tr>
										<td class="cbDeleteAll"><input  type="checkbox" value="${lu.userId}" name="cb" /></td>
										<td>${lu.userName}</td>
										<td><c:forEach var="lr" items="${lu.roleses}">
										${lr.name },
									</c:forEach></td>

										<td class="updateAndDelete"><a
											href="${contextPath }/admin/users/${lu.userId}"><i
												style="color: blue;" class="fa fa-pencil fa-lg"
												aria-hidden="true" title="Sửa"></i></a> 
												
												<a onclick="deleteOne(${lu.userId});" href="#" data-toggle="modal" data-target="#myModal" style="color: red; margin-left: 10px;"> 
												<i class="fa fa-trash-o fa-lg" aria-hidden="true" title="Xóa"></i>
										</a></td>
									</tr>
								</c:forEach>


							</tbody>
							<tfoot>
								<tr>
									<td><div style="text-align: center;"><button onclick="deleteAll();"  data-toggle="modal" data-target="#myModal"  class="btn btn-danger">Xóa Nhiều</button></div></td>
									<th>User Name</th>

									<th>Quyền</th>
									<td></td>
								</tr>
							</tfoot>
						</table>
					</div>
				</div>
			</div>
		</div>

		<div id="showUsersInactive" class="tabcontent">
			<h4>Hiển Thị Danh Sách Người DÙng Inactive (Bị Khóa)</h4>
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
				value="${_csrf.token}" />
					<input value="" id="arrayId" hidden="" name="arrayId" />
					<button class="btn btn-danger" style="float: left;">
						Xóa
					</button>
				</form:form>
				

				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>

	</div>
</div>


