package pizzaOrderForm.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pizzaOrderForm.cart.Cart;
import pizzaOrderForm.itemInfo.Juice;
import pizzaOrderForm.itemInfo.Pizza;
import pizzaOrderForm.itemInfo.SideMenu;
@WebServlet({"/ShoppingCartServlet"})
public class ShoppingCartServlet extends HttpServlet{
	private String view = "/shoppingCart.jsp";
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String itemIndexStr =request.getParameter("item");
		String quantityStr = request.getParameter("quantity");
		int itemIndexInt = Integer.parseInt(itemIndexStr);
		int quantityInt = Integer.parseInt(quantityStr);

		convData convertedData=IndexConvert(itemIndexInt);

		HttpSession session = request.getSession();
		List<Cart> list = new ArrayList<Cart>();

		List<Cart> fromSession = (List<Cart>) session.getAttribute("list");
		int i=0;
		String flag="F";
		if(fromSession != null) {
			list=fromSession;
			for(Cart s:fromSession) {
				if(s.item==convertedData.itemName) {
					flag="T";
					break;
				}
				i++;
			}
		}

		Cart cart=new Cart();
		cart.item=convertedData.itemName;
		cart.price=convertedData.itemPrice;
		cart.quantity=quantityInt;
		cart.total=cart.price*cart.quantity;
		cart.code=itemIndexInt;

		if(flag=="T") {
			list.set(i, cart);
		}else {
			list.add(cart);
		}

		session.setAttribute("list",list);
		session.setAttribute("itemIndex",itemIndexInt);

		RequestDispatcher dispatcher = request.getRequestDispatcher(this.view);
		dispatcher.forward(request, response);
	}

	public class convData {
		String itemName;
		int itemPrice;
	}

	public convData IndexConvert(int itemIndexInt) {
		String itemName="";
		int x=(int)Math.floor(itemIndexInt);
		int itemPrice=0;
		int switchflag=x/10;
		int subIndex=x%10;

		switch(switchflag) {

			case 1:{
				Pizza objItem = new Pizza();//ピザ
				itemName = objItem.getItemName(subIndex);
				itemPrice = objItem.getItemPrice(subIndex);
				break;
			}
			case 2:{
				SideMenu objItem=new SideMenu();
				itemName = objItem.getItemName(subIndex);
				itemPrice = objItem.getItemPrice(subIndex);
				break;
			}
			case 3:{
				Juice objItem=new Juice();
				itemName = objItem.getItemName(subIndex);
				itemPrice = objItem.getItemPrice(subIndex);
				break;
			}
		}
		convData convData=new convData();
		convData.itemName=itemName;
		convData.itemPrice=itemPrice;
		return convData;
	}
}
