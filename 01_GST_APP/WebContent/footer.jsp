
<%
	if (session.getAttribute("userId") != null) {

		session.setAttribute("page", "footer.jsp");
		session.setMaxInactiveInterval(10 * 60);
%>

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
<footer id="content-footer">
	<div class="row">
		<div class="col-xs-6">
			<span class="footer-legal">© 2017 Dnyanesh Design</span>
		</div>
		<div class="col-xs-6 text-right">
			<span class="footer-meta"> </span> <a href="#content"
				class="footer-return-top"> <span class="fa fa-arrow-up"></span>
			</a>
		</div>
	</div>
</footer>


<%
	} else {
		response.sendRedirect("login.jsp");
	}
%>
