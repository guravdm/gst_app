package com.gst.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gst.beans.ClientBean;
import com.gst.bo.ClientBO;

/**
 * Servlet implementation class AddClientCntrl
 */
@WebServlet("/AddClientCntrl")
public class AddClientCntrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddClientCntrl() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		// System.out.println("hiii from client controller");
		boolean flag = false;
		HttpSession session = request.getSession();
		ClientBean bean = new ClientBean();
		bean.setCompanyName(request.getParameter("companyName"));
		bean.setfName(request.getParameter("firstname"));
		bean.setlName(request.getParameter("lastname"));
		bean.setEmail(request.getParameter("useremail"));
		bean.setMobNo(request.getParameter("mobile_phone"));
		bean.setExtNo(request.getParameter("home_phone"));
		bean.setGstNo(request.getParameter("gstNo"));
		bean.setPanNo(request.getParameter("licence_no"));
		bean.setAddress(request.getParameter("comment"));
		// bean.setPicode(request.getParameter(""));
		bean.setSurvey_no(request.getParameter("srvNo"));
		bean.setState(request.getParameter("state"));
		bean.setPicode(request.getParameter("pincode"));

		ClientBO bo = new ClientBO();
		flag = bo.saveEntry(bean);
		if (flag == true) {
			session.setAttribute("smsg",
					"You have successfully added record into the database!");
			response.sendRedirect("client-list.jsp");
		} else {
			session.setAttribute("smsg", "something went wrong!");
			response.sendRedirect("client-new.jsp");
		}

	}

}
