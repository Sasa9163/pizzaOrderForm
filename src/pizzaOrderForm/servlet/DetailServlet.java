package pizzaOrderForm.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/item-detail")
public class DetailServlet extends HttpServlet {
	private static final long serialVersionUID=1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{

	String forwardPath=null;
	String code=request.getParameter("code");

	if(code == null) {
		forwardPath="/index.jsp";
	}

	if(code != null) {
		forwardPath="/item-detail.jsp";
	}

	request.setAttribute("code", code);
	RequestDispatcher dispatcher = request.getRequestDispatcher(forwardPath);
	dispatcher.forward(request, response);

	}
}
