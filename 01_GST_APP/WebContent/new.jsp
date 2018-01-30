
<%
	if (session.getAttribute("userId") != null) {

		session.setAttribute("page", "new");
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
		</header> <section id="content" class="table-layout animated fadeIn">
		<div class="tray tray-center">
			<div class="admin-form theme-primary mw1000 center-block"
				style="padding-bottom: 175px;">
				<div class="panel heading-border">
					<form method="post" action="http://admindesigns.com/"
						id="admin-form">
						<div class="panel-body bg-light">
							<div class="section-divider mt20 mb40">
								<span> Vendor Registration</span>
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

							<div class="section">
								<label for="website" class="field prepend-icon"> <input
									type="url" name="website" id="website" class="gui-input"
									placeholder="Current website url"> <label for="website"
									class="field-icon"> <i class="fa fa-globe"></i>
								</label>
								</label>
							</div>

							<div class="section" id="spy2">
								<label for="file1" class="field file"> <span
									class="button btn-primary"> Choose File </span> <input
									type="file" class="gui-file" name="upload1" id="file1"
									onChange="document.getElementById('uploader1').value = this.value;">
									<input type="text" class="gui-input" id="uploader1"
									placeholder="no file selected" readonly>
								</label>
							</div>

							<div class="section" id="spy3">
								<label for="comment" class="field prepend-icon"> <textarea
										class="gui-textarea" id="comment" name="comment"
										placeholder="Your comment"></textarea> <label for="comment"
									class="field-icon"> <i class="fa fa-comments"></i>
								</label> <span class="input-footer"> <strong>A Footer!:</strong>
										Use this area to put a useful tip or guideline..
								</span>
								</label>
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
										class="gui-input phone-group" placeholder="Home number">
										<label for="home_phone" class="field-icon"> <i
											class="fa fa-phone"></i>
									</label>
									</label>
								</div>

							</div>

							<div class="section-divider mv40" id="spy4">
								<span> Equal - Matching elements </span>
							</div>

							<div class="section">
								<label for="password" class="field prepend-icon"> <input
									type="password" name="password" id="password" class="gui-input"
									placeholder="Create a password"> <label for="password"
									class="field-icon"> <i class="fa fa-lock"></i>
								</label>
								</label>
							</div>

							<div class="section">
								<label for="repeatPassword" class="field prepend-icon">
									<input type="password" name="repeatPassword"
									id="repeatPassword" class="gui-input"
									placeholder="Repeat password"> <label
									for="repeatPassword" class="field-icon"> <i
										class="fa fa-unlock-alt"></i>
								</label>
								</label>
							</div>

							<div class="section-divider mv40" id="spy6">
								<span> Custom Methods </span>
							</div>

							<div class="section">
								<div class="smart-widget sm-left sml-120">
									<label for="verification" class="field prepend-icon"> <input
										type="text" name="verification" id="verification"
										class="gui-input" placeholder="Solve verification"> <label
										for="verification" class="field-icon"> <i
											class="fa fa-shield"></i>
									</label>
									</label> <label for="verification" class="button">15 + 4 = </label>
								</div>

							</div>

							<div class="section-divider mv40" id="spy7">
								<span> Conditional validation </span>
							</div>

							<div class="section">
								<p>1 - The applicant age must be 16 years and above</p>
								<p>2 - For applicants above 19 years, a licence number will
									be required</p>
							</div>

							<div class="section row">
								<div class="col-md-6">
									<label for="applicant_age" class="field prepend-icon">
										<input type="text" name="applicant_age" id="applicant_age"
										class="gui-input" placeholder="Applicant age"> <label
										for="applicant_age" class="field-icon"> <i
											class="fa fa-male"></i>
									</label>
									</label>
								</div>

								<div class="col-md-6">
									<label for="licence_no" class="field prepend-icon"> <input
										type="text" name="licence_no" id="licence_no"
										class="gui-input" placeholder="Licence number"> <label
										for="licence_no" class="field-icon"> <i
											class="fa fa-credit-card"></i>
									</label>
									</label>
								</div>

							</div>

							<hr class="alt short">
							<div class="section">
								<p>Child name will be required when you agree / tick / check
									that you are a parent</p>
							</div>

							<div class="section">
								<div class="option-group field">
									<label class="option block"> <input type="checkbox"
										name="parents" id="parents" value="parents"> <span
										class="checkbox"></span> Yes i am a parent
									</label>
								</div>

							</div>

							<div class="section">
								<label for="child_name" class="field prepend-icon"> <input
									type="text" name="child_name" id="child_name" class="gui-input"
									placeholder="Enter childs name"> <label
									for="child_name" class="field-icon"> <i
										class="fa fa-female"></i>
								</label>
								</label>
							</div>

						</div>

						<div class="panel-footer text-right">
							<button type="submit" class="button btn-primary">
								Validate Form</button>
							<button type="reset" class="button">Cancel</button>
						</div>

					</form>
				</div>
			</div>

		</div>
		</section> </section>
		</section>
		<jsp:include page="footer.jsp"></jsp:include>
		</section>
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