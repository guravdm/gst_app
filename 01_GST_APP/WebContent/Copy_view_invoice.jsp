
<%@page import="java.util.LinkedList"%>
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
	font-size: 16px;
	font-weight: normal;
	font-family: calibri;
}

.tg {
	height: 26px;
}
</style>



<script type="text/javascript">
	var iWords = [ 'Zero', ' One', ' Two', ' Three', ' Four', ' Five', ' Six',
			' Seven', ' Eight', ' Nine' ];
	var ePlace = [ 'Ten', ' Eleven', ' Twelve', ' Thirteen', ' Fourteen',
			' Fifteen', ' Sixteen', ' Seventeen', ' Eighteen', ' Nineteen' ];
	var tensPlace = [ '', ' Ten', ' Twenty', ' Thirty', ' Forty', ' Fifty',
			' Sixty', ' Seventy', ' Eighty', ' Ninety' ];
	var inWords = [];

	var numReversed, inWords, actnumber, i, j;

	function tensComplication() {
		'use strict';
		if (actnumber[i] === 0) {
			inWords[j] = '';
		} else if (actnumber[i] === 1) {
			inWords[j] = ePlace[actnumber[i - 1]];
		} else {
			inWords[j] = tensPlace[actnumber[i]];
		}
	}

	function testSkill() {
		'use strict';
		var junkVal = document.getElementById('grandamnt').value;
		//	alert(junkVal);
		junkVal = Math.floor(junkVal);
		var obStr = junkVal.toString();
		numReversed = obStr.split('');
		actnumber = numReversed.reverse();

		if (Number(junkVal) >= 0) {
			//do nothing
		} else {
			window.alert('wrong Number cannot be converted');
			return false;
		}
		if (Number(junkVal) === 0) {
			document.getElementById('containers').innerHTML = obStr + ''
					+ 'Rupees Zero Only';
			return false;
		}
		if (actnumber.length > 9) {
			window.alert('Oops!!!! the Number is too big to covertes');
			return false;
		}

		var iWordsLength = numReversed.length;
		var finalWord = '';
		j = 0;
		for (i = 0; i < iWordsLength; i++) {
			switch (i) {
			case 0:
				if (actnumber[i] === '0' || actnumber[i + 1] === '1') {
					inWords[j] = '';
				} else {
					inWords[j] = iWords[actnumber[i]];
				}
				inWords[j] = inWords[j] + ' Only';
				break;
			case 1:
				tensComplication();
				break;
			case 2:
				if (actnumber[i] === '0') {
					inWords[j] = '';
				} else if (actnumber[i - 1] !== '0' && actnumber[i - 2] !== '0') {
					inWords[j] = iWords[actnumber[i]] + ' Hundred and';
				} else {
					inWords[j] = iWords[actnumber[i]] + ' Hundred';
				}
				break;
			case 3:
				if (actnumber[i] === '0' || actnumber[i + 1] === '1') {
					inWords[j] = '';
				} else {
					inWords[j] = iWords[actnumber[i]];
				}
				if (actnumber[i + 1] !== '0' || actnumber[i] > '0') {
					inWords[j] = inWords[j] + ' Thousand';
				}
				break;
			case 4:
				tensComplication();
				break;
			case 5:
				if (actnumber[i] === '0' || actnumber[i + 1] === '1') {
					inWords[j] = '';
				} else {
					inWords[j] = iWords[actnumber[i]];
				}
				if (actnumber[i + 1] !== '0' || actnumber[i] > '0') {
					inWords[j] = inWords[j] + ' Lakh';
				}
				break;
			case 6:
				tensComplication();
				break;
			case 7:
				if (actnumber[i] === '0' || actnumber[i + 1] === '1') {
					inWords[j] = '';
				} else {
					inWords[j] = iWords[actnumber[i]];
				}
				inWords[j] = inWords[j] + ' Crore';
				break;
			case 8:
				tensComplication();
				break;
			default:
				break;
			}
			j++;
		}

		inWords.reverse();
		for (i = 0; i < inWords.length; i++) {
			finalWord += inWords[i];
		}
		/* document.getElementById('containers').innerHTML = obStr + '  '
				+ finalWord; */

		document.getElementById('containers').innerHTML = finalWord;
	}
</script>

<script type="text/javascript">
	var a = document.getElementById('grandamnt').value;
	//alert(a);
</script>



