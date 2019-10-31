import 'package:flutter/material.dart';
import 'package:like_app/instagram_card.dart';

import 'models/instagram_post.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(AplikasiLikeInstagram());

Future<List<InstagramPost>> getPosts() async {
  final response =
      await http.get('https://instagram-list.firebaseio.com/posts.json');

  if (response.statusCode == 200) {
    final List<InstagramPost> postList = [];
    final Map<String, dynamic> postsJson = json.decode(response.body);

    postsJson.forEach((String id, dynamic data) {
      final InstagramPost product = InstagramPost(
        profilePicture: 'images/insta_profpic.jpg',
        username: 'meidika_wardana',
        picture: data['pic_url'],
        likeCount: int.parse(data['like_count']),
        text: data['text_'],
      );
      postList.add(product);
    });

    return postList;
  } else {
    throw Exception('Gagal menampilkan postingan');
  }
}

class InstagramCards extends StatefulWidget {
  @override
  _InstagramCardsState createState() => _InstagramCardsState();
}

class _InstagramCardsState extends State<InstagramCards> {
  Future<List<InstagramPost>> posts;

  @override
  void initState() {
    super.initState();
    posts = getPosts();
  }

  @override
  Widget build(BuildContext context) {
    // InstagramPost instagramPost = new InstagramPost(
    //     profilePicture: 'images/insta_profpic.jpg',
    //     username: 'meidika_wardana',
    //     picture: 'https://pintar-android.com/wp_res/insta_pic2.png',
    //     likeCount: 3,
    //     text: 'Lagu romantis dari Jason Mraz :D');

    // return ListView.builder(
    //   itemBuilder: (BuildContext context, int index) {
    //     return InstagramCard(instagramPost);
    //   },
    //   itemCount: 3,
    // );

    return FutureBuilder<List<InstagramPost>>(
      future: posts,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return InstagramCard(snapshot.data[index]);
            },
            itemCount: snapshot.data.length,
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              "${snapshot.error}",
              textAlign: TextAlign.center,
            ),
          );
        }

        return CircularProgressIndicator();
      },
    );    
  }
}

class AplikasiLikeInstagram extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        body: InstagramCards(),
      ),
    );
  }
}
