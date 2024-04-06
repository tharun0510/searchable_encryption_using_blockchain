<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.privacy.Database.DatabaseConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.privacy.crypto.AES"%>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->


<style type="text/css">
body {
	background: linear-gradient(to right, #f12711, #f5af19);
	/* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
}

.contact-form {
	background: #fff;
	margin-top: 10%;
	margin-bottom: 5%;
	width: 70%;
}

.contact-form .form-control {
	border-radius: 1rem;
}

.contact-image {
	text-align: center;
}

.contact-image img {
	border-radius: 6rem;
	width: 11%;
	margin-top: -3%;
	transform: rotate(29deg);
}

.contact-form form {
	padding: 14%;
}

.contact-form form .row {
	margin-bottom: -7%;
}

.contact-form h3 {
	margin-bottom: 8%;
	margin-top: -10%;
	text-align: center;
	color: #0062cc;
}

.contact-form .btnContact {
	width: 50%;
	border: none;
	border-radius: 1rem;
	padding: 1.5%;
	background: #dc3545;
	font-weight: 600;
	color: #fff;
	cursor: pointer;
}

.btnContactSubmit {
	width: 50%;
	border-radius: 1rem;
	padding: 1.5%;
	color: #fff;
	background-color: #0062cc;
	border: none;
	cursor: pointer;
}

.btnContact {
	
}

.text-area {
	
}

.btn {
	margin-top: 50px;
}
</style>
</head>
<body>

	<%


String UserID=session.getAttribute("DataUser").toString();

System.out.println("userid"+UserID);

String filename=request.getParameter("Filename");
String keyword=request.getParameter("keyword");
String secretKey=request.getParameter("secretKey");


String keywords="",FileData="",SecretKey="",OriginalData="",FileData1="",FileData2="",decrypted="";

try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/privacy_preserving","root","root");
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from fileupload where filename = '"+filename+"'");
	while(rs.next()) {
		keywords = rs.getString("keywords");
		SecretKey = rs.getString("SecretKey");
		OriginalData = rs.getString("orginalContent");
		FileData1 = rs.getString("content1");
		FileData2 = rs.getString("content2");
	
	}
}catch(Exception e) {
	
}

System.out.print("jhidfjah"+keywords);

%>

	<div class="container contact-form">
		<div class="contact-image">
			<img src="https://image.ibb.co/kUagtU/rocket_contact.png"
				alt="rocket_contact" />
		</div>
		<form method="post" action="Download.jsp" name="form">
			<h3>DOWNLOAD FILES</h3>
			<div class="row">
				<div class="col-md-6">
					<span class="menu-title"><b>FileName</b></span><br />

					<div class="form-group">
						<input type="text" name="fileName" class="form-control"
							value="<%=filename %>" placeholder="File Name *" value=""
							readonly />
					</div>
					<span class="menu-title"><b>Keyword</b></span><br />

					<div class="form-group">
						<input type="text" name="keyWord" class="form-control"
							value="<%=keywords%>" placeholder="KeyWord *" value="" readonly />
					</div>
					

					<div class="form-group">
					<span class="menu-title" hidden><b>SecretKey</b></span><br />
						<input type="text" name="key" class="form-control"
							value="<%=SecretKey%>" placeholder="KeyWord *" hidden value="" readonly />
					</div>


				</div>
				<div class="col-md-6">
					<span class="menu-title"><b>Encrypted Data Block 1</b></span><br />
					<div class="form-group">
						<textarea name="content1" class="form-control"
							placeholder="Your Message *" style="width: 100%; height: 100px;"
							readonly><%= FileData1 %></textarea>
					</div>
				</div>

				<div class="col-md-6">
					<span class="menu-title"><b>Encrypted Data Block 2</b></span><br />
					<div class="form-group">
						<textarea name="content2" class="form-control"
							placeholder="Your Message *" style="width: 100%; height: 100px;"
							readonly><%= FileData2 %></textarea>
					</div>
				</div>

				<div class="col-md-6">
					<div class="form-group">
						<textarea name="orginalContent" class="form-control text-area"
							style="display: none" placeholder="Your Message *"
							style="width: 100%; height: 100px; " readonly><%= OriginalData %></textarea>
					</div>
				</div>




			</div>

			<input type="submit" name="btnSubmit" class="btn btn-danger"
				value="Download" />

		</form>
	</div>



</body>
</html>