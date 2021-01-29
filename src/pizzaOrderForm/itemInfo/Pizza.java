package pizzaOrderForm.itemInfo;

public class Pizza extends ItemInfo{
	private String[] itemList = {"","チーズピザ","シーフードピザ","ベーコンチーズピザ"};

    private int[] itemPriceList = {0,1000,1100,1200};

	public Pizza() {
		super.itemList=this.itemList;
		super.itemPriceList=this.itemPriceList;
	}

}
