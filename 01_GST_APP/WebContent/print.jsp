
<%
	Connection con = DoConnection.getConnection();
	if (session.getAttribute("userId") != null) {

		session.setAttribute("page", "view_invoice");
		session.setMaxInactiveInterval(10 * 60);

		java.util.Date dt = new java.util.Date();

		java.text.SimpleDateFormat sdf2 = new java.text.SimpleDateFormat(
				"yyyy-MM-dd");
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
				"dd-MM-yyyy");
		String currentTime = sdf.format(dt);
%>

<!DOCTYPE html>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.gst.util.DoConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.List"%>
<html>
<head>
<meta charset="utf-8">
<title>VIEW INVOICE</title>


<link rel='stylesheet' type='text/css'
	href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700'>

<link rel="stylesheet" type="text/css"
	href="assets/skin/default_skin/css/theme.css">

<style type="text/css">
table {
	border-collapse: collapse;
}

table, td, th {
	border: 1px solid black;
}

span, p, a, td {
	color: #000000;
	font-size: 13px;
	font-weight: normal;
}
</style>

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

					<%-- <%
						/* =========== COMPANY INFO ============= */
							String companyNames = "", compSrNo = "", compMob = "", compemailid = "", compAltMob = "", compTal = "", compDist = "", compARN = "", compGSTIN = "", compState = "", compCode = "";
							int comCnt = 0;
							PreparedStatement pk = con
									.prepareStatement("SELECT IFNULL(companyname,'') as companyname, IFNULL(srno,'') as srno, IFNULL(tal,'') as tal, IFNULL(dist,'') as dist, IFNULL(mobno,'') as mobno, IFNULL(altno,'') as altno, IFNULL(emailid,'') as emailid, IFNULL(gstin,'') as gstin, IFNULL(state,'') as state, IFNULL(statecode,'') as statecode, IFNULL(arn_no,'') as arn_no FROM companyinfo");
							ResultSet rrk = pk.executeQuery();
							while (rrk.next()) {
								comCnt++;
								companyNames = rrk.getString("companyname");
								compSrNo = rrk.getString("srno");
								compMob = rrk.getString("mobno");
								compAltMob = rrk.getString("altno");
								compTal = rrk.getString("tal");
								compDist = rrk.getString("dist");
								compARN = rrk.getString("arn_no");
								compGSTIN = rrk.getString("gstin");
								compState = rrk.getString("state");
								compCode = rrk.getString("statecode");
								compemailid = rrk.getString("emailid");
							}
					%> --%>


					<div class="panel-body p20" id="invoice-item">
						<div class="row" id="invoice-table">
							<div class="col-md-12">
								<table class="table" style="border: 1px solid black;">
									<thead>
										<tr style="border: 1px solid black;">
											<td colspan="3"><h1>Ashtavinayak Engineers</h1></td>
											<td colspan="3"><strong><b>Factory</b>:<br />Sr.No
													50, 39/1, A/p. Narhe Road, Opp. Poona Chemical, Tal.
													Haveli, Dist. Pune<br /> Mob No: 9011958026/ 9422344775 <br />E-mail:<a
													href="mailto:guravdm@gmail.com %>">guravdm@gmail.com </a> <br /></strong></td>
										</tr>
										<tr>
											<td colspan="6"><span style="margin-left: 30%"><b>Manufacture
														:</b> SPECIALIST IN ALL TYPES OF TOOL ROOM WORKS.</span></td>
										</tr>
										<tr>
											<td colspan="3">To,</td>
											<td colspan="3">GST INV No : <%=request.getParameter("viewInvId")%>
												<span style="margin-left: 35px;">Date : <%=currentTime%></span><br />
												<br />Challan No : 12 <span style="margin-left: 35px;">Date
													: 2017</span><br /> <br />P.O No :152<span
												style="margin-left: 10px;">Date : <small
													style="font-size: 12px;">2017</small>
											</span></td>
										</tr>


										<tr>
											<th>Sr No.</th>
											<th>Particulars / Item Name</th>
											<th>HSN Code</th>
											<th style="width: 135px;">Qty</th>
											<th>Rate</th>
											<th>Amount</th>
										</tr>
									</thead>
									<tbody>


										<%
											String subTotal = "", cgst = "", sgst = "", igst = "", grandTotal = "";
												try {

													int cnt = 0;

													PreparedStatement ps = con
															.prepareStatement("SELECT mm.material_name, mm.hsn_code, mm.uom,id.materialQty, po.rate, i.id as invoiceNo, id.id as idDetails, ROUND(i.subtotal) as subtotal, i.clientId as clntId, ROUND(i.grossamount) as grossamount, i.challn_no, ROUND(i.cgst_amnt) as cgst_amnt , ROUND(i.sgst_amnt) as sgst_amnt, ROUND(i.igst_amnt) as igst_amnt, i.print_status, i.outward_status, i.updatedTime, id.invoiceId, id.printed, cm.id as custId, cm.client_id, cm.company_name, i.clientId, po.po_no FROM invoice i, invoicedetails id, client_master cm, material_master mm, po_master po where id.materialCode = mm.id and po.material_id = mm.id and cm.id = po.client_id and id.invoiceId = i.id and i.clientId = cm.id and i.id = ?");
													ps.setString(1, request.getParameter("viewInvId"));
													ResultSet rs = ps.executeQuery();
													while (rs.next()) {
														cnt++;
														subTotal = rs.getString("subtotal");
														cgst = rs.getString("cgst_amnt");
														sgst = rs.getString("sgst_amnt");
														igst = rs.getString("igst_amnt");
														grandTotal = rs.getString("grossamount");
										%>
										<tr bordercolor="1px solide black">
											<td><b><%=cnt%></b></td>
											<td><%=rs.getString("material_name")%></td>
											<td><%=rs.getString("hsn_code")%></td>
											<td><%=rs.getString("materialQty")%></td>
											<td><%=rs.getString("rate")%></td>

											<%
												float qtyMtrlRateAmnt = 0f;
															Float qty = Float.parseFloat(rs
																	.getString("materialQty"));
															Float rates = Float.parseFloat(rs.getString("rate"));
															qtyMtrlRateAmnt = qty * rates;
															int roundAmounts = Math.round(qtyMtrlRateAmnt);
											%>

											<td><%=roundAmounts%></td>
										</tr>
										<%
											}
												} catch (SQLException e) {
													e.printStackTrace();
												}
										%>




										<tr>
											<td colspan="3" rowspan="3"><b>GSTIN</b>:
												27ASMPP1463G1ZI<br> <b>STATE</b>: MAHARASHTRA<br>
												<b>STATE CODE</b>: 27 <br> <b>ARN</b>:</td>
											<td colspan="2">Total Amount</td>
											<td><%=subTotal%></td>
										</tr>

										<!-- CGST SGST IGST CODE -->
										<tr>
											<td>CGST</td>
											<td>9%</td>
											<td><%=cgst%></td>
										</tr>
										<tr>
											<td>SGST</td>
											<td>9%</td>
											<td><%=sgst%></td>
										</tr>



										<tr>
											<td colspan="3" rowspan="3"><b>Amount in words</b>: <br>
												<b>Rupees</b>:</td>

											<td>IGST</td>
											<td>18%</td>
											<td><%=igst%></td>
										</tr>
										<tr>
											<td colspan="2">Transport Charges</td>
											<td>0</td>
										</tr>


										<tr>
											<td colspan="2">Gross Amount</td>
											<td><%=grandTotal%></td>
										</tr>

										<tr>
											<td colspan="10"><b><u>Terms &amp; Conditions :</u></b>
												<span> Payment due for period more than 30 days will
													be charged &#64; 24% per annum. </span></td>
										</tr>

										<tr>
											<td width="310px;" colspan="3">
												<p>
													<b><u>Declaration</u>:</b> &nbsp;"I/We hereby certify that
													my/our registration certificate under the Maharashtra GST
													Act, 2017 is in force on the date on which the sale of the
													goods specified in this tax invoice is made by me/us and
													that the transaction of sale covered by this tax invoice
													has been effected by me/us and it shall be accounted for in
													the turnover of sales while filing of return and the due
													tax, if any, payable on the sale has been paid or shall be
													paid."
											</td>
											<td colspan="1"><br /> <br /> <br /> <span
												style="text-align: center; margin-top: 80px; font-size: 12px;">Receiver
													Signature</span></td>
											<td colspan="3"><h5 class="pull-right">
													<span
														style="text-align: right; font-size: 13px; margin-top: 10px;">For
														Ashtavinayak Engineers</span>
												</h5> <br /> <br /> <br> <span class="pull-right">
													<!-- Proprietor --> Authorised Signature
											</span></td>
										</tr>


									</tbody>
								</table>
							</div>
						</div>
						<div class="row" id="invoice-footer">
							<div class="col-md-12">
								<div class="pull-left mt20 fs15 text-primary">Thank you
									for your business.</div>
								<br>
								<div class="pull-right invoice-buttons">

									<div class="clearfix"></div>
									<a href="javascript:window.print()"
										class="btn btn-default mr10"> <i class="fa fa-print pr5"></i>
										Print Invoice
									</a>
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



