// To parse this JSON data, do
//
//     final photosModel = photosModelFromMap(jsonString);

import 'dart:convert';

PhotosModel photosModelFromMap(String str) =>
    PhotosModel.fromMap(json.decode(str));

String photosModelToMap(PhotosModel data) => json.encode(data.toMap());

class PhotosModel {
  PhotosModel({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  factory PhotosModel.fromMap(Map<String, dynamic> json) => PhotosModel(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );

  Map<String, dynamic> toMap() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
      };
}
