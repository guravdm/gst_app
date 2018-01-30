
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%
	if (session.getAttribute("userId") != null) {

		session.setAttribute("page", "invoice-list");
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
<title>Invoice List</title>

<link rel='stylesheet' type='text/css'
	href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700'>

<link rel="stylesheet" type="text/css"
	href="vendor/plugins/magnific/magnific-popup.css">

<link rel="stylesheet" type="text/css"
	href="assets/skin/default_skin/css/theme.css">

<link rel="stylesheet" type="text/css"
	href="assets/admin-tools/admin-forms/css/admin-forms.css">

<link rel="stylesheet" type="text/css"
	href="vendor/plugins/datatables/media/css/datatables.min.css">
<link rel="stylesheet" type="text/css"
	href="vendor/plugins/datatables/media/css/datatables_addons.min.css">

<jsp:include page="header-scripts.jsp"></jsp:include>

<style type="text/css">
input#IdInvoice {
	height: 35px;
	width: 205%;
	line-height: 1px;
	margin: 0px;
	box-sizing: border-box;
	-webkit-border-after-color: red;
}

input#DateOfInvoice {
	height: 35px;
	width: 209%;
	line-height: 1px;
	margin: 0px;
	box-sizing: border-box;
	-webkit-border-after-color: red;
}
</style>

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
			<a href="invoice-list.jsp"
				class="btn btn-default btn-sm light fw600 ml10"> <span
				class="fa fa fa-arrow-left"></span> Refresh
			</a>
		</div>
		</header> <section id="content" class="table-layout animated fadeIn">




		<div class="tray tray-center">

			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-visible" id="spy3">
						<div class="panel-heading">
							<div class="panel-title hidden-xs">
								<span class="glyphicon glyphicon-tasks"></span>Invoice List <span
									style="float: right; margin-right: 20px;"><a
									href="new-invoice.jsp">New Invoice</a></span>
							</div>
						</div>


						<%
							session.setMaxInactiveInterval(10 * 60);

								if (session.getAttribute("smsg") != null) {
						%>
						<div id="fadeOutFun"
							class="alert alert-micro alert-border-left alert-success alert-dismissable">
							<button type="button" class="close" data-dismiss="alert"
								aria-hidden="true">×</button>
							<i class="fa fa-check pr10"></i> <strong>Well done!</strong> You
							<%=session.getAttribute("smsg")%>
						</div>
						<%
							session.removeAttribute("smsg");
								}
						%>

						<div class="panel-body pn">
							<table class="table table-striped table-hover table-bordered"
								id="datatable3" cellspacing="0" width="100%">
								<thead>
									<tr>
										<th>Invoice ID</th>
										<th>Company Name</th>
										<th>Sub Total</th>
										<th>SGST</th>
										<th>CGST</th>
										<th>IGST</th>
										<th>Grand Total</th>
										<th>Created Date Time</th>
										<th>view</th>
									</tr>
								</thead>
								<tbody>
									<%
										int cnt = 0;
											Connection con = DoConnection.getConnection();
											/* PreparedStatement ps = con
													.prepareStatement("select * from v_inv_invdetails"); */
											/* PreparedStatement ps = con
													.prepareStatement("select * from V_INV_LIST_PENDING_SHW"); */

											PreparedStatement ps = con
													.prepareStatement("select * from V_LIST_OF_INVOICE");
											/* PreparedStatement ps = con
													.prepareStatement("Select i.id as invoiceNo, id.id as idDetails, i.subtotal, i.clientid as clntId, i.grossamount, i.challn_no, i.cgst_amnt, i.sgst_amnt, i.igst_amnt, i.print_status, i.outward_status, IFNULL(i.newprint_date,'NA') as newprint_date, i.print_count, i.updatedTime, id.invoiceId, id.printed, cm.id, cm.client_id, cm.company_name, i.clientId, i.invoice_print_date from Invoice i LEFT OUTER JOIN invoicedetails id ON i.id = id.invoiceId, client_master cm where i.clientid = cm.id and i.newprint_date >= DATE_ADD(now(), INTERVAL -1 QUARTER) GROUP BY i.id order by i.newprint_date asc"); */
											ResultSet rs = ps.executeQuery();
											while (rs.next()) {
												int printStatus = 0;

												cnt++;
												printStatus = rs.getInt("print_status");
												if (printStatus == 0) {
									%>
									<tr style="background-color: #36435a; color: white;">
										<td><span class="label label-rounded label-danger"><%=rs.getString(1)%></span></td>
										<td><%=rs.getString("company_name")%></td>
										<td>
											<%
												if (rs.getString("subtotal") != null) {
											%> <%=rs.getString("subtotal")%> <%
 	}
 %>
										</td>
										<td>
											<%
												if (rs.getString("sgst_amnt") != null) {
											%> <%=rs.getString("sgst_amnt")%> <%
 	}
 %>
										</td>
										<td>
											<%
												if (rs.getString("cgst_amnt") != null) {
											%> <%=rs.getString("cgst_amnt")%> <%
 	}
 %>
										</td>
										<td>
											<%
												if (rs.getString("igst_amnt") != null) {
																rs.getString("igst_amnt");
															}
											%>
										</td>
										<td>
											<%
												if (rs.getString("grossamount") != null) {
																rs.getString("grossamount");
															}
											%>
										</td>
										<td><span class=""><%=rs.getString("invoice_print_date")%></span></td>
										<td><a href="#" style="color: white;"><i
												class="fa fa-eye" aria-hidden="true"></i></a> &nbsp;&nbsp; <a
											href="edit-invoice.jsp?clientName=<%=rs.getString("clientId")%>&invsUniqId=<%=rs.getString(1)%>&materialName="
											style="color: white;"><i class="fa fa-pencil"
												aria-hidden="true"></i></a></td>



										<%-- <% 
										
										 remove code cause duplicate records were insrting
												<td><a href="#" style="color: white;"><i
												class="fa fa-eye" aria-hidden="true"></i></a> &nbsp;&nbsp; <a
											href="addInvoiceDetails?clientName=<%=rs.getString("clientId")%>&invsUniqId=<%=rs.getString(1)%>&materialName="
											style="color: white;"><i class="fa fa-pencil"
												aria-hidden="true"></i></a></td>
												%> --%>
									</tr>
									<%
										} else {
									%>
									<tr>
										<td><span class="label label-rounded label-danger"><%=rs.getString(1)%></span></td>
										<td><%=rs.getString("company_name")%></td>
										<td><%=rs.getString("subtotal")%></td>
										<td><%=rs.getString("sgst_amnt")%></td>
										<td><%=rs.getString("cgst_amnt")%></td>
										<td><%=rs.getString("igst_amnt")%></td>
										<td><%=rs.getString("grossamount")%></td>
										<%
											Date d = rs.getDate("newprint_date");
														SimpleDateFormat s = new SimpleDateFormat("dd-MM-yyyy");
														String a = s.format(d);
										%>
										<td><span class=""><%=a%></span></td>
										<td><a
											href="view_invoice.jsp?viewInvId=<%=rs.getString(1)%>"><i
												class="fa fa-eye" aria-hidden="true"></i></a> &nbsp;&nbsp;<a
											href="change-inv-date.jsp?viewInvId=<%=rs.getString(1)%>"><i
												class="fa fa-pencil" aria-hidden="true"></i></a></td>
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

	<script src="vendor/plugins/datatables/media/js/datatables.min.js"></script>

	<script
		src="vendor/plugins/datatables/media/js/datatables_addons.min.js"></script>
	<script
		src="vendor/plugins/datatables/media/js/datatables_editor.min.js"></script>

	<script src="vendor/plugins/magnific/jquery.magnific-popup.js"></script>

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

		$('#datatable3').slide();
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