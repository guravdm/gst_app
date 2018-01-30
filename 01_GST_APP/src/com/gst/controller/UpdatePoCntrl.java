package com.gst.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gst.beans.PoBean;
import com.gst.bo.PoBO;

/**
 * Servlet implementation class UpdatePoCntrl
 */
@WebServlet("/UpdatePoCntrl")
public class UpdatePoCntrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdatePoCntrl() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
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

		// Integer clientId =
		// Integer.parseInt(request.getParameter("clientId"));
		Integer poId = Integer.parseInt(request.getParameter("purchID"));
		bean.setId(poId);

		PoBO bo = new PoBO();
		flag = bo.updateEntry(bean);
		if (flag == true) {
			session.setAttribute("smsg",
					"You have successfully added record into the database!");
			response.sendRedirect("po-list.jsp");
		} else {
			session.setAttribute("smsg", "something went wrong!");
			response.sendRedirect("po-edit.jsp?uId=" + poId);
		}

	}

}
