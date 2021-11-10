import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

// Customize API here
// Customize API here
class Getprofile {
  String url = "http://www.instagram.com/";

  //get profile details
  Future<String> getprofileDetails(String username) async {
    var res = await http.get(Uri.parse(url + username + "/?__a=1"));
    var data = json.decode(res.body);
    var graphql = data['graphql'];
    var user = graphql['user'];
    var getprofile = user['profile_pic_url_hd'];
    return getprofile;
  }

  //Get reels/posts photos
  Future<String> getPostPhoto(String link) async {
    var linkSplit = link.replaceAll(" ", "").split("/");
    var downloadURL = await http.get(Uri.parse(
        '${linkSplit[0]}//${linkSplit[2]}/${linkSplit[3]}/${linkSplit[4]}' "/?__a=1"));
    var data = json.decode(downloadURL.body);
    var graphql = data['graphql'];
    var shortcodeMedia = graphql['shortcode_media'];
    var getPhoto = shortcodeMedia['display_url'];
    return getPhoto;
  }

  //Get reels video
  Future<String> getInstaVideo(String link) async {
    var linkSplit = link.replaceAll(" ", "").split("/");
    var downloadURL = await http.get(Uri.parse(
        '${linkSplit[0]}//${linkSplit[2]}/${linkSplit[3]}/${linkSplit[4]}'
            "/?__a=1"));
    var data = json.decode(downloadURL.body);
    var graphql = data['graphql'];
    var shortcodeMedia = graphql['shortcode_media'];
    var getVideo = shortcodeMedia['video_url'];
    return getVideo;
  }

  math() {
    var rng = Random();
    for (var i = 0; i < 1; i++) {
      int number = rng.nextInt(1000);
      // print(number);
      return number;
    }
  }
}
