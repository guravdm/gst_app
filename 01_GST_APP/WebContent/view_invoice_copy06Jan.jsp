
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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

		SimpleDateFormat ye = new SimpleDateFormat("yy");
		Integer curYear = Integer.parseInt(ye.format(dt));
		// System.out.println(curYear);

		Calendar calendar = Calendar.getInstance();

		/* Calendar calendar = new GregorianCalendar(2008,
		Calendar.DECEMBER, 1); */
		//System.out.println("Starting date is: ");
		SimpleDateFormat q = new SimpleDateFormat("yyyy");
		String date = q.format(calendar.getTime());
		/* System.out.println(date); */

		System.out.println("After rolling 1 month, ending date is: ");
		calendar.roll(Calendar.YEAR, -1);
		date = q.format(calendar.getTime());;
		System.out.println(date);

		/* Calendar now = Calendar.getInstance();
		System.out
		.println("Current date : "
		+ (now.get(Calendar.MONTH) + 1) + "-"
		+ now.get(Calendar.DATE) + "-"
		+ now.get(Calendar.YEAR));
		now.get(Calendar.YEAR);

		now = Calendar.getInstance();
		now.add(Calendar.YEAR, -1);
		System.out
		.println("date before 1 years : "
		+ (now.get(Calendar.MONTH) + 1) + "-"
		+ now.get(Calendar.DATE) + "-"
		+ now.get(Calendar.YEAR)); */
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

a, li {
	color: white;
}

table, td, th {
	border: 1px solid black;
	color: black;
}

th {
	font-size: 16px;
}

td {
	font-size: 16px;
}

p, td {
	color: #000000;
	font-weight: normal;
	font-family: calibri;
}

.tg {
	height: 26px;
}

td {
	height: 26px;
}

div#invoice-table {
	margin-left: -1px;
}
</style>

<script type="text/javascript">
	var nume = document.getElementById('num').value;

	function isNumeric() {
		var elem = document.niw.num.value;
		if (elem != "") {
			var numericExpression = /^[0-9]+$/;
			if (elem.match(numericExpression)) {
				return true;
			} else {
				alert("Please Enter Only Number ");
				document.niw.num.value = "";
				return false;
			}
		}
	}

	function numinwrd() {
		var numbr = document.getElementById('num').value;
		var str = new String(numbr)
		var splt = str.split("");
		var rev = splt.reverse();
		var once = [ ' Zero ', ' One ', ' Two ', ' Three ', ' Four ', ' Five ',
				' Six ', ' Seven ', ' Eight ', ' Nine ' ];
		var twos = [ ' Ten ', ' Eleven ', ' Twelve ', ' Thirteen ',
				' Fourteen ', ' Fifteen ', ' Sixteen ', ' Seventeen ',
				' Eighteen ', ' Nineteen ' ];
		var tens = [ '', 'Ten ', ' Twenty ', ' Thirty ', ' Forty ', ' Fifty ',
				' Sixty ', ' Seventy ', ' Eighty ', ' Ninety ' ];
		numlen = rev.length;
		var word = new Array();
		var j = 0;
		for (i = 0; i < numlen; i++) {
			switch (i) {
			case 0:
				if ((rev[i] == 0) || (rev[i + 1] == 1)) {
					word[j] = '';
				} else {
					word[j] = once[rev[i]];
				}
				word[j] = word[j];
				break;
			case 1:
				abovetens();
				break;
			case 2:
				if (rev[i] == 0) {
					word[j] = '';
				} else if ((rev[i - 1] == 0) || (rev[i - 2] == 0)) {
					word[j] = once[rev[i]] + "Hundred ";
				} else {
					word[j] = once[rev[i]] + "Hundred and ";
				}
				break;
			case 3:
				if (rev[i] == 0 || rev[i + 1] == 1) {
					word[j] = '';
				} else {
					word[j] = once[rev[i]];
				}
				if ((rev[i + 1] != 0) || (rev[i] > 0)) {
					word[j] = word[j] + " Thousand ";
				}
				break;
			case 4:
				abovetens();
				break;
			case 5:
				if ((rev[i] == 0) || (rev[i + 1] == 1)) {
					word[j] = '';
				} else {
					word[j] = once[rev[i]];
				}
				word[j] = word[j] + "Lakhs";
				break;
			case 6:
				abovetens();
				break;
			case 7:
				if ((rev[i] == 0) || (rev[i + 1] == 1)) {
					word[j] = '';
				} else {
					word[j] = once[rev[i]];
				}
				word[j] = word[j] + "Crore";
				break;
			case 8:
				abovetens();
				break;
			default:
				break;
			}
			j++;
		}

		function abovetens() {
			if (rev[i] == 0) {
				word[j] = '';
			} else if (rev[i] == 1) {
				word[j] = twos[rev[i - 1]];
			} else {
				word[j] = tens[rev[i]];
			}
		}
		word.reverse();
		var finalw = '';
		for (i = 0; i < numlen; i++) {
			finalw = finalw + word[i];
		}
		document.getElementById('number').innerHTML = finalw;
	}

	function ctck() {
		var sds = document.getElementById("dum");
		if (sds == null) {
			alert("You are using a free package.\n You are not allowed to remove the tag.\n");
		}
		var sdss = document.getElementById("dumdiv");
		if (sdss == null) {
			alert("You are using a free package.\n You are not allowed to remove the tag.\n");
		}
	}
	document.onload = "ctck()";
