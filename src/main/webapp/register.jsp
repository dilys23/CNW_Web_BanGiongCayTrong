<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<link href="css/login.css" rel='stylesheet' type='text/css' />
<title>Đăng kí tài khoản</title>
</head>
<body>
	<%
		String err = "";
		if (request.getAttribute("err") != null) {
			err = (String) request.getAttribute("err");
		}
	%>
	<!--/start-login-two-->
	<div class="login-02" style="background-color: #FFDEE9; background-image: linear-gradient(0deg, #fbe9ef 0%, #9dfffa 69%, #a6f7ff 100%); padding: 1em 1em;">
		
		<div class="two-login  hvr-float-shadow" style ="width: 550px;">
			<div class="two-login-head"style="background-color:  #0093E9; background-image:linear-gradient(160deg, #0081cc 10%, #80D0C7 100%);
    ; text-align: center; position: relative;">
				<img src="images/top-note.png" alt="" />
				<h2>Đăng ký</h2>
			</div>
			<form action="RegisterServlet" method="post">
				<li style="color: red"><%=err%></li>
				Tên người dùng
				<li><input type="text" class="text" value=""
					name="username"><a href="#" class=" icon2 user2"></a></li>
				Mật khẩu	
				<li><input type="password" value=""
					name="password"><a href="#" class=" icon2 lock2"></a></li>
				Ngày sinh
				<li><input type="date" value=""
					name="ngaysinh"><a href="#" class=" icon2 lock2"></a></li>
				Giới tính
				<li><input type="text" value="" list="exampleList"
					name="gioitinh"> 
					<datalist id="exampleList">
					<option value="Nam">
					<option value="Nữ">
					</datalist><a href="#" class=" icon2 lock2"></a></li>
				Email
				<li><input type="text" value=""
					name="email"><a href="#" class=" icon2 lock2"></a></li>
				Số điện thoại
				<li><input type="text" value=""				
					name="sdt"><a href="#" class=" icon2 lock2"></a></li>
				Địa chỉ
				<li><input type="text" value=""
					name="diachi"><a href="#" class=" icon2 lock2"></a></li>
					
				<div class="p-container">
					<label class="checkbox two"><input type="checkbox"
						name="checkbox" checked><i></i>Tôi đồng ý <a href="#">Điều khoản dịch vụ</a></label>
				</div>
				<div class="submit two">
					<input type="submit" value="ĐĂNG KÝ">
				</div>
				<h5>
					<a href="login.jsp">Đăng nhập</a>
				</h5>
			</form>
		</div>
	</div>
</body>
</html>