import 'package:flutter/material.dart';
// import 'package:icall/Model/login_user_response_model.dart';
import 'package:icall/Model/user_all_posts_model.dart';
import 'package:icall/services/api_service.dart';
import 'dart:convert';
import 'package:video_player/video_player.dart';
import 'dart:async';

// import 'package:icall/services/shared_service.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ! Declaration variable
  var index = 0;
  var color = Colors.blue;
  late TabController myControler;
  var like = Colors.black;
  var like2 = Colors.black;
  var likeComent = Colors.black;
  var likenumber = 45;
  var likenumber2 = 117;
  var likeGroups = 22;
  late var size, width, height;
  String UserPosts = '';
  // late LoginUserResponseModel loginDetails;
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  Future<List<UserAllPostsModel>> convertToJson() async {
    List myMap = jsonDecode(UserPosts);
    List<UserAllPostsModel> myPosts = [];
    // var Details = await SharedService.loginDetails();
    // setState(() {
    //   loginDetails = Details!;
    // });
    myMap.forEach((dynamic post) {
      UserAllPostsModel myPost = UserAllPostsModel.fromJson(post);
      myPosts.add(myPost);
    });
    return myPosts.reversed.toList();
    // return myPosts;
  }

  Future readJsonFile() async {
    APIService.PostDetails().then((response) {
      setState(() {
        UserPosts = response;
      });
      if (response != "") {
        // ScaffoldMessenger.of(context).showSnackBar(
        //   const SnackBar(content: Text('Success!!')),
        // );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error While Fetching Posts!!')),
        );
      }
    });
  }

  @override
  void initState() {
    readJsonFile();
    super.initState();
    _controller = VideoPlayerController.network(
      'https://storage.googleapis.com/crimeposteddata/trailer_hd.mp4',
    );

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(true);
    _controller.play();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Container(
      child: userProfile(),
    );
    // Container(
    //   color: Colors.white,
    //   child: SingleChildScrollView(
    //     child: Column(
    //       children: [
    //         Container(
    //           color: Colors.white,
    //           width: width,
    //           margin: EdgeInsets.only(top: 5),
    //           child: Column(
    //             children: [
    //               ListTile(
    //                 isThreeLine: false,
    //                 title: Text("PC Gamer DZ"),
    //                 subtitle: Text("Abd Bekoula · 3d · Groups "),
    //                 // trailing: Icon(Icons.more_horiz),
    //                 leading: Container(
    //                   width: 50,
    //                   decoration: BoxDecoration(
    //                       borderRadius: BorderRadius.circular(20),
    //                       image: DecorationImage(
    //                           image: AssetImage("assets/umer.jpeg"),
    //                           fit: BoxFit.cover)),
    //                   child: null,
    //                 ),
    //               ),
    //               Container(
    //                 width: double.infinity,
    //                 //color: Colors.red,
    //                 child: Center(
    //                   child: Text(
    //                     "GTX 1660s khadma mampa 6 mois b garonti prix 11 nbi3 wela nbedel m3a RTX 3060 wela 2080ti balaka khtouna ! 😁😁 ",
    //                     style: TextStyle(fontSize: 16),
    //                     textAlign: TextAlign.start,
    //                   ),
    //                 ),
    //               ),
    //               Container(
    //                 width: width,
    //                 height: 1,
    //                 margin: EdgeInsets.only(top: 10),
    //                 // color: Colors.black12,
    //               ),
    //               Container(
    //                   child: Image.network(
    //                       'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg')),
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }

  Widget userProfile() {
    return FutureBuilder(
        future: convertToJson(),
        builder: (BuildContext context,
            AsyncSnapshot<List<UserAllPostsModel>> posts) {
          return ListView.builder(
              itemCount: (posts.data == null) ? 0 : posts.data!.length,
              itemBuilder: (BuildContext context, int position) {
                return Container(
                  child: Column(
                    children: [
                      ListTile(
                        leading: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.black,

                            // image: DecorationImage(
                            //     image: AssetImage("assets/umer.jpeg"),
                            //     fit: BoxFit.cover)
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(top: 15, left: 18),
                            child: Text(
                              posts.data![position].userName.toString()[0],
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                        subtitle: Container(
                          child: Text(
                            "Category: " +
                                posts.data![position].category.toString() +
                                "   Location: " +
                                posts.data![position].cityName.toString(),
                            style: TextStyle(color: Colors.green, fontSize: 11),
                          ),
                        ),
                        title: Text("\n" +
                            posts.data![position].userName.toString() +
                            " - " +
                            DateTime.parse(
                                    posts.data![position].timestamp.toString())
                                .year
                                .toString() +
                            "-" +
                            DateTime.parse(
                                    posts.data![position].timestamp.toString())
                                .month
                                .toString() +
                            "-" +
                            DateTime.parse(
                                    posts.data![position].timestamp.toString())
                                .day
                                .toString() +
                            "  " +
                            DateTime.parse(
                                    posts.data![position].timestamp.toString())
                                .hour
                                .toString() +
                            ":" +
                            DateTime.parse(
                                    posts.data![position].timestamp.toString())
                                .minute
                                .toString() +
                            ":" +
                            DateTime.parse(
                                    posts.data![position].timestamp.toString())
                                .second
                                .toString()),

                        // subtitle: Text(posts.data![position].description.toString()),
                      ),
                      Container(
                        margin: EdgeInsets.all(5),
                        width: double.infinity,
                        //color: Colors.red,
                        child: Text(
                          posts.data![position].description.toString(),
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      posts.data![position].fileType.toString() == "image"
                          ? Container(
                              child: Image.network(posts.data![position].file!))
                          : Container(
                              child: FutureBuilder(
                                future: _initializeVideoPlayerFuture,
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    // If the VideoPlayerController has finished initialization, use
                                    // the data it provides to limit the aspect ratio of the video.
                                    return AspectRatio(
                                      aspectRatio:
                                          _controller.value.aspectRatio,
                                      // Use the VideoPlayer widget to display the video.
                                      child: VideoPlayer(_controller),
                                    );
                                  } else {
                                    // If the VideoPlayerController is still initializing, show a
                                    // loading spinner.
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                },
                              ),

                              // Image.network(
                              //     'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg')
                            ),
                      Container(
                        width: width,
                        height: 1,
                        margin: EdgeInsets.only(top: 10),
                        color: Colors.black12,
                      ),
                    ],
                  ),
                );
              });
        });
  }
}
