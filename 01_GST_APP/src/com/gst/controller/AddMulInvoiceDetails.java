package com.gst.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gst.beans.InvoiceBean;
import com.gst.bo.ClientBO;
import com.gst.bo.InvoiceBO;
import com.gst.dao.InvoiceDAO;
import com.gst.dao.impl.InvoiceDAOImpl;

/**
 * Servlet implementation class AddMulInvoiceDetails
 */
@WebServlet("/AddMulInvoiceDetails")
public class AddMulInvoiceDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddMulInvoiceDetails() {
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
		System.out.println("hiii");
		HttpSession session = request.getSession();
		boolean flag = false;
		InvoiceBean bean = new InvoiceBean();
		bean.setCustCode(request.getParameter("clientName"));
		bean.setMaterialCode(request.getParameter("materialName"));
		bean.setMaterialQty(request.getParameter("materialQty"));
		bean.setInvoiceId(request.getParameter("invsUniqId"));
		InvoiceBO bo = new InvoiceBO();
		flag = bo.saveEntry(bean);
		flag = true;
		if (flag == true) {
			session.setAttribute("smsg",
					"You have successfully added record into the database!");
			request.setAttribute("invoiceDetails", bean);
			/*
			 * RequestDispatcher rd = request
			 * .getRequestDispatcher("addinvlist.jsp"); rd.forward(request,
			 * response);
			 */

			response.sendRedirect("addinvlist.jsp?msg=" + "added!"
					+ "&clientName=" + bean.getCustCode() + "&invsUniqId="
					+ bean.getInvoiceId() + "&challanNo=" + bean.getChallanNo());
		} else {
			session.setAttribute("smsg", "something went wrong!");
			RequestDispatcher rd = request
					.getRequestDispatcher("new-invoice.jsp");
			rd.forward(request, response);
		}

	}

}
