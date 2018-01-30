package com.gst.beans;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gst.dao.LoginDAO;
import com.gst.dao.impl.LoginDaoImpl;

public class LoginAction {

	public void loginMethod(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			String uname = request.getParameter("username");
			String pass = request.getParameter("password");
			session.setMaxInactiveInterval(10 * 20);
			LoginDAO dao = new LoginDaoImpl();
			boolean flag = dao.loginCred(uname, pass);
			// session.setAttribute("smsg", "Username or password is wrong...");
			if (flag) {
				session.setAttribute("alert", "Welcome to Ashtavinayak Eng");
				session.setAttribute("userId", request.getParameter("username"));
				RequestDispatcher rd = request
						.getRequestDispatcher("index.jsp");
				rd.forward(request, response);
			} else {
				session.setAttribute("smsg", "Username or password is wrong...");
				// request.setAttribute("smsg", "Invalid credentials!");
				RequestDispatcher rd = request
						.getRequestDispatcher("login.jsp");
				rd.forward(request, response);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
