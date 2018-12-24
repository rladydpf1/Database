<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import = "java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>COMP322003/004: Databases</title>
</head>
<body>
	<h2>Lab #9: Repeating Lab #5-3 via JSP</h2>
<%
	String serverIP = "localhost";
	String strSID = "orcl";
	String portNum = "1521";
	String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;
	String user = "knu";
	String pass = "comp322";
	Connection conn;
	PreparedStatement pstmt;
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url, user, pass);
%>
	<h3>------Q1 Result ------</h3>
<%
	try {
		String pName = request.getParameter("pName");
		String salary = request.getParameter("salary");
		String dNum = request.getParameter("dNum");
		String query = String.format("SELECT Fname, Minit, Lname" +
					" FROM EMPLOYEE, PROJECT, WORKS_ON" +
					" WHERE Dno = %s" +
					" AND Salary = %s" +
					" AND Ssn = Essn AND Pnumber = Pno " +
					" AND Pname = '%s'"+
					" ORDER BY Lname", 
					dNum, salary, pName);
		System.out.println(query);
		pstmt = conn.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery();
		out.println("<table border=\"1\">");
		ResultSetMetaData rsmd = rs.getMetaData();
		int cnt = rsmd.getColumnCount();
		for (int i = 1; i <= cnt; i++) {
			out.println("<th>" + rsmd.getColumnName(i) + "</th>");
		}
		while (rs.next()) {
			out.println("<tr>");
			out.println("<td>" +rs.getString(1) + "</td>");
			out.println("<td>" +rs.getString(2) + "</td>");
			out.println("<td>" +rs.getString(3) + "</td>");
			out.println("</tr>");
		}
		out.println("</table>");
	}
	catch (Exception e) {
		System.out.println(e);
	}
%>

	<h3>------Q2 Result ------</h3>
<%
	try {
		String address = request.getParameter("address");
		String supervisor_ssn = request.getParameter("supervisor_ssn");
		String query = String.format("SELECT Fname, Lname " +
				"FROM EMPLOYEE " +
				"WHERE Address LIKE '%%%s, TX%%' AND Super_ssn = '%s'", 
				address, supervisor_ssn);
		System.out.println(query);
		pstmt = conn.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery();
		out.println("<table border=\"1\">");
		ResultSetMetaData rsmd = rs.getMetaData();
		int cnt = rsmd.getColumnCount();
		for (int i = 1; i <= cnt; i++) {
		out.println("<th>" + rsmd.getColumnName(i) + "</th>");
		}
		while (rs.next()) {
		out.println("<tr>");
		out.println("<td>" +rs.getString(1) + "</td>");
		out.println("<td>" +rs.getString(2) + "</td>");
		out.println("</tr>");
		}
		out.println("</table>");
	}
	catch (Exception e) {
		System.out.println(e);
	}
%>

	<h3>------Q3 Result ------</h3>
<%
	try {
		String project_name = request.getParameter("project_name");
		String query = String.format("SELECT Lname " +
				"FROM EMPLOYEE, PROJECT, WORKS_ON " +
				"WHERE Ssn = Essn AND Pnumber = Pno AND Pname = '%s'", 
				project_name);
		System.out.println(query);
		pstmt = conn.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery();
		out.println("<table border=\"1\">");
		ResultSetMetaData rsmd = rs.getMetaData();
		int cnt = rsmd.getColumnCount();
		for (int i = 1; i <= cnt; i++) {
		out.println("<th>" + rsmd.getColumnName(i) + "</th>");
		}
		while (rs.next()) {
		out.println("<tr>");
		out.println("<td>" +rs.getString(1) + "</td>");
		out.println("</tr>");
		}
		out.println("</table>");
	}
	catch (Exception e) {
		System.out.println(e);
	}
%>
</body>
</html>