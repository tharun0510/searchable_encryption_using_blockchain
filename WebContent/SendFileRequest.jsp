<%@page import="com.privacy.Database.DatabaseConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

<title>View Uploaded List</title>

<link rel="stylesheet" href="css/navbar.css">

<style>



h2{
	text-align: center; 
	color: darkviolet;
    font-family: cursive;
    font-weight: bolder;
    margin-top: 20px;

}


img {
	height: 50em;
	position: absolute;
	width: 100vw;
	filter: blur(5px);
	-webkit-filter: blur(5px);
}

.col-md-12 {

background-color: white;
margin-top: 50px;
border-radius: 20px;


}

.table-responsive{

	color: black;
    font-family: cursive;
    font-weight: bold;

	}

body{

	background-image: linear-gradient(to right, #f12711, #f5af19); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */

	}

h2{

color: linear-gradient(to right, #f12711, #f5af19);

}




</style>

</head>
<body>



<img alt="" src="./assetds/imgs/integritybg3.jpg">

<nav class="main-navigation">
       
       

    </nav>
<div class="container ">

		<div class="row">
			<div class="col-md-12">
			<div class="navbar-header animated fadeInUp">
            <a class="btn btn-danger mt-2" href="DataUserHome.jsp">BACK</a>
            
            <c:if test="${param.success==1}">
		<div class="alert alert-success alert-dismissible fade show"
			role="alert">
			<strong>Success!</strong>FILEREQUEST HAS BEEN SENT<a
				href="Home.jsp"></a>
			<button type="button" class="btn-close" data-bs-dismiss="alert"
				aria-label="Close">X</button>
		</div>
	</c:if>
        </div>
				<h2 ><span>SEND FILE REQUEST</span></h2>
				<br>
				<div class="table-responsive">
					<table id="myTable" class="table table-bordred table-striped">
						<thead>
							<tr class="strikeout">
							
								<th>SrNo</th>
								<th>Date</th>
								<th>Filename</th>
								<th>Keyword</th>
								<th>BlockChain</th>
								<th>SecretKey</th>
								<th>Action</th>
								
								
							</tr>
						</thead>

						<%
						
							try {
								Connection con1 = null;

								con1 = DatabaseConnection.createConnection();
								PreparedStatement ps1 = con1.prepareStatement("SELECT * FROM `fileupload`");

								ResultSet rs = ps1.executeQuery();
								
						%>




						<tbody>
							<%
							
							int ii = 1;
								while (rs.next()) {
									
							%>

							<tr>
								<td><%=ii%></td>
								<td><%=rs.getString("CreationDate")%></td>	
								<td><%=rs.getString("filename")%></td>
								<td><%=rs.getString("keywords")%></td>
								<td><%=rs.getString("BlockHash")%></td> 
								<td><%=rs.getString("SecretKey")%></td> 
								<td><a class="btn btn-primary btn-sm" type="submit" href="FileRequestHandle.jsp?filename=<%=rs.getString("fileName") %>">SendRequest</a></td>
							</tr>

							<%
							ii++;
								}
							%>

						</tbody>

					</table>

					<%
						con1.close();
					%><br>
					<%
						} catch (Exception e) {
							e.printStackTrace();
						}
					%>
				</div>
			</div>
		</div>
	</div>



</body>
</html>