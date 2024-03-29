class Items {
  String? imageURI;
  String? itemName;
  double? price;
  String? expectedTime;
  bool isFavorite = false;
  final List<String> catergory;
  Items({
    required this.imageURI,
    required this.catergory,
    this.isFavorite = false,
    required this.itemName,
    required this.price,
    required this.expectedTime,
  });
}
