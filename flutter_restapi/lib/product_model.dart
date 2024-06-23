class Product {
  int id;
  String title;
  String description;
  String category;
  dynamic price;
  dynamic discountPercentage;
  dynamic rating;
  String brand;
  dynamic stock;
  String thumbnail;
  String images;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.category,
      required this.price,
      required this.discountPercentage,
      required this.rating,
      required this.brand,
      required this.stock,
      required this.thumbnail,
      required this.images});

  factory Product.fromMap(Map<String, dynamic> map) => Product(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      category: map['category'],
      price: map['price'],
      discountPercentage: map['discountPercentage'],
      rating: map['rating'],
      brand: map['brand'],
      stock: map['stock'],
      thumbnail: map['thumbnail'],
      images: map['images']);

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "description": description,
        "category": category,
        "price": price,
        "discountPercentage": discountPercentage,
        "rating": rating,
        "brand": brand,
        "stock": stock,
        "thumbnail": thumbnail,
        "images": images,
      };
}
