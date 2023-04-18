class Product {
  final int id;
  final String category;
  final String title;
  final String description;
  final int price;
  final String texture;
  final String wash;
  final String place;
  final String note;
  final String story;
  final String mainImage;
  final List<String> images;
  final List<ProductVariant> variants;
  final List<MyColor> colors;
  final List<String> sizes;

  Product({
    required this.id,
    required this.category,
    required this.title,
    required this.description,
    required this.price,
    required this.texture,
    required this.wash,
    required this.place,
    required this.note,
    required this.story,
    required this.mainImage,
    required this.images,
    required this.variants,
    required this.colors,
    required this.sizes,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      category: json['category'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      texture: json['texture'],
      wash: json['wash'],
      place: json['place'],
      note: json['note'],
      story: json['story'],
      mainImage: json['main_image'],
      images: List<String>.from(json['images']),
      variants: List<ProductVariant>.from(
          json['variants'].map((variant) => ProductVariant.fromJson(variant))),
      colors: List<MyColor>.from(
          json['colors'].map((color) => MyColor.fromJson(color))),
      sizes: List<String>.from(json['sizes']),
    );
  }
}

class MyColor {
  final String code;
  final String name;

  MyColor({required this.code, required this.name});

  factory MyColor.fromJson(Map<String, dynamic> json) {
    return MyColor(
      code: json['code'],
      name: json['name'],
    );
  }
}

class ProductVariant {
  final String colorCode;
  final String size;
  final int stock;

  ProductVariant(
      {required this.colorCode, required this.size, required this.stock});

  factory ProductVariant.fromJson(Map<String, dynamic> json) {
    return ProductVariant(
      colorCode: json['color_code'],
      size: json['size'],
      stock: json['stock'],
    );
  }
}
