// To parse this JSON data, do
//
//     final shoeModel = shoeModelFromJson(jsonString);

import 'dart:convert';

List<ShoeModel> shoeModelFromJson(String str) => List<ShoeModel>.from(json.decode(str).map((x) => ShoeModel.fromJson(x)));

String shoeModelToJson(List<ShoeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ShoeModel {
    ShoeModel({
        this.id,
        this.title,
        this.price,
        this.description,
        this.category,
        this.images,
    });

    int? id;
    String? title;
    int? price;
    String? description;
    Category? category;
    List<String>? images;

    factory ShoeModel.fromJson(Map<String, dynamic> json) => ShoeModel(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        description: json["description"],
        category: Category.fromJson(json["category"]),
        images: List<String>.from(json["images"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category!.toJson(),
        "images": List<dynamic>.from(images!.map((x) => x)),
    };
}

class Category {
    Category({
        this.id,
        this.name,
        this.image,
        this.keyLoremSpace,
    });

    int? id;
    Name? name;
    String? image;
    String ? keyLoremSpace;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: nameValues.map![json["name"]],
        image: json["image"],
        keyLoremSpace: json["keyLoremSpace"] ?? null,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
        "image": image,
        "keyLoremSpace": keyLoremSpace ?? null,
    };
}

enum Name { ELECTRONICS, FURNITURE, CLOTHES, SHOES, OTHERS }

final nameValues = EnumValues({
    "Clothes": Name.CLOTHES,
    "Electronics": Name.ELECTRONICS,
    "Furniture": Name.FURNITURE,
    "Others": Name.OTHERS,
    "Shoes": Name.SHOES
});

class EnumValues<T> {
    Map<String, T>? map;
    Map<T, String> ?reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map!.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap!;
    }
}
