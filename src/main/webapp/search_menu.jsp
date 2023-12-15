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
		<form style=" width: 200px; height: 140px;" method="post" action="SearchServlet" name="SearchServlet">
                        <p>
                        <label style="font-weight: bolder; font-size: medium; margin: 20px 0px 0px 5px;" for="tensp">Tên sản phẩm</label>
                        <br>
                        <input  type="text"  name="ten_san_pham" style="margin-top:2px; margin-bottom:5px; height:20px; width:97%; border-radius: 10px;">
                
                        <label for="theloai" style="font-weight: bolder; margin-bottom:4px; font-size: medium; ;">Thể loại</label>
                        <br>
                        <select  name="ten_the_loai" style="height:25px; width:100%; border-radius: 10px" >
                        	<option value="" selected="selected">--Chọn thể loại--</option>
                        	<%
				for (Category c : list) {
					
			%>
                        	<option  value="<%=c.getTen_the_loai() %>"><%=c.getTen_the_loai() %></option>
                        	<%} %>
                        </select>
                        </p>
                        <input type="submit" value="Tìm kiếm" name="timKiem" style="width: 80px; height: 25px; border-radius: 10px; margin-left: 50px;">
                	</form>
                	</li>
                	<li style="color: red"><%=err%></li>
                	</ul>
		</nav>
	</div>
</body>
</html>