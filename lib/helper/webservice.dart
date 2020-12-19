import 'dart:convert';

import 'package:hacker_stories/api/newsapi.dart';
import 'package:hacker_stories/helper/urlHelper.dart';
import 'package:http/http.dart' as http;


class Webservice {
  Future<http.Response> getStory(int storyId) {
    return http.get(UrlHelper.urlForStory(storyId));
  }

  Future<List<http.Response>> getCommentsByStory(Story story) async {
    return Future.wait(story.commentIds.map((commentId) {
      return http.get(UrlHelper.urlForCommentById(commentId));
    }));
  }

  Future<List<http.Response>> getTopStories() async {
    final response = await http.get(UrlHelper.urlForTopStories());
    if (response.statusCode == 200) {
      Iterable storyIds = jsonDecode(response.body);
      return Future.wait(storyIds.take(10).map((storyId) {
        return getStory(storyId);
      }));
    } else {
      throw Exception("Unable to fetch data!");
    }
  }
}
