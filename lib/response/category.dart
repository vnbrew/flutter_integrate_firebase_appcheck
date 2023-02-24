import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Category extends Equatable {
  const Category({
    required this.id,
    required this.name,
  });

  factory Category.fromJson(Map<String, dynamic> parsedJson) {
    return Category(
      id: parsedJson['id'] as String,
      name: parsedJson['name'] as String,
    );
  }

  static Category fromSnapshot(DocumentSnapshot snap) {
    final category = Category(
      id: snap['id'] as String,
      name: snap['name'] as String,
    );
    return category;
  }

  final String id;
  final String? name;

  Map<String, dynamic> toJson() => {
        '"id"': '"$id"',
        '"name"': '"$name"',
      };

  @override
  List<Object?> get props => [id, name];
}
