import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
              Container(
                height: 120,
                padding: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 10),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey[200],
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search, color: Colors.grey,),
                            hintText: 'Search',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Icon(Icons.camera_alt, color: Colors.grey[800],size: 30,)
                  ],
                ),
              ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: EdgeInsets.all(23),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text("Stories", style: new TextStyle(fontSize: 25.0,color: Colors.grey[900],fontWeight: FontWeight.bold),),
                          Text("See Archive")
                        ],
                      ),
                      SizedBox(width: 30,),
                      Container(
                        height: 280,
                        padding: EdgeInsets.only(top: 20),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                              makeStory(storyimage: 'assets/images/coverimage2.jpg',userImage: 'assets/images/user1.jpg',userName: 'Joan Louji'),
                              makeStory(storyimage: 'assets/images/coverimage3.jpg',userImage: 'assets/images/user2.jpg',userName: 'Victor'),
                              makeStory(storyimage: 'assets/images/coverimage4.jpg',userImage: 'assets/images/user3.jpg',userName: 'Jonh'),
                              makeStory(storyimage: 'assets/images/coverimage2.jpg',userImage: 'assets/images/user4.jpg',userName: 'Veronic'),
                          ],
                        ),
                      ),
                      SizedBox(height: 30,),
                      makeFeed(userName: 'Joan Louji',userImage: 'assets/images/user1.jpg', feedTime: '1 hrs ago',feedText: 'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...',feedImage:'assets/images/coverimage2.jpg'),
                      new Divider(
                        color: Colors.grey[380],
                      ),
                      makeFeed(userName: 'Victor',userImage: 'assets/images/user2.jpg', feedTime: '4 hrs ago',feedText: 'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...',feedImage:'assets/images/coverimage3.jpg'),
                      new Divider(
                        color: Colors.grey[380],
                      ),
                      makeFeed(userName: 'John',userImage: 'assets/images/user3.jpg', feedTime: '2 days ago',feedText: 'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...',feedImage:'assets/images/coverimage4.jpg'),
                      new Divider(
                        color: Colors.grey[380],
                      ),
                      makeFeed(userName: 'Veronica',userImage: 'assets/images/user4.jpg', feedTime: '1 week ago',feedText: 'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...',feedImage:'assets/images/coverimage2.jpg'),
                      new Divider(
                        color: Colors.grey[380],
                      ),
                      makeFeed(userName: 'Joan Louji',userImage: 'assets/images/user1.jpg', feedTime: '7 days ago',feedText: 'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...',feedImage:'assets/images/coverimage3.jpg'),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
    );
  }

  Widget makeStory({storyimage,userImage,userName}){
    print("helllo");
      return(
        AspectRatio(
          aspectRatio: 1.4/2,
          child: Container(
            margin: EdgeInsets.only(right: 10,),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(image: AssetImage(storyimage),fit: BoxFit.cover),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  colors: [
                    Colors.black.withOpacity(.9),
                    Colors.black.withOpacity(.1)
                  ]
                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(15),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white,width: 2),
                      image: DecorationImage(image: AssetImage(userImage),fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15,  top: 21),
                    height: 40,
                    child: Text(
                      userName, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      );
  }

  Widget makeFeed({userName,userImage,feedTime,feedText,feedImage}){
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage(userImage),fit: BoxFit.cover),
                ),
              ),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(userName, style: TextStyle(color: Colors.grey[800], fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 1),),
                  Text(feedTime, style: TextStyle(color: Colors.grey[500], fontSize: 15, fontWeight: FontWeight.normal),),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 200),
                child: Column(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.more_horiz),
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 20,),
          Text(feedText, style: TextStyle(color: Colors.grey[800], height: 1.5, fontSize: 16 , letterSpacing: .7),),
          SizedBox(height: 20,),
          Container(
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(image: AssetImage(feedImage),fit: BoxFit.cover)
            ),
          ),
          SizedBox(height: 3,),
          Row(
            children: <Widget>[
              Column(
                  children: <Widget>[
                    likeButton()
                  ],
              ),
              Column(
                children: <Widget>[
                  heartButton()
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Column(
                      children: <Widget>[
                        Text('1.3k', style: TextStyle(color: Colors.grey[900]),)
                      ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 230),
                child: Column(
                  children: <Widget>[
                    Text('30 Comments', style: TextStyle(color: Colors.grey[900]),)
                  ],
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              makeLike(),
              makeComment(),
              makeSharet(),
            ],
          )
        ],
      ),
    );
  }

  Widget makeLike(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      margin: EdgeInsets.only(left: 7,top: 13),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[200]),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.thumb_up, color: Colors.blueAccent,),
            SizedBox(width: 10,),
            Text('Likes')
          ],
        ),
      ),
    );
  }

  Widget makeComment(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      margin: EdgeInsets.only(left: 7,top: 13),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[200]),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.comment, color: Colors.grey,),
            SizedBox(width: 10,),
            Text('Comment')
          ],
        ),
      ),
    );
  }

  Widget makeSharet(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      margin: EdgeInsets.only(left: 7,top: 13),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[200]),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.share, color: Colors.grey,),
            SizedBox(width: 10,),
            Text('Share')
          ],
        ),
      ),
    );
  }

  Widget likeButton(){
    return Column(
      children: <Widget>[
        Container(
          height: 23,
          width: 23,
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.thumb_up, color: Colors.white,size: 13,)
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget heartButton(){
    return Column(
      children: <Widget>[
        Container(
          height: 23,
          width: 23,
          margin: EdgeInsets.only(left: 5),
          decoration: BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.favorite, color: Colors.white,size: 13,)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
