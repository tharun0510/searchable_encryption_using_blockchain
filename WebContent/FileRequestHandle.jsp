<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<%
String filename = request.getParameter("filename");


String ownerlogin = session.getAttribute("DataUser").toString();

String groupmanager = "" ;
System.out.println("Data request"+filename+"-");

String keyword = "";
String secret = "";

try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/privacy_preserving","root","root");
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from fileupload where filename = '"+filename+"'");
	while(rs.next()) {
		keyword = rs.getString("keywords");
		secret = rs.getString("SecretKey");
		
		
	}
}catch(Exception e) {
	
}
System.out.println(groupmanager);

int ans=0;
String filekey = "autoupdate";
String acceptby = "autoupdate";
try {
	Connection con = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/privacy_preserving","root","root");
	PreparedStatement ps = con.prepareStatement("INSERT INTO filerequest(filename,keywords,requestby,secretkey) VALUES(?,?,?,?)");
	
	ps.setString(1, filename);
	ps.setString(2, keyword);
	ps.setString(3, ownerlogin);
	ps.setString(4, secret);
	
	ans = ps.executeUpdate();
} catch(Exception e) {
	e.printStackTrace();
}
if(ans==1) {
	response.sendRedirect("SendFileRequest.jsp?success=1");
} else {
	response.sendRedirect("Error.jsp"); 
}
%>

</body>
</html>