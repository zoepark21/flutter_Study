import 'package:http/http.dart';

class ExamModel {
  String lastBuildDate;
  int total;
  int start;
  int display;
  List<ExamItem>? items;

  ExamModel({
    required this.lastBuildDate,
    required this.total,
    required this.start,
    required this.display,
  });

  ExamModel.fromJson(Map json)
      : lastBuildDate = json['lastBuildDate'] ?? "",
        total = json['total'],
        start = json['start'],
        display = json['display'] {
    var tap = json['items'];
    items = tap?.map<ExamItem>((e) => ExamItem.fromJson(e)).toList();
  }
}

class ExamItem {
  String title;
  String link;
  String image;
  String subtitle;
  String pubDate;
  String director;
  String actor;
  String userRating;

  ExamItem({
    required this.title,
    required this.link,
    required this.image,
    required this.subtitle,
    required this.pubDate,
    required this.director,
    required this.actor,
    required this.userRating,
  });

  ExamItem.fromJson(Map json)
      : title = json['title'],
        link = json['link'],
        image = json['image'],
        subtitle = json['subtitle'],
        pubDate = json['pubDate'],
        director = json['director'],
        actor = json['actor'],
        userRating = json['userRating'];
}