</script>

<script type="text/javascript">
	var a = document.getElementById('grandamnt').value;
	//alert(a);
</script>



</head>
<body onload="numinwrd()" class="invoice-page">

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
					<a
						href="view_invoice.jsp?viewInvId=<%=request.getParameter("viewInvId")%>"
						class="btn btn-default btn-sm light fw600 ml10"> <span
						class="fa fa fa-arrow-left"></span> Refresh
					</a>
				</div>
			</header>





			<%
				Date chlnsDate = null, poSyDate = null, newprint_date = null;
												String newSplitAdd = "", surveyNo = "", pincode = "";
												String compName = "", state = "", gstInvNo = "", arnNo = "", gstNo = "", address = "", poNo = "", poDate = "", challanNo = "", challanDate = "";
												PreparedStatement g = con
															.prepareStatement("SELECT cm.id as clintUId, i.id as gstInvoiceNo, IFNULL(cm.pincode,'') as pincode, cm.survey_no, i.clientId, cm.client_id, cm.company_name, cm.email, cm.mob_no, cm.gst_no, IFNULL(cm.pan_no,'') as pan_no, cm.address,  cm.updated_time, cm.state, cm.arn_no, i.subtotal, i.grossamount,i.challn_no, i.ChallanDate, i.PO_Number, i.PO_Date, i.PO_Valid_To, IFNULL(i.newprint_date,'NA') as newprint_date FROM client_master cm, invoice i where i.clientId = cm.id and i.id = ?");
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
														chlnsDate = rg.getDate("ChallanDate");
														poSyDate = rg.getDate("PO_Date");
														newprint_date = rg.getDate("newprint_date");
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
						<div class="content row" id="invoice-table">
							<div class="col-md-12">
								<table class="table" style="border: 1px solid black; width: 99%">
									<thead>
										<tr>
											<td width="97%" colspan="6"><strong><span
													style="margin-left: 45%; font-size: 24px;"><b>TAX
															INVOICE</b></span></strong></td>
										</tr>
										<tr style="border: 1px solid black;">
											<td width="50%" colspan="2"><h1>
													<img width="95%" alt="image" src="img/Untitled.png">
												</h1></td>
											<td colspan="4"><b>Factory</b>:<br />Laxmi Industrial
												Estate, Shop No:9, Sr.No 30/13, Narhe Dhayari <br />
												Road,Dhayari, Pune - 411041<br /> <b>Mob No</b>: 9422344775
												/ 9834822866 <br /> <b>E-mail:</b> shreepad.ph5@gmail.com <br />
												<span><b>Manufacture :</b>All types of Tool rooms,
													plastic moulding Dies Machine Components &amp; Industrial
													Job Works.</span></td>
										</tr>
										<tr>
											<td colspan="2" width="48%"><b>GSTN </b>:&nbsp; <span
												style="margin-left: 16px;">27ABKPH8416L1Z9</span> <br /> <b>
													STATE</b>: <span style="margin-left: 20px;">MAHARASHTRA
											</span><br /> <b> STATE CODE</b>: <span style="margin-left: 2px;">27</span>
												<br /> <b> ARN</b>: <span style="margin-left: 28px;">
													AA2702170201571</span></td>
											<%
												SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
																																																																																																																																																																													    SimpleDateFormat sd1 = new SimpleDateFormat("dd-MM-yyyy");
																																																																																																																																																																														String printDat = sd1.format(newprint_date);
											%>
											<td colspan="4" width="52%"><b>GST Invoice No</b>:
												&nbsp;&nbsp;<%=gstInvNo%> / <%=date%> - <%=curYear%><br />
												<b> Invoice Date</b>: <span style="margin-left: 25px;"><%=printDat%></span>
												<br /> <b> Challan No</b>: <span style="margin-left: 35px;"><%=challanNo%></span>
												<br /> <b> Challan Date</b>: <%
 	String chalnDate = sd1.format(chlnsDate);
                                                  		String poSyDate1 = sd1.format(poSyDate);
 %> <span style="margin-left: 24px;"><%=chalnDate%></span></td>
										</tr>
										<tr>
											<td colspan="2" width="48%"><strong>To,</strong><br>
												<strong style="font-size: 21px; margin-left: 20px;"><%=compName%></strong>
												<br> <span style="margin-left: 20px;"><%=address%></span></td>
											<td colspan="4" width="52%" style="vertical-align: initial"><b>PO
													No</b>: <span style="margin-left: 24px;"><%=poNo%></span> <br />
												<b> PO Date</b>: <span style="margin-left: 11px;"><%=poSyDate1%></span>
												<br /> <b> GST No</b>: <span style="margin-left: 17px;"><%=gstNo%></span>
												<br /> <b> STATE</b>: <span style="margin-left: 28px;"><%=state%></span></td>
										</tr>

										<tr style="border: 1px solid black;">
											<th
												style="border: 1px solid black; width: 6.6%; font-weight: bold; text-align: center;">Sr
												No.</th>
											<th
												style="border: 1px solid black; font-weight: bold; text-align: center; width: 40%;">Particulars
												/ Item Name</th>
											<th
												style="border: 1px solid black; font-weight: bold; text-align: center; width: 11%;">HSN
												Code</th>
											<th
												style="border: 1px solid black; font-weight: bold; text-align: center; width: 9%;">Qty</th>
											<th
												style="border: 1px solid black; font-weight: bold; text-align: center; width: 9%;">Rate</th>
											<th
												style="border: 1px solid black; font-weight: bold; text-align: center; width: 11%;">Amount</th>
										</tr>
									</thead>
									<tbody>

										<%
											String anas = "";
																																																																																																																																																																																																																																																																																																																																																																																																																			String subTotal = "", cgst = "", sgst = "", igst = "", grandTotal = "";
																																																																																																																																																																																																																																																																																																																																																																																																																		double grndTot = 0f;
																																																																																																																																																																																																																																																																																																																																																																																																																				try {

																																																																																																																																																																																																																																																																																																																																																																																																																					int cnt = 0;

																																																																																																																																																																																																																																																																																																																																																																																																																					PreparedStatement ps = con
																																																																																																																																																																																																																																																																																																																																																																																																																							.prepareStatement("SELECT mm.material_name, mm.hsn_code, mm.uom,id.materialQty, po.rate as po_Rate, id.materialRate as Rate, format(ROUND((id.materialQty * po.rate),2),2) as AmountEq, i.id as invoiceNo, id.id as idDetails, format(ROUND(i.subtotal),0) as subtotal, i.clientId as clntId, ROUND(i.grossamount) as grossamount, i.challn_no, format(ROUND(i.cgst_amnt,2),2) as cgst_amnt , format(ROUND(i.sgst_amnt,2),2) as sgst_amnt, format(ROUND(i.igst_amnt,2),2) as igst_amnt, i.print_status, i.outward_status, i.updatedTime, id.invoiceId, id.printed, cm.id as custId, cm.client_id, cm.company_name, i.clientId, po.po_no FROM invoice i, invoicedetails id, client_master cm, material_master mm, po_master po where id.materialCode = mm.id and po.material_id = mm.id and cm.id = po.client_id and id.invoiceId = i.id and i.clientId = cm.id and i.id = ?");
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
																																																																																																																																																																																																																																																																																																																																																																																																																						grndTot  = rs.getDouble("grossamount");
																																																																																																																																																																																																																																																																																																																																																																																																																						
																																																																																																																																																																																																																																																																																																																																																																																																																						 NumberFormat myFormat = NumberFormat.getInstance();
																																																																																																																																																																																																																																																																																																																																																																																																																					      myFormat.setGroupingUsed(true);

																																																																																																																																																																																																																																																																																																																																																																																																																					      double[] numbers = { grndTot };

																																																																																																																																																																																																																																																																																																																																																																																																																					      for (double d : numbers) {
																																																																																																																																																																																																																																																																																																																																																																																																																					         System.out.println(myFormat.format(d));
																																																																																																																																																																																																																																																																																																																																																																																																																					         anas = myFormat.format(d);
																																																																																																																																																																																																																																																																																																																																																																																																																					      }
										%>
										<tr>
											<td style="text-align: center;"><%=cnt%></td>
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
											<td colspan="3" rowspan="4"></td>
											<td colspan="2">Total Amount</td>
											<td style="text-align: right;"><%=subTotal%>.00</td>
										</tr>

										<!-- CGST SGST IGST CODE -->
										<tr>
											<td style="font-weight: bold;">CGST</td>
											<td>9%</td>
											<td style="text-align: right;"><%=cgst%></td>
										</tr>
										<tr>
											<td style="font-weight: bold;">SGST</td>
											<td>9%</td>
											<td style="text-align: right;"><%=sgst%></td>

										</tr>
										<tr>
											<td style="font-weight: bold;">IGST</td>
											<td>18%</td>
											<td style="text-align: right;"><%=igst%></td>
										</tr>

										<tr>
											<input type="hidden" name="num" value="<%=grandTotal%>"
												id="num" maxlength=9 onKeyup="isNumeric()">
											<td colspan="3" rowspan="3"><b style="font-size: 17px;"
												class="userBen">Amount in words</b>: &nbsp;<span id="number">
													&nbsp; </span>only.
										</tr>
										<tr>
											<td colspan="2" style="font-weight: bold;">Transport
												Charges</td>
											<td style="text-align: right;">0.00</td>
										</tr>

										<tr>
											<td colspan="2" style="font-weight: bold;">Gross Amount</td>
											<input style="display: none;" type="hidden"
												value="<%=grandTotal%>" id="grandamnt" readonly="readonly"
												name="grandamnt" onchange="convertNumberToWords()"
												onkeyup="word.innerHTML=convertNumberToWords(this.value)" />
											<td style="text-align: right;"><%=anas%>.00</td>
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
												paid or shall be paid."
										</tr>

										<tr>
											<td colspan="2"><br /> <span
												style="text-align: center; margin-top: 90px; font-size: 14.5px;">
													<br /> <br /> <span style="margin-left: 45px;">Receiver's
														Signature with stamp</span>
											</span></td>
											<td colspan="4"><h5 style="margin-left: 15%">
													<span
														style="text-align:; font-size: 15px; margin-top: 10px;"><strong
														style="margin-left: 25px;">For,
															&nbsp;Ashtavinayak Engineer's</strong></span>
												</h5> <br /> <span
												style="font-size: 14.5px; margin-left: 25%; margin-top: 15px;">
													<!-- Proprietor --> Authorised Signatory
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



