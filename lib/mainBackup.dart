// import 'package:flutter/material.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
// import 'package:instadownload/api/instaDownload.dart'; 
// import 'package:permission_handler/permission_handler.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await FlutterDownloader.initialize(debug: true);
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage>
//     with SingleTickerProviderStateMixin {
//   InstaDownload flutterInsta = InstaDownload();
//   TextEditingController usernameController = TextEditingController();
//   TextEditingController reelController = TextEditingController();
//   TabController? tabController;

//   String? username, followers = " ", following, bio, website, profileimage;
//   bool pressed = false;
//   bool downloading = false;

//   @override
//   void initState() {
//     super.initState();
//     tabController = TabController(vsync: this, initialIndex: 1, length: 2);
//     initializeDownloader();
//     downloadReels();
//   }

//   void initializeDownloader() async {
//     WidgetsFlutterBinding.ensureInitialized();
//     await FlutterDownloader.initialize(
//         debug: true // optional: set false to disable printing logs to console
//         );
//   }

//   void downloadReels() async {
//     var s = await flutterInsta
//         .downloadInsta("https://www.instagram.com/p/CDlGkdZgB2y");
//     print(s);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Package example app'),
//         bottom: TabBar(
//           controller: tabController,
//           tabs: [
//             Tab(
//               text: "Home",
//             ),
//             Tab(
//               text: "Reels",
//             )
//           ],
//         ),
//       ),
//       body: TabBarView(
//         controller: tabController,
//         children: [
//           homePage(), //  // home screen for Getting profile details
//           reelPage() // reel download Screen
//         ],
//       ),
//     );
//   }

// //get data from api
//   Future printDetails(String username) async {
//     await flutterInsta.getProfileDetails(username);
//     setState(() {
//       this.username = flutterInsta.username; //username
//       followers = flutterInsta.followers; //number of followers
//       following = flutterInsta.following; // number of following
//       website = flutterInsta.website; // bio link
//       bio = flutterInsta.bio; // Bio
//       profileimage = flutterInsta.imgurl; // Profile picture URL
//       print(followers);
//     });
//   }

//   Widget homePage() {
//     return SingleChildScrollView(
//       child: Center(
//         child: Column(
//           children: [
//             TextField(
//               decoration: InputDecoration(contentPadding: EdgeInsets.all(10)),
//               controller: usernameController,
//             ),
//             ElevatedButton(
//               child: Text("Print Details"),
//               onPressed: () async {
//                 setState(() {
//                   pressed = true;
//                 });

//                 printDetails(usernameController.text); //get Data
//               },
//             ),
//             pressed
//                 ? SingleChildScrollView(
//                     child: Container(
//                       width: MediaQuery.of(context).size.width * 0.9,
//                       child: Card(
//                         child: Container(
//                           margin: EdgeInsets.all(15),
//                           child: Column(
//                             mainAxisSize: MainAxisSize.max,
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Padding(
//                                 padding: EdgeInsets.only(top: 10),
//                               ),
//                               ClipRRect(
//                                 borderRadius: BorderRadius.circular(100),
//                                 child: Image.network(
//                                   "$profileimage",
//                                   width: 120,
//                                 ),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(top: 10),
//                               ),
//                               Text(
//                                 "$username",
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 18,
//                                 ),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(top: 10),
//                               ),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceAround,
//                                 children: [
//                                   Text(
//                                     "$followers\nFollowers",
//                                     style: TextStyle(
//                                       fontSize: 15,
//                                     ),
//                                   ),
//                                   Text(
//                                     "$following\nFollowing",
//                                     style: TextStyle(
//                                       fontSize: 15,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(top: 10),
//                               ),
//                               Text(
//                                 "$bio",
//                                 style: TextStyle(
//                                   fontSize: 15,
//                                 ),
//                               ),
//                               Padding(padding: EdgeInsets.only(top: 10)),
//                               Text(
//                                 "$website",
//                                 style: TextStyle(
//                                   fontSize: 15,
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   )
//                 : Container(),
//           ],
//         ),
//       ),
//     );
//   }

// //Reel Downloader page
//   Widget reelPage() {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         TextField(
//           controller: reelController,
//         ),
//         ElevatedButton(
//           onPressed: () {
//             setState(() {
//               downloading = true; //set to true to show Progress indicator
//             });
//             download();
//           },
//           child: Text("Download"),
//         ),
//         downloading
//             ? Center(
//                 child:
//                     CircularProgressIndicator(), //if downloading is true show Progress Indicator
//               )
//             : Container()
//       ],
//     );
//   }

// //Download reel video on button clickl
// // void lanchWhatsapp({@required number, @required message}) async {
// //   String url = "whatsapp://send?phone=$number&text=$message";
// //   await canLaunch(url) ? launch(url) : print("Can not launch");
// // }
//   void download() async {
//     final status = await Permission.storage.request();
//     if (status.isGranted) {
//       var myvideourl = await flutterInsta.downloadInsta(reelController.text);
//       // await canLaunch(myvideourl) ? launch(myvideourl) : print("Can not launch");
//       // FileName: edit start
//       String s = myvideourl;
//       var uri = Uri.parse(s);
//       String ws = uri.pathSegments.last;
//       // FileName: edit end
//       await FlutterDownloader.enqueue(
//         url: '$myvideourl',
//         fileName: ws,
//         savedDir: '/sdcard/Download/',
//         showNotification: true,
//         openFileFromNotification: true,
//       ).whenComplete(() {
//         setState(() {
//           downloading = false; // set to false to stop Progress indicator
//         });
//       });
//       print(myvideourl);
//       print(ws);
//     } else {
//       print("Permission deined");
//     }
//   }
// }
