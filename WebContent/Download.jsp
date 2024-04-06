<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.privacy.Database.DatabaseConnection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
       try
                               {
            
 String downloadFileName=request.getParameter("fileName");
 String Data=request.getParameter("orginalContent");
 
 
   String UserID=session.getAttribute("DataUser").toString();
 
   System.out.println("==============");
   System.out.println("============:"+downloadFileName+":========:"+Data+":==========:"+UserID+":==========");
 

   Date date = new Date();  
   SimpleDateFormat formatter = new SimpleDateFormat("dd MMM yyyy HH:mm:ss z");  
   String strDate = formatter.format(date);  
                 Connection c=DatabaseConnection.createConnection();
            	 PreparedStatement pst=c.prepareStatement("insert into filedownload(UserID, Status,CreationDate)values(?,?,?)");
 
					pst.setString(1,UserID);
	                pst.setString(2,"Download");
			        pst.setString(3,strDate);
		        
			int l=pst.executeUpdate();

			System.out.println("value of l==="+l);
			
   byte[] bytes = Data.getBytes();
   OutputStream out1 = response.getOutputStream();
   response.setContentType("text/plain; charset=utf-8");
   response.addHeader("Content-Disposition","attachment; filename=\"" + downloadFileName + "\".txt");
   out1.write(bytes);
   out1.flush();
   out1.close();
     

 
 }
        catch(Exception ex)
        {
        	ex.printStackTrace();
            
        }
        %>

</body>
</html>