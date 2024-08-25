class Product {
  final String id;
  final String name;
  final String description;
  final String imageId;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.imageId,
  });

  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'name': name,
  //     'description': description,
  //     'image': imageId,
  //   };
  // }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      description: json['description'] ?? "",
      imageId: json['reference_image_id'] ?? "",
    );
  }
}