class Story {
  final String title;
  final String url;
  final int time;
  final int score;
  final String by;
  List<int> commentIds = <int>[];

  Story(
      {this.title, this.url, this.time, this.score, this.commentIds, this.by});

  factory Story.fromJSON(Map<String, dynamic> json) {
    return Story(
        title: json["title"],
        url: json["url"],
        score: json["score"],
        time: json["time"],
        by: json["by"],
        commentIds:
            json["kids"] == null ? <int>[] : json["kids"].cast<int>());
  }
}
