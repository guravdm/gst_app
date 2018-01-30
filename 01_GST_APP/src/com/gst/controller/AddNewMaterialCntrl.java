package com.gst.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gst.beans.ClientBean;
import com.gst.beans.MaterialBean;
import com.gst.bo.ClientBO;
import com.gst.bo.MaterialBO;

/**
 * Servlet implementation class AddNewMaterialCntrl
 */
@WebServlet("/AddNewMaterialCntrl")
public class AddNewMaterialCntrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddNewMaterialCntrl() {
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
		MaterialBean bean = new MaterialBean();
		bean.setCompanyName(request.getParameter("companyName"));
		bean.setHsnCode(request.getParameter("hsn_code"));
		bean.setUom(request.getParameter("uom"));
		bean.setMaterialName(request.getParameter("material_name"));
		bean.setMaterialDesc(request.getParameter("comment"));

		MaterialBO bo = new MaterialBO();
		flag = bo.saveEntry(bean);
		if (flag == true) {
			session.setAttribute("smsg",
					"You have successfully added record into the database!");
			response.sendRedirect("material-list.jsp");
		} else {
			session.setAttribute("smsg", "something went wrong!");
			response.sendRedirect("new-material.jsp");
		}

	}

}
