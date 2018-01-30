
<%
	if (session.getAttribute("userId") != null) {

		session.setAttribute("page", "sidebar-widget");
		session.setMaxInactiveInterval(10 * 60);
%>

<%
	if (session.getAttribute("userId") == null)
			response.sendRedirect("login.jsp");

		response.setHeader("Cache-Control",
				"no-cache, no-store, must-revalidate");
		response.setHeader("Expires", "0");
		response.setHeader("Pragma", "no-cache");
		String loginId = session.getAttribute("userId").toString();
		// String empName = session.getAttribute("empName").toString();
%>
<header class="sidebar-header">

	<div class="sidebar-widget menu-widget">
		<div class="row text-center mbn">
			<div class="col-xs-4">
				<a href="index.jsp" class="text-primary" data-toggle="tooltip"
					data-placement="top" title="Dashboard"> <span
					class="glyphicon glyphicon-home"></span>
				</a>
			</div>
			<div class="col-xs-4">
				<a href="#" class="text-info" data-toggle="tooltip"
					data-placement="top" title="Messages"> <span
					class="glyphicon glyphicon-inbox"></span>
				</a>
			</div>
			<div class="col-xs-4">
				<a href="#" class="text-alert" data-toggle="tooltip"
					data-placement="top" title="Tasks"> <span
					class="glyphicon glyphicon-bell"></span>
				</a>
			</div>
			<div class="col-xs-4">
				<a href="#" class="text-system" data-toggle="tooltip"
					data-placement="top" title="Activity"> <span
					class="fa fa-desktop"></span>
				</a>
			</div>
			<div class="col-xs-4">
				<a href="#" class="text-danger" data-toggle="tooltip"
					data-placement="top" title="Settings"> <span
					class="fa fa-gears"></span>
				</a>
			</div>
			<div class="col-xs-4">
				<a href="#" class="text-warning" data-toggle="tooltip"
					data-placement="top" title="Cron Jobs"> <span
					class="fa fa-flask"></span>
				</a>
			</div>
		</div>
	</div>

	<div class="sidebar-widget author-widget hidden">
		<div class="media">
			<a class="media-left" href="#"> <img
				src="assets/img/avatars/3.jpg" class="img-responsive">
			</a>
			<div class="media-body">
				<div class="media-links">
					<a href="#" class="sidebar-menu-toggle">User Menu -</a> <a
						href="./LogOut">Logout</a>
				</div>
				<div class="media-author">Michael Richards</div>
			</div>
		</div>
	</div>

	<div class="sidebar-widget search-widget search-lg hidden">
		<div class="form-group mbn">
			<span class="append-icon left"> <i class="fa fa-search"></i>
			</span> <input type="text" class="form-control" id="sidebarSearch"
				placeholder="Search...">
		</div>
	</div>
	<div class="sidebar-widget search-widget hidden">
		<div class="form-group mbn">
			<span class="append-icon left"> <i class="fa fa-search"></i>
			</span> <input type="text" class="form-control" id="sidebarSearch"
				placeholder="Search...">
		</div>
	</div>
</header>

<%
	} else {
		response.sendRedirect("login.jsp");
	}
%>