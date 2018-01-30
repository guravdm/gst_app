

<%
	if (session.getAttribute("userId") != null) {

		session.setAttribute("page", "client-new");
		session.setMaxInactiveInterval(10 * 60);
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New Client Entry</title>

<jsp:include page="header-scripts.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="vendor/plugins/datatables/media/css/datatables.min.css">
<link rel="stylesheet" type="text/css"
	href="vendor/plugins/datatables/media/css/datatables_addons.min.css">


<script type="text/javascript" src="ajax/getName.js"></script>


</head>
<body onload="GetControllerNo()" class="dashboard-page sb-l-o sb-r-c">


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
			<a href="client-list.jsp"
				class="btn btn-default btn-sm light fw600 ml10"> <span
				class="fa fa fa-arrow-left"></span> Back
			</a> <a href="client-new.jsp"
				class="btn btn-default btn-sm light fw600 ml10"> <span
				class="fa fa fa-refresh"></span> Refresh
			</a>
		</div>
		</header> <section id="content" class="animated fadeIn">



		<div class="tray tray-center">

			<div class="admin-form theme-primary mw1000 center-block"
				style="padding-bottom: 175px;">
				<div class="panel heading-border">
					<form method="post" action="./AddClientCntrl" id="admin-form"
						autocomplete="off">
						<div class="panel-body bg-light">
							<div class="section-divider mt20 mb40">
								<span> Client Registration</span>
							</div>

							<div class="section">
								<label for="companyName" class="field prepend-icon"> <input
									autofocus type="text" name="companyName" id="companyName"
									onkeyup="GetControllerNo()" class="gui-input"
									placeholder="Company Name"> <label for="companyName"
									class="field-icon"> <i class="fa fa-shield"></i>
								</label> <span id="folderwarning" name="folderwarning"
									style="color: red">Customer name already exists!</span>
								</label>
							</div>


							<div class="section row" id="spy1">
								<div class="col-md-6">
									<label for="firstname" class="field prepend-icon"> <input
										type="text" name="firstname" id="firstname" class="gui-input"
										placeholder="First name..."> <label for="firstname"
										class="field-icon"> <i class="fa fa-user"></i>
									</label>
									</label>
								</div>

								<div class="col-md-6">
									<label for="lastname" class="field prepend-icon"> <input
										type="text" name="lastname" id="lastname" class="gui-input"
										placeholder="Last name..."> <label for="lastname"
										class="field-icon"> <i class="fa fa-user"></i>
									</label>
									</label>
								</div>

							</div>

							<div class="section">
								<label for="useremail" class="field prepend-icon"> <input
									type="email" name="useremail" id="useremail" class="gui-input"
									placeholder="Email address"> <label for="useremail"
									class="field-icon"> <i class="fa fa-envelope"></i>
								</label>
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
							</div>



							<div class="section-divider mv40">
								<span> Fill at least one </span>
							</div>

							<div class="section row">
								<div class="col-md-6">
									<label for="mobile_phone" class="field prepend-icon"> <input
										type="tel" name="mobile_phone" id="mobile_phone"
										class="gui-input phone-group" placeholder="Mobile number">
										<label for="mobile_phone" class="field-icon"> <i
											class="fa fa-mobile-phone"></i>
									</label>
									</label>
								</div>

								<div class="col-md-6">
									<label for="home_phone" class="field prepend-icon"> <input
										type="tel" name="home_phone" id="home_phone"
										class="gui-input phone-group" placeholder="EXT number">
										<label for="home_phone" class="field-icon"> <i
											class="fa fa-phone"></i>
									</label>
									</label>
								</div>

							</div>

							<div class="section row">
								<div class="col-md-6">
									<label for="gstNo" class="field prepend-icon"> <input
										type="text" name="gstNo" id="gstNo" class="gui-input"
										placeholder="GST Number"> <label for="gstNo"
										class="field-icon"> <i class="fa fa-male"></i>
									</label>
									</label>
								</div>

								<div class="col-md-6">
									<label for="licence_no" class="field prepend-icon"> <input
										type="text" name="licence_no" id="licence_no"
										class="gui-input" placeholder="PAN number"> <label
										for="licence_no" class="field-icon"> <i
											class="fa fa-credit-card"></i>
									</label>
									</label>
								</div>

							</div>




							<div class="section row" style="display: none;">
								<div class="col-md-6">
									<label for="srvNo" class="field prepend-icon"> <input
										value="none" type="text" name="srvNo" id="srvNo"
										class="gui-input" placeholder="Survey Number"> <label
										for="srvNo" class="field-icon"> <i class="fa fa-male"></i>
									</label>
									</label>
								</div>

								<div class="col-md-6">
									<label for="pincode" class="field prepend-icon"> <input
										value="none" type="text" name="pincode" id="pincode"
										class="gui-input" placeholder="pin code"> <label
										for="pincode" class="field-icon"> <i
											class="fa fa-credit-card"></i>
									</label>
									</label>
								</div>

							</div>






							<div class="section" id="spy3">
								<label for="comment" class="field prepend-icon"> <textarea
										class="gui-textarea" id="comment" name="comment"
										placeholder="Address"></textarea> <label for="comment"
									class="field-icon"> <i class="fa fa-comments"></i>
								</label> <span class="input-footer"> <strong>A Addess!:</strong>
										Use this area to write an address of a Vendor..
								</span>
								</label>
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
													firstname : {
														required : true
													},
													companyName : {
														required : true
													},
													lastname : {
														required : true
													},
													useremail : {
														required : true,
														email : true
													},

													mobileos : {
														required : true,
														minlength : 10
													},
													comment : {
														required : true,
														minlength : 6
													},
													srvNo : {
														required : true,
													},
													mobile_phone : {
														require_from_group : [
																1,
																".phone-group" ]
													},
													home_phone : {
														require_from_group : [
																1,
																".phone-group" ]
													},

													gstNo : {
														required : true,
													},
													licence_no : {
														required : function(
																element) {
															return $(
																	"#applicant_age")
																	.val() > 19;
														}
													},
												},

												/* @validation error messages 
												---------------------------------------------- */

												messages : {
													firstname : {
														required : 'Enter first name'
													},
													srvNo : {
														required : 'Enter survey number'
													},
													companyName : {
														required : 'Enter Company Name'
													},
													lastname : {
														required : 'Enter last name'
													},
													useremail : {
														required : 'Enter email address',
														email : 'Enter a VALID email address'
													},
													website : {
														required : 'Enter your website URL',
														url : 'URL should start with - http://www'
													},
													language : {
														required : 'Choose a language'
													},
													upload1 : {
														required : 'Please browse a file',
														extension : 'File format not supported'
													},
													mobileos : {
														required : 'Please select a mobile platform'
													},
													comment : {
														required : 'Oops you forgot to comment',
														minlength : 'Enter at least 30 characters or more'
													},
													mobile_phone : {
														require_from_group : 'Fill at least a mobile contact'
													},
													home_phone : {
														require_from_group : 'Fill at least a home contact'
													},
													password : {
														required : 'Please enter a password'
													},
													repeatPassword : {
														required : 'Please repeat the above password',
														equalTo : 'Password mismatch detected'
													},

													gstNo : {
														required : 'Enter GST Number',
													},
													licence_no : {
														required : 'Enter licence number'
													},
													child_name : {
														required : 'Please enter your childs name'
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

						});
	</script>

</body>
</html>

<%
	} else {
		response.sendRedirect("login.jsp");
	}
%>
