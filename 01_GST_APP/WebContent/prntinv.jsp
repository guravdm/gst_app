
<%
	if (session.getAttribute("userId") != null) {

		session.setAttribute("page", "prntinv");
		session.setMaxInactiveInterval(10 * 60);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>VIEW INVOICE</title>


<link rel='stylesheet' type='text/css'
	href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700'>

<link rel="stylesheet" type="text/css"
	href="assets/skin/default_skin/css/theme.css">

</head>
<body class="invoice-page">

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
	<div id="main">
		<jsp:include page="header.jsp"></jsp:include>


		<aside id="sidebar_left" class="nano nano-primary affix">
			<div class="sidebar-left-content nano-content">
				<%-- 
				<jsp:include page="sidebar-widget.jsp"></jsp:include> --%>
				<jsp:include page="sidebar.jsp"></jsp:include>

				<div class="sidebar-toggle-mini">
					<a href="#"> <span class="fa fa-sign-out"></span>
					</a>
				</div>

			</div>

		</aside>

		<section id="content_wrapper">
			<jsp:include page="topbar-drop.jsp"></jsp:include>
			<header id="topbar" class="ph10">
				<div class="topbar-left">
					<ul class="nav nav-list nav-list-topbar pull-left">
						<li class="active"><a href="index.jsp">Dashboard</a></li>
						<li><a href="#">List Item</a></li>
					</ul>
				</div>
				<div class="topbar-right hidden-xs hidden-sm">
					<a href="view_invoice.jsp"
						class="btn btn-default btn-sm light fw600 ml10"> <span
						class="fa fa fa-arrow-left"></span> Refresh
					</a>
				</div>
			</header>


			<section id="content" class="">
				<div class="panel invoice-panel">
					<div class="panel-heading">
						<span class="panel-title"> <span
							class="glyphicon glyphicon-print"></span> Printable Invoice
						</span>
						<div class="panel-header-menu pull-right mr10">
							<a href="new-invoice.jsp"><button type="button"
									class="btn btn-xs btn-default btn-gradient mr5">
									<i class="fa fa-plus-square pr5"></i> New Invoice
								</button> </a> <a href="javascript:window.print()"
								class="btn btn-xs btn-default btn-gradient mr5"> <i
								class="fa fa-print fs13"></i>
							</a>
							<div class="btn-group">
								<button type="button"
									class="btn btn-xs btn-default btn-gradient dropdown-toggle"
									data-toggle="dropdown">
									<span class="glyphicon glyphicon-cog"></span>
								</button>
								<ul class="dropdown-menu checkbox-persist pull-right text-left"
									role="menu">
									<li><a> <i class="fa fa-user"></i> View Profile
									</a></li>
									<li><a> <i class="fa fa-envelope-o"></i> Message
									</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="panel-body p20" id="invoice-item">
						<div class="row mb30">
							<div class="col-md-4">
								<div class="pull-left">
									<h1 class="lh10 mt10">INVOICE</h1>
									<h5 class="mn">Created: Nov 23 2013</h5>
									<h5 class="mn">
										Status: <b class="text-success">Paid - On Time</b>
									</h5>
								</div>
							</div>
							<div class="col-md-4">
								<img src="assets/img/logos/logo.png"
									class="img-responsive center-block mt10 mw200 hidden-xs"
									alt="AdminDesigns">
							</div>
							<div class="col-md-4">
								<div class="pull-right text-right">
									<h2 class="invoice-logo-text hidden lh10">AdminDesigns</h2>
									<h5>
										Sales Rep: <b class="text-primary">Michael Ronny</b>
									</h5>
								</div>
							</div>
						</div>
						<div class="row" id="invoice-info">
							<div class="col-md-4">
								<div class="panel panel-alt">
									<div class="panel-heading">
										<span class="panel-title"> <i class="fa fa-user"></i>
											Bill To:
										</span>
										<div class="panel-btns pull-right ml10">
											<span class="panel-title-sm"> Edit</span>
										</div>
									</div>
									<div class="panel-body">
										<address>
											<strong>Cannon Camera</strong> <br> 151 Sandy Ave, Suite
											200 <br> San Jose, CA 91503 <br> <abbr
												title="Phone">P:</abbr> (123) 456-7890
										</address>
									</div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="panel panel-alt">
									<div class="panel-heading">
										<span class="panel-title"> <i
											class="fa fa-location-arrow"></i> Ship To:
										</span>
										<div class="panel-btns pull-right ml10">
											<span class="panel-title-sm"> Edit</span>
										</div>
									</div>
									<div class="panel-body">
										<address>
											<strong>Amazon, Inc.</strong> <br> 795 Folsom Ave, Suite
											600 <br> San Francisco, CA 94107 <br> <abbr
												title="Phone">P:</abbr> (123) 456-7890
										</address>
									</div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="panel panel-alt">
									<div class="panel-heading">
										<span class="panel-title"> <i class="fa fa-info"></i>
											Invoice Details:
										</span>
										<div class="panel-btns pull-right ml10"></div>
									</div>
									<div class="panel-body">
										<ul class="list-unstyled">
											<li><b>Invoice #:</b> 58126332</li>
											<li><b>Invoice Date:</b> 10 Oct 2013</li>
											<li><b>Due Date:</b> 21 Dec 2013</li>
											<li><b>Terms:</b> Ten Forty</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="row" id="invoice-table">
							<div class="col-md-12">
								<table class="table table-striped table-bordered">
									<thead>
										<tr>
											<th>#</th>
											<th>Item</th>
											<th>Description</th>
											<th style="width: 135px;">#</th>
											<th>Rate</th>
											<th class="text-right pr10">Price</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><b>3</b></td>
											<td>Net Code Revamp</td>
											<td>Worked on Design and Structure (per hour)</td>
											<td>16</td>
											<td>$35.00</td>
											<td class="text-right pr10">$560.00</td>
										</tr>
										<tr>
											<td><b>1</b></td>
											<td>Developer Newsletter</td>
											<td>Year Subscription X2</td>
											<td>2</td>
											<td>$12.99</td>
											<td class="text-right pr10">$25.98</td>
										</tr>
										<tr>
											<td><b>3</b></td>
											<td>Admin Dashboard</td>
											<td>Design and implemention(per hour)</td>
											<td>16</td>
											<td>$35.00</td>
											<td class="text-right pr10">$560.00</td>
										</tr>
										<tr>
											<td><b>3</b></td>
											<td>Web Development</td>
											<td>Worked on Design and Structure (per hour)</td>
											<td>23</td>
											<td>$30.00</td>
											<td class="text-right pr10">$690.00</td>
										</tr>
										<tr>
											<td><b>1</b></td>
											<td>Developer Newsletter</td>
											<td>Year Subscription X2</td>
											<td>2</td>
											<td>$12.99</td>
											<td class="text-right pr10">$25.98</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="row" id="invoice-footer">
							<div class="col-md-12">
								<div class="pull-left mt20 fs15 text-primary">Thank you
									for your business.</div>
								<div class="pull-right">
									<table class="table table-bordered" id="invoice-summary">
										<thead>
											<tr>
												<th><b>Sub Total:</b></th>
												<th>$1375.98</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td><b>Payments</b></td>
												<td>(-)0.00</td>
											</tr>
											<tr>
												<td><b>Total</b></td>
												<td>$230.00</td>
											</tr>
											<tr>
												<td><b>Balance Due:</b></td>
												<td>$1375.98</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="clearfix"></div>
								<div class="invoice-buttons">
									<a href="javascript:window.print()"
										class="btn btn-default mr10"> <i class="fa fa-print pr5"></i>
										Print Invoice
									</a>
									<button class="btn btn-primary btn-gradient" type="button">
										<i class="fa fa-floppy-o pr5"></i> Save Invoice
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</section>
	</div>



	<script src="vendor/jquery/jquery-3.1.1.min.js"></script>
	<script src="vendor/jquery/jquery_migrate/jquery-migrate-3.0.0.min.js"></script>
	<script src="vendor/jquery/jquery_ui/jquery-ui.min.js"></script>

	<script src="assets/js/utility/utility.js"></script>
	<script src="assets/js/demo/demo.js"></script>
	<script src="assets/js/main.js"></script>
	<script type="text/javascript">
		jQuery(document).ready(function() {

			"use strict";

			// Init Theme Core    
			Core.init();

			// Init Demo JS 
			Demo.init();

		});
	</script>

</body>
</html>


<%
	} else {
		response.sendRedirect("login.jsp");
	}
%>