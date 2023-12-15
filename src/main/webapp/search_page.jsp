<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.Product"%>
<%@page import="java.util.List"%>
<%@page import="model.bo.*"%>
<%@page import="java.text.NumberFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang chủ</title>
<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="css/menu.css" />
<link rel="stylesheet" href="css/product.css" />
</head>
<body>

	<div id="main">
		<div id="head">
			<img src="images/bgr1.jpg" width="1200px" height="200px" />
		</div>

		<%
			String username = null;
				Cookie[] cookies = request.getCookies();
				if(cookies !=null)
				{
				for(Cookie cookie : cookies)
				{
				    if(cookie.getName().equals("username")) 
				    	username = cookie.getValue();
				}
				}
				
			if (username != null) {
		%>
		<div id="head-link">
			<div id='menungang' style="background-color:  #0093E9; background-image:linear-gradient(160deg, #0081cc 10%, #80D0C7 100%);width: 1200px;">
				<ul>
					<li class='last'><a href="index.jsp"><span>Trang
								chủ</span></a></li>
					<li class='last'><a href="product.jsp"><span>Sản phẩm</span></a></li>
					<li class='last'><a href="cart.jsp"><span>Giỏ hàng</span></a></li>
					<li class='last'><a href="search_page.jsp"><span>Tìm kiếm</span></a></li>
					<li class='last' style="float: right;"><a href="LogoutServlet"><span>Đăng
								xuất</span></a></li>
					<li class='last' style="float: right;"><a href="update_user.jsp?username=<%=username %>"><span><%=username%></span></a></li>
				</ul>
			</div>
		</div>
		<%
			} else {
		%>
		<div id="head-link">
			<div id='menungang' style="background-color:  #0093E9; background-image:linear-gradient(160deg, #0081cc 10%, #80D0C7 100%);width: 1200px;">
			
				<ul>
					<li class='last'><a href="index.jsp"><span>Trang
								chủ</span></a></li>
					<li class='last'><a href="product.jsp"><span>Sản phẩm</span></a></li>
					<li class='last'><a href="search_page.jsp"><span>Tìm kiếm</span></a></li>
					<li class='last' style="float: right;"><a href="register.jsp"><span>Đăng
								ký</span></a></li>
					<li class='last' style="float: right;"><a href="login.jsp"><span>Đăng
								nhập</span></a></li>
				</ul>
			</div>
		</div>
		<%
			}
		%>
		<div id="content" style = "background-color: azure; width: 1200px" >
			<div style="margin-left: 10px ; margin-top : 10px; width: 200px; border-radius: 10px"><jsp:include page="search_menu.jsp"></jsp:include></div>
			 
				<%
				
					ProductDAOImpl productDAO = new ProductDAOImpl();
						List<Product> list = new ArrayList<Product>();
						list = productDAO.getList();
						String ten_san_pham = "";
						String ten_the_loai = "";
						if (request.getParameter("ten_the_loai") != null && request.getParameter("ten_san_pham")!= null) {
					ten_the_loai = request.getParameter("ten_the_loai");
					ten_san_pham = request.getParameter("ten_san_pham");
						}
						NumberFormat nf = NumberFormat.getInstance();
						nf.setMinimumFractionDigits(0);
				%>
				<% String err = "";
				if (request.getAttribute("err") != null) {
					err = (String) request.getAttribute("err");%>
					<h3><%=err %></h3>
				<% } %>
				
				<%if(productDAO.searchList(ten_san_pham, ten_the_loai).size()==0 && err=="") {%>
					<h3>Không tìm thấy sản phẩm nào phù hợp</h3>
					<%} %>
				<div id="site-wrapper" style="float: left ;margin-left: 230px; width: 950px; margin-top: -140px ">
					<ul class="products homepage">
					
						<%
							if (ten_the_loai != null || ten_san_pham != null) {
									for (Product p : productDAO.searchList(ten_san_pham, ten_the_loai)) {
						%>

						<li class="preorder"><span class="tagimg "> </span> <a
							href="detail.jsp?ma_san_pham=<%=p.getMa_san_pham()%>"> <img
								src="sanpham/<%=p.getHinh_anh()%>" width=" 250px" height="250px" />
								<h3><%=p.getTen_san_pham()%></h3>
								<h4>
									Giá:
									<%=nf.format(p.getGia_ban())%>
									VNĐ
								</h4> <span class="textkm">Khuyến mãi trị giá đến <strong>500.000₫</strong>
							</span>
								<p class="info">
									<span>Hãng sx: <%=p.getHang_san_xuat()%>
									</span> <span>Giá: <%=nf.format(p.getGia_ban())%> VNĐ
									</span> <span>Thông tin: <%=p.getThong_tin()%>
								</p>
						</a></li>

						<%
							}
								} else {%>
									<h3> Nhập thông tin tìm kiếm </h3>
								<%}
						%>
					</ul>
				</div>
			
		</div>
		<div id="footer"><jsp:include page="footer.jsp"></jsp:include></div>
	</div>

</body>
</html>