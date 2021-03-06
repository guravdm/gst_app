

<%@page import="java.util.TimeZone"%>
<%
	if (session.getAttribute("userId") != null) {

		session.setAttribute("page", "index");
		session.setMaxInactiveInterval(10 * 60);

		Calendar now = Calendar.getInstance(); // Gets the current date and time
		int year = now.get(Calendar.YEAR);
		Connection con = DoConnection.getConnection();
		Calendar localCalendar = Calendar.getInstance(TimeZone
				.getDefault());
		int currentMonth = localCalendar.get(Calendar.MONTH) + 1;
		int minusOneMonth = localCalendar.get(Calendar.MONTH) - 0;
		int minusTwoMonth = localCalendar.get(Calendar.MONTH) - 1;
%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.gst.util.DoConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dashboard</title>

<jsp:include page="header-scripts.jsp"></jsp:include>

<link rel="stylesheet" type="text/css"
	href="assets/skin/default_skin/css/theme.css">

<link rel="stylesheet" type="text/css"
	href="assets/admin-tools/admin-forms/css/admin-forms.css">

<link rel="stylesheet" type="text/css"
	href="assets/fonts/zocial/zocial.css">

<style type="text/css">
.card.card-primary {
	background: #024a88;
}

.info-box {
	color: #fff;
}

.card, .card .card-header {
	border: none;
	border-radius: 0;
}

.card {
	overflow: hidden;
	box-shadow: 1px 1px 5px 0 rgba(0, 0, 0, .25);
}

.card {
	position: relative;
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-orient: vertical;
	-webkit-box-direction: normal;
	-ms-flex-direction: column;
	flex-direction: column;
	min-width: 0;
	word-wrap: break-word;
	background-color: #fff;
	background-clip: border-box;
	border: 1px solid rgba(0, 0, 0, .125);
	border-radius: .25rem;
}

.ytd {
	margin-bottom: 10px;
	margin-right: 2%;
	color: #bd2e8c;
	cursor: pointer;
	/* background-color: #51566c;
	color: white; */
}
</style>










</head>
<body class="dashboard-page sb-l-o sb-r-c">


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
	<%-- <%=loginId%> --%>

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

		<!-- Dashboard actual content start -->

		<section id="content_wrapper">
			<jsp:include page="topbar-drop.jsp"></jsp:include>
			<header id="topbar" class="ph10">
				<div class="topbar-left">
					<ul class="nav nav-list nav-list-topbar pull-left">
						<li class="active"><a href="index.jsp">Dashboard</a></li>
					</ul>
				</div>
				<div class="topbar-right hidden-xs hidden-sm">
					<a href="index.jsp" class="btn btn-default btn-sm light fw600 ml10">
						<span class="fa fa fa-refresh"></span> Refresh
					</a>
				</div>
			</header>
			<section id="content" class="animated fadeIn">


				<%
					session.setMaxInactiveInterval(10 * 60);

						if (session.getAttribute("alert") != null) {
				%>
				<div id="fadeOutFun"
					class="alert alert-micro alert-border-left alert-danger alert-dismissable">
					<button type="button" class="close" data-dismiss="alert"
						aria-hidden="true">�</button>
					<i class="fa fa-check pr10"></i> <strong> <%=session.getAttribute("alert")%>!
					</strong>
				</div>
				<%
					session.removeAttribute("alert");
						}

						String invoiceCount = "", totInvYear = "";

						PreparedStatement pe = con
								.prepareStatement("SELECT count(*) FROM invoice where YEAR(invoice_print_date) = ?");
						pe.setInt(1, year);
						ResultSet re = pe.executeQuery();
						while (re.next()) {
							totInvYear = re.getString(1);
						}
				%>

				<div class="row">
					<span id="btnsYearly" class="pull-right ytd"><b>Show YTD</b></span>
				</div>
				<div class="row" id="yearlyData">
					<div class="col-sm-3 col-xl-3">
						<div class="panel panel-tile text-center br-a br-grey">
							<div class="panel-body">
								<h1 class="fs30 mt5 mbn"><%=totInvYear%></h1>
								<h6 class="text-system">TOTAL SALES</h6>
							</div>
							<div class="panel-footer br-t p12">
								<span class="fs11"> <i class="fa fa-arrow-up pr5"></i> <!-- 3%
									INCREASE --> <b>1 Year Data</b>
								</span>
							</div>
						</div>
					</div>
					<div class="col-sm-3 col-xl-3">
						<div class="panel panel-tile text-center br-a br-grey">
							<div class="panel-body">

								<%
									String yearlyGross = "";
										Integer paidYearlyAmnt = 0;
										Integer yearPaid = 0;
										PreparedStatement q = con
												.prepareStatement("SELECT sum(pd.PaymentAmount) as PaymentAmount, sum((i.grossamount) - (pd.PaymentAmount)) as outStanding, sum(pd.balance_amnt) as balance_amnt FROM invoice i ,sales_pay_details pd where pd.invoiceId = i.id and YEAR(pd.createdTime) = ?");
										q.setInt(1, year);
										ResultSet rop = q.executeQuery();
										while (rop.next()) {
											yearPaid = rop.getInt(1);
										}

										PreparedStatement po = con
												.prepareStatement("SELECT sum(grossamount) FROM invoice where YEAR(invoice_print_date) = ?");
										po.setInt(1, year);
										ResultSet ro = po.executeQuery();
										while (ro.next()) {
											yearlyGross = ro.getString(1);
										}
										paidYearlyAmnt = Integer.parseInt(yearlyGross) - yearPaid;
								%>


								<%
									if (yearlyGross == null) {
								%>
								<h1 class="fs30 mt5 mbn">0</h1>
								<%
									} else {
								%>
								<h1 class="fs30 mt5 mbn"><%=yearlyGross%></h1>
								<%
									}
								%>

								<h6 class="text-success">TOTAL SALES GROSS</h6>
							</div>
							<div class="panel-footer br-t p12">
								<span class="fs11"> <i class="fa fa-arrow-up pr5"></i> <!-- 2.7% INCREASE -->
									<b>1 YTD</b>
								</span>
							</div>
						</div>
					</div>

					<div class="col-sm-3 col-xl-3">
						<div class="panel panel-tile text-center br-a br-grey">
							<div class="panel-body">
								<h1 class="fs30 mt5 mbn"><%=yearPaid%></h1>
								<h6 class="text-danger">
									Paid &map;
									<%=paidYearlyAmnt%>
									is Remaining
								</h6>
							</div>
							<div class="panel-footer br-t p12">
								<span class="fs11"> <i
									class="fa fa-arrow-down pr5 text-danger"></i> <b>1 YTD</b>
								</span>
							</div>
						</div>
					</div>


					<div class="col-sm-3 col-xl-3">
						<div class="panel panel-tile text-center br-a br-grey">
							<%
								String yearlyGST = "";
									PreparedStatement po1 = con
											.prepareStatement("SELECT ROUND(sum(sgst_amnt + igst_amnt + cgst_amnt),0) as totalGST FROM invoice where YEAR(invoice_print_date) = ?");
									po1.setInt(1, year);
									ResultSet ro1 = po1.executeQuery();
									while (ro1.next()) {
										yearlyGST = ro1.getString(1);
									}
							%>
							<div class="panel-body">
								<%
									if (yearlyGST != null) {
								%>
								<h1 class="fs30 mt5 mbn"><%=yearlyGST%></h1>
								<%
									} else {
								%>
								<h1 class="fs30 mt5 mbn">0</h1>
								<%
									}
								%>
								<h6 class="text-warning">Total GST</h6>
							</div>
							<div class="panel-footer br-t p12">
								<span class="fs11"> <i
									class="fa fa-arrow-up pr5 text-success"></i> <b>GST</b>
								</span>
							</div>
						</div>
					</div>

				</div>



				<%-- <%
				below 4 KPI BOXES
				%> --%>

				<%
					Integer grossP = 0;
						int createdMonth = 0;
						PreparedStatement l = con
								.prepareStatement("select month(createdTime) as month from invoice where month(createdTime) = ?");
						l.setInt(1, currentMonth);
						ResultSet rk = l.executeQuery();
						while (rk.next()) {
							createdMonth = rk.getInt("month");
						}
						if (createdMonth == currentMonth) {
				%>


				<div class="row">
					<div class="col-sm-3">
						<div class="panel panel-tile text-center br-a br-light">
							<%
								/* PreparedStatement pm = con
																																																																																		.prepareStatement("SELECT count(*) FROM invoice where invoice_print_date >= DATE_ADD(now(), INTERVAL -1 MONTH)"); */
										PreparedStatement pm = con
												.prepareStatement("SELECT count(*) FROM invoice where MONTH(invoice_print_date) = ?");
										pm.setInt(1, currentMonth);
										ResultSet rm = pm.executeQuery();
										// System.out.println(pm);
										while (rm.next()) {
											invoiceCount = rm.getString(1);
										}
							%>
							<div class="panel-body bg-light">
								<h1 class="fs35 mbn"><%=invoiceCount%></h1>
								<h6 class="text-system">INVOICE</h6>
							</div>
							<div class="panel-footer bg-light dark br-t br-light p12">
								<span class="fs11"> <i class="fa fa-arrow-up"></i> 1
									Months
								</span>
							</div>
						</div>
					</div>


					<div class="col-sm-3">
						<div class="panel panel-tile text-center">
							<div class="panel-body bg-info light">

								<%
									String twoGrossAmount = "";
											Integer absa = 0;

											PreparedStatement outs = con
													.prepareStatement("SELECT sum(pd.PaymentAmount) as PaymentAmount, sum((i.grossamount) - (pd.PaymentAmount)) as outStanding, sum(pd.balance_amnt) as balance_amnt FROM invoice i ,sales_pay_details pd where pd.invoiceId = i.id and MONTH(pd.createdTime) = ?");
											outs.setInt(1, currentMonth);
											ResultSet rou = outs.executeQuery();
											while (rou.next()) {
												absa = rou.getInt(1);
											}
											PreparedStatement ps1 = con
													.prepareStatement("SELECT ROUND(sum(grossamount),0) as totalGrossAmnt FROM invoice where MONTH(invoice_print_date) = ?");
											ps1.setInt(1, currentMonth);
											ResultSet rs1 = ps1.executeQuery();
											while (rs1.next()) {
												twoGrossAmount = rs1.getString(1);
											}

											grossP = Integer.parseInt(twoGrossAmount) - absa;
								%>

								<h1 class="fs35 mbn"><%=grossP%></h1>
								<h6 class="text-white">GROSS AMOUNT CONVERSIONS</h6>
							</div>
							<div class="panel-footer bg-info br-n p12">
								<span class="fs11"> <i class="fa fa-arrow-up pr5"></i> <b>
										1 Months</b>
								</span>
							</div>
						</div>
					</div>


					<div class="col-sm-3">
						<div class="panel panel-tile text-center">
							<div class="panel-body bg-success light">
								<h1 class="fs35 mbn"><%=absa%></h1>
								<h6 class="text-white">Paid Amount</h6>
							</div>
							<div class="panel-footer bg-success br-n p12">
								<span class="fs11"> <i class="fa fa-arrow-up pr5"></i> <b>
										1 Months</b>
								</span>
							</div>
						</div>
					</div>



					<div class="col-sm-3">
						<div class="panel panel-tile text-center">
							<div class="panel-body bg-primary light">
								<%
									String twoMonthGST = "";
											PreparedStatement ps = con
													.prepareStatement("SELECT ROUND(sum(sgst_amnt + igst_amnt + cgst_amnt),0) as totalGST FROM invoice where MONTH(invoice_print_date) = ?");
											ps.setInt(1, currentMonth);
											ResultSet rs = ps.executeQuery();
											while (rs.next()) {
												twoMonthGST = rs.getString(1);
											}
								%>
								<h1 class="fs35 mbn"><%=twoMonthGST%></h1>
								<h6 class="text-white">GST CONVERSIONS</h6>
							</div>
							<div class="panel-footer bg-primary br-n p12">
								<span class="fs11"> <i class="fa fa-arrow-up pr5"></i> <b>
										1 Months</b>
								</span>
							</div>
						</div>
					</div>


				</div>
				<%
					} else {
				%>
				<div class="alert alert-danger">
					None invoices created in this month. <a class="alert-link"
						href="invoice-list.jsp">New Invoice</a>
				</div>
				<%
					}
				%>
				<!-- END KPI BOXES  -->

				<!-- Prevoius monthly records -->



				<%-- <div class="row mb10">
					<div class="col-sm-6 col-md-3">
						<div class="panel bg-alert-primarys of-h mb10">
							<div class="pn pl20 p5">
								<h2 class="mt15 lh15">
									<b><%=invoiceCount%></b>
								</h2>
								<h5 class="text-mutedss">Invoices</h5>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-md-3">
						<div class="panel bg-info-dangers of-h mb10">
							<div class="pn pl20 p5">
								<h2 class="mt15 lh15">
									<b>5500</b>
								</h2>
								<h5 class="text-mutedss">Due Amount</h5>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-md-3">
						<div class="panel bg-info-thirds of-h mb10">
							<div class="pn pl20 p5">
								<h2 class="mt15 lh15">
									<b>12000</b>
								</h2>
								<h5 class="text-mutedss">Amount</h5>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-md-3">
						<div class="panel bg-info-fourth of-h mb10">
							<div class="pn pl20 p5">
								<h2 class="mt15 lh15">
									<b>714</b>
								</h2>
								<h5 class="text-mutedss">GST Amount</h5>
							</div>
						</div>
					</div>
				</div> --%>


				<div class="row">
					<div class="col-md-7">
						<div class="panel">
							<div class="panel-heading">
								<span class="panel-title text-info fw600"> <i
									class="fa fa-pencil hidden"></i> Sales Chart <strong><%=year%></strong>
								</span>
							</div>

							<div>
								<span id="container_two"
									style="width: 100%; height: 300px; margin: auto;"></span>
							</div>
						</div>
					</div>
					<div class="col-md-5">
						<div class="panel">
							<div class="panel-heading">
								<span class="panel-title fw600 text-info"> Sales of the
									year of <b><%=year%></b>
								</span>
							</div>
							<div class="panel-body pn">
								<div id="container_pieChart"
									style="width: 100%; height: 340px; margin: 0 auto"></div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</section>
	</div>



	<jsp:include page="footer-scripts.jsp"></jsp:include>


	<script src="assets/js/utility/utility.js"></script>
	<script src="assets/js/demo/demo.js"></script>
	<script src="assets/js/main.js"></script>

	<script src="assets/js/demo/widgets.js"></script>

	<script src="assets/js/Chart.min.js"></script>

	<script src="chartjs/highcharts.js"></script>
	<script src="chartjs/exporting.js"></script>


	<script>
		$(document).ready(function() {

			$('#fadeOutFun').fadeOut(20900, 'swing', function() {
				//callback function after animation finished
				$("#fadeOutFun").attr('value', 'fadeOut() is now Complete');
			});
		});
	</script>


	<%
		/* String jan = "", feb = "", mar = "", apr = "", may = "", jun = "", jul = "", aug = "", sep = "", oct = "", nov = "", dec = ""; */
			float janPer = 0f, febPer = 0f, marPer = 0f, aprPer = 0f, mayPer = 0f, junPer = 0f, julyPer = 0f, augPer = 0f, sepPer = 0f, octPer = 0f, novPer = 0f, decPer = 0f;
			float jan = 0f, feb = 0f, mar = 0f, apr = 0f, may = 0f, jun = 0f, jul = 0f, aug = 0f, sep = 0f, oct = 0f, nov = 0f, dec = 0f;
			String totalInv = "", totalPaidInvamnt = "", totalQuot = "", acceptQuotat = "", rejectQuotat = "";
			String percentage = "";
			float grosAmnt = 0f;
			try {

				// System.out.println("\n current year is: " + year);

				/* PreparedStatement p = con
						.prepareStatement("SELECT sum(paymentamount) as total FROM paymentdetails"); */
				PreparedStatement p = con
						.prepareStatement(" SELECT SUM(IF(month = '1', total, 0))  AS 'Jan', SUM(IF(month = '2', total, 0))  AS 'Feb', SUM(IF(month = '3', total, 0))  AS 'Mar', SUM(IF(month = '4', total, 0))  AS 'Apr', SUM(IF(month = '5', total, 0))  AS 'May', SUM(IF(month = '6', total, 0))  AS 'Jun',  SUM(IF(month = '7', total, 0))  AS 'Jul', SUM(IF(month = '8', total, 0))  AS 'Aug', SUM(IF(month = '9', total, 0))  AS 'Sep', SUM(IF(month = '10', total, 0)) AS 'Oct', SUM(IF(month = '11', total, 0)) AS 'Nov', SUM(IF(month = '12', total, 0)) AS 'Dec'  FROM (SELECT Month(invoice_print_date) AS month, SUM(grossamount) AS total FROM invoice WHERE  Year(invoice_print_date) = ? GROUP  BY Month(invoice_print_date)) AS e");
				p.setInt(1, year);
				ResultSet r = p.executeQuery();
				//	System.out.println("\n current query is: " + p);
				while (r.next()) {
					jan = r.getFloat(1);
					feb = r.getFloat(2);
					mar = r.getFloat(3);
					apr = r.getFloat(4);
					may = r.getFloat(5);
					jun = r.getFloat(6);
					jul = r.getFloat(7);
					aug = r.getFloat(8);
					sep = r.getFloat(9);
					oct = r.getFloat(10);
					nov = r.getFloat(11);
					dec = r.getFloat(12);
				}

				PreparedStatement per = con
						.prepareStatement("SELECT ROUND(IFNULL(sum(grossamount),0),2) as grossamount FROM invoice where YEAR(invoice_print_date) = ?");
				per.setInt(1, year);
				ResultSet rper = per.executeQuery();
				// System.out.println("\n current query is: " + per);
				while (rper.next()) {
					grosAmnt = rper.getFloat(1);
					/* janPer = (Math.round(jan / grosAmnt)); */
					janPer = jan / grosAmnt;
					febPer = feb / grosAmnt;
					marPer = mar / grosAmnt;
					aprPer = apr / grosAmnt;
					mayPer = may / grosAmnt;
					junPer = jun / grosAmnt;
					julyPer = jul / grosAmnt;
					augPer = aug / grosAmnt;
					sepPer = sep / grosAmnt;
					octPer = oct / grosAmnt;
					novPer = nov / grosAmnt;
					decPer = dec / grosAmnt;

				}
				/* System.out.println("\n percentage of Oct :" + oct + "\t "
						+ grosAmnt + "\t" + sepPer + "\n"); */
			} catch (Exception ee) {
				ee.printStackTrace();
			}
	%>


	<script type="text/javascript">
		jQuery(document).ready(function() {

			"use strict";

			// Init Theme Core    
			Core.init();

			// Init Demo JS  
			Demo.init();

			// This page contains more Initilization Javascript than normal.
			// As a result it has its own js page. See charts.js for more info
			demoHighCharts.init();

		});
	</script>








	<script>
		Highcharts
				.chart(
						'container_two',
						{
							chart : {
								type : 'column'
							},
							title : {
								text : 'SALES & PURCHASE ANALYSIS'
							},
							subtitle : {
							/* text : 'Source: WorldClimate.com' */
							},
							xAxis : {
								categories : [ 'Jan', 'Feb', 'Mar', 'Apr',
										'May', 'Jun', 'Jul', 'Aug', 'Sep',
										'Oct', 'Nov', 'Dec' ],
								crosshair : true
							},
							yAxis : {
								min : 0,
								title : {
									text : 'SALES & PURCHASE Analysis'
								}
							},
							tooltip : {
								headerFormat : '<span style="font-size:10px">{point.key}</span><table>',
								pointFormat : '<tr><td style="color:{series.color};padding:0">{series.name}: </td>'
										+ '<td style="padding:0"><b>{point.y:.1f}</b></td></tr>',
								footerFormat : '</table>',
								shared : true,
								useHTML : true
							},
							plotOptions : {
								column : {
									pointPadding : 0.2,
									borderWidth : 0
								}
							},
							series : [
									{
										name : 'Sales',
										data : [
	<%=jan%>
		,
	<%=feb%>
		,
	<%=mar%>
		,
	<%=apr%>
		,
	<%=may%>
		,
	<%=jun%>
		,
	<%=jul%>
		,
	<%=aug%>
		,
	<%=sep%>
		,
	<%=oct%>
		,
	<%=nov%>
		,
	<%=dec%>
		]

									},

									{
										name : 'Purchase',
										data : [ 42.4, 33.2, 34.5, 39.7, 52.6,
												75.5, 57.4, 60.4, 47.6, 39.1,
												46.8, 25000.00 ]

									} ]
						});

		// Make monochrome colors
		var pieColors = (function() {
			var colors = [], base = Highcharts.getOptions().colors[0], i;

			for (i = 0; i < 50; i += 1) {
				// Start out with a darkened base color (negative brighten), and end
				// up with a much brighter color
				colors
						.push(Highcharts.Color(base).brighten((i - 8) / 18)
								.get());
			}
			return colors;
		}());

		// Build the chart
		Highcharts
				.chart(
						'container_pieChart',
						{
							chart : {
								plotBackgroundColor : null,
								plotBorderWidth : null,
								plotShadow : false,
								type : 'pie'
							},
							title : {
								text : 'Total Sales Percentage'
							},
							tooltip : {
								pointFormat : '{series.name}: <b>{point.percentage:.1f}%</b>'
							},
							plotOptions : {
								pie : {
									allowPointSelect : true,
									cursor : 'pointer',
									colors : pieColors,
									dataLabels : {
										enabled : true,
										format : '<b>{point.name}</b><br>{point.percentage:.1f} %',
										distance : -50,
										filter : {
											property : 'percentage',
											operator : '>',
											value : 4
										}
									}
								}
							},
							series : [ {
								name : 'Sales',
								data : [ {
									name : 'Jan',
									y :
	<%=janPer%>
		}, {
									name : 'Feb',
									y :
	<%=febPer%>
		}, {
									name : 'March',
									y :
	<%=marPer%>
		}, {
									name : 'Apr',
									y :
	<%=aprPer%>
		}, {
									name : 'May',
									y :
	<%=mayPer%>
		}, {
									name : 'June',
									y :
	<%=junPer%>
		}, {
									name : 'July',
									y :
	<%=julyPer%>
		}, {
									name : 'Aug',
									y :
	<%=augPer%>
		}, {
									name : 'Sep',
									y :
	<%=sepPer%>
		}, {
									name : 'Oct',
									y :
	<%=octPer%>
		}, {
									name : 'Nov',
									y :
	<%=novPer%>
		}, {
									name : 'Dec',
									y :
	<%=decPer%>
		} ]
							} ]
						});
	</script>











	<script>
		// alert(dec);
		var highColors = [ bgWarning, bgPrimary, bgInfo, bgAlert, bgDanger,
				bgSuccess, bgSystem, bgDark ];

		var demoHighPies = function() {
			var pie1 = $('#high-pie');
			if (pie1.length) {
				$('#high-pie').highcharts({
					credits : false,
					chart : {
						plotBackgroundColor : null,
						plotBorderWidth : null,
						plotShadow : false
					},
					title : {
						text : null
					},
					/* tooltip : {
						pointFormat : '{series.name}: <b>{point.percentage:.1f}%</b>'
					}, */
					plotOptions : {
						pie : {
							center : [ '30%', '50%' ],
							allowPointSelect : true,
							cursor : 'pointer',
							dataLabels : {
								enabled : false
							},
							showInLegend : true
						}
					},
					colors : highColors,
					legend : {
						x : 90,
						floating : true,
						verticalAlign : "middle",
						layout : "vertical",
						itemMarginTop : 10
					},
					series : [ {
						type : 'pie',
						name : 'Ashtavinayak Engs',
						data : [ [ 'Sales', 35.0 ], {
							name : 'Purchase',
							y : 15.8,
							sliced : true,
							selected : true
						}, [ 'GST', 58 ], ]
					} ]
				});
			}
		}

		var line1 = $('#high-linees');

		if (line1.length) {
			$('#high-linees').highcharts(
					{
						credits : false,
						colors : highColors,
						chart : {
							type : 'column',
							zoomType : 'x',
							panning : true,
							panKey : 'shift',
							marginRight : 50,
							marginTop : -5,
						},
						title : {
							text : null
						},
						xAxis : {
							gridLineColor : '#EEE',
							lineColor : '#EEE',
							tickColor : '#EEE',
							categories : [ 'Jan', 'Feb', 'Mar', 'Apr', 'May',
									'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov',
									'Dec' ]
						},
						yAxis : {
							min : -2,
							tickInterval : 5,
							gridLineColor : '#EEE',
							title : {
								text : 'SALES & PURCHASE',
								style : {
									color : bgInfo,
									fontWeight : '900'
								}
							}
						},
						plotOptions : {
							spline : {
								lineWidth : 3,
							},
							area : {
								fillOpacity : 0.2
							}
						},
						legend : {
							enabled : false,
						},
						series : [
								{
									name : 'Sales',
									/* data : [ 8.0, 5, 9, 14, 18, 21.5, 25.2,
											26.5, 23.3, 18.3, 13.9, 35 ] */
									data : [ jan1, feb, march, apr, may, jun,
											july, aug, sep, oct, nov, dec ]

								},

								{
									name : 'Purchase',
									data : [ 15, 4.2, 5.7, 8.5, 11.9, 15.2,
											17.0, 16.6, 14.2, 10.3, 6.6, 19 ]
								}, ]
					});
		}

		// Bar chart

		new Chart(document.getElementById("bar-chart"), {
			type : 'bar',
			colors : highColors,
			data : {
				labels : [ "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul",
						"Aug", "Sep", "Oct", "Nov", "Dec" ],
				datasets : [ {
					label : "Income ($)",
					backgroundColor : [ "#3e95cd", "#3e95cd", "#3e95cd",
							"#3e95cd", "#3e95cd", "#3e95cd", "#3e95cd",
							"#3e95cd", "#3e95cd", "#3e95cd", "#3e95cd",
							"#3e95cd" ],

					data : [ jan1, feb, march, apr, may, jun, july, aug, sep,
							oct, nov, dec ]
				} ]
			},
			options : {
				legend : {
					display : false
				},
				title : {
					display : true,
					text : 'Total Sales'
				}
			}
		});

		// pie-chart
		new Chart(document.getElementById("pie-chart"), {
			type : 'pie',
			data : {
				labels : [ "Total Invoice", "Total Quotation",
						"Approved Quotation", "Rejected Quotation" ],

				/* labels : [ "Total Invoice", "Total Quotation",
									"Accepted Quotation", "Rejected Quotation",
									"Total Income" ], */
				datasets : [ {
					label : "Total Counts",
					backgroundColor : [ "#3e95cd", "#8e5ea2", "#3cba9f",
							"#e8c3b9", "#c45850" ],
					/* data : [ totInv, totquotation, accept_quo, reject_quo,
							totInvAmnt ] */
					data : [ 10, 15, 25, 50 ]
				} ]
			},
			options : {
				title : {
					display : true,
					text : 'Total Invoice And Quotation'
				}
			}
		});
	</script>


	<script type="text/javascript">
		$(document).ready(function() {
			$('#yearlyData').hide();
			$('#btnsYearly').click(function() {
				/* alert('hiiii'); */
				$('#yearlyData').toggle(2000);
			});
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