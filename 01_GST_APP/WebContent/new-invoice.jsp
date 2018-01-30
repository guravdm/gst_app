
<%
	if (session.getAttribute("userId") != null) {

		session.setAttribute("page", "new-invoice");
		session.setMaxInactiveInterval(10 * 60);
%>

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
<title>New Invoice Entry</title>

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
				<li><a href="#">New Entry</a></li>
			</ul>
		</div>
		<div class="topbar-right hidden-xs hidden-sm">
			<a href="invoice-list.jsp"
				class="btn btn-default btn-sm light fw600 ml10"> <span
				class="fa fa fa-arrow-left"></span> Back
			</a> <a href="new-invoice.jsp"
				class="btn btn-default btn-sm light fw600 ml10"> <span
				class="fa fa fa-refresh"></span> Refresh
			</a>
		</div>
		</header> <section id="content" class="animated fadeIn">



		<div class="tray tray-center">

			<div class="admin-form theme-primary mw1000 center-block"
				style="padding-bottom: 175px;">
				<div class="panel heading-border">
					<div class="panel-body pn">

						<form method="post" action="saveInvoice" id="admin-form"
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



								<%
									Connection con = DoConnection.getConnection();
										int autoInvID = 0;
										PreparedStatement pl = con
												.prepareStatement("SELECT count(*) as autoNo FROM invoice");
										ResultSet rl = pl.executeQuery();
										while (rl.next()) {
											autoInvID += rl.getInt(1);
											autoInvID += 45;
										}
								%>
								<div class="section row">
									<div class="col-md-6">
										<label for="invsUniqId" class="field prepend-icon"> <input
											readonly="readonly" type="text" name="invsUniqId"
											id="invsUniqId" class="gui-input" value="<%=autoInvID%>"
											placeholder="invsUniqId Id"> <label for="invsUniqId"
											class="field-icon" />
										</label> </label>
									</div>
								</div>


								<div class="section ">
									<label for="clientName" class="field prepend-icon"> <select
										name="clientName" id="clientName"
										class="select2-single form-control gui-input">
											<option></option>
											<%
												PreparedStatement pt = con
															.prepareStatement("select * from client_master");
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
										<label for="state" class="field prepend-icon"> <select
											name="state" id="state"
											class="select2-single form-control gui-input">
												<option value="Maharashtra">Maharashtra</option>
												<option value="Karnataka">Karnataka</option>
												<option value="Kerala">Kerala</option>
										</select>
										</label>
									</div>
									<div class="col-md-6">
										<label for="challanNo" class="field prepend-icon"> <input
											type="text" name="challanNo" id="challanNo" class="gui-input"
											placeholder="Challan No"> <label for="challanNo"
											class="field-icon" />
										</label> </label>
									</div>
								</div>

								<div class="section row" id="spy1">
									<div class="col-md-6">
										<label for="challanDate" class="field prepend-icon"> <input
											type="text" name="challanDate" id="challanDate"
											class="gui-input" placeholder="Challan Date"> <label
											for="challanDate" class="field-icon"> </label>
										</label>
									</div>

									<div class="col-md-6">
										<label for="poNumber" class="field prepend-icon"> <input
											type="text" name="poNumber" id="poNumber" class="gui-input"
											placeholder="PO Number"> <label for="poNumber"
											class="field-icon"> </label>
										</label>
									</div>
								</div>

								<div class="section row">
									<div class="col-md-6">
										<label for="POValidFrom" class="field prepend-icon"> <input
											type="tel" name="POValidFrom" id="POValidFrom"
											class="gui-input phone-group" placeholder="PO Valid From">
											<label for="POValidFrom" class="field-icon"> <i
												class="fa fa-mobile-phone"></i>
										</label>
										</label>
									</div>

									<div class="col-md-6">
										<label for="POValidTo" class="field prepend-icon"> <input
											type="tel" name="POValidTo" id="POValidTo"
											class="gui-input phone-group" placeholder="POValid To">
											<label for="POValidTo" class="field-icon"> <i
												class="fa fa-phone"></i>
										</label>
										</label>
									</div>

								</div>

								<hr class="alt short">
							</div>

							<div class="panel-footer text-right">
								<button type="submit" class="button btn-primary">Submit</button>
								<button type="reset" class="button">Cancel</button>
							</div>
						</form>
					</div>
				</div>

			</div>
		</section><jsp:include page="footer.jsp"></jsp:include> </section>

	</div>



	<jsp:include page="footer-scripts.jsp"></jsp:include>

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
													poNumber : {
														required : true
													},
													POValidFrom : {
														required : true
													},
													POValidTo : {
														required : true
													},
													challanDate : {
														required : true
													},

													challanNo : {
														required : true
													},
													state : {
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

													state : {
														required : 'Oops you forgot to select state'
													},
													challanNo : {
														required : 'Enter challan no'
													},
													challanDate : {
														required : 'select date'
													},
													POValidTo : {
														required : 'select PO valid date'
													},
													POValidFrom : {
														required : 'select PO valid date'
													},
													poNumber : {
														required : 'enter valid po number'
													}

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
			$("#POValidFrom").datepicker({
				onSelect : function(selected) {
					var dt = new Date(selected);
					dt.setDate(dt.getDate() + 1);
					$("#POValidTo").datepicker("option", "minDate", dt);
				}
			});

			$("#POValidTo").datepicker({
				onSelect : function(selected) {
					var dt = new Date(selected);
					dt.setDate(dt.getDate() - 1);
					$("#POValidFrom").datepicker("option", "maxDate", dt);
				}
			});
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