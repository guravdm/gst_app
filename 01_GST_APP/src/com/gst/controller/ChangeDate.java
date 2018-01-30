package com.gst.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gst.util.DoConnection;

/**
 * Servlet implementation class ChangeDate
 */
@WebServlet("/ChangeDate")
public class ChangeDate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ChangeDate() {
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
			boolean flag = false;
			HttpSession session = request.getSession();
			java.util.Date dtTime = new java.util.Date();

			java.text.SimpleDateFormat curTime = new java.text.SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String timeStamp = curTime.format(dtTime);

			java.text.SimpleDateFormat sdf1 = new java.text.SimpleDateFormat(
					"dd/MM/yyyy");
			Date date = null;
			java.text.SimpleDateFormat sdf2 = new java.text.SimpleDateFormat(
					"yyyy/MM/dd");
			String dispdate;

			Connection con = DoConnection.getConnection();
			PreparedStatement ps = con
					.prepareStatement("update invoice set newprint_date = ? where id = ?");
			ps.setString(2, request.getParameter("invsUniqId"));
			date = sdf1.parse(request.getParameter("changeToDate"));
			dispdate = sdf2.format(date);
			ps.setString(1, dispdate);
			ps.executeUpdate();
			System.out.println(ps);
			flag = true;
			if (flag == true) {
				session.setAttribute("smsg",
						"You have successfully made changes!");
				response.sendRedirect("invoice-list.jsp");
			} else {
				session.setAttribute("smsg", "something went wrong!");
				response.sendRedirect("change-inv-date.jsp?viewInvId="
						+ request.getParameter("viewInvId"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
