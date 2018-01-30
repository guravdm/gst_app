
<%
	if (session.getAttribute("userId") != null) {

		session.setAttribute("page", "edit-invoice");
%>

<%@page import="com.gst.beans.InvoiceBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.gst.util.DoConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New Client Entry</title>

<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache" />

<jsp:include page="header-scripts.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="vendor/plugins/datatables/media/css/datatables.min.css">
<link rel="stylesheet" type="text/css"
	href="vendor/plugins/datatables/media/css/datatables_addons.min.css">

<link rel="stylesheet" type="text/css"
	href="vendor/plugins/select2/css/core.css">


<link rel="stylesheet" href="ui/cs/jquery-ui.css">
<script src="ui/jquery-2.1.1.js"></script>
<script src="ui/jquery-ui.js"></script>


<%
	InvoiceBean invoiceData = (InvoiceBean) request
				.getAttribute("invData");
%>

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
				class="fa fa fa-arrow-left"></span> Back
			</a>
		</div>
		</header> <section id="content" class="animated fadeIn">
		<div class="tray tray-center">
			<div class="admin-form theme-primary mw1000 center-block"
				style="padding-bottom: 175px;">
				<div class="panel heading-border">
					<div class="panel-body pn">
						<!-- <form method="get" action="./UpdateInvoice" id="admin-form"
							autocomplete="off"> -->
						<form method="POST" action="addInvoiceDetails" id="admin-form"
							autocomplete="off">
							<div class="panel-body bg-light">
								<%
									session.setMaxInactiveInterval(10 * 60);

										if (session.getAttribute("smsg") != null) {
								%>
								<div id="fadeOutFun"
									class="alert alert-micro alert-border-left alert-success alert-dismissable">
									<button type="button" class="close" data-dismiss="alert"
										aria-hidden="true">×</button>
									<i class="fa fa-check pr10"></i> <strong></strong>
									<%=session.getAttribute("smsg")%>
									<!-- <a href="#" class="alert-link">this important alert message</a> -->
									.
								</div>
								<%
									session.removeAttribute("smsg");
										}
								%>

								<div class="section-divider mt20 mb40">
									<span> New Invoice</span>
								</div>

								<div class="section">
									<label for="clientName" class="field prepend-icon"> <select
										name="clientName" id="clientName"
										class="select2-single form-control gui-input">
											<%
												Connection con = DoConnection.getConnection();
													//	String invoiceUniqId = (String) invoiceData.getInvoiceId();
													//	String custCode = (String) invoiceData.getCustCode();
													PreparedStatement pt = con
															.prepareStatement("select * from client_master where id = ?");
													/* pt.setString(1, custCode); */
													pt.setString(1, request.getParameter("clientName"));
													ResultSet rt = pt.executeQuery();
													while (rt.next()) {
											%>

											<option value="<%=rt.getString(1)%>"><%=rt.getString(3)%></option>

											<%
												}
											%>
									</select>
									</label>
								</div>
								<div class="section row" id="spy1">
									<div class="col-md-6">
										<%
											/* Integer sesInvoiceId = (Integer) session.getAttribute("uniqInv_ID"); */
												Integer sesInvoiceId = Integer.parseInt(request
														.getParameter("invsUniqId"));
										%>
										<input type="hidden" value="<%=sesInvoiceId%>"
											name="invsUniqId" id="invsUniqId" /> <label for="invsUniqId"
											class="field prepend-icon"> <select
											name="materialName" id="materialName"
											class="select2-single form-control gui-input">
												<%
													PreparedStatement pg = con
																.prepareStatement("select * from material_master where client_id = ? and po_status = '1'");
														/* pg.setString(1, custCode); */
														pg.setString(1, request.getParameter("clientName"));
														ResultSet rg = pg.executeQuery();
														//		System.out.println(pg);
														while (rg.next()) {
												%>
												<option value="<%=rg.getString(1)%>"><%=rg.getString(3)%></option>
												<%
													}
												%>
										</select>
									</div>

									<div class="col-md-6">
										<label for="materialQty" class="field prepend-icon"> <input
											type="text" name="materialQty" id="materialQty"
											class="gui-input" placeholder="Material Quantity"> <label
											for="materialQty" class="field-icon" />
										</label> </label>
									</div>
								</div>
								<hr class="alt short">
							</div>

							<div class="panel-footer text-right">
								<button type="submit" class="button btn-primary">Add
									More</button>
								<button type="reset" class="button">Cancel</button>
							</div>
						</form>
					</div>



					<div class="tray tray-center">
						<div class="row">
							<div class="col-md-12">
								<form action="printInvoice" method="POST">


									<!-- <div class="panel-footer text-left">
										<button type="submit" class="button btn-primary">
											Print Invoice <i class="fa fa-print fs13"></i>
										</button>
									</div> -->

									<input type="hidden" value="<%=sesInvoiceId%>"
										name="invsUniqId" id="invsUniqId" />
									<div class="panel panel-visible" id="spy3">
										<div class="panel-body pn">
											<table class="table table-striped table-hover table-bordered"
												id="datatable3" cellspacing="0" width="100%">
												<thead>
													<tr>
														<th>ID</th>
														<th>Company Name</th>
														<th>Material Name</th>
														<th>Quantity</th>
														<th>Material Rate</th>
														<th>Amount</th>
														<th>Delete</th>
													</tr>
												</thead>
												<tbody>
													<%
														int cns = 0, interstateornot = 0;
															double miTot = 0d, totalAdditionOfGSTAmnt = 0d, AbslGrorssamnt = 0d, totIGSTAdd = 0d;
															double grandTotalAmount = 0;
															double totalQtyMtrlRate = 0d, subTotal = 0d;
															int vatperCgst = 9, vatperSgst = 9, vatperIgst = 18;
															double cgst = 0f, sgst = 0f, igst = 0f, finalAmount = 0f;
															PreparedStatement ps = con
																	.prepareStatement("SELECT id.id as idDetails, id.InvoiceId, c.id, id.materialcode, c.company_name, id.materialQty, i.id, i.clientId, IFNULL(po.rate,0) as MaterialRate, IFNULL(po.po_no,'NA') as po_no, mm.Material_Name, i.interstate_flag FROM invoicedetails id, invoice i, material_master mm left join po_master po on mm.id = po.material_Id, client_master c WHERE i.id = id.InvoiceId AND i.clientId = c.id AND mm.client_Id = c.id AND id.materialCode = mm.id AND i.clientId = ? AND i.inv_Hide = '0' AND i.id = ?");
															ps.setString(1, request.getParameter("clientName"));
															ps.setString(2, request.getParameter("invsUniqId"));
															ResultSet rs = ps.executeQuery();
															while (rs.next()) {
																cns++;

																interstateornot = Integer.parseInt(rs
																		.getString("interstate_flag"));
													%>
													<tr>

														<input type="hidden"
															value="<%=rs.getString("idDetails")%>" name="inDetails"
															id="inDetails" readonly="readonly" />
														<%-- <td><span class="label label-rounded label-danger"><%=rs.getString("idDetails")%></span></td> --%>
														<td><span class="label label-rounded label-danger"><%=cns%></span></td>
														<td><%=rs.getString("company_name")%></td>
														<td><%=rs.getString("Material_Name")%></td>
														<td><%=rs.getString("materialQty")%></td>
														<td><input type="text"
															value="<%=rs.getString("MaterialRate")%>"
															name="materialRatePO" id="materialRatePO"
															readonly="readonly" style="border: none; outline: none;" /></td>

														<%
															Double materialQty = Double.parseDouble(rs
																			.getString("materialQty"));
																	double MaterialRate = Double.parseDouble(rs
																			.getString("MaterialRate"));

																	totalQtyMtrlRate = materialQty * MaterialRate;
																	subTotal += totalQtyMtrlRate;

																	cgst = subTotal * vatperCgst / 100;
																	sgst = subTotal * vatperSgst / 100;
																	igst = subTotal * vatperIgst / 100;
														%>

														<td><input type="text" value="<%=totalQtyMtrlRate%>"
															name="materQtyTotal" id="materQtyTotal"
															readonly="readonly" style="border: none; outline: none;" /></td>
														<td><span style="margin-left: 18px;"></span><a
															class="fa fa-trash-o fa-lg" title="Delete"
															onclick="return confirm('Are you sure!?')"
															href="DeleteInvoiceId?clientName=<%=request.getParameter("clientName")%>&invsUniqId=<%=request.getParameter("invsUniqId")%>&deleteId=<%=rs.getString("idDetails")%>"><span></span></a>
															<span style="margin-left: 18px;"></span></td>
													</tr>
													<%
														}
													%>

													<tr>
														<td colspan="3" rowspan="3"></td>
														<td colspan="2">Total Amount&nbsp;</td>
														<td><span><input type="text"
																readonly="readonly" style="border: none; outline: none;"
																name="subTotalAmount" id="subTotalAmount"
																value="<%=subTotal%>" /></span></td>
													</tr>

													<%
														if (interstateornot == 0) {
																totalAdditionOfGSTAmnt = cgst + sgst;
															} else {
																totalAdditionOfGSTAmnt = 0 + 0;
															}
															if (interstateornot == 1) {
																totIGSTAdd = igst + 0;
															} else {
																totIGSTAdd = 0 + 0;
															}

															finalAmount += AbslGrorssamnt;
															double MastTotal = 0;
															if (interstateornot == 0) {
																MastTotal = totalAdditionOfGSTAmnt;
															} else {
																MastTotal = totIGSTAdd;
															}

															miTot = subTotal + MastTotal;
															grandTotalAmount = Math.round(miTot);
													%>

													<%
														if (interstateornot == 0) {
													%>
													<tr>
														<td>CGST</td>
														<td>9%</td>
														<td><input type="text" value="<%=cgst%>"
															readonly="readonly" name="cgstAmounts" id="cgstAmounts"
															style="border: none; outline: none;" /></td>
													</tr>

													<tr>
														<td>SGST</td>
														<td>9%</td>
														<td><input type="text" value="<%=sgst%>"
															readonly="readonly" name="sgstAmounts" id="sgstAmounts"
															style="border: none; outline: none;" /></td>
													</tr>
													<%
														} else {
													%>
													<tr>
														<td>CGST</td>
														<td>9%</td>
														<td><input type="text" value="0" name="cgstAmounts"
															id="cgstAmounts" /></td>
													</tr>

													<tr>
														<td>SGST</td>
														<td>9%</td>
														<td><input type="text" name="sgstAmounts"
															id="sgstAmounts" value="0" /></td>
													</tr>
													<%
														}
													%>

													<%
														if (interstateornot == 1) {
													%>
													<tr>
														<td colspan="3" rowspan="3"></td>
														<td>IGST</td>
														<td>18%</td>
														<td><input type="text" value="<%=igst%>"
															readonly="readonly" style="border: none; outline: none;"
															id="igstAmountTax" name="igstAmountTax" /></td>
													</tr>
													<%
														} else {
													%>
													<tr>
														<td colspan="3" rowspan="3"></td>
														<td>IGST</td>
														<td>18%</td>
														<td><input type="text" value="0" readonly="readonly"
															style="border: none; outline: none;" id="igstAmountTax"
															name="igstAmountTax" /></td>
													</tr>
													<%
														}
													%>

													<tr>
														<td colspan="2">Transport Charges &nbsp;</td>
														<td><span>0</span></td>
													</tr>
													<tr>
														<td colspan="2">Gross Amount &nbsp;</td>
														<td><span><input type="text"
																value="<%=grandTotalAmount%>" name="grossAmounts"
																id="grossAmounts" style="border: none; outline: none;"
																readonly="readonly" /></span></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>

									<%
										if (grandTotalAmount != 0) {
									%>
									<div class="panel-footer text-right">
										<button type="submit" class="button btn-primary">
											Print Invoice <i class="fa fa-print fs13"></i>
										</button>
										<!-- <button type="submit" class="button btn-warning">Submit</button> -->
									</div>
									<%
										} else {
									%>
									<div class="panel-footer text-right">
										<button type="button" class="button btn-warning">Add
											material</button>
									</div>
									<%
										}
									%>


								</form>
							</div>
						</div>
					</div>



				</div>
			</div>
		</div>




		</section><jsp:include page="footer.jsp"></jsp:include> </section>
	</div>

	<jsp:include page="footer-scripts.jsp"></jsp:include>


	<script src="vendor/plugins/datatables/media/js/datatables.min.js"></script>

	<script
		src="vendor/plugins/datatables/media/js/datatables_addons.min.js"></script>
	<script
		src="vendor/plugins/datatables/media/js/datatables_editor.min.js"></script>


	<script src="assets/admin-tools/admin-forms/js/jquery.validate.min.js"></script>

	<script
		src="assets/admin-tools/admin-forms/js/additional-methods.min.js"></script>

	<script src="vendor/plugins/select2/js/select2.min.js"></script>

	<script src="assets/js/utility/utility.js"></script>
	<script src="assets/js/demo/demo.js"></script>
	<script src="assets/js/main.js"></script>

	<script type="text/javascript">
		jQuery(document)
				.ready(
						function() {

							"use strict";

							// Init Theme Core    
							Core.init();

							// Init Demo JS     
							Demo.init();

							/* @custom validation method (smartCaptcha) 
							------------------------------------------------------------------ */

							$.validator.methods.smartCaptcha = function(value,
									element, param) {
								return value == param;
							};

							$("#admin-form")
									.validate(
											{

												/* @validation states + elements 
												------------------------------------------- */

												errorClass : "state-error",
												validClass : "state-success",
												errorElement : "em",

												/* @validation rules 
												------------------------------------------ */

												rules : {
													materialQty : {
														required : true,
														number : true,
													},
													materialName : {
														required : true
													},
													clientName : {
														required : true
													}
												},

												/* @validation error messages 
												---------------------------------------------- */

												messages : {

													clientName : {
														required : 'Enter Company Name'
													},

													materialName : {
														required : 'Oops you forgot to select state'
													},
													materialQty : {
														required : 'enter quantity'
													},

												},

												/* @validation highlighting + error placement  
												---------------------------------------------------- */

												highlight : function(element,
														errorClass, validClass) {
													$(element)
															.closest('.field')
															.addClass(
																	errorClass)
															.removeClass(
																	validClass);
												},
												unhighlight : function(element,
														errorClass, validClass) {
													$(element)
															.closest('.field')
															.removeClass(
																	errorClass)
															.addClass(
																	validClass);
												},
												errorPlacement : function(
														error, element) {
													if (element.is(":radio")
															|| element
																	.is(":checkbox")) {
														element
																.closest(
																		'.option-group')
																.after(error);
													} else {
														error
																.insertAfter(element
																		.parent());
													}
												}

											});

							// Cache several DOM elements
							var pageHeader = $('.content-header').find('b');
							var adminForm = $('.admin-form');
							var options = adminForm.find('.option');
							var switches = adminForm.find('.switch');
							var buttons = adminForm.find('.button');
							var Panel = adminForm.find('.panel');

							// Form Skin Switcher
							$('#skin-switcher a')
									.on(
											'click',
											function() {
												var btnData = $(this).data(
														'form-skin');

												$('#skin-switcher a')
														.removeClass(
																'item-active');
												$(this).addClass('item-active')

												adminForm
														.each(function(i, e) {
															var skins = 'theme-primary theme-info theme-success theme-warning theme-danger theme-alert theme-system theme-dark'
															var panelSkins = 'panel-primary panel-info panel-success panel-warning panel-danger panel-alert panel-system panel-dark'
															$(e)
																	.removeClass(
																			skins)
																	.addClass(
																			'theme-'
																					+ btnData);
															Panel
																	.removeClass(
																			panelSkins)
																	.addClass(
																			'panel-'
																					+ btnData);
															pageHeader
																	.removeClass()
																	.addClass(
																			'text-'
																					+ btnData);
														});

												$(options)
														.each(
																function(i, e) {
																	if ($(e)
																			.hasClass(
																					'block')) {
																		$(e)
																				.removeClass()
																				.addClass(
																						'block mt15 option option-'
																								+ btnData);
																	} else {
																		$(e)
																				.removeClass()
																				.addClass(
																						'option option-'
																								+ btnData);
																	}
																});

												// var sliders = $('.ui-timepicker-div', adminForm).find('.ui-slider');
												$('body')
														.find('.ui-slider')
														.each(
																function(i, e) {
																	$(e)
																			.addClass(
																					'slider-primary');
																});

												$(switches)
														.each(
																function(i, ele) {
																	if ($(ele)
																			.hasClass(
																					'switch-round')) {
																		if ($(
																				ele)
																				.hasClass(
																						'block')) {
																			$(
																					ele)
																					.removeClass()
																					.addClass(
																							'block mt15 switch switch-round switch-'
																									+ btnData);
																		} else {
																			$(
																					ele)
																					.removeClass()
																					.addClass(
																							'switch switch-round switch-'
																									+ btnData);
																		}
																	} else {
																		if ($(
																				ele)
																				.hasClass(
																						'block')) {
																			$(
																					ele)
																					.removeClass()
																					.addClass(
																							'block mt15 switch switch-'
																									+ btnData);
																		} else {
																			$(
																					ele)
																					.removeClass()
																					.addClass(
																							'switch switch-'
																									+ btnData);
																		}
																	}

																});
												buttons
														.removeClass()
														.addClass(
																'button btn-'
																		+ btnData);
											});

							setTimeout(
									function() {
										adminForm.addClass('theme-primary');
										Panel.addClass('panel-primary');
										pageHeader.addClass('text-primary');

										$(options)
												.each(
														function(i, e) {
															if ($(e).hasClass(
																	'block')) {
																$(e)
																		.removeClass()
																		.addClass(
																				'block mt15 option option-primary');
															} else {
																$(e)
																		.removeClass()
																		.addClass(
																				'option option-primary');
															}
														});

										$(switches)
												.each(
														function(i, ele) {
															if ($(ele)
																	.hasClass(
																			'switch-round')) {
																if ($(ele)
																		.hasClass(
																				'block')) {
																	$(ele)
																			.removeClass()
																			.addClass(
																					'block mt15 switch switch-round switch-primary');
																} else {
																	$(ele)
																			.removeClass()
																			.addClass(
																					'switch switch-round switch-primary');
																}
															} else {
																if ($(ele)
																		.hasClass(
																				'block')) {
																	$(ele)
																			.removeClass()
																			.addClass(
																					'block mt15 switch switch-primary');
																} else {
																	$(ele)
																			.removeClass()
																			.addClass(
																					'switch switch-primary');
																}
															}
														});
									}, 800);
							// Init Select2 - Basic Single
							$(".select2-single").select2();

							// Init Select2 - Contextuals (via html classes)
							$(".select2-primary").select2(); // select2 contextual - primary
							$(".select2-success").select2(); // select2 contextual - success
							$(".select2-info").select2(); // select2 contextual - info
							$(".select2-warning").select2(); /*  // select2 contextual - warning  */
						});
	</script>

	<script>
		$(function() {
			$("#challanDate").datepicker();
		});
		$(function() {
			$("#POValidFrom").datepicker();
		});
		$(function() {
			$("#POValidTo").datepicker();
		});
	</script>

	<script>
		$(document).ready(function() {

			$('#fadeOutFun').fadeOut(5000, 'swing', function() {
				//callback function after animation finished
				$("#fadeOutFun").attr('value', 'fadeOut() is now Complete');
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