</head>
<body onload="testSkill()" class="invoice-page">

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



			<%
				String newSplitAdd = "", surveyNo = "", pincode = "";
					String compName = "", state = "", gstInvNo = "", arnNo = "", gstNo = "", address = "", poNo = "", poDate = "", challanNo = "", challanDate = "";
					PreparedStatement g = con
							.prepareStatement("SELECT cm.id as clintUId, i.id as gstInvoiceNo, IFNULL(cm.pincode,'') as pincode, cm.survey_no, i.clientId, cm.client_id, cm.company_name, cm.email, cm.mob_no, cm.gst_no, IFNULL(cm.pan_no,'') as pan_no, cm.address,  cm.updated_time, cm.state, cm.arn_no, i.subtotal, i.grossamount,i.challn_no, i.ChallanDate, i.PO_Number, i.PO_Date, i.PO_Valid_To FROM client_master cm, invoice i where i.clientId = cm.id and i.id = ?");
					g.setString(1, request.getParameter("viewInvId"));
					ResultSet rg = g.executeQuery();
					while (rg.next()) {
						gstInvNo = rg.getString(2);
						compName = rg.getString("company_name");
						surveyNo = rg.getString("survey_no");
						arnNo = rg.getString("arn_no");
						gstNo = rg.getString("gst_no");
						address = rg.getString("address");
						poNo = rg.getString("PO_Number");
						poDate = rg.getString("PO_Date");
						challanNo = rg.getString("challn_no");
						challanDate = rg.getString("ChallanDate");
						state = rg.getString("state");
						pincode = rg.getString("pincode");
					}

					String message = address;
					for (int i = 0; i < message.length(); i += 10) {
						/* System.out.println(message.substring(i,
								Math.min(i + 28, message.length()))); */
						newSplitAdd = (message.substring(i,
								Math.min(i + 28, message.length())));
			%>

			<%
				}
			%>

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
						<div class="row" id="invoice-table">
							<div class="col-md-12">
								<table class="table" style="border: 1px solid black; width: 99%">
									<thead>
										<tr>
											<td colspan="6"><strong><span
													style="margin-left: 45%"><b>TAX INVOICE</b></span></strong></td>
										</tr>
										<tr style="border: 1px solid black;">
											<td width="50%" colspan="2"><h1>
													<img width="95%" alt="image" src="img/Untitled.png">
												</h1></td>
											<td colspan="4"><b>Factory</b>:<br />Laxmi Industrial
												Estate, Shop No:9, Sr.No 30/13, Narhe Dhayari <br />
												Road,Dhayari, Pune - 411041<br /> <b>Mob No</b>: 9422344775
												/ 9834822866 <br /> <b>E-mail:</b> shreepad.ph5@gmail.com <br />
												<span><br> <b>Manufacture :</b>All types of Tool
													rooms, plastic moulding Dies Machine <br /> Components
													&amp; Industrial Job Works.</span></td>
										</tr>
										<tr>
											<td colspan="2"><b>GSTN </b>:27ABKPH8416L1Z9 <br /> <b>
													STATE</b>: MAHARASHTRA <br /> <b> STATE CODE</b>: 27 <br /> <b>
													ARN</b>: AA2702170201571</td>

											<td colspan="4"><b>GST Invoice No</b>: <%=gstInvNo%> <br />
												<b> Invoice Date</b>: <%=currentTime%> <br /> <b>
													Challan No</b>: <%=challanNo%> <br /> <b> Challan Date</b>: <%=challanDate%></td>
										</tr>
										<tr>
											<td colspan="2" width="48%">To, <strong><%=compName%></strong>
												<br><%=surveyNo%><br> <span
												style="text-align: justify;"><%=address%></span><br> <%=pincode%>
											</td>


											<td colspan="4" width="52%" style="vertical-align: initial"><b>PO
													No</b>: <%=poNo%> <br /> <b> PO Date</b>: <%=poDate%> <br />
												<b> GST No</b>: <%=gstNo%> <br /> <b> STATE</b>: <%=state%></td>
										</tr>


										<tr style="border: 1px solid black;">
											<th
												style="border: 1px solid black; width: 8%; text-align: center;">Sr
												No.</th>
											<th
												style="border: 1px solid black; text-align: center; width: 40%;">Particulars
												/ Item Name</th>
											<th
												style="border: 1px solid black; text-align: center; width: 12%;">HSN
												Code</th>
											<th
												style="border: 1px solid black; text-align: center; width: 10%;">Qty</th>
											<th
												style="border: 1px solid black; text-align: center; width: 10%;">Rate</th>
											<th
												style="border: 1px solid black; text-align: center; width: 15%;">Amount</th>
										</tr>
									</thead>
									<tbody>

										<%
											String subTotal = "", cgst = "", sgst = "", igst = "", grandTotal = "";
												try {

													int cnt = 0;

													PreparedStatement ps = con
															.prepareStatement("SELECT mm.material_name, mm.hsn_code, mm.uom,id.materialQty, po.rate as po_Rate, id.materialRate as Rate, ROUND((id.materialQty * po.rate),2) as AmountEq, i.id as invoiceNo, id.id as idDetails, ROUND(i.subtotal) as subtotal, i.clientId as clntId, ROUND(i.grossamount) as grossamount, i.challn_no, i.cgst_amnt as cgst_amnt , i.sgst_amnt as sgst_amnt, i.igst_amnt as igst_amnt, i.print_status, i.outward_status, i.updatedTime, id.invoiceId, id.printed, cm.id as custId, cm.client_id, cm.company_name, i.clientId, po.po_no FROM invoice i, invoicedetails id, client_master cm, material_master mm, po_master po where id.materialCode = mm.id and po.material_id = mm.id and cm.id = po.client_id and id.invoiceId = i.id and i.clientId = cm.id and i.id = ?");
													ps.setString(1, request.getParameter("viewInvId"));
													ResultSet rs = ps.executeQuery();
													// System.out.println(ps);
													while (rs.next()) {
														cnt++;
														subTotal = rs.getString("subtotal");
														cgst = rs.getString("cgst_amnt");
														sgst = rs.getString("sgst_amnt");
														igst = rs.getString("igst_amnt");
														grandTotal = rs.getString("grossamount");
										%>
										<tr style="border: 1px solid black;">
											<td><b><%=cnt%></b></td>
											<td><%=rs.getString("material_name")%></td>
											<td style="text-align: center;"><%=rs.getString("hsn_code")%></td>
											<td style="text-align: center;"><%=rs.getString("materialQty")%></td>
											<td style="text-align: center;"><%=rs.getString("rate")%></td>

											<%
												float qtyMtrlRateAmnt = 0f;
															Float qty = Float.parseFloat(rs
																	.getString("materialQty"));
															Float rates = Float.parseFloat(rs.getString("rate"));
															qtyMtrlRateAmnt = qty * rates;
															int roundAmounts = Math.round(qtyMtrlRateAmnt);
											%>

											<%-- <td><%=roundAmounts%></td> --%>
											<td style="text-align: right;"><%=rs.getString("AmountEq")%></td>
										</tr>


										<%
											}

													if (cnt < 5) {
										%>
										<tr>
											<td class="tg"></td>
											<td class="tg"></td>
											<td class="tg"></td>
											<td class="tg"></td>
											<td class="tg"></td>
											<td class="tg"></td>
										</tr>
										<tr>
											<td class="tg"></td>
											<td class="tg"></td>
											<td class="tg"></td>
											<td class="tg"></td>
											<td class="tg"></td>
											<td class="tg"></td>
										</tr>
										<%
											}

												} catch (SQLException e) {
													e.printStackTrace();
												}
										%>




										<tr>
											<td colspan="3" rowspan="3"></td>
											<td colspan="2">Total Amount</td>
											<td style="text-align: right;"><%=subTotal%>.00</td>
										</tr>

										<!-- CGST SGST IGST CODE -->
										<tr>
											<td>CGST</td>
											<td>9%</td>
											<td style="text-align: right;"><%=cgst%></td>
										</tr>
										<tr>
											<td>SGST</td>
											<td>9%</td>
											<td style="text-align: right;"><%=sgst%></td>
										</tr>



										<tr>
											<td colspan="3" rowspan="3"><b>Amount in words</b>: <br>
												<p>
													<span id="containers"></span>
												<div id="word"></div></td>

											<td>IGST</td>
											<td>18%</td>
											<td style="text-align: right;"><%=igst%></td>
										</tr>
										<tr>
											<td colspan="2">Transport Charges</td>
											<td style="text-align: right;">0</td>
										</tr>


										<tr>
											<td colspan="2">Gross Amount</td>
											<input style="display: none;" type="hidden"
												value="<%=grandTotal%>" id="grandamnt" readonly="readonly"
												name="grandamnt" onchange="convertNumberToWords()"
												onkeyup="word.innerHTML=convertNumberToWords(this.value)" />
											<td style="text-align: right;"><%=grandTotal%>.00</td>
										</tr>

										<tr>
											<td colspan="10"><b><u>Terms &amp; Conditions :</u></b>
												<span> Payment due for period more than 30 days will
													be charged &#64; 24% per annum. </span></td>
										</tr>
										<tr>
											<td colspan="6"><b><u>Declaration</u>:</b> &nbsp;"I/We
												hereby certify that my/our registration certificate under
												the Maharashtra GST Act, 2017 is in force on the date on
												which the sale of the goods specified in this tax invoice is
												made by me/us and that the transaction of sale covered by
												this tax invoice has been effected by me/us and it shall be
												accounted for in the turnover of sales while filing of
												return and the due tax, if any, payable on the sale has been
												paid or shall be paid."</td>
										</tr>

										<tr>
											<td colspan="3"><br /> <span
												style="text-align: center; margin-top: 90px; font-size: 12px;"><br />
													<br />Receiver's Signature with stamp</span></td>
											<td colspan="3"><h5 class="pull-right">
													<span
														style="text-align: right; font-size: 13px; margin-top: 10px;">For
														Ashtavinayak Engineer's</span>
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



