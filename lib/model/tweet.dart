
import 'package:json_annotation/json_annotation.dart';

part 'tweet.g.dart';

@JsonSerializable()
class Tweet {
  final int id;
  final String profile;
  final int created_date;
  final String author;
  final String message;

  Tweet(
      {required this.id, required this.profile, required this.created_date, required this.author, required this.message});

  factory Tweet.fromJson(Map<String, dynamic> json) => _$TweetFromJson(json);
  // Map<String, dynamic> toJson() => _$TweetToJson(this);

  // Tweet.fromJson(Map<String, dynamic> json)
  //     : id = json['id'],
  //       profile = json['profile'],
  //       created_date = json['created_date'],
  //       author = json['author'],
  //       message = json['message'];

  DateTime get createdDate =>
      DateTime.fromMillisecondsSinceEpoch(created_date * 1000);
}