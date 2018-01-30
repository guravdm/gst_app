package com.gst.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gst.util.DoConnection;

/**
 * Servlet implementation class DeleteMaterial
 */
@WebServlet("/DeleteMaterial")
public class DeleteMaterial extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteMaterial() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		try {

			boolean flag = false;
			Connection con = DoConnection.getConnection();
			PreparedStatement p = con
					.prepareStatement("delete from material_master where id = ?");
			p.setString(1, request.getParameter("deleteId"));
			p.executeUpdate();
			flag = true;

			if (flag == true) {
				session.setAttribute("smsg", "Record delete from database!");
				response.sendRedirect("material-list.jsp");
			} else {
				session.setAttribute("smsg", "something went wrong!");
				response.sendRedirect("material-list.jsp");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
