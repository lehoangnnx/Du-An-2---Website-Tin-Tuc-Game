<%@ page pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<div class="site-sidebar">
	<div class="custom-scroll custom-scroll-light">
		<ul class="sidebar-menu">
			<li class="menu-title">Quản Lý</li>
			<li class="with-sub"><a href="${contextPath }/admin/index"
				class="waves-effect  waves-light"> <span class="s-icon"><i
						class="ti-anchor"></i></span> <span class="s-text">Trang Chủ</span>
			</a></li>


			<li class="with-sub"><a href="#"
				class="waves-effect  waves-light"> <span class="s-caret"><i
						class="fa fa-angle-down"></i></span> <span class="s-icon"><i
						class="ti-paint-bucket"></i></span> <span class="s-text">Quản Lý
						Người Dùng </span>
			</a>
				<ul>
					<li><a href="${contextPath }/admin/users">Quản Lý Người Dùng</a></li>
					<li><a href="${contextPath }/admin/roless">Quản Lý Quyền</a></li>
				</ul></li>
			<li class="with-sub"><a href="#"
				class="waves-effect  waves-light"> <span class="s-caret"><i
						class="fa fa-angle-down"></i></span> <span class="s-icon"><i
						class="ti-menu-alt"></i></span> <span class="s-text">Bài Viết</span>
			</a>
				<ul>
					<li><a href="${contextPath }/admin/articles">Quản Lý Bài Viết</a></li>
					<li><a href="${contextPath }/admin/articles/category">Quản Lý Danh Mục Bài Viết</a></li>
					
				</ul></li>



		</ul>
	</div>
</div>
