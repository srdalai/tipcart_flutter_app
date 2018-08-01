import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductCategory {
  final String name, slug, description, image;
  final int id, parent, count;

  ProductCategory({
    this.name, this.slug, this.description, this.image,
    this.id, this.parent, this.count
  });

  factory ProductCategory.fromJson(Map<String, dynamic> json) {
    return new ProductCategory(
      name: json['name'],
      slug: json['slug'],
      description: json['description'],
      image: json['image'],
      id: json['id'],
      parent: json['parent'],
      count: json['count']
    );
  }
}

//Main category response
class RootCategories {
  final List<dynamic> mainCats;

  RootCategories({this.mainCats});

  factory RootCategories.fromJson(Map<String, dynamic> json) {
    return new RootCategories(mainCats: json["product_categories"]);
  }
}