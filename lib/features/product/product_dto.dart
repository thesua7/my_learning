class ProductDTO {
  final int? id;
  final String? title;
  final String? description;
  final String? category;
  final double? price;
  final double? discountPercentage;
  final double? rating;
  final int? stock;
  final List<String>? tags;
  final String? brand;
  final String? sku;
  final int? weight;
  final Dimensions? dimensions;
  final String? warrantyInformation;
  final String? shippingInformation;
  final String? availabilityStatus;
  final List<Review>? reviews;
  final String? returnPolicy;
  final int? minimumOrderQuantity;
  final Meta? meta;
  final List<String>? images;
  final String? thumbnail;

  ProductDTO({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.tags,
    this.brand,
    this.sku,
    this.weight,
    this.dimensions,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    this.reviews,
    this.returnPolicy,
    this.minimumOrderQuantity,
    this.meta,
    this.images,
    this.thumbnail,
  });

  factory ProductDTO.fromJson(Map<String, dynamic> json) => ProductDTO(
    id: json['id'] as int?,
    title: json['title'] as String?,
    description: json['description'] as String?,
    category: json['category'] as String?,
    price: (json['price'] as num?)?.toDouble(),
    discountPercentage: (json['discountPercentage'] as num?)?.toDouble(),
    rating: (json['rating'] as num?)?.toDouble(),
    stock: json['stock'] as int?,
    tags: json['tags'] != null
        ? List<String>.from(json['tags'])
        : <String>[],
    brand: json['brand'] as String?,
    sku: json['sku'] as String?,
    weight: json['weight'] as int?,
    dimensions: json['dimensions'] != null
        ? Dimensions.fromJson(json['dimensions'])
        : null,
    warrantyInformation: json['warrantyInformation'] as String?,
    shippingInformation: json['shippingInformation'] as String?,
    availabilityStatus: json['availabilityStatus'] as String?,
    reviews: json['reviews'] != null
        ? List<Review>.from(
        (json['reviews'] as List).map((x) => Review.fromJson(x)))
        : <Review>[],
    returnPolicy: json['returnPolicy'] as String?,
    minimumOrderQuantity: json['minimumOrderQuantity'] as int?,
    meta: json['meta'] != null ? Meta.fromJson(json['meta']) : null,
    images: json['images'] != null
        ? List<String>.from(json['images'])
        : <String>[],
    thumbnail: json['thumbnail'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'category': category,
    'price': price,
    'discountPercentage': discountPercentage,
    'rating': rating,
    'stock': stock,
    'tags': tags ?? [],
    'brand': brand,
    'sku': sku,
    'weight': weight,
    'dimensions': dimensions?.toJson(),
    'warrantyInformation': warrantyInformation,
    'shippingInformation': shippingInformation,
    'availabilityStatus': availabilityStatus,
    'reviews': reviews?.map((x) => x.toJson()).toList() ?? [],
    'returnPolicy': returnPolicy,
    'minimumOrderQuantity': minimumOrderQuantity,
    'meta': meta?.toJson(),
    'images': images ?? [],
    'thumbnail': thumbnail,
  };
}

class Dimensions {
  final double? width;
  final double? height;
  final double? depth;

  Dimensions({this.width, this.height, this.depth});

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
    width: (json['width'] as num?)?.toDouble(),
    height: (json['height'] as num?)?.toDouble(),
    depth: (json['depth'] as num?)?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    'width': width,
    'height': height,
    'depth': depth,
  };
}

class Review {
  final int? rating;
  final String? comment;
  final DateTime? date;
  final String? reviewerName;
  final String? reviewerEmail;

  Review({
    this.rating,
    this.comment,
    this.date,
    this.reviewerName,
    this.reviewerEmail,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    rating: json['rating'] as int?,
    comment: json['comment'] as String?,
    date: json['date'] != null ? DateTime.tryParse(json['date']) : null,
    reviewerName: json['reviewerName'] as String?,
    reviewerEmail: json['reviewerEmail'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'rating': rating,
    'comment': comment,
    'date': date?.toIso8601String(),
    'reviewerName': reviewerName,
    'reviewerEmail': reviewerEmail,
  };
}

class Meta {
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? barcode;
  final String? qrCode;

  Meta({this.createdAt, this.updatedAt, this.barcode, this.qrCode});

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    createdAt: json['createdAt'] != null
        ? DateTime.tryParse(json['createdAt'])
        : null,
    updatedAt: json['updatedAt'] != null
        ? DateTime.tryParse(json['updatedAt'])
        : null,
    barcode: json['barcode'] as String?,
    qrCode: json['qrCode'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'createdAt': createdAt?.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
    'barcode': barcode,
    'qrCode': qrCode,
  };
}
