class Transaction {
  final String id;
  final double amount;
  final DateTime date;
  final Map<String, int> items;
  final bool isDone;
  final String user;

  // final String imageURI;
  // final String title;

  Transaction({
    required this.id,
    required this.amount,
    required this.date,
    required this.items,
    this.isDone = false,
    required this.user,

    // required this.title,
    // required this.imageURI,
  });
}
