package pizzaOrderForm.itemInfo;

public class ItemInfo {
	protected String[] itemList;
	protected int[] itemPriceList;

	public String getItemName(int index) {
	       return itemList[index];
	    }

	public int getItemPrice(int index) {
	       return itemPriceList[index];
	}
 }