<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/login.css" rel='stylesheet' type='text/css' />
<title>Đăng nhập hệ thống</title>
</head>
<body>
	<%
		String err = "";
		if (request.getAttribute("err") != null) {
			err = (String) request.getAttribute("err");
		}
	%>

	<!--/start-
		<form class="login-form" action="LoginServlet" method="post">
	<div class="login-container">
	     <h2> Login WebSite </h2>
	     	</div>
	</form>
	login-one-->
	<div class="login-01"style="background-color: #FFDEE9; background-image: linear-gradient(0deg, #fbe9ef 0%, #9dfffa 69%, #a6f7ff 100%); padding: 1em 1em;">
		<div class="one-login  hvr-float-shadow">
			<div class="one-login-head" style="background-color:  #0093E9; background-image:linear-gradient(160deg, #0081cc 10%, #80D0C7 100%);
    ; text-align: center; position: relative;">
 
				<img src="images/top-lock.png" alt="" />
				<h1>LOGIN</h1>
			</div>
			<form action="LoginServlet" method="post" style={{text-align: left;}}>
				<% String mess="";
				if (request.getAttribute("mess") != null){
					mess= (String) request.getAttribute("mess");%>
				<li style="color: red"><%=mess%></li>	
					<% }%>
				<li style="color: red"><%=err%></li>
				Tên người dùng
				<li><input type="text" class="text" value=""
					name="username"><a href="#" class=" icon user"></a></li>
				Mật khẩu
				<li><input type="password" value=""
					name="password"><a href="#" class=" icon lock"></a></li>
				<div class="p-container">
					<label class="checkbox"><input type="checkbox"
						name="checkbox" checked><i></i>Ghi nhớ mật khẩu</label>
					<h6>
						<a href="resetpassword.jsp">Khôi phục mật khẩu</a>
					</h6>
					<div class="clear"></div>
				</div>
				<div class="submit">
					<input type="submit" value="SIGN IN">
				</div>
				
				<h5>
					Bạn muốn đăng ký tài khoản?<a href="register.jsp"> Đăng ký </a>
				</h5>
			</form>
		</div>
	</div>

</body>
</html>