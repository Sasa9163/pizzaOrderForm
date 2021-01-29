package pizzaOrderForm.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pizzaOrderForm.dbConn.DBconn;
import pizzaOrderForm.userData.UserData;
@WebServlet({"/Login"})
public class LoginServlet extends HttpServlet{
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

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		request.setCharacterEncoding("UTF-8");
		String idStr = request.getParameter("user_id");
		String nameStr = request.getParameter("user_name");
		String mailStr = request.getParameter("user_mail");

		String[] name=nameStr.split(" ");
		UserData userData=new UserData();
		userData.id=idStr;
		userData.firstname=name[0];
		userData.lastname=name[1];
		userData.mail=mailStr;

		HttpSession session = request.getSession();

		boolean check = authUser(userData);
	    if (check){
	      getmoreUserData(userData);
	      session.setAttribute("user",userData);
	      session.setAttribute("login", "OK");
	      response.sendRedirect(request.getContextPath()+"/index.jsp");
	    }else{
	      session.setAttribute("status", "Not Auth");
	      response.sendRedirect(request.getContextPath()+"/NewRegister.html");
	    }
	}

	protected boolean authUser(UserData Data){

	    try {
	      String sql = "SELECT * FROM SasaUserTable WHERE user_id = ? && user_lastname = ? && user_firstname = ? && user_mail = ? ";
	      PreparedStatement pstmt = conn.prepareStatement(sql);

	      pstmt.setString(1, Data.id);
	      pstmt.setString(2, Data.lastname);
	      pstmt.setString(3, Data.firstname);
	      pstmt.setString(4, Data.mail);
	      ResultSet rs = pstmt.executeQuery();

	      if (rs.next()){
	        return true;
	      }else{
	        return false;
	      }
	    }catch (SQLException e){
	      log("SQLException:" + e.getMessage());
	      return false;
	    }
	  }

	protected void getmoreUserData(UserData Data){

	    try {
	    	String sql = "SELECT * FROM SasaUserTable WHERE user_id = ?";
	    	PreparedStatement pstmt = conn.prepareStatement(sql);

	    	pstmt.setString(1, Data.id);
	    	ResultSet rs = pstmt.executeQuery();

	      if (rs.next()){
	    	    Data.contact_mail=rs.getString("contact_mail");
	    	    Data.post_code=rs.getString("post_code");
	    	    Data.address=rs.getString("address");
	      }
	    }catch (SQLException e){
	      log("SQLException:" + e.getMessage());
	    }
	  }
}