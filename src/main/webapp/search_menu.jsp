<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.Category"%>
<%@page import="java.util.List"%>
<%@page import="model.bo.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
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
		String err="";
	%>
	<div class="container">
		<nav>
		<ul class="mcd-menu">
		<li>
		<form accept-charset="utf-8" method="post" action="SearchServlet" name="SearchServlet">
                        <p>
                        <label for="tensp">Tên sản phẩm</label>
                        <br>
                        <input accept-charset="utf-8" type="text"  name="ten_san_pham" style="width:97%">
                        </p>
                        <p>
                        <label for="theloai">Thể loại</label>
                        <br>
                        <select accept-charset="utf-8" name="ten_the_loai" style="width:100%">
                        	<option value="" selected="selected">--Chọn thể loại--</option>
                        	<%
				for (Category c : list) {
					
			%>
                        	<option accept-charset="utf-8"  value="<%=c.getTen_the_loai() %>"><%=c.getTen_the_loai() %></option>
                        	<%} %>
                        </select>
                        </p>
                        <input type="submit" value="Tìm kiếm" name="timKiem">
                	</form>
                	</li>
                	<li style="color: red"><%=err%></li>
                	</ul>
		</nav>
	</div>
</body>
</html>