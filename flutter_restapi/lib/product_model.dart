class Product {
  int id;
  String title;
  String category;
  dynamic price;
  dynamic rating;
  dynamic stock;
  String thumbnail;

  Product(
      {required this.id,
      required this.title,
      required this.category,
      required this.price,
      required this.rating,
      required this.stock,
      required this.thumbnail});

  factory Product.fromMap(Map<String, dynamic> map) => Product(
      id: map['id'],
      title: map['title'],
      category: map['category'],
      price: map['price'],
      rating: map['rating'],
      stock: map['stock'],
      thumbnail: map['thumbnail']);

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "category": category,
        "price": price,
        "rating": rating,
        "stock": stock,
        "thumbnail": thumbnail,
      };
}
