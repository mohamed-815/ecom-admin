class OrderModel {
  // String image;
  String id;
  String category;
  String name;
  String size;
  double price;
  double minno;
  double minnomultiple;
  String description;
  double subtotalprice;
  List<dynamic>? imagelist = [];
  Map<String, dynamic>? locationdetail;

  OrderModel({
    required this.locationdetail,
    required this.minnomultiple,
    required this.subtotalprice,
    this.imagelist,
    // required this.imagelist,
    this.id = '',
    required this.description,
    //  required this.image,
    required this.name,
    required this.category,
    required this.minno,
    required this.price,
    required this.size,
  });

  Map<String, dynamic> toJson() {
    return {
      'locationdetail': locationdetail,
      'minnomultiple': minnomultiple,
      'subtotalprice': subtotalprice,
      'id': id,
      'category': category,
      'name': name,
      'size': size,
      'price': price,
      'minno': minno,
      'description': description,
      'imagelist': imagelist,
    };
  }

  static OrderModel fromJson(Map<String, dynamic> json) {
    return OrderModel(
      locationdetail: json['locationdetail'],
      minnomultiple: json['minnomultiple'],
      subtotalprice: json['subtotalprice'],
      id: json['id'],
      description: json['description'],
      name: json['name'],
      category: json['category'],
      minno: json['minno'],
      price: json['price'],
      size: json['size'],
      imagelist: json['imagelist'],
    );
  }
}
