
<%
	if (session.getAttribute("userId") != null) {

		session.setAttribute("page", "view-cust-mtrl-list");
		session.setMaxInactiveInterval(10 * 60);
%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.gst.util.DoConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Material List</title>

<link rel='stylesheet' type='text/css'
	href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700'>

<link rel="stylesheet" type="text/css"
	href="vendor/plugins/datatables/media/css/datatables.min.css">
<link rel="stylesheet" type="text/css"
	href="vendor/plugins/datatables/media/css/datatables_addons.min.css">

>

<jsp:include page="header-scripts.jsp"></jsp:include>
</head>
<body class="datatables-page" data-spy="scroll" data-target="#nav-spy"
	data-offset="300">
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
			<jsp:include page="sidebar-widget.jsp"></jsp:include>
			<jsp:include page="sidebar.jsp"></jsp:include>
			<div class="sidebar-toggle-mini">
				<a href="#"> <span class="fa fa-sign-out"></span>
				</a>
			</div>
		</div>
		</aside>
		<section id="content_wrapper"> <jsp:include
			page="topbar-drop.jsp"></jsp:include> <header id="topbar"
			class="ph10">
		<div class="topbar-left">
			<ul class="nav nav-list nav-list-topbar pull-left">
				<li class="active"><a href="index.jsp">Dashboard</a></li>
				<li><a href="#">List Item</a></li>
			</ul>
		</div>
		<div class="topbar-right hidden-xs hidden-sm">
			<a href="material-list.jsp"
				class="btn btn-default btn-sm light fw600 ml10"> <span
				class="fa fa fa-refresh"></span> Refresh
			</a>
		</div>
		</header> <section id="content" class="table-layout animated fadeIn">




		<div class="tray tray-center">
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-visible" id="spy3">
						<div class="panel-heading">
							<div class="panel-title hidden-xs">
								<span class="glyphicon glyphicon-tasks"></span>Material List <span
									style="float: right; margin-right: 20px;"><a
									href="new-material.jsp">New Material</a></span>
							</div>

						</div>


						<%
							session.setMaxInactiveInterval(10 * 20);
						%>

						<div class="panel-body pn">
							<table class="table table-striped table-hover table-bordered"
								id="datatable3" cellspacing="0" width="100%">
								<thead>
									<tr>
										<th>Client ID</th>
										<!-- <th>Company Name</th> -->
										<th>Material Name</th>
										<th>HSN Code</th>
										<th>UOM</th>
										<th>Created Date Time</th>
										<th>Edit / Delete</th>
									</tr>
								</thead>
								<tbody>
									<%
										Connection con = DoConnection.getConnection();
											PreparedStatement ps = con
													.prepareStatement("select * from MATERIAL_LIST where client_id = ?");
											ps.setString(1, request.getParameter("custcode"));
											ResultSet rs = ps.executeQuery();
											while (rs.next()) {
												int poStatus = 0;
												poStatus = rs.getInt("po_status");
												if (poStatus == 0) {
									%>
									<tr style="background-color: #36435a; color: white;">
										<td><span class="label label-rounded label-danger"><%=rs.getString("customerId")%></span></td>
										<%-- <td><%=rs.getString("company_name")%></td> --%>
										<td><%=rs.getString("material_name")%></td>
										<td><%=rs.getString("hsn_code")%></td>
										<td><%=rs.getString("uom")%></td>
										<td><span class="label label-rounded label-system"><%=rs.getString("updatedTime")%></span></td>
										<%-- <td><span style="text-align: justify;"><%=rs.getString("address")%></span></td> --%>

										<td><a class="fa fa-edit fa-lg" title="Edit"
											style="color: white;"
											href="edit-material.jsp?uId=<%=rs.getString("id")%>"><span></span></a>
											<span style="margin-left: 18px;"></span><a
											style="color: white;" class="fa fa-trash-o fa-lg"
											title="Delete" onclick="return confirm('Are you sure!?')"
											href="./DeleteMaterial?deleteId=<%=rs.getString("id")%>"><span></span></a>
											<span style="margin-left: 18px;"></span> <a
											style="color: white;" class="fa fa-plus fa-lg" title="Add PO"
											href="po-new.jsp?clientId=<%=rs.getString("client_id")%>"><span></span></a>
											<!-- <button class="btn btn-warning btn-alt btn-block"
												data-effect="mfp-sign">Sign Flip</button> --></td>
									</tr>
									<%
										} else {
									%>
									<tr>
										<td><span class="label label-rounded label-danger"><%=rs.getString("customerId")%></span></td>
										<td><%=rs.getString("material_name")%></td>
										<td><%=rs.getString("hsn_code")%></td>
										<td><%=rs.getString("uom")%></td>
										<td><span class="label label-rounded label-system"><%=rs.getString("updatedTime")%></span></td>
										<td><a class="fa fa-edit fa-lg" title="Edit"
											href="edit-material.jsp?uId=<%=rs.getString("id")%>"><span></span></a>
											<span style="margin-left: 18px;"></span><a
											class="fa fa-trash-o fa-lg" title="Delete"
											onclick="return confirm('Are you sure!?')"
											href="./DeleteMaterial?deleteId=<%=rs.getString("id")%>"><span></span></a>
											<span style="margin-left: 18px;"></span> <a
											class="fa fa-plus fa-lg" title="Add PO" href="#"><span></span></a>
											<!-- <button class="btn btn-warning btn-alt btn-block"
												data-effect="mfp-sign">Sign Flip</button> --></td>
									</tr>
									<%
										}
											}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		</section> </section>

	</div>





	<jsp:include page="footer-scripts.jsp"></jsp:include>

	<script src="vendor/plugins/magnific/jquery.magnific-popup.js"></script>

	<script src="vendor/plugins/datatables/media/js/datatables.min.js"></script>

	<script
		src="vendor/plugins/datatables/media/js/datatables_addons.min.js"></script>
	<script
		src="vendor/plugins/datatables/media/js/datatables_editor.min.js"></script>



	<script src="assets/js/utility/utility.js"></script>
	<script src="assets/js/demo/demo.js"></script>
	<script src="assets/js/main.js"></script>

	<script>
		$(document).ready(function() {

			$('#fadeOutFun').fadeOut(5000, 'swing', function() {
				//callback function after animation finished
				$("#fadeOutFun").attr('value', 'fadeOut() is now Complete');
			});
		});
	</script>


	<script type="text/javascript">
		jQuery(document).ready(
				function() {

					"use strict";

					// Init Theme Core    
					Core.init();

					// Init Demo JS  
					Demo.init();

					// Init DataTables
					$('#datatable').DataTable({
						// dom: "Bfrtip",
						// dom: "rtip",
						dom : 'rt<"bottom"p>'
					});

					$('#datatable2').dataTable({
						// dom: "Bfrtip",
						// dom: "rtip",
						dom : '<"top"fl>rt<"bottom"ip>'
					// select: true
					});

					$('#datatable3').dataTable({
						dom : '<"top"Bf>rt<"bottom"ip>',
						buttons : [ 'copy', 'excel', 'pdf', 'csv', 'print' ]
					});

					// ABC FILTERING
					var table6 = $('#datatable6').DataTable({
						// dom: 't<"dt-panelfooter clearfix"ip>',
						dom : 'rt<"bottom pv10"ip>',
						"ordering" : false
					});

					var alphabet = $('<div class="dt-abc-filter"/>').append(
							'<span class="abc-label">Search: </span> ');
					var columnData = table6.column(0).data();
					var bins = bin(columnData);

					$('<span class="active"/>').data('letter', '').data(
							'match-count', columnData.length).html('None')
							.appendTo(alphabet);

					for (var i = 0; i < 26; i++) {
						var letter = String.fromCharCode(65 + i);

						$('<span/>').data('letter', letter).data('match-count',
								bins[letter] || 0).addClass(
								!bins[letter] ? 'empty' : '').html(letter)
								.appendTo(alphabet);
					}

					$('#datatable6').parents('.panel').find('.panel-menu')
							.addClass('dark').html(alphabet);

					alphabet.on('click', 'span', function() {
						alphabet.find('.active').removeClass('active');
						$(this).addClass('active');

						_alphabetSearch = $(this).data('letter');
						table6.draw();
					});

					var info = $('<div class="alphabetInfo"></div>').appendTo(
							alphabet);

					var _alphabetSearch = '';

					$.fn.dataTable.ext.search.push(function(settings,
							searchData) {
						if (!_alphabetSearch) {
							return true;
						}
						if (searchData[0].charAt(0) === _alphabetSearch) {
							return true;
						}
						return false;
					});

					function bin(data) {
						var letter, bins = {};
						for (var i = 0, ien = data.length; i < ien; i++) {
							letter = data[i].charAt(0).toUpperCase();

							if (bins[letter]) {
								bins[letter]++;
							} else {
								bins[letter] = 1;
							}
						}
						return bins;
					}

				});
	</script>

</body>
</html>

<%
	if (con != null) {
			con.close();
		}
	} else {
		response.sendRedirect("login.jsp");
	}
%>