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
<title>MUSICPLAYER</title>
<link rel="stylesheet"
	href="./font-awesome-4.7.0//font-awesome-4.7.0/css/font-awesome.css">
</head>

<style>
body {
	margin: 0;
	background-color: black;
	font-family: sans-serif;
}

h1 {
	color: red;
}

#menu {
	margin-top: 50px;
}

#button {
	display: flex;
	flex-direction: row;
	margin-top: 100px;
}

.b {
	height: 45px;
	width: 150px;
	border: 1px solid;
	background-color: purple;
	border-radius: 10px;
	margin-left: 25px;
	cursor: pointer;
}

.b:hover {
	background-image: linear-gradient(red, orange);
	background: linear-gradient(to bottom right,    rgb(255, 0, 0),
		rgb(255, 213, 0));
}

a {
	margin-left: 20px;
	top: 20px;
	color: white;
	text-decoration: none;
}

#play {
	height: 300px;
	width: 1500px;
	font-size: 300px;
	color: white;
	display: flex;
	flex-direction: row;
}

img {
	height: 200px;
	width: 150px;
}

img:hover {
	height: 220px;
	width: 170px;
}

.a {
	margin-top: 12px;
}

#nav {
	height: 60px;
	background-color: #f0f8ff;
	display: flex;
	align-items: center;
	position: relative;
}

#img1 {
	height: 50px;
	width: 100px;
}

#name {
	font-size: 30px;
	color: black;
	font-family: fantasy;
	margin-left: 100px;
}

#in {
	margin-left: 250px;
}

#id {
	height: 25px;
	width: 300px;
	border-radius: 10px;
}

#submit {
	height: 25px;
	border-radius: 10px;
}

#a3 {
	background-image: url("./button-g44a203ffa_1280.png");
}

button {
	height: 45px;
	width: 150px;
	border: 1px solid;
	background-color: purple;
	border-radius: 10px;
	margin-left: 25px;
	cursor: pointer;
	color: white;
}

button:hover {
	background-image: linear-gradient(red, orange);
	box-shadow:
}
</style>
<body>
	<div id="nav">
		<div id="logo">
			<img alt="" src="logo-gbd6755be4_1280.png" id="img1">
		</div>
		<div id="name">MUSIC PLAYER</div>
		<div id="in">
			<form action="" method="post">
				<table>
					<tr>
						<td><input type="text" name="id" id="id"></td>
						<td><input type="submit" value="SEARCH" id="submit">
						</td>
					</tr>

				</table>
			</form>
		</div>


	</div>


	<div id="menu">

		<div id="play">
			PLAY <a href="http://localhost:8080/Multiplayer/play.jsp"><img
				alt="" src="button-g44a203ffa_1280.png"></a>
		</div>
		<div id="button">
			<div class="b">
				<div class="a">
					<a href="http://localhost:8080/Multiplayer/add.jsp">ADD SONG</a>
				</div>
			</div>
			<div class="b">
				<div class="a">
					<a href="http://localhost:8080/Multiplayer/delete.jsp">REMOVE
						SONG</a>
				</div>
			</div>

			<div class="b">
				<div class="a">
					<a href="http://localhost:8080/Multiplayer/update.jsp">UPDATE
						SONG</a>
				</div>
			</div>
			<div>
				<a class="a" href="http://localhost:8080/Multiplayer/SongList.jsp"><button>SONG
						LIST</button></a>
			</div>
		</div>

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