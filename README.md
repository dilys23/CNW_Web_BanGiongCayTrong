	****Triển khai chương trình****
           
    Chương trình được triển khai sử dụng mô hình MVC_JSPServlet.
    Vận hành trên Apache Tomcat 8.5, một máy chủ web Java Servlet/JSP nổi tiếng và mạnh mẽ, hỗ trợ việc thực thi các ứng dụng web dựa trên Java Servlet và JSP.

**	**Xây dựng cơ sở dữ liệu****

- 	Sử dụng MySQL trên Xampp để lưu trữ csdl
- Xây dựng các bảng: 
•	User: Lưu trữ thông tin của người dùng như : username, password, ngày sinh, …
•	Category: Lưu trữ thông tin phân loại các sản phẩm được bán.
•	Product: Lưu trữ thông tin chi tiết của các sản phẩm theo mỗi loại tương ứng.
•	History: Lưu lại chi tiết mua hàng: tổng tiền, ngày mua, sản phẩm, …
Hình 3. 1 Cơ sở dữ liệu
  



              
**Triển khai mô hình MVC_JSP Servlet**
- Triển khai mô hình MVC_JSP Servlet
- 	Người dùng thực hiện hành động trên giao diện (View):
-  Người dùng truy cập các trang JSP như index.jsp, login.jsp, hoặc product.jsp.
- 	Tương tác với các nút bấm, form nhập liệu hoặc liên kết trên giao diện.
- 	Controller điều khiển hành động:
-	Servlets như LoginServlet, RegisterServlet, SearchServlet nhận và xử lý các yêu cầu từ người dùng.
-	Controller quyết định cần tương tác với Model nào dựa trên yêu cầu nhận được.
-Model xử lý dữ liệu và logic:
-	Các lớp Bean (như Cart, Product) lưu trữ thông tin và logic liên quan.
-	BO (Business Objects) chịu trách nhiệm cho logic phức tạp hơn.
-	DAO (Data Access Objects) thực hiện truy cập và cập nhật cơ sở dữ liệu.
-	Model cập nhật thông tin:
-	Sau khi xử lý logic, Model có thể trả về kết quả hoặc cập nhật dữ liệu trong cơ sở dữ liệu.
-	View hiển thị kết quả:
-	Sau khi Controller nhận được kết quả từ Model, nó chuyển kết quả đến các trang JSP.
-	Các trang JSP như detail.jsp, cart.jsp hiển thị thông tin tương ứng dựa trên dữ liệu từ Model.


	Tương tác giữa các phần:
-	Controller điều hướng và quản lý quá trình, quyết định cần sử dụng Model nào để xử lý.
-	Model chứa dữ liệu và logic xử lý, cập nhật hoặc trả về thông tin cho Controller.
-	View hiển thị thông tin cho người dùng dựa trên dữ liệu từ Controller và Model.
-	Quá trình này diễn ra khi người dùng tương tác với giao diện, yêu cầu gửi đến Controller, và sau đó thông tin được xử lý, cập nhật và hiển thị lại trên giao diện người dùng. Mỗi phần trong mô hình MVC có trách nhiệm riêng biệt nhưng làm việc cùng nhau để tạo ra trải nghiệm hoạt động mượt mà và có ý nghĩa cho người dùng.


**Các chức năng của hệ thống chương trình**
        Tất cả chức năng được thao tác dưới User : Le  .
