

<%
	if (session.getAttribute("userId") != null) {

		session.setAttribute("page", "salespay");
		session.setMaxInactiveInterval(10 * 60);
%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.gst.util.DoConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Payment List</title>

<link rel='stylesheet' type='text/css'
	href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700'>

<link rel="stylesheet" type="text/css"
	href="vendor/plugins/datatables/media/css/datatables.min.css">
<link rel="stylesheet" type="text/css"
	href="vendor/plugins/datatables/media/css/datatables_addons.min.css">

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
		<section id="content_wrapper">
			<jsp:include page="topbar-drop.jsp"></jsp:include>
			<header id="topbar" class="ph10">
				<div class="topbar-left">
					<ul class="nav nav-list nav-list-topbar pull-left">
						<li class="active"><a href="index.jsp">Dashboard</a></li>
					</ul>
				</div>
				<div class="topbar-right hidden-xs hidden-sm">
					<a href="salespay.jsp"
						class="btn btn-default btn-sm light fw600 ml10"> <span
						class="fa fa fa-arrow-left"></span> Refresh
					</a>
				</div>
			</header>
			<section id="content" class="table-layout animated fadeIn">




				<div class="tray tray-center">
					<div class="row">
						<div class="col-md-12">
							<div class="panel panel-visible" id="spy3">
								<div class="panel-heading">
									<div class="panel-title hidden-xs">
										<span class="glyphicon glyphicon-tasks"></span>Payment List <span
											style="float: right; margin-right: 20px;"></span>
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
									<i class="fa fa-check pr10"></i> <strong>Well done!</strong>
									You
									<%=session.getAttribute("smsg")%>
									<!-- <a href="#" class="alert-link">this important alert message</a> -->
									.
								</div>
								<%
									session.removeAttribute("smsg");
										}
								%>

								<div class="panel-body pn">
									<table style="font-size: 13px"
										class="table table-striped table-hover table-bordered"
										id="datatable3" cellspacing="0" width="100%">
										<thead>
											<tr>
												<th>#</th>
												<th>Invoice No</th>
												<th>Company Name</th>
												<th>Inv Printed Date</th>
												<th>Invoice Amount</th>
												<th>Payment Made</th>
												<th>Balance Amount</th>
											</tr>
										</thead>
										<tbody>
											<%
												Connection con = DoConnection.getConnection();
													PreparedStatement ps = con
															.prepareStatement("select * from v_pay_transactions ");
													ResultSet rs = ps.executeQuery();
													while (rs.next()) {
											%>
											<tr>
												<td><a
													href="madesalespay.jsp?invoiceId=<%=rs.getString("inviceId")%>&custCode=<%=rs.getString("clntId")%>&BalanceAmount=<%=rs.getString("BalanceAmount")%>&compname=<%=rs.getString("company_name")%>">Payment</a></td>
												<td><span class="label label-rounded label-danger"><%=rs.getString("inviceId")%></span></td>
												<td><%=rs.getString("company_name")%></td>
												<td><%=rs.getString("invoice_print_date")%></td>
												<td><%=rs.getString("InvoiceAmount")%></td>
												<td><%=rs.getString("PaymentMade")%></td>
												<td><%=rs.getString("BalanceAmount")%></td>
											</tr>
											<%
												}
											%>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>

			</section>
		</section>
	</div>


	<jsp:include page="footer-scripts.jsp"></jsp:include>

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
					// select: true
					// buttons: [{
					//         extend: "create",
					//         editor: editor
					//     }, {
					//         extend: "edit",
					//         editor: editor
					//     }, {
					//         extend: "remove",
					//         editor: editor
					// }]
					// "sDom": 't<"dt-panelfooter clearfix"ip>',
					// "oTableTools": {
					//     "sSwfPath": "vendor/plugins/datatables/extensions/TableTools/swf/copy_csv_xls_pdf.swf"
					// }
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
					// select: true
					// "aoColumnDefs": [{
					//     'bSortable': false,
					//     'aTargets': [-1]
					// }],
					// "oLanguage": {
					//     "oPaginate": {
					//         "sPrevious": "",
					//         "sNext": ""
					//     }
					// },
					// "iDisplayLength": 5,
					// "aLengthMenu": [
					//     [5, 10, 25, 50, -1],
					//     [5, 10, 25, 50, "All"]
					// ],
					// "sDom": '<"dt-panelmenu clearfix"Tfr>t<"dt-panelfooter clearfix"ip>',
					// "oTableTools": {
					//     "sSwfPath": "vendor/plugins/datatables/extensions/TableTools/swf/copy_csv_xls_pdf.swf"
					// }
					});

					// $('#datatable4').dataTable({
					//     "aoColumnDefs": [{
					//         'bSortable': false,
					//         'aTargets': [-1]
					//     }],
					//     "oLanguage": {
					//         "oPaginate": {
					//             "sPrevious": "",
					//             "sNext": ""
					//         }
					//     },
					//     "iDisplayLength": 5,
					//     "aLengthMenu": [
					//         [5, 10, 25, 50, -1],
					//         [5, 10, 25, 50, "All"]
					//     ],
					//     "sDom": 'T<"panel-menu dt-panelmenu"lfr><"clearfix">tip',

					//     "oTableTools": {
					//         "sSwfPath": "vendor/plugins/datatables/extensions/TableTools/swf/copy_csv_xls_pdf.swf"
					//     }
					// });

					// // Multi-Column Filtering
					// $('#datatable5 thead th').each(function() {
					//     var title = $('#datatable5 tfoot th').eq($(this).index()).text();
					//     $(this).html('<input type="text" class="form-control" placeholder="Search ' + title + '" />');
					// });

					// // DataTable
					// var table5 = $('#datatable5').DataTable({
					//     "sDom": 't<"dt-panelfooter clearfix"ip>',
					//     "ordering": false
					// });

					// // Apply the search
					// table5.columns().eq(0).each(function(colIdx) {
					//     $('input', table5.column(colIdx).header()).on('keyup change', function() {
					//         table5
					//             .column(colIdx)
					//             .search(this.value)
					//             .draw();
					//     });
					// });

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

					// // ROW GROUPING
					// var table7 = $('#datatable7').DataTable({
					//     "columnDefs": [{
					//         "visible": false,
					//         "targets": 2
					//     }],
					//     "order": [
					//         [2, 'asc']
					//     ],
					//     "sDom": 't<"dt-panelfooter clearfix"ip>',
					//     "displayLength": 25,
					//     "drawCallback": function(settings) {
					//         var api = this.api();
					//         var rows = api.rows({
					//             page: 'current'
					//         }).nodes();
					//         var last = null;

					//         api.column(2, {
					//             page: 'current'
					//         }).data().each(function(group, i) {
					//             if (last !== group) {
					//                 $(rows).eq(i).before(
					//                     '<tr class="row-label ' + group.replace(/ /g, '').toLowerCase() + '"><td colspan="5">' + group + '</td></tr>'
					//                 );
					//                 last = group;
					//             }
					//         });
					//     }
					// });

					// // Order by the grouping
					// $('#datatable7 tbody').on('click', 'tr.row-label', function() {
					//     var currentOrder = table7.order()[0];
					//     if (currentOrder[0] === 2 && currentOrder[1] === 'asc') {
					//         table7.order([2, 'desc']).draw();
					//     } else {
					//         table7.order([2, 'asc']).draw();
					//     }
					// });

					// $('#datatable8').DataTable({
					//     "sDom": 'Rt<"dt-panelfooter clearfix"ip>',
					// });

					// // COLLAPSIBLE ROWS
					// function format(d) {
					//     // `d` is the original data object for the row
					//     return '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">' +
					//         '<tr>' +
					//         '<td class="fw600 pr10">Full name:</td>' +
					//         '<td>' + d.name + '</td>' +
					//         '</tr>' +
					//         '<tr>' +
					//         '<td class="fw600 pr10">Extension:</td>' +
					//         '<td>' + d.extn + '</td>' +
					//         '</tr>' +
					//         '<tr>' +
					//         '<td class="fw600 pr10">Extra info:</td>' +
					//         '<td>And any further details here (images etc)...</td>' +
					//         '</tr>' +
					//         '</table>';
					// }

					// var table = $('#datatable9').DataTable({
					//     "sDom": 'Rt<"dt-panelfooter clearfix"ip>',
					//     "ajax": "vendor/plugins/datatables/examples/data_sources/objects.txt",
					//     "columns": [{
					//         "className": 'details-control',
					//         "orderable": false,
					//         "data": null,
					//         "defaultContent": ''
					//     }, {
					//         "data": "name"
					//     }, {
					//         "data": "position"
					//     }, {
					//         "data": "office"
					//     }, {
					//         "data": "salary"
					//     }],
					//     "order": [
					//         [1, 'asc']
					//     ]
					// });

					// // Add event listener for opening and closing details
					// $('#datatable9 tbody').on('click', 'td.details-control', function() {
					//     var tr = $(this).closest('tr');
					//     var row = table.row(tr);

					//     if (row.child.isShown()) {
					//         // This row is already open - close it
					//         row.child.hide();
					//         tr.removeClass('shown');
					//     } else {
					//         // Open this row
					//         row.child(format(row.data())).show();
					//         tr.addClass('shown');
					//     }
					// });

					// // MISC DATATABLE HELPER FUNCTIONS

					// // Add Placeholder text to datatables filter bar
					// $('.dataTables_filter input').attr("placeholder", "Enter Terms...");

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