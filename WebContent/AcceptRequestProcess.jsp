<%@page import="com.privacy.crypto.AES"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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


System.out.print("filename::"+filename);

String keyword = "";
String secret = "";
String requestby ="";

try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/privacy_preserving","root","root");
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from fileupload where filename = '"+filename+"'");
	while(rs.next()) {
		keyword = rs.getString("keywords");
		secret = rs.getString("SecretKey");
		requestby = rs.getString("requestby");
		

		System.out.println("REQUESTBY=========="+requestby);
		
	}
	
}catch(Exception e)
{

	System.out.println("feafdfds==========ERROR==========");	
	
}



int ans=0;
String filekey = "autoupdate";
String acceptby = "autoupdate";

AES aes = new AES();

String decryptSecret = aes.decrypt(secret);

System.out.print("decryptSecretKey::"+decryptSecret);


try {
	Connection con = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/privacy_preserving","root","root");
	PreparedStatement ps = con.prepareStatement("update filerequest set secretkey='"+decryptSecret+"' where filename='"+filename+"'");
	

	ans = ps.executeUpdate();
	
	System.out.println("ans::"+ans);
} catch(Exception e) {
	e.printStackTrace();
	System.out.println("==========ERROR==========");
}

	


int result = 0;
try {
	Connection con = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/privacy_preserving","root","root");
	PreparedStatement ps = con.prepareStatement(" INSERT INTO fileaccept(filename,keywords,requestby,secretkey) VALUES(?,?,?,?)");
	ps.setString(1, filename);
	ps.setString(2, keyword);
	ps.setString(3, requestby);
	ps.setString(4, decryptSecret);

	result = ps.executeUpdate();
	
	System.out.println("ans::"+ans);
	
	System.out.println("result::"+result);
	
	if(result!=0) {
		response.sendRedirect("AcceptRequest.jsp?success=1");
		System.out.println("==========SUCCESS==========");
	} else {
		response.sendRedirect("Error.jsp"); 
		
		System.out.println("==========ERROR==========");
	}
} catch(Exception e) {
	e.printStackTrace();
}



%>



</body>
</html>