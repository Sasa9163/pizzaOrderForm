package pizzaOrderForm.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet({"/MyPage"})

public class MyPageServlet extends HttpServlet{
	private String view = "/WEB-INF/views/userPage.jsp";
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String login_st=(String)session.getAttribute("login");
		if (login_st=="OK"){
				RequestDispatcher dispatcher = request.getRequestDispatcher(this.view);
				dispatcher.forward(request, response);
		    }else{
		    	response.sendRedirect(request.getContextPath()+"/index.jsp");
		    }
	}
}
