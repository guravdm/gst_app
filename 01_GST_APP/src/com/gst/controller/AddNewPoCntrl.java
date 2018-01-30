package com.gst.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gst.beans.ClientBean;
import com.gst.beans.PoBean;
import com.gst.bo.ClientBO;
import com.gst.bo.PoBO;

/**
 * Servlet implementation class AddNewPoCntrl
 */
@WebServlet("/AddNewPoCntrl")
public class AddNewPoCntrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddNewPoCntrl() {
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

		System.out.println("hiii from client controller");
		boolean flag = false;
		HttpSession session = request.getSession();
		PoBean bean = new PoBean();
		bean.setClientId(request.getParameter("companyName"));
		bean.setMatrlId(request.getParameter("material_name"));
		bean.setPoNo(request.getParameter("poNo"));
		bean.setRate(request.getParameter("rate"));
		Integer custCode = Integer.parseInt(request.getParameter("custCode"));

		PoBO bo = new PoBO();
		flag = bo.saveEntry(bean);
		if (flag == true) {
			session.setAttribute("smsg",
					"You have successfully added record into the database!");
			/*
			 * response.sendRedirect("po-list.jsp?clientId" +
			 * request.getParameter("companyName"));
			 */
			response.sendRedirect("po-new.jsp?clientId=" + custCode);
		} else {
			session.setAttribute("smsg", "something went wrong!");
			/* response.sendRedirect("po-new.jsp"); */
			response.sendRedirect("client-list.jsp");
		}

	}

}
