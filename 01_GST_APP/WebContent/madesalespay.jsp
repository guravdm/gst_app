

<%
	if (session.getAttribute("userId") != null) {

		session.setAttribute("page", "madesalespay");
		session.setMaxInactiveInterval(10 * 60);
		Connection con = DoConnection.getConnection();
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
<title>Payment Entry</title>

<jsp:include page="header-scripts.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="vendor/plugins/datatables/media/css/datatables.min.css">
<link rel="stylesheet" type="text/css"
	href="vendor/plugins/datatables/media/css/datatables_addons.min.css">
<link rel="stylesheet" type="text/css"
	href="vendor/plugins/select2/css/core.css">


<!-- <link rel="stylesheet" href="assets/jquery-ui.css">

<script src="assets/jquery.js"></script> -->
<link rel="stylesheet" href="ui/cs/jquery-ui.css">
<script src="ui/jquery-2.1.1.js"></script>
<script src="ui/jquery-ui.js"></script>



<script>
	function change() {
		// alert('sadsa');

		var mode = document.getElementById("pay_mode").value;
		// alert(mode);
		var ChequeNo = document.getElementById("spy1");

		if (mode == "Cheque") {
			// alert(mode);
			ChequeNo.style.display = "block";
		} else {
			ChequeNo.style.display = "none";

		}

	}
</script>

</head>
<body onload="change()" class="dashboard-page sb-l-o sb-r-c">


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
			</ul>
		</div>
		<div class="topbar-right hidden-xs hidden-sm">
			<a href="salespay.jsp"
				class="btn btn-default btn-sm light fw600 ml10"> <span
				class="fa fa fa-arrow-left"></span> Back
			</a> <a href="madesalespay.jsp"
				class="btn btn-default btn-sm light fw600 ml10"> <span
				class="fa fa fa-refresh"></span> Refresh
			</a>
		</div>
		</header> <section id="content" class="animated fadeIn">
		<div class="tray tray-center">
			<div class="admin-form theme-primary mw1000 center-block"
				style="padding-bottom: 175px;">
				<div class="panel heading-border">
					<form method="post" action="paymadecntrl" autocomplete="off"
						onsubmit="return checkit();" id="admin-form">
						<div class="panel-body bg-light">
							<div class="section-divider mt20 mb40">
								<span> Payment Entry</span>
							</div>

							<%
								session.setMaxInactiveInterval(10 * 60);
							%>

							<div class="section row">
								<div class="col-md-6">
									<label for="invoiceCode" class="field prepend-icon"> <input
										type="text" name="invoiceCode" id="invoiceCode"
										readonly="readonly"
										value="<%=request.getParameter("invoiceId")%>"
										class="gui-input" placeholder="Invoice Number"> <label
										for="invoiceCode" class="field-icon"> <i class="fa "></i>
									</label>
									</label>
								</div>
							</div>


							<input type="hidden" name="cmName" id="cmName"
								value="<%=request.getParameter("compname")%>" /> <input
								type="hidden" name="compCodes" id="compCodes"
								value="<%=request.getParameter("custCode")%>" />

							<div class="section">
								<label for="companyName" class="field prepend-icon"> <input
									value="<%=request.getParameter("compname")%>" type="text"
									readonly="readonly" name="companyName" id="companyName"
									class="gui-input"
									placeholder="<%=request.getParameter("compname")%>"> <label
									for="companyName" class="field-icon"> <i
										class="fa fa-shield"></i>
								</label>
								</label>
							</div>


							<div class="section row">
								<div class="col-md-6">
									<label for="balance_amnt" class="field prepend-icon"> <input
										type="text" name="balance_amnt" id="balance_amnt"
										readonly="readonly"
										value="<%=request.getParameter("BalanceAmount")%>"
										class="gui-input" placeholder="Balance Amount"> <label
										for="balance_amnt" class="field-icon"> <i class="fa "></i>
									</label>
									</label>
								</div>


								<div class="col-md-6">
									<label for="pay_mode" class="field prepend-icon"> <select
										name="pay_mode" id="pay_mode" onchange="change()"
										class="select2-single form-control gui-input">
											<option value="Cash">Cash</option>
											<option value="Cheque">Cheque</option>
									</select>
									</label>
								</div>
							</div>

							<div class="section row">
								<div class="col-md-6" id="spy1">
									<label for="chequeNo" class="field prepend-icon"> <input
										type="text" name="chequeNo" id="chequeNo" class="gui-input"
										placeholder="Cheque Number"> <label for="chequeNo"
										class="field-icon"> <i class="fa "></i>
									</label>
									</label>
								</div>
							</div>


							<div class="section row">
								<div class="col-md-6">


									<script type="text/javascript">
										function checkit() {
											$('#amsg').html('');
											if (parseInt($('#balance_amnt')
													.val()) >= parseInt($(
													'#pay_amnt').val()))
												return true;
											else
												$('#amsg')
														.html(
																"Paying amount should be less than balance amount.");
											return false;
										}
									</script>

									<%
										if (request.getParameter("BalanceAmount") == null) {
									%>
									<input type="text" placeholder="" class="form-control"
										style="width: 40%" name="pay_amnt" value="0" id="pay_amnt"
										id="pay_amnt" onkeyup="checkit();" autofocus="autofocus">
									<%
										} else {
									%>


									<label for="pay_amnt" class="field prepend-icon"> <input
										autofocus type="text" name="pay_amnt" id="pay_amnt"
										onkeyup="checkit();" class="gui-input"
										placeholder="Payment Amount"> <label for="pay_amnt"
										class="field-icon"> <i class="fa"></i>
									</label>
									</label>

									<%
										}
									%>
									<label id="amsg"></label>
								</div>

								<div class="col-md-6">
									<label for="pay_date" class="field prepend-icon"> <input
										type="text" name="pay_date" id="pay_date" class="gui-input"
										placeholder="Payment Date"> <label for="pay_date"
										class="field-icon"> <i class="fa "></i>
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
		$(document).ready(function() {
			$('#pay_mode').hide();
		});
	</script>


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
													balance_amnt : {
														required : true
													},
													companyName : {
														required : true
													},
													pay_mode : {
														required : true
													},
													chequeNo : {
														required : true
													},
													pay_amnt : {
														required : true,
														number :true
													},
													pay_date : {
														required : true
													},
												},

												/* @validation error messages 
												---------------------------------------------- */

												messages : {

													companyName : {
														required : 'Enter Company Name'
													},

													balance_amnt : {
														required : 'please specify amount'
													},

													pay_mode : {
														required : 'please select payment mode'
													},
													chequeNo : {
														required : 'please enter cheque no'
													},

													pay_amnt : {
														required : 'please enter amount'
													},
													pay_date : {
														required : 'please select date'
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
		$(document).ready(function() {

			$('#fadeOutFun').fadeOut(5000, 'swing', function() {
				//callback function after animation finished
				$("#fadeOutFun").attr('value', 'fadeOut() is now Complete');
			});

			$('#pay_date').datepicker({
				dateFormat : 'dd/mm/yy',
				changeMonth : true,
				changeYear : true
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