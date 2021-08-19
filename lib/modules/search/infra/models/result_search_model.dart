import 'dart:convert';

import 'package:github_search_dart_clean/modules/search/domain/entities/result_search.dart';

class ResultSearchModel extends ResultSearch {
  final String title;
  final String content;
  final String img;

  ResultSearchModel({this.title, this.content, this.img});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'img': img
    };
  }

  static ResultSearchModel fromMap(Map<String, dynamic> map) {
    if(map == null) 
      return null;

    return ResultSearchModel(
      title: map['title'],
      content: map['content'],
      img: map['img']
    );
  }

  String toJson() => json.encode(toMap());

  static ResultSearchModel fromJson(String source) => fromMap(json.decode(source));
}