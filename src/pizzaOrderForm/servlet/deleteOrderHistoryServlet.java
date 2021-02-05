package pizzaOrderForm.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ResourceBundle;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pizzaOrderForm.userData.UserData;

@WebServlet({"/deleteOrderHistory"})
public class deleteOrderHistoryServlet extends HttpServlet{
	private String view = "/WEB-INF/views/userPage.jsp";
	protected Connection conn=null;

	public void init() throws ServletException{
		ResourceBundle rb=ResourceBundle.getBundle("dbset");
		String servername = rb.getString("server");
		String databasename = rb.getString("db");
		String user = rb.getString("user");;
		String password = rb.getString("password");

		String url = "jdbc:mysql://" + servername + "/" + databasename;

		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conn = DriverManager.getConnection(url, user, password);
		}catch (ClassNotFoundException e){
		      log("ClassNotFoundException:" + e.getMessage());
	    }catch (SQLException e){
	      log("SQLException:" + e.getMessage());
	    }catch (Exception e){
	      log("Exception:" + e.getMessage());
	    }
	  }

	public void destory() {
		try {
			if(conn != null) {
				conn.close();
			}
		}catch(SQLException e) {
			log("SQLException:"+e.getMessage());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();

		UserData user=(UserData) session.getAttribute("user");
		String userStr=user.id;
		history_del(userStr);

		RequestDispatcher dispatcher = request.getRequestDispatcher(this.view);
		dispatcher.forward(request, response);
	}

	protected void history_del(String user){
	    try {
	    	String sql = "DELETE FROM SasaOrderHistory WHERE order_user = ?";
	    	PreparedStatement pstmt = conn.prepareStatement(sql);

	    	pstmt.setString(1, user);
	    	int i = pstmt.executeUpdate();

	    	conn.commit();

	    }catch (SQLException e){
	      log("SQLException:" + e.getMessage());
	    }
	  }

}