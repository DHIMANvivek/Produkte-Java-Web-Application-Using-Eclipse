package com.produkte.model;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class Products {
	public String _id;
	public String quantity;
	public String price;
	public String itemId;
	public String items;
	public String dateTimeStamp;

	public Products() {

	}

	public Products(String _id, String quantity, String price, String itemId, String items, String dateTimeStamp) {
		super();

		this.quantity = quantity;
		this.price = price;
		this.itemId = itemId;
		this.items = items;
		this.dateTimeStamp = dateTimeStamp;
	}

	@Override
	public String toString() {
		return "Products [_id=" + _id + ", quantity=" + quantity + ", price=" + price + ", itemId=" + itemId
				+ ", items=" + items + ", dateTimeStamp=" + dateTimeStamp + "]";
	}

	public Map<String, Object> toMap() {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("quantity", quantity);
		map.put("price", price);
		map.put("itemId", itemId);
		map.put("items", items);
		map.put("dateTimeStamp", new Date());

		return map;

	}
}
