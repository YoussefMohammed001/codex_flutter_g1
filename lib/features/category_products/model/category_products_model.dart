class CategoryProductsModel {
  final bool status;
  final String? message;
  final ProductListData data;

  CategoryProductsModel({
    required this.status,
    this.message,
    required this.data,
  });

  factory CategoryProductsModel.fromJson(Map<String, dynamic> json) {
    return CategoryProductsModel(
      status: json['status'],
      message: json['message'],
      data: ProductListData.fromJson(json['data']),
    );
  }
}

class ProductListData {
  final int currentPage;
  final List<ProductData> data;

  ProductListData({
    required this.currentPage,
    required this.data,
  });

  factory ProductListData.fromJson(Map<String, dynamic> json) {
    return ProductListData(
      currentPage: json['current_page'],
      data: List<ProductData>.from(
        (json['data'] as List).map((e) => ProductData.fromJson(e)),
      ),
    );
  }
}

class ProductData {
  final int id;
  final num price;
  final num oldPrice;
  final int discount;
  final String image;
  final String name;
  final String description;
  final List<String> images;
  final bool inFavorites;
  final bool inCart;

  ProductData({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.images,
    required this.inFavorites,
    required this.inCart,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      id: json['id'],
      price: json['price'],
      oldPrice: json['old_price'],
      discount: json['discount'],
      image: json['image'],
      name: json['name'],
      description: json['description'],
      images: List<String>.from(json['images']),
      inFavorites: json['in_favorites'],
      inCart: json['in_cart'],
    );
  }
}