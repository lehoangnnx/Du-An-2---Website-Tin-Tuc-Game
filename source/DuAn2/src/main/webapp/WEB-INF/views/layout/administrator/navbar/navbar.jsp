<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<nav class="navbar navbar-light">
    <div class="navbar-left">
        <a class="navbar-brand" href="index.html">
            <div class="logo"></div>
        </a>
        <div class="toggle-button dark sidebar-toggle-first float-xs-left hidden-md-up">
            <span class="hamburger"></span>
        </div>
        <div class="toggle-button-second dark float-xs-right hidden-md-up">
            <i class="ti-arrow-left"></i>
        </div>
        <div class="toggle-button dark float-xs-right hidden-md-up" data-toggle="collapse" data-target="#collapse-1">
            <span class="more"></span>
        </div>
    </div>
    <div class="navbar-right navbar-toggleable-sm collapse" id="collapse-1">
        <div class="toggle-button light sidebar-toggle-second float-xs-left hidden-sm-down">
            <span class="hamburger"></span>
        </div>
        <div class="toggle-button-second light float-xs-right hidden-sm-down">
            <i class="ti-arrow-left"></i>
        </div>
        <ul class="nav navbar-nav float-md-right">
            <li class="nav-item dropdown">
                <a class="nav-link" href="#" data-toggle="dropdown" aria-expanded="false">
                    <i class="ti-flag-alt"></i>
                    <span class="hidden-md-up ml-1">Tasks</span>
                    <span class="tag tag-success top">3</span>
                </a>
                <div class="dropdown-tasks dropdown-menu dropdown-menu-right animated fadeInUp">
                    <div class="t-item">
                        <div class="mb-0-5">
                            <a class="text-black" href="#">First Task</a>
                            <span class="float-xs-right text-muted">75%</span>
                        </div>
                        <progress class="progress progress-danger progress-sm" value="75" max="100">100%</progress>
                        <span class="avatar box-32">
											<img src="${contextPath}/img/img/avatars/2.jpg" alt="">
										</span>
                        <a class="text-black" href="#">John Doe</a>, <span class="text-muted">5 min ago</span>
                    </div>
                    <div class="t-item">
                        <div class="mb-0-5">
                            <a class="text-black" href="#">Second Task</a>
                            <span class="float-xs-right text-muted">40%</span>
                        </div>
                        <progress class="progress progress-purple progress-sm" value="40" max="100">100%</progress>
                        <span class="avatar box-32">
											<img src="${contextPath}/img/img/avatars/3.jpg" alt="">
										</span>
                        <a class="text-black" href="#">John Doe</a>, <span class="text-muted">15:07</span>
                    </div>
                    <div class="t-item">
                        <div class="mb-0-5">
                            <a class="text-black" href="#">Third Task</a>
                            <span class="float-xs-right text-muted">100%</span>
                        </div>
                        <progress class="progress progress-warning progress-sm" value="100" max="100">100%</progress>
                        <span class="avatar box-32">
											<img src="${contextPath}/img/img/avatars/4.jpg" alt="">
										</span>
                        <a class="text-black" href="#">John Doe</a>, <span class="text-muted">yesterday</span>
                    </div>
                    <div class="t-item">
                        <div class="mb-0-5">
                            <a class="text-black" href="#">Fourth Task</a>
                            <span class="float-xs-right text-muted">60%</span>
                        </div>
                        <progress class="progress progress-success progress-sm" value="60" max="100">100%</progress>
                        <span class="avatar box-32">
											<img src="${contextPath}/img/img/avatars/5.jpg" alt="">
										</span>
                        <a class="text-black" href="#">John Doe</a>, <span class="text-muted">3 days ago</span>
                    </div>
                    <a class="dropdown-more" href="#">
                        <strong>View all tasks</strong>
                    </a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link" href="#" data-toggle="dropdown" aria-expanded="false">
                    <i class="ti-email"></i>
                    <span class="hidden-md-up ml-1">Notifications</span>
                    <span class="tag tag-danger top">12</span>
                </a>
                <div class="dropdown-messages dropdown-tasks dropdown-menu dropdown-menu-right animated fadeInUp">
                    <div class="m-item">
                        <div class="mi-icon bg-info"><i class="ti-comment"></i></div>
                        <div class="mi-text"><a class="text-black" href="#">John Doe</a> <span class="text-muted">commented post</span> <a class="text-black" href="#">Lorem ipsum dolor</a></div>
                        <div class="mi-time">5 min ago</div>
                    </div>
                    <div class="m-item">
                        <div class="mi-icon bg-danger"><i class="ti-heart"></i></div>
                        <div class="mi-text"><a class="text-black" href="#">John Doe</a> <span class="text-muted">liked post</span> <a class="text-black" href="#">Lorem ipsum dolor</a></div>
                        <div class="mi-time">15:07</div>
                    </div>
                    <div class="m-item">
                        <div class="mi-icon bg-purple"><i class="ti-user"></i></div>
                        <div class="mi-text"><a class="text-black" href="#">John Doe</a> <span class="text-muted">followed</span> <a class="text-black" href="#">Kate Doe</a></div>
                        <div class="mi-time">yesterday</div>
                    </div>
                    <div class="m-item">
                        <div class="mi-icon bg-danger"><i class="ti-heart"></i></div>
                        <div class="mi-text"><a class="text-black" href="#">John Doe</a> <span class="text-muted">liked post</span> <a class="text-black" href="#">Lorem ipsum dolor</a></div>
                        <div class="mi-time">3 days ago</div>
                    </div>
                    <a class="dropdown-more" href="#">
                        <strong>View all notifications</strong>
                    </a>
                </div>
            </li>
            <li class="nav-item dropdown hidden-sm-down">
                <a href="#" data-toggle="dropdown" aria-expanded="false">
									<span class="avatar box-32">
										<img src="${contextPath}/img/img/avatars/1.jpg" alt="">
									</span>
                </a>
                <div class="dropdown-menu dropdown-menu-right animated fadeInUp">
                    <a class="dropdown-item" href="#">
                        <i class="ti-email mr-0-5"></i> Inbox
                    </a>
                    <a class="dropdown-item" href="#">
                        <i class="ti-user mr-0-5"></i> Profile
                    </a>
                    <a class="dropdown-item" href="#">
                        <i class="ti-settings mr-0-5"></i> Settings
                    </a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#"><i class="ti-help mr-0-5"></i> Help</a>
                     <c:if test="${pageContext.request.userPrincipal.name != null}">
		                    <form:form id="logoutForm" method="POST" action="${contextPath}/logout">
		            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		            <button type="submit" class="dropdown-item"><i class="ti-power-off mr-0-5"></i>Sign out</button>
		        </form:form>
		        </c:if>
                    
                </div>
            </li>
        </ul>
        <ul class="nav navbar-nav">
            <li class="nav-item hidden-sm-down">
                <a class="nav-link toggle-fullscreen" href="#">
                    <i class="ti-fullscreen"></i>
                </a>
            </li>
            <li class="nav-item dropdown hidden-sm-down">
                <a class="nav-link" href="#" data-toggle="dropdown" aria-expanded="false">
                    <i class="ti-layout-grid3"></i>
                </a>
                <div class="dropdown-apps dropdown-menu animated fadeInUp">
                    <div class="a-grid">
                        <div class="row row-sm">
                            <div class="col-xs-4">
                                <div class="a-item">
                                    <a href="#">
                                        <div class="ai-icon"><img class="img-fluid" src="${contextPath}/img/img/brands/dropbox.png" alt=""></div>
                                        <div class="ai-title">Dropbox</div>
                                    </a>
                                </div>
                            </div>
                            <div class="col-xs-4">
                                <div class="a-item">
                                    <a href="#">
                                        <div class="ai-icon"><img class="img-fluid" src="${contextPath}/img/img/brands/github.png" alt=""></div>
                                        <div class="ai-title">Github</div>
                                    </a>
                                </div>
                            </div>
                            <div class="col-xs-4">
                                <div class="a-item">
                                    <a href="#">
                                        <div class="ai-icon"><img class="img-fluid" src="${contextPath}/img/img/brands/wordpress.png" alt=""></div>
                                        <div class="ai-title">Wordpress</div>
                                    </a>
                                </div>
                            </div>
                            <div class="col-xs-4">
                                <div class="a-item">
                                    <a href="#">
                                        <div class="ai-icon"><img class="img-fluid" src="${contextPath}/img/img/brands/gmail.png" alt=""></div>
                                        <div class="ai-title">Gmail</div>
                                    </a>
                                </div>
                            </div>
                            <div class="col-xs-4">
                                <div class="a-item">
                                    <a href="#">
                                        <div class="ai-icon"><img class="img-fluid" src="${contextPath}/img/img/brands/drive.png" alt=""></div>
                                        <div class="ai-title">Drive</div>
                                    </a>
                                </div>
                            </div>
                            <div class="col-xs-4">
                                <div class="a-item">
                                    <a href="#">
                                        <div class="ai-icon"><img class="img-fluid" src="${contextPath}/img/img/brands/dribbble.png" alt=""></div>
                                        <div class="ai-title">Dribbble</div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <a class="dropdown-more" href="#">
                        <strong>View all apps</strong>
                    </a>
                </div>
            </li>
        </ul>
        <div class="header-form float-md-left ml-md-2">
            <form>
                <input type="text" class="form-control b-a" placeholder="Search for...">
                <button type="submit" class="btn bg-white b-a-0">
                    <i class="ti-search"></i>
                </button>
            </form>
        </div>
    </div>
</nav>