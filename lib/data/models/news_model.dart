// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
  String status;
  int totalResults;
  List<Result> results;
  String nextPage;

  NewsModel({
    required this.status,
    required this.totalResults,
    required this.results,
    required this.nextPage,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        status: json["status"],
        totalResults: json["totalResults"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        nextPage: json["nextPage"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "nextPage": nextPage,
      };
}

class Result {
  String title;
  String link;
  // List<String> keywords;
  List<String> creator;
  dynamic videoUrl;
  String description;
  String content;
  String pubDate;
  dynamic imageUrl;
  String sourceId;
  // List<Category> category;
  List<String> country;
  Language language;

  Result({
    required this.title,
    required this.link,
    // required this.keywords,
    required this.creator,
    required this.videoUrl,
    required this.description,
    required this.content,
    required this.pubDate,
    required this.imageUrl,
    required this.sourceId,
    // required this.category,
    required this.country,
    required this.language,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        title: json["title"],
        link: json["link"],
        // keywords: List<String>.from(json["keywords"].map((x) => x)),
        // List<String>.from(json["creator"].map((x) => x)),
        creator: json["creator"] != null
            ? List<String>.from(json["creator"].map((x) => x))
            : ["SIN DATA"],
        videoUrl: json["video_url"],
        description: json["description"] ?? "Sin Descripcion",
        content: json["content"] ?? 'Sin contenido',
        // pubDate: DateTime.parse(json["pubDate"]),
        pubDate:
            DateFormat.yMMMMEEEEd().format(DateTime.parse(json['pubDate'])),
        imageUrl: json["image_url"],
        sourceId: json["source_id"],
        // category: List<Category>.from(
        //     json["category"].map((x) => categoryValues.map[x]!)),
        // List<Country>.from(
        //     json["country"].map((x) => countryValues.map[x]!)),
        country: json["country"] != null
            ? List<String>.from(json["country"].map((x) => x))
            : ["SIN DATA"],
        language: languageValues.map[json["language"]]!,
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "link": link,
        // "keywords": List<dynamic>.from(keywords.map((x) => x)),
        "creator": List<dynamic>.from(creator.map((x) => x)),
        "video_url": videoUrl,
        "description": description,
        "content": content,
        "pubDate": pubDate,
        "image_url": imageUrl,
        "source_id": sourceIdValues.reverse[sourceId],

        "country":
            List<dynamic>.from(country.map((x) => countryValues.reverse[x])),
        "language": languageValues.reverse[language],
      };
}

enum Category { TOP }

final categoryValues = EnumValues({"top": Category.TOP});

enum Country { PAKISTAN, FIJI }

final countryValues =
    EnumValues({"Fiji": Country.FIJI, "pakistan": Country.PAKISTAN});

enum Language { ENGLISH }

final languageValues = EnumValues({"english": Language.ENGLISH});

enum SourceId { PAKOBSERVER, FIJITIMES }

final sourceIdValues = EnumValues(
    {"fijitimes": SourceId.FIJITIMES, "pakobserver": SourceId.PAKOBSERVER});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
