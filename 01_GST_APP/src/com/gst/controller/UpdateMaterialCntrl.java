package com.gst.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gst.beans.MaterialBean;
import com.gst.beans.VendorRegBean;
import com.gst.bo.MaterialBO;
import com.gst.bo.VendorBO;

/**
 * Servlet implementation class UpdateMaterialCntrl
 */
@WebServlet("/UpdateMaterialCntrl")
public class UpdateMaterialCntrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateMaterialCntrl() {
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

		// System.out.println("hiii from material controller");
		boolean flag = false;
		HttpSession session = request.getSession();
		MaterialBean bean = new MaterialBean();
		bean.setCompanyName(request.getParameter("companyName"));
		bean.setHsnCode(request.getParameter("hsn_code"));
		bean.setUom(request.getParameter("uom"));
		bean.setMaterialName(request.getParameter("material_name"));
		bean.setMaterialDesc(request.getParameter("comment"));
		Integer pk_id = Integer.parseInt(request.getParameter("pri_id"));
		bean.setPkid(pk_id);

		MaterialBO bo = new MaterialBO();
		flag = bo.updateEntry(bean);
		if (flag == true) {
			session.setAttribute("smsg",
					"You have successfully added record into the database!");
			response.sendRedirect("material-list.jsp");
		} else {
			session.setAttribute("smsg", "something went wrong!");
			response.sendRedirect("edit-material.jsp");
		}

	}

}
