

<%
	if (session.getAttribute("userId") != null) {

		session.setAttribute("page", "demo");
		session.setMaxInactiveInterval(10 * 60);
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Vendor Registration</title>
<jsp:include page="header-scripts.jsp"></jsp:include>
</head>
<body class="admin-validation-page" data-spy="scroll"
	data-target="#nav-spy" data-offset="200">
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
			page="topbar-drop.jsp"></jsp:include> <header id="topbar">
		<div class="topbar-left">
			<ol class="breadcrumb">
				<li class="crumb-active"><a href="index.jsp">Dashboard</a></li>
				<li class="crumb-icon"><a href="index.jsp"> <span
						class="glyphicon glyphicon-home"></span>
				</a></li>
				<li class="crumb-link"><a href="index.jsp">Home</a></li>
				<li class="crumb-trail">Dashboard</li>
			</ol>
		</div>
		</header> </section>

	</div>


	<style>
/* demo page styles */
body {
	min-height: 2300px;
}

.content-header b, .admin-form .panel.heading-border:before, .admin-form .panel .heading-border:before
	{
	transition: all 0.7s ease;
}
/* responsive demo styles */
@media ( max-width : 800px) {
	.admin-form .panel-body {
		padding: 18px 12px;
	}
}
</style>





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
													lastname : {
														required : true
													},
													useremail : {
														required : true,
														email : true
													},
													website : {
														required : true,
														url : true
													},
													language : {
														required : true
													},
													upload1 : {
														required : true,
														extension : "jpg|png|gif|jpeg|doc|docx|pdf|xls|rar|zip"
													},
													mobileos : {
														required : true
													},
													comment : {
														required : true,
														minlength : 30
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
													password : {
														required : true,
														minlength : 6,
														maxlength : 16
													},
													repeatPassword : {
														required : true,
														minlength : 6,
														maxlength : 16,
														equalTo : '#password'
													},
													gender : {
														required : true
													},
													languages : {
														required : true
													},
													verification : {
														required : true,
														smartCaptcha : 19
													},
													applicant_age : {
														required : true,
														min : 16
													},
													licence_no : {
														required : function(
																element) {
															return $(
																	"#applicant_age")
																	.val() > 19;
														}
													},
													child_name : {
														required : "#parents:checked"
													}

												},

												/* @validation error messages 
												---------------------------------------------- */

												messages : {
													firstname : {
														required : 'Enter first name'
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
													gender : {
														required : 'Please choose specie'
													},
													languages : {
														required : 'Select laguages spoken'
													},
													verification : {
														required : 'Please enter verification code',
														smartCaptcha : 'Oops - enter a correct verification code'
													},
													applicant_age : {
														required : 'Enter applicant age',
														min : 'Must be 16 years and above'
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
										buttons.removeClass().addClass(
												'button btn-primary');
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