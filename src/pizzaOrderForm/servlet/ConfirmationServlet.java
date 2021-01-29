package pizzaOrderForm.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pizzaOrderForm.cart.Cart;
import pizzaOrderForm.orderer.Orderer;
@WebServlet({"/ConfirmationServlet"})
public class ConfirmationServlet extends HttpServlet {
	private String view = "/WEB-INF/views/confirmation.jsp";
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String lastnameStr = request.getParameter("lastname");
		String firstnameStr = request.getParameter("firstname");
		String addressStr = request.getParameter("address");
		String deliveryDate =request.getParameter("date");
		String nameStr=lastnameStr+firstnameStr;

		HttpSession session = request.getSession();
		List<Cart> fromSession = (List<Cart>) session.getAttribute("list");
		Cart Contents=new Cart();
		Contents=fromSession.get(0);

		Orderer o = new Orderer(nameStr,addressStr);
		String name=o.getName();
		String address=o.getAddress();

		int quantityInt = Contents.quantity;
		String itemName=Contents.item;
		int itemPrice=Contents.price;

		int total_amount=calcTotalAmount(itemPrice,quantityInt);

		Integer quantity_io=new Integer(quantityInt);
		Integer total_amount_io=new Integer(total_amount);

		int tax_included_price=includeTax(total_amount);

		String[] list = new String[7];
		list[0]=name;
		list[1]=address;
		list[2]=itemName;
		list[3]="test";
		list[4]=quantity_io.toString();
		list[5]=total_amount_io.toString();;
		list[6]=deliveryDate;

		session.setAttribute("orderer_data",o);
		request.setAttribute("total_amount", total_amount);
		request.setAttribute("tax_included_price",tax_included_price);
		session.setAttribute("date",deliveryDate);


		session.setAttribute("csvstr",list);

		RequestDispatcher dispatcher = request.getRequestDispatcher(this.view);
		dispatcher.forward(request, response);

	}

	public int calcTotalAmount(int price, int quantity) {

		int amount=price*quantity;
		return amount;
	}

	public int includeTax(int x) {
		double result=x*1.1;
		return (int)Math.floor(result);
	}

}


