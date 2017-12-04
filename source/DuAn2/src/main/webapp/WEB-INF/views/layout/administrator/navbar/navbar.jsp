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

        <ul class="nav navbar-nav float-md-right">


            <li class="nav-item dropdown hidden-sm-down">
                <label style="font-weight: bold;font-size: 15px; margin-right: 10px;text-transform: uppercase;"> ${user.userName}</label>
                <a href="javascipt:void(0);" data-toggle="dropdown" aria-expanded="false">
									<span class="avatar box-32">
										<img src="${contextPath}/images/avatar/${user.avatar}" alt="">
									</span>
                </a>
                <div class="dropdown-menu dropdown-menu-right animated fadeInUp">

                     <c:if test="${pageContext.request.userPrincipal.name != null}">
		           
		            <a id="btn-logout" href="javascript:void(0);" class="dropdown-item"><i class="ti-power-off mr-0-5"></i>Đăng Xuất</a>
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