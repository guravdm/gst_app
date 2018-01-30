
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.gst.util.DoConnection"%>
<%@page import="java.sql.Connection"%>
<%
	if (session.getAttribute("userId") != null) {

		session.setAttribute("page", "sidebar");
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
		Connection con = DoConnection.getConnection();
		String fName = "", lName = "", role = "";
		PreparedStatement p = con
				.prepareStatement("select * from employee_master where username = ? ");
		p.setString(1, loginId);
		ResultSet r = p.executeQuery();
		while (r.next()) {
			fName = r.getString("first_name");
			lName = r.getString("last_name");
			role = r.getString("role");
		}
%>

<div class="sidebar-widget author-widget">
	<div class="media">
		<a class="media-left" href="#"> <img
			src="assets/img/avatars/3.jpg" class="img-responsive">
		</a>
		<div class="media-body">
			<div class="media-links">
				<a href="#"> -</a> <a href="./LogOut">Logout</a>
			</div>
			<div class="media-author"><%=fName%>&nbsp;<%=lName%></div>
		</div>
	</div>
</div>
<ul class="nav sidebar-menu">
	<li class="sidebar-label pt20">Menu</li>

	<li class="active"><a href="index.jsp"> <span
			class="glyphicon glyphicon-home"></span> <span class="sidebar-title">Dashboard</span>
	</a></li>





	<li class="sidebar-label pt15">Purchase &amp; Sales</li>
	<li><a class="accordion-toggle" href="#"> <span
			class="fa fa-columns"></span> <span class="sidebar-title">Sales</span>
			<span class="caret"></span>
	</a>
		<ul class="nav sub-nav">

			<!-- <a class="accordion-toggle" href="#"> <span
					class="fa fa-plus-square-o"></span> Sales Entry <span class="caret"></span> 
			</a>-->

			<li><a href="new-invoice.jsp"> New Sales </a></li>
			<li><a href="invoice-list.jsp"> Sales List </a></li>

		</ul></li>


	<li><a class="accordion-toggle" href="#"> <span
			class="glyphicon glyphicon-fire"></span> <span class="sidebar-title">Purchase</span>
			<span class="caret"></span>
	</a>
		<ul class="nav sub-nav">
			<li><a href="#"> <span class="glyphicon glyphicon-book"></span>
					New Purchase
			</a></li>
			<li><a href="#"> <span
					class="glyphicon glyphicon-modal-window"></span> Purchase List
			</a></li>
		</ul></li>


	<li class="sidebar-label pt15">Purchase &amp; Sales Payments</li>
	<li><a class="accordion-toggle" href="#"> <span
			class="fa fa-money" aria-hidden="true"></span> <span
			class="sidebar-title">Payments</span> <span class="caret"></span>
	</a>
		<ul class="nav sub-nav">
			<li><a href="salespay.jsp"> <span
					class="glyphicon glyphicon-book"></span> Sales Payment
			</a></li>
			<li><a href="#"> <span
					class="glyphicon glyphicon-modal-window"></span> Purchase Payment
			</a></li>
		</ul></li>



	<!-- payment history links -->

	<li><a class="accordion-toggle" href="#"> <span
			class="fa fa-money" aria-hidden="true"></span> <span
			class="sidebar-title">Payment History</span> <span class="caret"></span>
	</a>
		<ul class="nav sub-nav">
			<li><a href="salespayhistory.jsp"> <span
					class="glyphicon glyphicon-book"></span> Sales Payment History
			</a></li>
			<li><a href="#"> <span
					class="glyphicon glyphicon-modal-window"></span> Purchase Payment
					History
			</a></li>
		</ul></li>


	<!-- Purchase & sales payment history end -->



	<li class="sidebar-label pt20">
		<!-- Systems --> Vendor
	</li>
	<li><a class="accordion-toggle" href="#"> <span
			class="fa fa-diamond"></span> <span class="sidebar-title">Vendor</span>
			<span class="caret"></span>
	</a>
		<ul class="nav sub-nav">
			<li><a href="vendor-reg.jsp"> <span class="fa fa-cube"></span>
					New Vendor
			</a></li>
			<li><a href="vendor-list.jsp"> <span class="fa fa-desktop"></span>
					Vendor List
			</a></li>
		</ul></li>



	<li class="sidebar-label pt20">Masters</li>
	<li><a class="accordion-toggle" href="#"> <span
			class="glyphicon glyphicon-bell"></span> <span class="sidebar-title">Clients</span>
			<span class="caret"></span>
	</a>
		<ul class="nav sub-nav">
			<li><a href="client-new.jsp"> <span class="fa fa-warning"></span>
					New Client
			</a></li>
			<li><a href="client-list.jsp"> <span class="fa fa-spinner"></span>
					Client List
			</a></li>
		</ul></li>


	<li><a class="accordion-toggle" href="#"> <span
			class="glyphicon glyphicon-hdd"></span> <span class="sidebar-title">Material
		</span> <span class="caret"></span>
	</a>
		<ul class="nav sub-nav">
			<li><a href="new-material.jsp"> <span class="fa fa-magic"></span>
					Add New Material
			</a></li>
			<li><a href="material-list.jsp"> <span
					class="fa fa-exchange"></span> Material List
			</a></li>
		</ul></li>


	<li><a class="accordion-toggle" href="#"> <span
			class="glyphicon glyphicon-duplicate"></span> <span
			class="sidebar-title">Purchase Order </span> <span class="caret"></span>
	</a>
		<ul class="nav sub-nav">
			<li><a href="po-new.jsp"> <span class="fa fa-magic"></span>
					New PO
			</a></li>
			<li><a href="po-list.jsp"> <span class="fa fa-exchange"></span>
					PO List
			</a></li>
		</ul></li>


	<!-- <li><a class="accordion-toggle" href="#"> <span
			class="glyphicon glyphicon-duplicate"></span> <span
			class="sidebar-title">Purchase Order</span> <span class="caret"></span>
	</a>
		<ul class="nav sub-nav">
			<li><a class="accordion-toggle" href="#"> <span
					class="fa fa-desktop"></span> Basic <span class="caret"></span>
			</a>
				<ul class="nav sub-nav">
					<li><a href="pages_search-results.html">Search Results <span
							class="label label-xs bg-primary">New</span>
					</a></li>
					<li><a href="pages_gallery.html"> Gallery </a></li>
				</ul></li>
			<li><a class="accordion-toggle" href="#"> <span
					class="fa fa-usd"></span> Misc <span class="caret"></span>
			</a>
				<ul class="nav sub-nav">
					<li><a href="pages_invoice.html"> Printable Invoice </a></li>
					<li><a href="pages_blank.html"> Blank </a></li>
				</ul></li>
		</ul></li> -->

</ul>


<%
	} else {
		response.sendRedirect("login.jsp");
	}
%>