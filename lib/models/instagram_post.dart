import 'package:flutter/material.dart';

class InstagramPost {
  final String profilePicture;
  final String username;
  final String picture;
  final int likeCount;
  final String text;

  InstagramPost(
      {@required this.profilePicture,
      @required this.username,
      @required this.picture,
      @required this.likeCount,
      @required this.text});
}
