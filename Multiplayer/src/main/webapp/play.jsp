<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PLAY SONG</title>
</head>
<style>
body {
	background-image: url(./headsets-gc143b686e_1920.jpg);
	background-position: center;
	background-repeat: no-repeat;
}

#sub {
	margin-left: 90px;
	background-color: transparent;
	text-align: center;
	border-radius: 10px;
	box-shadow: 3px 4px 3px black;
}

#sub:hover {
	background-image: linear-gradient(red, orange);
}

#a:hover {
	background-image: linear-gradient(red, orange);
}

#a {
	height: 35px;
	width: 90px;
	border: 1px solid;
	border-radius: 10px;
	text-align: center;
	background-color: white;
	margin-left: 20px;
	background-color: transparent;
	box-shadow: 3px 4px 3px black;
}

a {
	text-decoration: none;
}

#box {
	display: flex;
	margin-top: 30px;
}

#add {
	margin-top: 35px;
	margin-left: 40px
}

#in {
	background-color: transparent;
	border: none;
	border-bottom: 0.5px solid;
	outline: none;
}

#a1 {
	margin-top: 9px;
}
</style>
<body>
	<div>
		<h1>PLAYING SONG</h1>


		<form action="" method="post">
			<table>
				<tr>
					<td><h2>ENTER SONG ID TO PLAY SONG :</h2></td>
					<td><input id="in" type="text" name="id"></td>
				</tr>

			</table>
			<div id="box">
				<input type="submit" id="sub">
				<div id="a">
					<div id="a1">
						<a href="http://localhost:8080/Multiplayer/menu.jsp">GO BACK</a>
					</div>
				</div>
			</div>
		</form>



	</div>
	<%
	String id = request.getParameter("id");

	try {
		String song;
		response.setContentType("text/html");

		Class.forName("com.mysql.cj.jdbc.Driver");

		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/weja1?user=root&password=root");

		PreparedStatement preparedStatement = connection.prepareStatement("select * from multiplayer where id=?");
		preparedStatement.setString(1, id);
		ResultSet resultSet = preparedStatement.executeQuery();
	%>

	<%
	while (resultSet.next()) {
		out.print("<h2> Song ID :</h1>" + "<h1>" + resultSet.getInt(1) + "</h1>");
		out.print("<h2> Song Name :</h1>" + "<h1>" + resultSet.getString(2) + "</h1>");
		out.print("<h2> Singer Name :</h1>" + "<h1>" + resultSet.getString(3) + "</h1>");
		out.print("<h2> Song Link :</h1>" + "<h1>" + resultSet.getString(4) + "</h1>");
	%>


	<%
	}
	%>


	<%
	} catch (Exception e) {
	e.printStackTrace();

	}
	%>

</body>
</html>