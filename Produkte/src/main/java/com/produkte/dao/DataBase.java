package com.produkte.dao;

import java.sql.Connection;

import java.sql.DriverManager;
import java.util.ArrayList;

import org.bson.Document;
import org.bson.types.ObjectId;

import com.mongodb.BasicDBObject;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.Updates;
import com.produkte.model.Products;
import com.produkte.model.UserId;

public class DataBase {

	MongoClient mongoClient;

	public DataBase() {

		try {
			String connectionURL = "mongodb+srv://androidvivek:vivek@cluster0.ay1mh.mongodb.net/androidvivek?retryWrites=true&w=majority";
			mongoClient = MongoClients.create(connectionURL);
		} catch (Exception e) {
			System.out.println("Something Went Wrong: " + e);
		}

	}

	public boolean logFever(Products products) {

		Document document = new Document(products.toMap());

		// Insert into DataBase
		mongoClient.getDatabase("Produkte").getCollection("products").insertOne(document);
		System.out.println(products.itemId + " " + products.price + " Fever Saved in MongoDB");

		return true;
	}

	public void fetch(UserId userId) {

		try {

			Document document = new Document(userId.toMap());

			mongoClient.getDatabase("Produkte").getCollection("userId").insertOne(document);
			System.out.println("Document Inserted :)");

		} catch (Exception e) {
			System.out.println("Something Went Wrong: " + e);
		}

	}

	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/produktewebapp", "root", "Vivek");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return con;
	}

	public ArrayList<Products> fetchProducts(String userId) {

		ArrayList<Products> productRecords = new ArrayList<Products>();

		try {

			BasicDBObject query = new BasicDBObject();
			query.put("itemId", userId);

			MongoCursor<Document> cursor = mongoClient.getDatabase("Produkte").getCollection("products").find(query)
					.iterator();
			while (cursor.hasNext()) {

				Document document = cursor.next();
				Products product = new Products();

				product._id = document.getObjectId("_id").toString();
				product.itemId = document.getString("itemId");
				product.dateTimeStamp = document.getDate("dateTimeStamp").toString();
				product.quantity = document.getString("quantity");
				product.items = document.getString("items");
				product.price = document.getString("price");
				productRecords.add(product);

			}
		} catch (Exception e) {
			System.out.println("Something Went Wrong: " + e);
		}

		return productRecords;

	}

	public void deleteForever(String userId) {

		System.out.println("[DB] Deleting Product:" + userId);

		BasicDBObject query = new BasicDBObject();

		query.put("_id", new ObjectId(userId));

		// Fetching the Data
		mongoClient.getDatabase("Produkte").getCollection("products").deleteOne(query);

	}

	public void updateProducts(String itemname, String itemId) {
		// MongoDB Document which converts HashMap to Document | BOXING

		System.out.println("[DB] Updating item  " + itemId);

		BasicDBObject query = new BasicDBObject();
		query.put("_id", new ObjectId(itemId));

		MongoCursor<Document> cursor = mongoClient.getDatabase("Produkte").getCollection("products").find(query)
				.iterator();

		Document document = cursor.next();

		document.put("items", itemname);

		ObjectId oId = new ObjectId(itemId);

		System.out.println("[DB] " + document.toJson());

		// Insert into DataBase
		mongoClient.getDatabase("Produkte").getCollection("products").updateOne(Filters.eq("_id", oId),
				Updates.set("items", itemname));
		System.out.println("Fever Updated");

	}

}
