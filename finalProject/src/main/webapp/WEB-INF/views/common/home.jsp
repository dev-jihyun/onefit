<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
	font-family: "Lato", sans-serif;
}

.sidenav {
	height: 100%;
	width: 18%;
	position: fixed;
	z-index: 1;
	top: 0;
	left: 0;
	background-color: #27a5ff;
	overflow-x: hidden;
	padding-top: 20px;
}

.sidenav a {
	padding: 6px 8px 6px 16px;
	text-decoration: none;
	text-align:center;
	font-size: 2rem;
	color: #FFFFFF;
	display: block;
}

.sidenav a:hover {
	color: #f1f1f1;
	background-color: #64c8fa;
}

.sidenav a:first-child{
	
}

.main {
	margin-left: 160px; /* Same as the width of the sidenav */
	font-size: 28px; /* Increased text to enable scrolling */
	padding: 0px 10px;
}

@media screen and (max-height: 450px) {
	.sidenav {
		padding-top: 15px;
	}
	.sidenav a {
		font-size: 18px;
	}
}
</style>
</head>
<body>
	<div class="profile-wrapper">
		<img src="">
	</div>
	<div class="sidenav">
		<a href="#about">About</a> <a href="#services">Services</a> <a
			href="#clients">Clients</a> <a href="#contact">Contact</a>
	</div>
</body>
</html>

