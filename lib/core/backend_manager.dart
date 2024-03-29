import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/items.dart';
import '../models/transaction.dart';

enum TransactionStatus { preparing, ready, delivered }

class BackendManager {
  List<Items> products = [];
  final String _baseUrl = "http://10.0.2.2:3000";

  /// Sends a POST request to the specified [endpoint] with the given [data].
  Future<void> sendPostRequest(
      {required Map<String, Object> data, required String endpoint}) async {
    final apiUrl = Uri.parse("https://jsonplaceholder.typicode.com$endpoint");

    var response = await http.post(apiUrl,
        headers: {"Content-Type": "application/json"}, body: jsonEncode(data));

    if (response.statusCode == 201) {
      print("Post created successfully!");
    } else {
      print("Failed to create post!");
    }
  }

  /// Retrieves items from the backend at the specified [endpoint].
  /// Returns a [Future] that completes with a list of [Items].
  Future<List<Items>> getProducts({required String endpoint}) async {
    var response;
    try {
      final apiUrl = Uri.parse("$_baseUrl$endpoint");
      response = await http.get(apiUrl);
      if (response.statusCode == 200) {
        products.clear();
        var data = jsonDecode(response.body);
        for (var item in data) {
          // Add each item to the list
          products.add(Items(
            imageURI: item["imageurl"],
            itemName: item["title"],
            expectedTime: item["expectedtime"].toString(),
            price: item["price"].toDouble(),
            catergory: List<String>.from(item["categories"]),
          ));
        }
        return products; // Return the list of items
      } else {
        // Failed to fetch data from the backend, using sample data instead
        print(
            "Failed to fetch data! Either database is empty or not currently running. Using sample data instead.");
        // print(response.statusCode);
        return TEST_ITEMS; // Return the list of test items instead
      }
    } catch (e) {
      print(
          "Failed to establish connection. Continuing without fetching data.");
      return TEST_ITEMS; // Return the list of test items instead
    }
  }

  /// Retrieves transactions from the backend at the specified [endpoint].
  /// Returns a [Future] that completes with a list of [Transaction].
  Future<List<Transaction>> getTransactions({required String endpoint}) async {
    var response;
    try {
      final apiUrl = Uri.parse("$_baseUrl$endpoint");
      response = await http.get(apiUrl);
      if (response != null && response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List<Transaction> transactions = [];
        // print(data);
        // print(data[0]["status_enum"]);

        for (var item in data) {
          transactions.add(Transaction(
            id: item["id"].toString(),
            amount: item["total_price"].toDouble(),
            date: DateTime.parse(item["order_date"]),
            items: Map<String, int>.fromIterables(
              (item["items"] as List).map((e) => e.toString()).toList(),
              (item["quantity"] as List).map((e) => e as int).toList(),
            ),
            isDone: item["status_enum"] == 1 || item["status_enum"] == 2
                ? true
                : false,
            user: item["rollno"],
          ));
        }
        return transactions; // Return the list of transactions
      } else {
        // Failed to fetch data from the backend, using sample data instead
        print(
            "Failed to fetch data! Either database is empty or not currently running. Using sample data instead.");
        // print(response.statusCode);
        return TEST_TRANSACTIONS; // Return the list of test transactions instead
      }
    } catch (e) {
      print(
          "Failed to establish connection. Continuing without fetching data.");
      return TEST_TRANSACTIONS;
    }
  }

  /// Posts an order to the database.
  /// The [data] is a map that contains the items and their quantities to be ordered.
  /// The [userName] is the roll number of the user placing the order.
  Future<void> postOrder({
    required Map<String, int> data,
    required String userName,
    required String endpoint,
  }) async {
    final List<String> items = data.keys.toList();
    final List<int> quantity = data.values.toList();
    List<Items> products = await getProducts(endpoint: '/product');
    final DateTime orderDate = DateTime.now();
    final int statusEnum = TransactionStatus.preparing.index;

    // Get the price of each item in the data map and multiply it with the
    // quanity for that item and calculate total price.
    double totalPrice = 0;
    for (int i = 0; i < items.length; i++) {
      totalPrice += products
              .firstWhere((element) => element.itemName == items[i])
              .price! *
          quantity[i];
    }

    final Map<String, Object> orderData = {
      "rollno": userName,
      "items": items,
      "quantity": quantity,
      "total_price": totalPrice,
      "order_date": orderDate.toIso8601String(),
      "status_enum": statusEnum,
    };

    final apiUrl = Uri.parse("$_baseUrl$endpoint");
    try {
      var response = await http.post(apiUrl,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(orderData));
      if (response.statusCode == 200) {
        print("Post created successfully!");
      } else {
        print("Failed to create post!");
        print(response.statusCode);
      }
    } catch (e) {
      print("An error occurred while creating the post: $e");
    }
  }

  final List<Items> TEST_ITEMS = [
    Items(
      imageURI: "https://i.imgur.com/crsd3wU.jpeg",
      itemName: "Item Name",
      expectedTime: "10 mins",
      price: 99.9,
      catergory: ["Veg", "Meals"],
    ),
    Items(
      imageURI: "https://i.imgur.com/crsd3wU.jpeg",
      itemName: "Item Name",
      expectedTime: "10 mins",
      price: 99.9,
      catergory: ["Veg", "Beverages"],
    ),
    Items(
      imageURI: "https://i.imgur.com/crsd3wU.jpeg",
      itemName: "Item Name",
      expectedTime: "10 mins",
      price: 99.9,
      catergory: ["Non-Veg", "Meals", "Combos"],
    ),
    Items(
      imageURI: "https://i.imgur.com/crsd3wU.jpeg",
      itemName: "Item Name",
      expectedTime: "10 mins",
      price: 99.9,
      catergory: ["Non-Veg", "Snacks"],
    ),
  ];
  final List<Transaction> TEST_TRANSACTIONS = [
    Transaction(
        id: "121",
        amount: 99.9,
        date: DateTime.now(),
        items: {"Samosa": 2, "Vada": 3},
        user: "2023BCS0023"),
    Transaction(
        id: "122",
        amount: 100,
        date: DateTime.now(),
        items: {"Samosa": 3, "Mango Lassi": 2},
        user: "2023BCS0023"),
    Transaction(
        id: "123",
        amount: 99.9,
        date: DateTime.now(),
        items: {"Sandwich": 2, "Vada": 3},
        isDone: true,
        user: "2023BCS0023"),
    Transaction(
        id: "124",
        amount: 99.9,
        date: DateTime.now(),
        items: {"Samosa": 2, "Vada": 3},
        isDone: true,
        user: "2023BCS0023"),
  ];
}
