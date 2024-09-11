// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tweet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tweet _$TweetFromJson(Map<String, dynamic> json) => Tweet(
      id: (json['id'] as num).toInt(),
      profile: json['profile'] as String,
      created_date: (json['created_date'] as num).toInt(),
      author: json['author'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$TweetToJson(Tweet instance) => <String, dynamic>{
      'id': instance.id,
      'profile': instance.profile,
      'created_date': instance.created_date,
      'author': instance.author,
      'message': instance.message,
    };
