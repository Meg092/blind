import 'dart:typed_data';
import 'package:intl/intl.dart';

class BlindEntity {
  int id;
  DateTime createdTime;
  Uint8List image;
  String brandInformation;
  int star;
  int hiddenVersion;
  String mark;

  BlindEntity({
    required this.id,
    required this.createdTime,
    required this.image,
    required this.brandInformation,
    required this.star,
    required this.hiddenVersion,
    required this.mark,
  });

  factory BlindEntity.fromJson(Map<String, dynamic> json) {
    return BlindEntity(
      id: json['id'],
      createdTime: DateTime.parse(json['createdTime']),
      image: json['image'],
      brandInformation: json['brandInformation'],
      star: json['star'],
      hiddenVersion: json['hiddenVersion'],
      mark: json['mark'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdTime': createdTime.toIso8601String(),
      'image': image,
      'brandInformation': brandInformation,
      'star': star,
      'hiddenVersion': hiddenVersion,
      'mark': mark,
    };
  }

  String get createdTimeStr => DateFormat('MM/dd/yyyy').format(createdTime);
}