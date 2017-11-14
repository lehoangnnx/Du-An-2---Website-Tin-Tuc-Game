<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<header id="navigation">
	<div class="navbar navbar-inverse navbar-fixed-top" role="banner">
		<div class="container" style="margin-top: -10px;">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Navigation</span> <span class="icon-bar"></span>
					<span class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<div class="text-center">
					<a class="navbar-brand " href="${contextPath}/"
						style="margin-top: 11px;"><h1>
							<img class=" " src="${contextPath}/images/logo2.png" alt="logo">
						</h1></a>
				</div>
			</div>
			<div class="collapse navbar-collapse ">
				<ul class="nav navbar-nav navbar-right">
					<li class="scroll active"><a href="${contextPath}/">Trang
							chủ</a></li>
					<c:forEach var="atl" items="${articleCategoryList}">
						<c:if test="${atl.subArticleCategoryId == 0}">
							<li class="scroll"><a href="${atl.slug}">${atl.name}</a></li>
						</c:if>
					</c:forEach> 
					
					<li class="dropdown head-dpdn"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"> <i
							class="fa fa-percent" aria-hidden="true"></i>Giải trí<span
							class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">Tải game</a></li>
							<li><a href="#">Forum</a></li>
							<li><a href="#">Trải nghiệm</a></li>
						</ul></li>				

			<li class="scroll"><a href="#">Liên hệ</a></li>


			<!-- ${pageContext.request.userPrincipal.name}
					//${pageContext.request.userPrincipal.authorities}   -->

			<security:authorize access="isAuthenticated()">
				<security:authentication var="principal" property="principal" />
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <security:authorize
							access="hasAnyRole('FACEBOOK', 'GOOGLE')">
                                ${user.firstName} ${ user.lastName   }
                            </security:authorize> <security:authorize
							access="hasAnyRole('MEMBER', 'ADMIN')">
                                ${user.userName}
                            </security:authorize> <span class="caret"></span>
				</a>
					<ul class="dropdown-menu">
						<security:authorize access="hasRole('MEMBER')">
							<li><a href="#">Thông Tin</a></li>

						</security:authorize>
						<security:authorize access="hasAnyRole('FACEBOOK', 'GOOGLE')">
							<li><a href="#">Trang Cá Nhân</a></li>
						</security:authorize>

						<security:authorize access="hasRole('ADMIN')">
							<li><a href="${contextPath }/admin/index">Quản Trị</a></li>
						</security:authorize>
						<security:authorize access="hasRole('GOOGLE')">
							<form:form id="logoutForm" method="POST"
								action="${contextPath}/logout">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
								<button type="submit" onclick="signOut();" class="dropdown-item">Đăng
									Xuất</button>
							</form:form>

						</security:authorize>

						<security:authorize access="!hasRole('GOOGLE')">
							<form:form id="logoutForm" method="POST"
								action="${contextPath}/logout">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
								<button type="submit" class="dropdown-item">Đăng Xuất</button>
							</form:form>
						</security:authorize>


					</ul></li>
			</security:authorize>
			<security:authorize access="!isAuthenticated()">
				<li class="scroll"><a class="modal_trigger" href="#modal">Đăng
						Nhập</a></li>

			</security:authorize>
			
			<div class="menu">
						<ul>
							<li><a href="#">ĐÙ MÁ</a>
								<ul>
									<li><a href="#">CÓ</a>
										<ul>
											<li><a href="#">WHAT THE FUCK</a></li>
											<li><a href="#">WHAT THE FUCK</a></li>
											<li><a href="#">WHAT THE FUCK</a></li>
											<li><a href="#">WHAT THE FUCK</a></li>
										</ul></li>
									<li><a href="#">RA</a>
										<ul>
											<li><a href="#">WHAT THE FUCK</a></li>
											<li><a href="#">WHAT THE FUCK</a></li>
											<li><a href="#">WHAT THE FUCK</a></li>
											<li><a href="#">WHAT THE FUCK</a></li>
										</ul></li>
									<li><a href="#">KHÔNG</a>
										<ul>
											<li><a href="#">WHAT THE FUCK</a></li>
											<li><a href="#">WHAT THE FUCK</a></li>
											<li><a href="#">WHAT THE FUCK</a></li>
										</ul></li>
									<li><a href="#">THÌ BẢO</a>
										<ul>
											<li><a href="#">WHAT THE FUCK</a></li>
											<li><a href="#">WHAT THE FUCK</a></li>
											<li><a href="#">WHAT THE FUCK</a></li>
											<li><a href="#">WHAT THE FUCK</a></li>
										</ul></li>
								</ul></li>

						</ul>
					</div>


			<!-- <li class="fa fa-caret-down" style="font-size: 26px">
                        </li> -->
			</ul>
		</div>
	</div>
	</div>
	<!--/navbar-->
</header>
<!--/Đóng header-->
<!--/Tìm kiếm-->
<div class="content">
	<div class="container">
		<div class="row">
			<div class="col-md-12 push-right">
				<div class="search">
					<form class="navbar-form navbar-right" action="#" method="post">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Search">
							<button type="submit" class="btn btn-default"
								aria-label="Left Align">
								<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
							</button>
						</div>
					</form>
				</div>
			</div>

		</div>
	</div>
</div>

<!--/Đóng tìm kiếm-->
<div class="content">
	<div class="container">
		<div class="row">

			<div class="col-md-12 push-right">
				<div class="ot-breaking-news-body mouseenter"
					data-breaking-timeout="4000" data-breaking-autostart="true">
					<div class="ot-breaking-news-controls">
						<strong><i class="fa fa-bar-chart"></i>Thông tin game 24h
							: </strong>
					</div>
					<div class="ot-breaking-news-content">
						<marquee behavior="scroll" direction="left" scrollamount="8"
							scrolldelay="20" width="90%">
							<a href="${contextPath}/${getTop1Article.slug} "
								style="color: #fc7700">${getTop1Article.title}</a>
						</marquee>

					</div>
					<!-- END .ot-breaking-news-body -->
				</div>

			</div>
		</div>
	</div>
</div>


