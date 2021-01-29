package pizzaOrderForm.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pizzaOrderForm.cart.Cart;
import pizzaOrderForm.dbConn.DBconn;
import pizzaOrderForm.userData.UserData;

@WebServlet({"/OrderResultServlet"})
public class OrderResultServlet extends HttpServlet{
	private String view = "/WEB-INF/views/orderResult.jsp";
	protected Connection conn=null;

	public void init() throws ServletException{
		DBconn data=new DBconn();
		String servername = data.servername;
		String databasename = data.databasename;
		String user = data.user;
		String password = data.password;

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
		List<Cart> fromSession = (List<Cart>) session.getAttribute("list");
		Cart result=new Cart();

		UserData user=(UserData) session.getAttribute("user");
		String userStr=user.id;

		Date date = new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String dateStr=sdf.format(date);

		String check="default";
		for(int i=0;i<fromSession.size();i++) {
			result=fromSession.get(i);
			stock_calc(result,userStr,dateStr);
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(this.view);
		dispatcher.forward(request, response);
	}

	protected void stock_calc(Cart Data,String user,String date){
	    try {
	    	int stock=0;
	    	String sql = "SELECT * FROM SasaItemTable WHERE item_code = ?";
	    	PreparedStatement pstmt = conn.prepareStatement(sql);

	    	pstmt.setInt(1, Data.code);
	    	ResultSet rs = pstmt.executeQuery();

	    	if (rs.next()){
	    	    stock=rs.getInt("stock_quantity");
	      	}

	    	int r=stock-Data.quantity;
	    	sql = "UPDATE SasaItemTable SET stock_quantity = ? WHERE item_code=?";
	    	PreparedStatement pstmt2 = conn.prepareStatement(sql);
	    	pstmt2.setInt(1, r);
	    	pstmt2.setInt(2, Data.code);
	    	int i = pstmt2.executeUpdate();

	    	sql = "INSERT SasaOrderHistory VALUES (?,?,?,?)";

	    	PreparedStatement pstmt3 = conn.prepareStatement(sql);
	    	pstmt3.setString(1, user);
	    	pstmt3.setString(2, Data.item);
	    	pstmt3.setInt(3, Data.quantity);
	    	pstmt3.setString(4, date);
	    	int j=pstmt3.executeUpdate();

	    	conn.commit();

	    }catch (SQLException e){
	      log("SQLException:" + e.getMessage());
	    }
	  }

}