package controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.*;
import model.bo.*;


@WebServlet("/ConfirmServlet")
public class ConfirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAOImpl userDAO = new UserDAOImpl();
    private ProductDAOImpl productDAO = new ProductDAOImpl();  
    private HistoryDAOImpl historyDAO = new HistoryDAOImpl();

    public ConfirmServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        User u = userDAO.getUser(username);

        // Lấy thời gian lưu vào CSDL
        Calendar calendar = Calendar.getInstance();
        java.sql.Timestamp tdate = new java.sql.Timestamp(calendar.getTime().getTime());

        double total = 0;
        ArrayList<Cart> cart = (ArrayList<Cart>) request.getSession().getAttribute("cart");
        NumberFormat nf = NumberFormat.getInstance();
        nf.setMinimumFractionDigits(0);

        // Không cần xác nhận qua email, lưu trực tiếp vào lịch sử
        for (Cart c : cart) {
            total = total + (c.getQuantity() * productDAO.getProduct(c.getP().getMa_san_pham()).getGia_ban());

            History h = new History(0, u.getUser_id(), c.getP().getMa_san_pham(), tdate, c.getQuantity(), (c.getQuantity() * productDAO.getProduct(c.getP().getMa_san_pham()).getGia_ban()));
            historyDAO.addHistory(h);
        }

        cart.clear();
        request.getSession().setAttribute("cart", cart);

        // Redirect to the index page or any other page as needed
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
        rd.forward(request, response);
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}
