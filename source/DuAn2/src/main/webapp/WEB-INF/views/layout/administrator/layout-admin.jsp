<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<html lang="en">

	<head>
	<title><tiles:insertAttribute name="title" /></title>
		<tiles:insertAttribute name="head" />
		<tiles:insertAttribute name="headtag" />
	</head>
	<body class="fixed-sidebar fixed-header skin-default content-appear">
		<div class="wrapper">

			<!-- Preloader -->
			<div class="preloader"></div>

			<!-- Sidebar -->
			<div class="site-overlay"></div>
            <tiles:insertAttribute name="sitebar" />
			
			<!-- Sidebar second -->
			<div class="site-sidebar-second custom-scroll custom-scroll-dark">
				<ul class="nav nav-tabs" role="tablist">
					<li class="nav-item">
						<a class="nav-link active" data-toggle="tab" href="tab-1" role="tab">Chat</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" data-toggle="tab" href="index.html#tab-2" role="tab">Activity</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" data-toggle="tab" href="index.html#tab-3" role="tab">Todo</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" data-toggle="tab" href="index.html#tab-4" role="tab">Settings</a>
					</li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="tab-1" role="tabpanel">
						<div class="sidebar-chat animated fadeIn">
							<div class="sidebar-group">
								<h6>Favorites</h6>
								<a class="text-black" href="#">
									<span class="sc-status bg-success"></span>
									<span class="sc-name">John Doe</span>
									<span class="sc-writing"> typing...<i class="ti-pencil"></i></span>
								</a>
								<a class="text-black" href="#">
									<span class="sc-status bg-success"></span>
									<span class="sc-name">Vance Osborn</span>
								</a>
								<a class="text-black" href="#">
									<span class="sc-status bg-danger"></span>
									<span class="sc-name">Wolfe Stevie</span>
									<span class="tag tag-primary">7</span>
								</a>
								<a class="text-black" href="#">
									<span class="sc-status bg-warning"></span>
									<span class="sc-name">Jonathan Mel</span>
								</a>
								<a class="text-black" href="#">
									<span class="sc-status bg-secondary"></span>
									<span class="sc-name">Carleton Josiah</span>
								</a>
							</div>
							<div class="sidebar-group">
								<h6>Work</h6>
								<a class="text-black" href="#">
									<span class="sc-status bg-secondary"></span>
									<span class="sc-name">Larry Hal</span>
								</a>
								<a class="text-black" href="#">
									<span class="sc-status bg-success"></span>
									<span class="sc-name">Ron Carran</span>
									<span class="sc-writing"> typing...<i class="ti-pencil"></i></span>
								</a>
							</div>
							<div class="sidebar-group">
								<h6>Social</h6>
								<a class="text-black" href="#">
									<span class="sc-status bg-success"></span>
									<span class="sc-name">Lucius Skyler</span>
									<span class="tag tag-primary">3</span>
								</a>
								<a class="text-black" href="#">
									<span class="sc-status bg-danger"></span>
									<span class="sc-name">Landon Graham</span>
								</a>
							</div>
						</div>
						<div class="sidebar-chat-window animated fadeIn">
							<div class="scw-header clearfix">
								<a class="text-grey float-xs-left" href="#"><i class="ti-angle-left"></i> Back</a>
								<div class="float-xs-right">
									<strong>Jonathan Mel</strong>
									<div class="avatar box-32">
										<img src="${contextPath}/img/img/avatars/5.jpg" alt="">
										<span class="status bg-success top right"></span>
									</div>
								</div>
							</div>
							<div class="scw-item">
								<span>Hello!</span>
							</div>
							<div class="scw-item self">
								<span>Meeting at 16:00 in the conference room. Remember?</span>
							</div>
							<div class="scw-item">
								<span>No problem. Thank's for reminder!</span>
							</div>
							<div class="scw-item self">
								<span>Prepare to be amazed.</span>
							</div>
							<div class="scw-item">
								<span>Good. Can't wait!</span>
							</div>
							<div class="scw-form">
								<form>
									<input class="form-control" type="text" placeholder="Type...">
									<button class="btn btn-secondary" type="button"><i class="ti-angle-right"></i></button>
								</form>
							</div>
						</div>
					</div>
					<div class="tab-pane" id="tab-2" role="tabpanel">
						<div class="sidebar-activity animated fadeIn">
							<div class="notifications">
								<div class="n-item">
									<div class="media">
										<div class="media-left">
											<div class="avatar box-48">
												<img class="b-a-radius-circle" src="${contextPath}/img/img/avatars/1.jpg" alt="">
												<span class="n-icon bg-danger"><i class="ti-pin-alt"></i></span>
											</div>
										</div>
										<div class="media-body">
											<div class="n-text"><a class="text-black" href="#">John Doe</a> <span class="text-muted">uploaded <a class="text-black" href="#">monthly report</a></div>
											<div class="text-muted font-90">12 minutes ago</div>
										</div>
									</div>
								</div>
								<div class="n-item">
									<div class="media">
										<div class="media-left">
											<div class="avatar box-48">
												<img class="b-a-radius-circle" src="${contextPath}/img/img/avatars/3.jpg" alt="">
												<span class="n-icon bg-success"><i class="ti-comment"></i></span>
											</div>
										</div>
										<div class="media-body">
											<div class="n-text"><a class="text-black" href="#">Vance Osborn</a> <span class="text-muted">commented </span> <a class="text-black" href="#">Project</a></div>
											<div class="n-comment my-0-5">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore</div>
											<div class="text-muted font-90">3 hours ago</div>
										</div>
									</div>
								</div>
								<div class="n-item">
									<div class="media">
										<div class="media-left">
											<div class="avatar box-48">
												<img class="b-a-radius-circle" src="${contextPath}/img/img/avatars/2.jpg" alt="">
												<span class="n-icon bg-danger"><i class="ti-email"></i></span>
											</div>
										</div>
										<div class="media-body">
											<div class="n-text"><a class="text-black" href="#">Ron Carran</a> <span class="text-muted">send you files</span></div>
											<div class="row row-sm my-0-5">
												<div class="col-xs-4">
													<img class="img-fluid" src="${contextPath}/img/img/photos-1/1.jpg" alt="">
												</div>
												<div class="col-xs-4">
													<img class="img-fluid" src="${contextPath}/img/img/photos-1/2.jpg" alt="">
												</div>
												<div class="col-xs-4">
													<img class="img-fluid" src="${contextPath}/img/img/photos-1/3.jpg" alt="">
												</div>
											</div>
											<div class="text-muted font-90">30 minutes ago</div>
										</div>
									</div>
								</div>
								<div class="n-item">
									<div class="media">
										<div class="media-left">
											<div class="avatar box-48">
												<img class="b-a-radius-circle" src="${contextPath}/img/img/avatars/4.jpg" alt="">
												<span class="n-icon bg-primary"><i class="ti-plus"></i></span>
											</div>
										</div>
										<div class="media-body">
											<div class="n-text"><a class="text-black" href="#">Larry Hal</a> <span class="text-muted">invited you to </span><a class="text-black" href="#">Project</a></div>
											<div class="text-muted font-90">10:58</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="tab-pane" id="tab-3" role="tabpanel">
						<div class="sidebar-todo animated fadeIn">
							<div class="sidebar-group">
								<h6>Important</h6>
								<div class="st-item">
									<label class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input">
										<span class="custom-control-indicator"></span>
										<span class="custom-control-description">Mock up</span>
									</label>
								</div>
								<div class="st-item">
									<label class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input" checked>
										<span class="custom-control-indicator"></span>
										<span class="custom-control-description">Prototype iPhone</span>
									</label>
								</div>
								<div class="st-item">
									<label class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input">
										<span class="custom-control-indicator"></span>
										<span class="custom-control-description">Build final version</span>
									</label>
								</div>
								<div class="st-item">
									<label class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input">
										<span class="custom-control-indicator"></span>
										<span class="custom-control-description">Approval docs</span>
									</label>
								</div>
							</div>
							<div class="sidebar-group">
								<h6>Secondary</h6>
								<div class="st-item">
									<label class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input" checked>
										<span class="custom-control-indicator"></span>
										<span class="custom-control-description">Website redesign</span>
									</label>
								</div>
								<div class="st-item">
									<label class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input" checked>
										<span class="custom-control-indicator"></span>
										<span class="custom-control-description">Skype call</span>
									</label>
								</div>
								<div class="st-item">
									<label class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input">
										<span class="custom-control-indicator"></span>
										<span class="custom-control-description">Blog post</span>
									</label>
								</div>
							</div>
						</div>
					</div>
					<div class="tab-pane" id="tab-4" role="tabpanel">
						<div class="sidebar-settings animated fadeIn">
							<div class="sidebar-group">
								<h6>Main</h6>
								<div class="ss-item">
									<div class="text-truncate">Anyone can register</div>
									<div class="ss-checkbox"><input type="checkbox" class="js-switch" data-size="small" data-color="#3e70c9" checked></div>
								</div>
								<div class="ss-item">
									<div class="text-truncate">Allow commenting</div>
									<div class="ss-checkbox"><input type="checkbox" class="js-switch" data-size="small" data-color="#3e70c9"></div>
								</div>
								<div class="ss-item">
									<div class="text-truncate">Allow deleting</div>
									<div class="ss-checkbox"><input type="checkbox" class="js-switch" data-size="small" data-color="#3e70c9"></div>
								</div>
							</div>
							<div class="sidebar-group">
								<h6>Notificatiоns</h6>
								<div class="ss-item">
									<div class="text-truncate">Commits</div>
									<div class="ss-checkbox"><input type="checkbox" class="js-switch" data-size="small" data-color="#3e70c9"></div>
								</div>
								<div class="ss-item">
									<div class="text-truncate">Messages</div>
									<div class="ss-checkbox"><input type="checkbox" class="js-switch" data-size="small" data-color="#3e70c9" checked></div>
								</div>
							</div>
							<div class="sidebar-group">
								<h6>Security</h6>
								<div class="ss-item">
									<div class="text-truncate">Daily backup</div>
									<div class="ss-checkbox"><input type="checkbox" class="js-switch" data-size="small" data-color="#3e70c9" checked></div>
								</div>
								<div class="ss-item">
									<div class="text-truncate">API Access</div>
									<div class="ss-checkbox"><input type="checkbox" class="js-switch" data-size="small" data-color="#3e70c9" checked></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Template options -->
			

			<!-- Header -->
			<div class="site-header">
            <tiles:insertAttribute name="navbar" />
			</div>

			<div class="site-content">
				<!-- Content -->
				<tiles:insertAttribute name="body" />
				<!-- Footer -->
				<tiles:insertAttribute name="footer" />
			</div>

		</div>

		<tiles:insertAttribute name="footertag" />
	</body>
</html>