4.1.	Hiển thị giao diện chính của trang web khi chưa đăng nhập.
 ![image](https://github.com/dilys23/CNW_Web_BanGiongCayTrong/assets/91045422/72ca0fbc-9dc1-4c81-8bba-8517b14c5e0f)

Hình 4. 1 Giao diện của trang web khi chưa đăng nhập.


4.2.	Đăng ký tài khoản.
 ![image](https://github.com/dilys23/CNW_Web_BanGiongCayTrong/assets/91045422/45ae2bbd-a788-4f51-b6e2-1d947a974622)

Hình 4. 2 Giao diện đăng ký tài khoản.
4.3.	Giao diện đăng nhập.
![image](https://github.com/dilys23/CNW_Web_BanGiongCayTrong/assets/91045422/46f13a9e-587b-410b-9eca-b2415e2b8972)

Hình 4. 3 Giao diện đăng nhập.

4.4.	Đăng nhập tài khoản thành công.
![image](https://github.com/dilys23/CNW_Web_BanGiongCayTrong/assets/91045422/f16dc6ab-4f49-4a83-b6d2-80d4755dbfe0)











Hình 4. 4 Giao diện sau khi đăng nhập thành công.
4.5.	Xem danh sách sản phẩm theo từng loại phân biệt.
4.5.1.	Xem danh sách về Cây giống.

![image](https://github.com/dilys23/CNW_Web_BanGiongCayTrong/assets/91045422/670de6de-6c09-484f-97ae-9cbc5f23233b)










Hình 4. 5 Danh sách cây giống.


4.5.2.	Xem danh sách Hạt giống hoa.




![image](https://github.com/dilys23/CNW_Web_BanGiongCayTrong/assets/91045422/df7da179-85ea-462d-a587-4e5b08835def)







Hình 4. 6 Danh sách Hạt giống hoa.
4.5.3.	Xem danh sách Hạt giống rau củ.


![image](https://github.com/dilys23/CNW_Web_BanGiongCayTrong/assets/91045422/3c1cc88e-d857-4a77-89b8-a24dfcd5ae91)









Hình 4. 7 Danh sách hạt giống rau củ.




4.5.4.	Xem danh sách các loại Phân bón.



![image](https://github.com/dilys23/CNW_Web_BanGiongCayTrong/assets/91045422/33bc2828-8169-43fa-b767-465074c3eb24)








Hình 4. 8 Danh sách các loại Phân bón.
4.5.5.	Xem danh sách các loại Dụng cụ.




![image](https://github.com/dilys23/CNW_Web_BanGiongCayTrong/assets/91045422/e81566fa-0855-4a90-b89c-67de85208976)






Hình 4. 9 Danh sách các loại Dụng cụ.




4.6.	Xem và chọn sản phẩm để thêm vào giỏ hàng.
4.6.1.	Xem sản phẩm.


![image](https://github.com/dilys23/CNW_Web_BanGiongCayTrong/assets/91045422/6d78c677-b4ab-4cf0-8b73-cfefc0f42d24)









Hình 4. 10 Giao diện xem sản phẩm.
4.6.2.	Chọn sản phẩm

![image](https://github.com/dilys23/CNW_Web_BanGiongCayTrong/assets/91045422/187bc8e8-0051-4273-9a81-904c96bcb8a6)









Hình 4. 11 Giao diện chọn sản phẩm.




4.6.3.	Xem chi tiết 
![image](https://github.com/dilys23/CNW_Web_BanGiongCayTrong/assets/91045422/00a569ca-9ee0-488a-adf7-490bc2113ef0)

Hình 4. 12 Giao diện xem chi tiết. 
4.6.4.	Thêm sản phẩm vào giỏ hàng	


![image](https://github.com/dilys23/CNW_Web_BanGiongCayTrong/assets/91045422/c0d8aab4-2093-423d-b018-5e838328dddc)



![image](https://github.com/dilys23/CNW_Web_BanGiongCayTrong/assets/91045422/ad4ee49c-0456-4c8c-a2cf-4d79b00dc65c)









Hình 4. 13 Giao diện sau khi thêm sản phẩm vào giỏ hàng.

4.7.	Thanh toán hóa đơn.
4.7.1.	Thanh toán hóa đơn thành công.
![image](https://github.com/dilys23/CNW_Web_BanGiongCayTrong/assets/91045422/f5ad211e-8893-4b3b-800a-9527d6058372)

Hình 4. 14 Giao diện thanh toán hóa đơn thành công.






4.7.2.	Xem lịch sử thanh toán.






![image](https://github.com/dilys23/CNW_Web_BanGiongCayTrong/assets/91045422/7831bb47-a713-451f-abdc-b53640775219)





Hình 4. 15 Giao diện xem lịch sử thanh toán.
4.8.	Tìm kiếm sản phẩm.





![image](https://github.com/dilys23/CNW_Web_BanGiongCayTrong/assets/91045422/d199c219-9de6-4be5-a441-8b1ed97f760a)
















![image](https://github.com/dilys23/CNW_Web_BanGiongCayTrong/assets/91045422/9d8b2dd2-319f-40db-a411-38a47d0221f3)



Hình 4. 16 Giao diện sau khi tìm kiếm sản phẩm.







4.9.	Cập nhật thông tin User.
![image](https://github.com/dilys23/CNW_Web_BanGiongCayTrong/assets/91045422/7279ac57-0a38-4ce1-8981-a5239ed72062)


Hình 4. 17 Giao diện cập nhật User.
![image](https://github.com/dilys23/CNW_Web_BanGiongCayTrong/assets/91045422/cd7862af-c3ac-4b3d-848d-e0347ffacf76)

Hình 4. 18 Giao diện sau cập nhật User thành công.
4.10.	Đăng xuất.
 ![image](https://github.com/dilys23/CNW_Web_BanGiongCayTrong/assets/91045422/83bd8983-ff12-4c69-8ecf-0d17062348b7)

Hình 4. 19 Giao diện sau khi đăng xuất.

