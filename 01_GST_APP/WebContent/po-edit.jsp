
<%
	if (session.getAttribute("userId") != null) {

		session.setAttribute("page", "po-edit");
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
<title>Purchase Order Entry</title>

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
	Connection con = DoConnection.getConnection();
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
				<li><a href="#">PO Entry</a></li>
			</ul>
		</div>
		<div class="topbar-right hidden-xs hidden-sm">
			<a href="po-list.jsp" class="btn btn-default btn-sm light fw600 ml10">
				<span class="fa fa fa-arrow-left"></span> Back
			</a> <a href="po-new.jsp" class="btn btn-default btn-sm light fw600 ml10">
				<span class="fa fa fa-refresh"></span> Refresh
			</a>
		</div>
		</header> <section id="content" class="animated fadeIn">



		<div class="tray tray-center">

			<div class="admin-form theme-primary mw1000 center-block"
				style="padding-bottom: 175px;">
				<div class="panel heading-border">
					<form method="post" action="./UpdatePoCntrl" autocomplete="off"
						id="admin-form">
						<div class="panel-body bg-light">
							<div class="section-divider mt20 mb40">
								<span> Purchase Order Entry</span>
							</div>

							<%
								session.setMaxInactiveInterval(10 * 20);

									if (session.getAttribute("smsg") != null) {
							%>
							<div id="fadeOutFun"
								class="alert alert-micro alert-border-left alert-success alert-dismissable">
								<button type="button" class="close" data-dismiss="alert"
									aria-hidden="true">�</button>
								<i class="fa fa-check pr10"></i> <strong></strong> You
								<%=session.getAttribute("smsg")%>
								<!-- <a href="#" class="alert-link">this important alert message</a> -->
								.
							</div>
							<%
								session.removeAttribute("smsg");
									}
							%>

							<%
								String clientName = "";
									PreparedStatement ps = con
											.prepareStatement("SELECT po.id as purchaseID, po.material_id, po.client_id, po.rate,po.po_no, mm.client_id as clientId, mm.material_name, cm.company_name FROM po_master po, material_master mm, client_master cm where cm.id = mm.client_id and po.client_id = cm.id and po.material_id = mm.id and po.id = ? ");
									ps.setString(1, request.getParameter("uId"));
									ResultSet rs = ps.executeQuery();
									while (rs.next()) {
							%>

							<input type="hidden" name="clientId" id="clientId"
								readonly="readonly" value="<%=rs.getString("company_name")%>" />
							<input type="hidden" readonly="readonly" name="purchID"
								id="purchID" value="<%=rs.getString("purchaseID")%>" />


							<div class="section">
								<label for="companyName" class="field prepend-icon"> <input
									readonly="readonly" type="text" name="companyName"
									id="companyName" autofocus
									value="<%=rs.getString("company_name")%>" class="gui-input"
									placeholder="Company Name"> <label for="companyName"
									class="field-icon"> <i class="fa fa-shield"></i>
								</label>
								</label>
							</div>


							<div class="section">
								<select name="material_name" id="material_name"
									class="select2-single form-control gui-input">
									<option value="<%=rs.getString("material_name")%>"><%=rs.getString("material_name")%></option>
								</select>
							</div>

							<div class="section row" id="spy1">
								<div class="col-md-6">
									<label for="poNo" class="field prepend-icon"> <input
										value="<%=rs.getString("po_no")%>" type="text" name="poNo"
										id="poNo" class="gui-input" placeholder="PO Number"> <label
										for="poNo" class="field-icon"> <i class="fa fa-user"></i>
									</label>
									</label>
								</div>

								<div class="col-md-6">
									<label for="rate" class="field "> <input type="text"
										value="<%=rs.getString("rate")%>" name="rate" id="rate"
										class="gui-input" value="0" placeholder="Rate"> <label
										for="rate" class="field-icon"> </label>
									</label>
								</div>
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

													poNo : {
														required : true
													},
													rate : {
														required : true
													},
													mtaerialsName : {
														required : true
													}
												},

												/* @validation error messages 
												---------------------------------------------- */

												messages : {

													companyName : {
														required : 'Enter Company Name'
													},

													poNo : {
														required : 'Oops you forgot to give po number'
													},
													rate : {
														required : 'Enter Material Rate'
													},
													rate : {
														required : 'Enter Material Rate'
													},
													mtaerialsName : {
														required : 'select material from list'
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