
<%
	if (session.getAttribute("userId") != null) {

		session.setAttribute("page", "topbar-drop");
		session.setMaxInactiveInterval(10 * 60);

		if (session.getAttribute("userId") == null)
			response.sendRedirect("login.jsp");

		response.setHeader("Cache-Control",
				"no-cache, no-store, must-revalidate");
		response.setHeader("Expires", "0");
		response.setHeader("Pragma", "no-cache");
		String loginId = session.getAttribute("userId").toString();
		// String empName = session.getAttribute("empName").toString();
%>

<div id="topbar-dropmenu">
	<div class="topbar-menu row">
		<div class="col-xs-4 col-sm-2">
			<a href="#" class="metro-tile"> <span
				class="glyphicon glyphicon-inbox"></span> <span class="metro-title">Messages</span>
			</a>
		</div>
		<div class="col-xs-4 col-sm-2">
			<a href="#" class="metro-tile"> <span
				class="glyphicon glyphicon-user"></span> <span class="metro-title">Users</span>
			</a>
		</div>
		<div class="col-xs-4 col-sm-2">
			<a href="#" class="metro-tile"> <span
				class="glyphicon glyphicon-headphones"></span> <span
				class="metro-title">Support</span>
			</a>
		</div>
		<div class="col-xs-4 col-sm-2">
			<a href="#" class="metro-tile"> <span class="fa fa-gears"></span>
				<span class="metro-title">Settings</span>
			</a>
		</div>
		<div class="col-xs-4 col-sm-2">
			<a href="#" class="metro-tile"> <span
				class="glyphicon glyphicon-facetime-video"></span> <span
				class="metro-title">Videos</span>
			</a>
		</div>
		<div class="col-xs-4 col-sm-2">
			<a href="#" class="metro-tile"> <span
				class="glyphicon glyphicon-picture"></span> <span
				class="metro-title">Pictures</span>
			</a>
		</div>
	</div>
</div>


<%
	} else {
		response.sendRedirect("login.jsp");
	}
%>