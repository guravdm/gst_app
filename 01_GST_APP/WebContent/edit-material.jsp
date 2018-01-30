
<%
	if (session.getAttribute("userId") != null) {

		session.setAttribute("page", "edit-material");
		session.setMaxInactiveInterval(10 * 60);
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
<title>Edit Material Entry</title>

<jsp:include page="header-scripts.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="vendor/plugins/datatables/media/css/datatables.min.css">
<link rel="stylesheet" type="text/css"
	href="vendor/plugins/datatables/media/css/datatables_addons.min.css">
<link rel="stylesheet" type="text/css"
	href="vendor/plugins/select2/css/core.css">


<link rel="stylesheet" href="assets/jquery-ui.css">

<script src="assets/jquery.js"></script>

<%
	Connection con = DoConnection.getConnection();
		String data = "";
		PreparedStatement pa = con
				.prepareStatement("select * from client_master");
		ResultSet ra = pa.executeQuery();
		while (ra.next()) {
			data = ra.getString(3) + "";
		}
%>
<input type="hidden" value="<%=data%>" name="clntName" id="clntName" />
<script>
	$(function() {
		var name = document.getElementById("clntName").value;
		// alert(name);
		var result = name.split(",");
		/* var availableTags = [ name ]; */
		$("#companyName").autocomplete({
			source : result
		});
	});
</script>

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
				<li><a href="#">Edit Material</a></li>
			</ul>
		</div>
		<div class="topbar-right hidden-xs hidden-sm">
			<a href="material-list.jsp"
				class="btn btn-default btn-sm light fw600 ml10"> <span
				class="fa fa fa-arrow-left"></span> Back
			</a> <a href="edit-material.jsp?uId=<%=request.getParameter("uId")%>"
				class="btn btn-default btn-sm light fw600 ml10"> <span
				class="fa fa fa-refresh"></span> Refresh
			</a>
		</div>
		</header> <section id="content" class="animated fadeIn">



		<div class="tray tray-center">

			<div class="admin-form theme-primary mw1000 center-block"
				style="padding-bottom: 175px;">
				<div class="panel heading-border">
					<form method="post" action="./UpdateMaterialCntrl"
						autocomplete="off" id="admin-form">
						<div class="panel-body bg-light">
							<div class="section-divider mt20 mb40">
								<span> Modify Material Information</span>
							</div>

							<%
								session.setMaxInactiveInterval(10 * 20);

									if (session.getAttribute("smsg") != null) {
							%>
							<div id="fadeOutFun"
								class="alert alert-micro alert-border-left alert-success alert-dismissable">
								<button type="button" class="close" data-dismiss="alert"
									aria-hidden="true">×</button>
								<i class="fa fa-check pr10"></i> <strong>Well done!</strong> You
								<%=session.getAttribute("smsg")%>
								<!-- <a href="#" class="alert-link">this important alert message</a> -->
								.
							</div>
							<%
								session.removeAttribute("smsg");
									}
							%>

							<%
								PreparedStatement p = con
											.prepareStatement("SELECT m.id as mId, m.client_id, m.material_name, m.hsn_code, m.uom, m.material_des, m.createdTime, m.updatedTime, cm.client_id as customerId, cm.company_name FROM material_master m, client_master cm where cm.id = m.client_id and m.id = ?");
									p.setString(1, request.getParameter("uId"));
									ResultSet r = p.executeQuery();
									// System.out.println(p);
									while (r.next()) {
							%>
							<input type="hidden" name="pri_id" value="<%=r.getString(1)%>" />

							<div class="section">
								<label for="companyName" class="field prepend-icon"> <input
									value="<%=r.getString("company_name")%>" type="text"
									readonly="readonly" name="companyName" id="companyName"
									autofocus class="gui-input" placeholder="Company Name">
									<label for="companyName" class="field-icon"> <i
										class="fa fa-shield"></i>
								</label>
								</label>
							</div>


							<div class="section row" id="spy1">
								<div class="col-md-6">
									<label for="hsn_code" class="field prepend-icon"> <input
										value="<%=r.getString("hsn_code")%>" type="text"
										name="hsn_code" id="hsn_code" class="gui-input"
										placeholder="HSN Code"> <label for="hsn_code"
										class="field-icon"> <i class="fa fa-user"></i>
									</label>
									</label>
								</div>

								<div class="col-md-6">
									<label for="uom" class="field prepend-icon"> <input
										value="<%=r.getString("uom")%>" type="text" name="uom"
										id="uom" class="gui-input" value="kg" placeholder="UOM">
										<label for="uom" class="field-icon"> <i
											class="fa fa-user"></i>
									</label>
									</label>
								</div>

							</div>

							<div class="section">
								<label for="useremail" class="field prepend-icon"> <input
									type="text" name="material_name" id="material_name"
									value="<%=r.getString("material_name")%>" class="gui-input"
									placeholder="Material Name"> <label for="material_name"
									class="field-icon"> <i class="fa fa-envelope"></i>
								</label>
								</label>
							</div>


							<div class="section" id="spy3">
								<label for="comment" class="field prepend-icon"> <textarea
										class="gui-textarea" id="comment" name="comment"
										placeholder="Material Details"><%=r.getString("material_des")%></textarea>
									<label for="comment" class="field-icon"> <i
										class="fa fa-comments"></i>
								</label> <span class="input-footer"> <strong>Material
											Details!:</strong> Use this area to describe material..
								</span>
								</label>
							</div>
							<%
								}
							%>
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
													material_name : {
														required : true
													},
													companyName : {
														required : true
													},

													hsn_code : {
														required : true
													},
													uom : {
														required : true
													},

													comment : {
														required : true,
														minlength : 5
													},

												},

												/* @validation error messages 
												---------------------------------------------- */

												messages : {

													companyName : {
														required : 'Enter Company Name'
													},

													comment : {
														required : 'Oops you forgot to comment',
														minlength : 'Enter at least 5 characters or more'
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