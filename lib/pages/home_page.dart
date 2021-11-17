import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Home extends StatefulWidget {
  final String id = "home_page";

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isDark = false;
  List<String> circle_image = [
    'assets/images/user_1.jpeg',
    'assets/images/user_2.jpeg',
    'assets/images/user_3.jpeg',
    'assets/images/user_4.jpeg',
    'assets/images/user_5.jpeg',
  ];
  List<String> back_image = [
    'assets/images/feed_1.jpeg',
    'assets/images/feed_2.jpeg',
    'assets/images/feed_3.jpeg',
    'assets/images/feed_4.jpeg',
    'assets/images/feed_5.jpeg',
  ];
  List<String> usernames = [
    'User One',
    'User Two',
    'User Three',
    'User Four',
    'User Five',
    'User Six',
  ];

  List<Widget> storeWidgets = [];

  List<Widget> _firstrunner() {
    if (storeWidgets.isEmpty) {
      for (int i = 0; i < circle_image.length; i++) {
        storeWidgets.add(
            _shortUserBuider(back_image[i], circle_image[i], usernames[i]));
      }
    }
    return storeWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: AppBar(
        backgroundColor: isDark ? Colors.black : Colors.white,
        elevation: 0.0,
        title: Text(
          "facebook",
          style: TextStyle(color: Colors.blueAccent, fontSize: 28.0),
        ),
        actions: [
          Row(
            children: [
              Icon(Icons.search, color: isDark ? Colors.white : Colors.black),
              SizedBox(width: 15.0),
              Icon(Icons.camera_alt,
                  color: isDark ? Colors.white : Colors.black),
              SizedBox(width: 15.0),
            ],
          )
        ],
      ),
      body: Container(
        child: ListView(
          children: [
            // @user image, search panel and text button panel
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              height: 100.0,
              width: double.infinity,
              color: isDark ? Colors.black : Colors.white,
              child: Column(
                children: [
                  Container(
                    height: 40.0,
                    child: Row(
                      children: [
                        Container(
                          height: 45.0,
                          width: 45.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/user_1.jpeg"))),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 10.0),
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                border: Border.all(
                                    color: Colors.grey[500]!, width: 1.0)),
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: "What's on your mind?",
                                  hintStyle: TextStyle(
                                      color: Colors.grey[500],
                                      fontSize: 16.0,
                                      letterSpacing: 1.0),
                                  border: InputBorder.none),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 60.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _textbuttonBuilder(
                            Icons.video_call, "Live", Colors.red),
                        _verticalDividerBuilder(1.5, Colors.grey),
                        _textbuttonBuilder(Icons.photo, "Photo", Colors.green),
                        _verticalDividerBuilder(1.5, Colors.grey),
                        _textbuttonBuilder(
                            Icons.location_on, "Check in", Colors.red),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10.0),

            // short view horizontal panel
            Container(
              height: MediaQuery.of(context).size.height / 4.5,
              width: double.infinity,
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              color: isDark ? Colors.black : Colors.white,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: _firstrunner(),
              ),
            ),

            makeFeeds(circle_image[0] ,usernames[0], "1 hr ago",
                "All the Lorem Ipsum generators on the Internet tend to repeat predefined.",
                back_image[0], "3.1k", "4000", back_image[4]),

            makeFeeds(circle_image[1] ,usernames[1], "5 min ago",
                "All the Lorem Ipsum generators on the Internet tend to repeat predefined.",
                back_image[1], "1.1k", "1523", back_image[2]),

            makeFeeds(circle_image[2] ,usernames[2], "2 day ago",
                "All the Lorem Ipsum generators on the Internet tend to repeat predefined.",
                back_image[2], "5k", "1001",  back_image[0]),

            makeFeeds(circle_image[3] ,usernames[3], "1 week ago",
                "All the Lorem Ipsum generators on the Internet tend to repeat predefined.",
                back_image[3], "1.9M", "5200"),
          ],
        ),
      ),
    );
  }

  // @text button builder
  Widget _textbuttonBuilder(icon, text, color) {
    return Row(
      children: [
        Icon(
          icon,
          color: color,
        ),
        SizedBox(width: 5.0),
        Text(
          text,
          style: TextStyle(color: Colors.grey[600]),
        )
      ],
    );
  }

  // @divider builder
  Widget _verticalDividerBuilder(w, color) {
    return Container(
      width: w,
      color: color,
      margin: EdgeInsets.only(top: 18.0, bottom: 18.0),
    );
  }

  // @short store panels buider
  Widget _shortUserBuider(back_image, circle_image, text) {
    return Container(
      width: MediaQuery.of(context).size.width / 3.8,
      height: double.infinity,
      margin: EdgeInsets.only(left: 10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          image: DecorationImage(image: AssetImage(back_image), fit: BoxFit.cover),
          color: Colors.red),
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(.9),
                  Colors.black.withOpacity(.7),
                  Colors.black.withOpacity(.5),
                  Colors.black.withOpacity(.3),
                  Colors.black.withOpacity(.0),
                ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40.0,
              width: 40.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(circle_image), fit: BoxFit.cover),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.blue, width: 1.5)),
            ),
            Text(
              text,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }

  // @makefeed panel
  Widget makeFeeds(userImage, userName, userTime, feedText, feedImage, viewSize,commentSize, [feedImage2]) {
    return Column(
      children: [
        SizedBox(height: 10.0),
        Container(
          width: double.infinity,
          color: isDark ? Colors.black : Colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 40.0,
                          width: 40.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(userImage), fit: BoxFit.cover)),
                        ),
                        SizedBox(width: 10.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userName,
                              style: TextStyle(
                                  color:
                                      isDark ? Colors.grey[400] : Colors.grey[900],
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 3.0),
                            Text(userTime,
                                style: TextStyle(
                                    color: Colors.grey[800], fontSize: 14.0))
                          ],
                        )
                      ],
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.more_horiz, color: Colors.grey))
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Text(feedText,
                      style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.0,
                          height: 1.5),
                      maxLines: 2)),
              SizedBox(height: 15.0),

              feedImage2 == null ? Image(
                height: MediaQuery.of(context).size.height / 3.5,
                width: double.infinity,
                image: AssetImage(feedImage),
                fit: BoxFit.cover,
              )
                  :
                  Container(
                    height: MediaQuery.of(context).size.height / 3.5,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Expanded(
                          child: Image(
                            height: MediaQuery.of(context).size.height / 3.5,
                            width: double.infinity,
                            image: AssetImage(feedImage),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: Image(
                            height: MediaQuery.of(context).size.height / 3.5,
                            width: double.infinity,
                            image: AssetImage(feedImage2),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),

              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 10.0),
                      Container(
                          height: 25.0,
                          width: 25.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                            border: Border.all(color: Colors.grey, width: 1.6),
                          ),
                          child: Center(
                              child: Icon(
                            Icons.thumb_up,
                            color: Colors.white,
                            size: 14.0,
                          ))),
                      Transform.translate(
                        offset: Offset(-5.0, 0.0),
                        child: Container(
                            height: 25.0,
                            width: 25.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                              border: Border.all(color: Colors.grey, width: 1.6),
                            ),
                            child: Center(
                                child: Icon(
                              Icons.favorite,
                              color: Colors.white,
                              size: 14.0,
                            ))),
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        viewSize,
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Text(
                      "${commentSize} Comments",
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _textbuttonBuilder(Icons.thumb_up, "Like", Colors.blue),
                    _textbuttonBuilder(Icons.message, "Comment", Colors.grey),
                    _textbuttonBuilder(Icons.share, "Share", Colors.grey),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
