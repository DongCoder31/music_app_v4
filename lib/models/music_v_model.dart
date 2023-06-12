import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

class MusicVModel{
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'type')
  int? type;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'time')
  String? time;

  @JsonKey(name: 'author')
  String? author;

  @JsonKey(name: 'imageUrl')
  String? imageUrl;

  @JsonKey(name: 'pathMusic')
  String? pathMusic;

  @JsonKey(name: 'isLoadSound')
  bool? isLoadSound;

  @JsonKey(name: 'Key')
  Key? setSourceKey;


  MusicVModel(
  {this.id,
    this.type,
    this.title,
    this.description,
    this.time,
    this.author,
    this.imageUrl,
    this.pathMusic,
    this.isLoadSound,
    this.setSourceKey,});
}