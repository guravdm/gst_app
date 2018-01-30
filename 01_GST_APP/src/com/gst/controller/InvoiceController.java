package com.gst.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gst.beans.LoginAction;
import com.gst.bo.InvoiceAction;

/**
 * Servlet implementation class InvoiceController
 */
@WebServlet("/InvoiceController")
public class InvoiceController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	InvoiceAction invoiceAction;
	LoginAction loginAction;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InvoiceController() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public void init() throws ServletException {
		invoiceAction = new InvoiceAction();
		loginAction = new LoginAction();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		if (request.getServletPath().equals("/DeleteInvoiceId")) {
			invoiceAction.deleteInvDetails(request, response);
		}

		if (request.getServletPath().equals("/view_invoice")) {
			invoiceAction.viewInvoices(request, response);
		}
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		/* login mapping start */
		if (request.getServletPath().equals("/saveInvoice")) {
			invoiceAction.saveInvMethod(request, response);
		}

		if (request.getServletPath().equals("/addInvoiceDetails")) {
			invoiceAction.addMoreInvDetails(request, response);
		}

		if (request.getServletPath().equals("/updateInvoice")) {
			invoiceAction.updateInvMethod(request, response);
		}

		// for printing and saving data in both invoice and invoicedetails table
		if (request.getServletPath().equals("/printInvoice")) {
			invoiceAction.printAndSaveInvoice(request, response);
		}

		/* login mapping Start */

		if (request.getServletPath().equals("/login")) {
			loginAction.loginMethod(request, response);
		}

		/* making payment controller = page madesalepay.jsp */
		if (request.getServletPath().equals("/paymadecntrl")) {
			invoiceAction.donePay(request, response);
		}

		/* login mapping End */
	}

}
