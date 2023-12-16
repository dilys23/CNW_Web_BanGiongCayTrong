<%@page import="model.bo.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.text.NumberFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi tiết sản phẩm</title>
<link rel="stylesheet" href="css/detail.css" />
<link rel="stylesheet" href="css/menu.css" />
<style type="text/css">
body {
	font-family: Arial, Tahoma;
	font-size: 12px;
	background-color: #1AA59A;}
#main {
	 width: 100%;
    max-width: 1200px; /* Adjust max-width according to your design */
    margin: 0 auto; /* Center the content */
    overflow: hidden; /* Ensure content doesn't overflow */
}
#head {
	height: 200px;
	background-color: #F5F5F5;
	border: 1px solid #CDCDCD;
	margin-bottom: 5px;
	margin-top: 5px;
}

#head-link {
	height: 50px;
	line-height: 30px;
	border: 1px solid #CDCDCD;
	background-color: #F5F5F5;
	margin-bottom: 5px;
	clear: both;
}

#content {
	width: 1200px;
	min-height: 550px;
	border: 1px solid #CDCDCD;
	float: left;
	margin-bottom: 5px;
	clear: both;
	background-color: azure;
}


#footer {
	height: 50px;
	clear: both;
	border: 1px solid #CDCDCD;
	background-color: #F8F8FF;
	margin-top: 440px;
}
</style>
</head>
<body>

	<%
		// ham nay de lay ma san pham truyen qua tren thanh dia chj
		String ma_san_pham = "";
		if (request.getParameter("ma_san_pham") != null) {
			ma_san_pham = request.getParameter("ma_san_pham");
		}

		ProductDAOImpl productDAO = new ProductDAOImpl();
		NumberFormat nf = NumberFormat.getInstance();
		nf.setMinimumFractionDigits(0);
	%>
	<div id="main">
		<div id="head">
				<img src="images/bgr1.png" width="1200px" height="200px" />
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
			<div id='menungang'style="background-color:  #0093E9; background-image:linear-gradient(160deg, #0081cc 10%, #80D0C7 100%);width: 1200px;">
				<ul>
					<li class='last'><a href="index.jsp"><span>Trang
								chủ</span></a></li>
					<li class='last'><a href="#"><span>Sản phẩm</span></a></li>
					<li class='last'><a href="cart.jsp"><span>Giỏ hàng</span></a></li>
					<li class='last'><a href="search_page.jsp"><span>Tìm kiếm</span></a></li>
					<li class='last' style="float: right;"><a href="LogoutServlet"><span>Đăng xuất</span></a></li>
					<li class='last' style="float: right;"><a href="update_user.jsp?username=<%=username %>"><span><%=username %></span></a></li>
					
				</ul>
			</div>
		</div>
		<%
			} else {
		%>
		<div id="head-link">
			<div id='menungang'style="background-color:  #0093E9; background-image:linear-gradient(160deg, #0081cc 10%, #80D0C7 100%);width: 1200px;">
				<ul>
					<li class='last'><a href="index.jsp"><span>Trang
								chủ</span></a></li>
					<li class='last'><a href="#"><span>Sản phẩm</span></a></li>
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
		<div id="content">

			<div class="left-1">
				<img
					src="sanpham/<%=productDAO.getProduct(Integer.parseInt(ma_san_pham))
					.getHinh_anh()%>"
					width="200px" height="200px" />
			</div>
			<div class="left-2">
				<table>
					<tr class="row1">
						<td class="col2" colspan="2"
							style="padding: 10px; color: white; background-color: #1AA59A; font-size: 15px; text-transform: uppercase; text-align: center; font-weight: bold"><%=productDAO.getProduct(Integer.parseInt(ma_san_pham))
					.getTen_san_pham()%></td>
					</tr>
					<tr class="row2">
						<td class="col1">Hãng sản xuất:</td>
						<td class="col2"><%=productDAO.getProduct(Integer.parseInt(ma_san_pham))
					.getHang_san_xuat()%></td>
					</tr>

					<tr class="row2">
						<td class="col1">Giá bán:</td>
						<td class="col2"><%=nf.format(productDAO.getProduct(Integer.parseInt(ma_san_pham))
					.getGia_ban()) %> VNĐ</td>
					</tr>

				</table>
			</div>
			<% if(username != null) { %>
			<div
				style="margin-left: 400px;  text-align: center; margin-top: 10px; padding: 10px; clear: both;">
				<a
					href="#"><img
					src="images/giohang.png" /></a>
				<form action="GioHangServlet" method="post">
					<input type="number" min="1" value="1" name="soluong"/>
					<input type="hidden" value="setCart" name="command"/>
					<input type="hidden" value="<%=ma_san_pham %>" name="ma_san_pham"/>
					<input type="submit" value="Thêm vào giỏ hàng">
				</form>	
			</div>
			<%} else { %>
			<div
				style="margin-left: 200px; text-align: center; margin-top: -50px; ">
				<a
					href="login.jsp"><img
					src="images/giohang.png" /></a>
			</div>
			<%} %>
			<div class="left-3">
				<article> <input type="checkbox" id="read_more"
					role="button"> <label for="read_more" onclick=""
					style="width: 300px; margin-left: 640px;background-color: #1AA59A;"><span>Xem
						thông tin chi tiết</span> <span>Đóng</span></label> <section>
				<table style="margin-left:600px; margin-top: 30px;">

					<!-- thong tin chung -->
					<tr rowspan="2"  ">
						<td class="detail-1" > Thông chi tiết</td>
						<td class="detail-2">Đang cập nhật</td>
					</tr>


				</table>
				</section> </article>
			</div>

		</div>
		<div id="footer"><jsp:include page="footer.jsp"></jsp:include></div>
	</div>
</body>
</html>