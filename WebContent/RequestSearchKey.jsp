<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous"></script>

<style type="text/css">
body {
	background-image: linear-gradient(to right top, #D91B23, #124FEB);
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center
}

.search {
	background-color: #fff;
	padding: 4px;
	border-radius: 5px
}

.search-1 {
	position: relative;
	width: 100%
}

.search-1 input {
	height: 45px;
	border: none;
	width: 100%;
	padding-left: 34px;
	padding-right: 10px;
	border-right: 2px solid #eee
}

.search-1 input:focus {
	border-color: none;
	box-shadow: none;
	outline: none
}

.search-1 i {
	position: absolute;
	top: 12px;
	left: 5px;
	font-size: 24px;
	color: #eee
}

::placeholder {
	color: #eee;
	opacity: 1
}

.search-2 {
	position: relative;
	width: 100%
}

.search-2 input {
	height: 45px;
	border: none;
	width: 100%;
	padding-left: 18px;
	padding-right: 100px
}

.search-2 input:focus {
	border-color: none;
	box-shadow: none;
	outline: none
}

.search-2 i {
	position: absolute;
	top: 12px;
	left: -10px;
	font-size: 24px;
	color: #eee
}

.search-2 button {
	position: absolute;
	right: 1px;
	top: 0px;
	border: none;
	height: 45px;
	background-color: red;
	color: #fff;
	width: 90px;
	border-radius: 4px
}

@media ( max-width :800px) {
	.search-1 input {
		border-right: none;
		border-bottom: 1px solid #eee
	}
	.search-2 i {
		left: 4px
	}
	.search-2 input {
		padding-left: 34px
	}
	.search-2 button {
		height: 37px;
		top: 5px
	}
}
</style>

</head>
<body>

	<div class="container">
	
		<form action="Search-Result.jsp" method="post">
		<div class="search">
			<div class="row">
				<div class="col-md-6">
					<div class="search-1">
						<i class='bx bx-search-alt'></i> <input type="text"
							placeholder="FileName" name="filename" >
					</div>
				</div>
				<div class="col-md-6">
					<div>
						<div class="search-2">
							<i class='bx bxs-map'></i> <input type="text"
								placeholder="Keyword" name=keywords>
							<button type="submit">Search</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		</form>
	</div>



</body>
</html>