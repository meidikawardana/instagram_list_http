import 'package:flutter/material.dart';

import 'models/instagram_post.dart';

class InstagramCard extends StatelessWidget {
  final InstagramPost _instagramPost;

  InstagramCard(this._instagramPost);

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: <Widget>[
        Row(
          // row #1
          children: [
            Container(
              child: Image.asset(
                _instagramPost.profilePicture,
                width: 30,
                fit: BoxFit.contain,
              ),
              margin: EdgeInsets.all(10),
            ),
            Expanded(
              child: Text(
                _instagramPost.username,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            )
          ],
        ),
        Row(
          //row #2
          children: <Widget>[
            Expanded(
              child: Container(
                child: // Image.asset(_instagramPost.picture)
                    Image.network(
                  _instagramPost.picture,
                  fit: BoxFit.contain,
                  // height: _screenWidth,
                ),
                color: Colors.black,
              ),
            )
          ],
        ),
        Row(
          //row #3
          children: <Widget>[
            IconButton(
              icon: Image.asset(
                'images/ic_love.png',
                fit: BoxFit.contain,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset(
                'images/ic_comment.png',
                fit: BoxFit.contain,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset(
                'images/ic_send.png',
                fit: BoxFit.contain,
              ),
              onPressed: () {},
            ),
            Expanded(
              child: IconButton(
                icon: Image.asset(
                  'images/ic_save.png',
                  fit: BoxFit.contain,
                ),
                onPressed: () {},
                padding: EdgeInsets.only(right: 10),
                alignment: Alignment.centerRight,
              ),
            ),
          ],
        ),
        Row(
          //row #4
          children: <Widget>[
            Container(
              child: Text(
                _instagramPost.likeCount.toString() + ' like',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              padding: EdgeInsets.only(left: 10),
            ),
          ],
        ),
        Row(
          //row #5
          children: <Widget>[
            Container(
              child: RichText(
                text: new TextSpan(
                  style: new TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: _instagramPost.username + ' ',
                        style: new TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: _instagramPost.text),
                  ],
                ),
              ),
              padding: EdgeInsets.only(left: 10, top: 5, bottom: 10),
              width: MediaQuery.of(context).size.width * 0.8,
            )
          ],
        ),
      ],
    );
  }
}
