class ProductDetailsModelResponse {
  final bool status;
  final String message;
  final ProductDetailsData? data;
  ProductDetailsModelResponse({required this.status, required this.message, required this.data});

  factory ProductDetailsModelResponse.fromJson(Map<String,dynamic> json){
    return ProductDetailsModelResponse(
        status: json['status'] ?? false,
        message: json['message'] ?? "ث خطاءحد",
        data:  json['data'] != null ? ProductDetailsData.fromJson(json: json['data']) : null,

    );
  }

}

class ProductDetailsData {
  final int id;
  final String name;
  final String description;
  final num price;
  final num oldPrice;
  final int discount;
  final List images;
  final bool inFAv;
  final bool inCart;

  ProductDetailsData(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.oldPrice,
      required this.discount,
      required this.images,
      required this.inFAv,
      required this.inCart});

  factory ProductDetailsData.fromJson({required Map<String, dynamic> json}) {
    return ProductDetailsData(
        id: json['id'] ?? 0,
        name: json['name'] ?? "",
        description: json['description'] ?? "",
        price: json['price'] ?? 0,
        oldPrice: json['old_price'] ?? 0,
        discount: json['discount'] ?? 0,
        images: json['images'],
        inFAv: json['in_favorites'] ?? false,
        inCart: json['in_cart'] ?? false
    );
  }
}
