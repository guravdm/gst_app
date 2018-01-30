package com.gst.bo;

import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gst.beans.InvoiceBean;
import com.gst.beans.SalesPayBean;
import com.gst.dao.InvoiceDAO;
import com.gst.dao.SalesDao;
import com.gst.dao.impl.InvoiceDAOImpl;
import com.gst.dao.impl.SalesDaoImpl;

public class InvoiceAction {
	public void saveInvMethod(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			boolean flag = false;
			InvoiceBean bean = new InvoiceBean();
			bean.setCustCode(request.getParameter("clientName"));
			bean.setState(request.getParameter("state"));
			bean.setChallanNo(request.getParameter("challanNo"));
			bean.setChallanDate(request.getParameter("challanDate"));
			bean.setPoNo(request.getParameter("poNumber"));
			bean.setPoValidFrom(request.getParameter("POValidFrom"));
			bean.setPoValidTo(request.getParameter("POValidTo"));
			Integer uniqId = Integer.parseInt(request
					.getParameter("invsUniqId"));
			bean.setId(uniqId);

			InvoiceDAO dao = new InvoiceDAOImpl();
			dao.InvoiceSave(bean);
			flag = true;

			if (flag == true) {
				session.setAttribute("smsg",
						"You have successfully added record into the database!");
				session.setAttribute("uniqInv_ID", uniqId);
				request.setAttribute("invData", bean);
				RequestDispatcher rd = request
						.getRequestDispatcher("addinvlist.jsp?clientId="
								+ bean.getCustCode() + "&invoicId="
								+ bean.getId() + "&challaNo="
								+ bean.getChallanNo());
				rd.forward(request, response);
			} else {
				session.setAttribute("smsg", "something went wrong!");
				/* response.sendRedirect("new-material.jsp"); */
				RequestDispatcher rd = request
						.getRequestDispatcher("new-invoice.jsp");
				rd.forward(request, response);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void updateInvMethod(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			boolean flag = false;
			InvoiceBean bean = new InvoiceBean();
			bean.setCustCode(request.getParameter("clientName"));
			bean.setState(request.getParameter("state"));
			bean.setChallanNo(request.getParameter("challanNo"));
			bean.setChallanDate(request.getParameter("challanDate"));
			bean.setPoNo(request.getParameter("poNumber"));
			bean.setPoValidFrom(request.getParameter("POValidFrom"));
			bean.setPoValidTo(request.getParameter("POValidTo"));
			InvoiceDAO dao = new InvoiceDAOImpl();
			dao.InvoiceUpdateMethod(bean);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void addMoreInvDetails(HttpServletRequest request,
			HttpServletResponse response) {
		try {

			HttpSession session = request.getSession();
			boolean flag = false;
			InvoiceBean invoiceDetails = new InvoiceBean();
			invoiceDetails.setCustCode(request.getParameter("clientName"));
			invoiceDetails
					.setMaterialCode(request.getParameter("materialName"));
			invoiceDetails.setMaterialQty(request.getParameter("materialQty"));
			invoiceDetails.setInvoiceId(request.getParameter("invsUniqId"));
			InvoiceDAO dao = new InvoiceDAOImpl();
			dao.moreInvoiceQtyDetails(invoiceDetails);
			flag = true;

			if (flag == true) {
				session.setAttribute("smsg",
						"You have successfully added record into the database!");

				request.setAttribute("invData", invoiceDetails);
				RequestDispatcher rd = request
						.getRequestDispatcher("addinvlist.jsp");
				rd.forward(request, response);
			} else {
				session.setAttribute("smsg", "something went wrong!");
				/* response.sendRedirect("new-material.jsp"); */
				RequestDispatcher rd = request
						.getRequestDispatcher("new-invoice.jsp");
				rd.forward(request, response);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// for deleting records from the invoicedetails table
	public void deleteInvDetails(HttpServletRequest request,
			HttpServletResponse response) {

		try {

			HttpSession session = request.getSession();
			boolean flag = false;
			InvoiceBean invoiceDetails = new InvoiceBean();
			invoiceDetails.setCustCode(request.getParameter("clientName"));
			invoiceDetails
					.setMaterialCode(request.getParameter("materialName"));
			invoiceDetails.setMaterialQty(request.getParameter("materialQty"));
			invoiceDetails.setInvoiceId(request.getParameter("invsUniqId"));

			Integer pk_id = Integer.parseInt(request.getParameter("deleteId"));
			invoiceDetails.setId(pk_id);
			InvoiceDAO dao = new InvoiceDAOImpl();
			dao.deleteInvoiceDetails(invoiceDetails);
			flag = true;

			if (flag == true) {
				session.setAttribute("smsg",
						"You have successfully deleted records from the database!");

				request.setAttribute("invData", invoiceDetails);
				RequestDispatcher rd = request
						.getRequestDispatcher("addinvlist.jsp");
				rd.forward(request, response);
			} else {
				session.setAttribute("smsg", "something went wrong!");
				/* response.sendRedirect("new-material.jsp"); */
				RequestDispatcher rd = request
						.getRequestDispatcher("new-invoice.jsp");
				rd.forward(request, response);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void printAndSaveInvoice(HttpServletRequest request,
			HttpServletResponse response) {
		try {

			HttpSession session = request.getSession();
			boolean flag = false;
			InvoiceBean bean = new InvoiceBean();
			bean.setMaterialRate(request.getParameter("materialRatePO")); // Material
			// Rate
			bean.setAmount(request.getParameter("subTotalAmount")); // subTotal
			bean.setGrossAmount(request.getParameter("grossAmounts")); // grossAmount
			bean.setCgst_amnt(request.getParameter("cgstAmounts")); // CGST Tax
			bean.setSgst_amnt(request.getParameter("sgstAmounts")); // SGST
																	// Tax
			bean.setIgst_amnt(request.getParameter("igstAmountTax")); // IGST
			// Tax

			String materialRate = request.getParameter("materialRatePO");

			bean.setCustCode(request.getParameter("clientName"));
			bean.setMaterialCode(request.getParameter("materialName"));
			bean.setMaterialQty(request.getParameter("materialQty"));
			Integer id = Integer.parseInt(request.getParameter("invsUniqId"));
			bean.setId(id);

			// Integer inDetails =
			// Integer.parseInt(request.getParameter("inDetails"));
			bean.setInvoiceId(request.getParameter("inDetails"));
			InvoiceDAO dao = new InvoiceDAOImpl();
			dao.updateInvInvDetails(bean);
			flag = true;

			if (flag == true) {
				session.setAttribute("smsg",
						"You have successfully printed Invoice!");
				response.sendRedirect("invoice-list.jsp");
			} else {
				session.setAttribute("smsg", "something went wrong!");
				response.sendRedirect("invoice-list.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void viewInvoices(HttpServletRequest request,
			HttpServletResponse response) {
		try {

			boolean flag = false;
			InvoiceBean bean = new InvoiceBean();

			Integer pkId = Integer.parseInt(request.getParameter("viewInvId"));
			bean.setId(pkId);

			flag = true;
			InvoiceDAO dao = new InvoiceDAOImpl();
			if (flag) {
				ArrayList<Object> al = dao.prinatbleInvoiceData();
				request.setAttribute("printingData", al);
				response.sendRedirect("view_invoice.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void donePay(HttpServletRequest request, HttpServletResponse response) {
		try {
			boolean flag = false;
			HttpSession session = request.getSession();

			SalesPayBean bean = new SalesPayBean();
			bean.setInvoiceId(request.getParameter("invoiceCode"));
			bean.setClient_code(request.getParameter("compCodes"));
			bean.setPayment_mode(request.getParameter("pay_mode"));
			bean.setPaymentAmount(request.getParameter("pay_amnt"));
			bean.setPay_made_date(request.getParameter("pay_date"));
			bean.setCheque_no(request.getParameter("chequeNo"));

			String companyName = request.getParameter("cmName");
			String balanceAmount = request.getParameter("balance_amnt");
			bean.setBalance_amnt(balanceAmount);

			SalesDao dao = new SalesDaoImpl();
			dao.insertPayTrans(bean);
			flag = true;

			if (flag == true) {
				session.setAttribute("smsg",
						"You have successfully made transactions!");
				response.sendRedirect("salespay.jsp");
			} else {
				session.setAttribute("smsg", "something went wrong!");
				response.sendRedirect("madesalespay.jsp?invoiceId="
						+ request.getParameter("invoiceCode") + "&custCode="
						+ request.getParameter("companyName")
						+ "&BalanceAmount=" + balanceAmount + "&compname="
						+ companyName);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
