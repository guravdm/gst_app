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
import com.gst.bo.UpdateInvBO;
import com.gst.dao.InvoiceDAO;
import com.gst.dao.impl.InvoiceDAOImpl;

/**
 * Servlet implementation class UpdateInvoice
 */
@WebServlet("/UpdateInvoice")
public class UpdateInvoice extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateInvoice() {
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
		try {
			HttpSession session = request.getSession();
			boolean flag = false;
			InvoiceBean invoiceDetails = new InvoiceBean();
			invoiceDetails.setCustCode(request.getParameter("clientName"));
			invoiceDetails
					.setMaterialCode(request.getParameter("materialName"));
			invoiceDetails.setMaterialQty(request.getParameter("materialQty"));
			invoiceDetails.setInvoiceId(request.getParameter("invsUniqId"));
			UpdateInvBO bo = new UpdateInvBO();
			flag = bo.updateInvoice(invoiceDetails);
			if (flag == true) {
				session.setAttribute("smsg",
						"You have successfully added record into the database!");
				RequestDispatcher rd = request
						.getRequestDispatcher("edit-invoice.jsp?clientName="
								+ request.getParameter("clientName"));
				rd.forward(request, response);
			} else {
				session.setAttribute("smsg", "something went wrong!");
				RequestDispatcher rd = request
						.getRequestDispatcher("new-invoice.jsp");
				rd.forward(request, response);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
