package pizzaOrderForm.itemInfo;

public class SideMenu extends ItemInfo {
	private String[] itemList = {"","チキンナゲット","サラダ",};

    private int[] itemPriceList = {0,500,400};

    public SideMenu() {
		super.itemList=this.itemList;
		super.itemPriceList=this.itemPriceList;
	}
}
