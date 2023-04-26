<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>




<html>
<head>
<meta charset="ISO-8859-1">
<title>ADD SONG PAGE</title>
</head>
<style>
body {
	background-image: url(./guitar-g0d73e44d5_1920.jpg);
	background-size: cover;
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

input {
	border: none;
	border-bottom: 0.5px solid black;
	outline: none;
	background-color: transparent;
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
	position: relative;
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

#h1 {
	margin-left: 200px
}

#a1 {
	margin-top: 10px;
}
</style>
<body>
	<h1 id="h1">ADD SONG</h1>

	<div id="add">

		<form action="./add.jsp" method="post">
			<table>
				<tr>
					<td><h1>SONG ID :</h1></td>
					<td><input type="text" name="songId"></td>


				</tr>
				<br>
				<tr></tr>
				<tr>
					<td><h1>SONG NAME :</h1></td>
					<td><input type="text" name="songName"></td>

				</tr>

				<tr>
					<td><h1>SINGER NAME :</h1></td>
					<td><input type="text" name="singerName"></td>

				</tr>

				<tr>
					<td><h1>SONG LINK :</h1></td>
					<td><input type="text" name="songLink"></td>

				</tr>
				<tr></tr>
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
	response.setContentType("text/html");
	String id = request.getParameter("songId");
    String sname = request.getParameter("songName");
	String singer = request.getParameter("singerName");
	String link = request.getParameter("songLink");

	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/weja1", "root", "root");
		PreparedStatement preparedStatement = connection.prepareStatement("insert into multiplayer values (?,?,?,?)");

		preparedStatement.setString(1, id);
		preparedStatement.setString(2, sname);
		preparedStatement.setString(3, singer);
		preparedStatement.setString(4, link);

		int result = preparedStatement.executeUpdate();
		if (result == 1) {
			out.println("<h1 > Add song Successful</h>");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>

</body>
</html>