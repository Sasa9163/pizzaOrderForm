package pizzaOrderForm.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet({"/recipientDataServlet"})
public class RecipientDataServlet extends HttpServlet{
	private String view = "";
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		String login=(String)session.getAttribute("login");

		if(login=="OK") {
			view="/WEB-INF/views/recipientData.jsp";
		}else {
			view="/WEB-INF/views/login.jsp";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(this.view);
		dispatcher.forward(request, response);
	}

}
