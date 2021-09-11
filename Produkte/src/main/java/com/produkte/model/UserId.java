package com.produkte.model;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class UserId {

	public String _id;

	public String userId;

	public String dateTimeStamp;

	public UserId() {

	}

	public UserId(String userId) {
		this.userId = userId;

	}

	public Map<String, Object> toMap() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("dateTimeStamp", new Date());
		return map;
	}
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	@Override
	public String toString() {
		return "UserId [_id=" + _id + ", userId=" + userId + ", dateTimeStamp=" + dateTimeStamp + "]" + "\n"
				+ super.toString();
	}

}