package com.gst.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.binary.Base64;

/**
 * Servlet implementation class loginCntrl
 */
@WebServlet("/loginCntrl")
public class loginCntrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public loginCntrl() {
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

		String orig = "original String before base64 encoding in Java";
		// encoding byte array into base 64
		byte[] encoded = Base64.encodeBase64(orig.getBytes());

		System.out.println("Original String: " + orig);
		System.out.println("Base64 Encoded String : " + new String(encoded));

		// decoding byte array into base64
		byte[] decoded = Base64.decodeBase64(encoded);
		System.out.println("Base 64 Decoded  String : " + new String(decoded));

	}

}
