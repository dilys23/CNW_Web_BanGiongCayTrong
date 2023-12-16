<%@page import="model.bean.*"%>
<%@page import="model.bo.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.NumberFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Giỏ hàng</title>
<link rel="stylesheet" href="css/cart.css" />
<link rel="stylesheet" href="css/menu.css" />
<link rel="stylesheet" href="css/main.css" />
<link rel="stylesheet" href="css/bootstrap.min.css" />
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
	min-height: 430px;
	border: 1px solid #CDCDCD;
	float: left;
	margin-bottom: 5px;
	clear: both;
	background-color: azure;
}

#footer {
width: 1200px;
	height: 50px;
	clear: both;
	border: 1px solid #CDCDCD;
	background-color: #F8F8FF;
	margin-bottom: 5px;
}
.product-image , .product-details, .product-price, .product-quantity , .product-line-price
{ 
   font-size: 16px;
   color: black;
}
</style>
</head>
<body>
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
	%>
	<div id="main">
		<div id="head">
				<img src="images/bgr1.png" width="1200px" height="200px" />
		</div>
		<div id="head-link">
			<div id='menungang' style="background-color:  #0093E9; background-image:linear-gradient(160deg, #0081cc 10%, #80D0C7 100%);width: 1200px;">
				<ul>
					<li class='last'><a href="index.jsp"><span>Trang
								chủ</span></a></li>
					<li class='last'><a href="product.jsp"><span>Sản phẩm</span></a></li>
					<li class='last'><a href="cart.jsp"><span>Giỏ hàng</span></a></li>
					<li class='last'><a href="search_page.jsp"><span>Tìm kiếm</span></a></li>
					<li class='last' style="float: right;"><a href="login.jsp"><span>Đăng
								xuất</span></a></li>
					<li class='last' style="float: right;"><a href="update_user.jsp?username=<%=username %>"><span><%= username %></span></a></li>			
				</ul>
			</div>
		</div>
		<div id="content">
			

			<div class="shopping-cart">

				<div class="column-labels">
					<label class="product-image">Hình ảnh</label> <label
						class="product-details">Sản phẩm</label> <label
						class="product-price">Ngày mua</label> <label
						class="product-quantity">Số lượng</label><label
						class="product-line-price">Đã thanh toán</label>
				</div>
				<%
					ProductDAOImpl productDAO = new ProductDAOImpl();
							HistoryDAOImpl historyDAO = new HistoryDAOImpl();
							UserDAOImpl userDAO = new UserDAOImpl();
							User u= userDAO.getUser(username);
							
							List<History> L= historyDAO.getList(u.getUser_id());
							NumberFormat nf = NumberFormat.getInstance();
							nf.setMinimumIntegerDigits(0);
							
				%>
				<%
					if (L != null) {
										for (History h : L) {
											
				%>
				<div class="product">
					<div class="product-image">
						<img
							src="sanpham/<%=productDAO.getProduct(h.getMa_san_pham())
							.getHinh_anh()%>">
					</div>
					<div class="product-details">
						<div class="product-title">
							<%=productDAO.getProduct(h.getMa_san_pham())
							.getTen_san_pham()%>
						</div>
						<p class="product-description"></p>
					</div>
					<div class="product-price"><%=h.getNgay_mua()%>
					</div>
					<div class="product-quantity cart_quantity_button">
						<%=h.getSo_luong() %>
					</div>
					<div class="product-line-price" style="text-align: right"><%=nf.format(productDAO.getProduct(
							h.getMa_san_pham()).getGia_ban())%>
						VNĐ
					
						
					</div>
					
				</div>
				<%
					}
									}
				%>
				
				
			</div>

		</div>
		<div id="footer"><jsp:include page="footer.jsp"></jsp:include></div>
	</div>
</body>
</html>