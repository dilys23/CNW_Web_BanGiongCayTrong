<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.Category"%>
<%@page import="java.util.List"%>
<%@page import="model.bo.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Menu dọc</title>
<link rel="stylesheet" href="css/category.css" />
</head>
<body>
	<%
		CategoryDAOImpl categoryDAO = new CategoryDAOImpl();
		List<Category> list = new ArrayList<Category>();
		list = categoryDAO.getList();
	%>
	<div class="container" style = "background-color:azure ;width: 250px;height: 450px">
		<nav>
		<ul class="mcd-menu">
			<%
				for (Category c : list) {
					
			%>
			<li><a href="index.jsp?ma_the_loai=<%=c.getMa_the_loai()%>"> <i class="fa fa-home"><img
						src="images/<%=c.getMa_the_loai() %>.png"></i>
					<strong><%=c.getTen_the_loai()%></strong> <small><%=c.getMo_ta()%></small>
			</a></li>
			<%
				}
			%>
		</ul>
		</nav>
	</div>
</body>
</html>