import 'productData.dart';

class ProductByCategoryModel {
  String? msg;
  List<ProductData>? products;

  ProductByCategoryModel({this.msg, this.products});

  ProductByCategoryModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      products = <ProductData>[];
      json['data'].forEach((v) {
        products!.add(ProductData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (products != null) {
      data['data'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}









//This class contains special remark data model

// class ProductByRemarkModel {
//   String? msg;
//   List<ProductData>? products;
//
//   ProductByRemarkModel({this.msg, this.products});
//
//   ProductByRemarkModel.fromJson(Map<String, dynamic> json) {
//     msg = json['msg'];
//     if (json['data'] != null) {
//       products = <ProductData>[];
//       json['data'].forEach((v) {
//         products!.add(ProductData.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['msg'] = msg;
//     if (products != null) {
//       data['data'] = products!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class ProductData {
//   int? id;
//   String? title;
//   String? shortDes;
//   String? price;
//   int? discount;
//   String? discountPrice;
//   String? image;
//   int? stock;
//   double? star;
//   String? remark;
//   int? categoryId;
//   int? brandId;
//   String? createdAt;
//   String? updatedAt;
//   Null? brand;
//   Null? category;
//
//   ProductData(
//       {this.id,
//         this.title,
//         this.shortDes,
//         this.price,
//         this.discount,
//         this.discountPrice,
//         this.image,
//         this.stock,
//         this.star,
//         this.remark,
//         this.categoryId,
//         this.brandId,
//         this.createdAt,
//         this.updatedAt,
//         this.brand,
//         this.category});
//
//   ProductData.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     shortDes = json['short_des'];
//     price = json['price'];
//     discount = json['discount'];
//     discountPrice = json['discount_price'];
//     image = json['image'];
//     stock = json['stock'];
//     star = json['star'];
//     remark = json['remark'];
//     categoryId = json['category_id'];
//     brandId = json['brand_id'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     brand = json['brand'];
//     category = json['category'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['title'] = title;
//     data['short_des'] = shortDes;
//     data['price'] = price;
//     data['discount'] = discount;
//     data['discount_price'] = discountPrice;
//     data['image'] = image;
//     data['stock'] = stock;
//     data['star'] = star;
//     data['remark'] = remark;
//     data['category_id'] = categoryId;
//     data['brand_id'] = brandId;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     data['brand'] = brand;
//     data['category'] = category;
//     return data;
//   }
// }
