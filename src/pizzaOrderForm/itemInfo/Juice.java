package pizzaOrderForm.itemInfo;

public class Juice extends ItemInfo {
	private String[] itemList = {"","オレンジジュース"};

    private int[] itemPriceList = {0,300};

    public Juice() {
		super.itemList=this.itemList;
		super.itemPriceList=this.itemPriceList;
	}
}
