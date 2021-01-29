package pizzaOrderForm.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pizzaOrderForm.userData.UserData;

@WebServlet({"/Insert"})
public class Insert extends HttpServlet {
	private String view = "/WEB-INF/views/insertResult.jsp";
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

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
		session.setAttribute("user",userData);

		RequestDispatcher dispatcher = request.getRequestDispatcher(this.view);
		dispatcher.forward(request, response);

	}

}


