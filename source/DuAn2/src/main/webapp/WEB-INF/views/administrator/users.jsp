<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="content-area py-1">
	<div class="container-fluid">
		<h4>Data Tables</h4>
		<ol class="breadcrumb no-bg mb-1">
			<li class="breadcrumb-item"><a href="tables-datatable.html#">Home</a></li>
			<li class="breadcrumb-item"><a href="tables-datatable.html#">Tables</a></li>
			<li class="breadcrumb-item active">Data Tables</li>
		</ol>


		<div class="box box-block bg-white">
			<h5 class="mb-1">Table with Column Filtering</h5>
			<div class="overflow-x-auto">
			<span id="arrayId" ></span>
				<div id="jqcc">
				<table class="table table-striped table-bordered dataTable"
					id="table-3">
					<thead>
					<tr>
							<th style="width: 20px;"><input type="checkbox" id="allcb" name="allcb" /></th>
            
							<th>User Name</th>
							
							<th>Quyền</th>
							<th class="text-center"><a
								href="#" ><i style="color: green;" class="fa fa-plus fa-2x"
								title="Thêm"></i></a></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="lu" items="${listUsers}">								
								<tr>
									<td><input type="checkbox" value="${lu.userId}"
										name="cb" /></td>
									<td>${lu.userName}</td>
									<td>
									<c:forEach var="lr" items="${lu.roleses}" >
										${lr.name },
									</c:forEach>
									</td>
									
									<td><a href="#"><i style="color: blue;"
											class="fa fa-pencil fa-lg" aria-hidden="true" title="Sửa"></i></a>
										<a style="color: red; margin-left: 10px;" href="#"> <i
											class="fa fa-trash-o fa-lg" aria-hidden="true" title="Xóa"></i>
									</a></td>
								</tr>
							</c:forEach>
						

					</tbody>
					<tfoot>
						<tr>
						<td></td>
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
</div>

