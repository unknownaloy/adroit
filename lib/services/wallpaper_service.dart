import 'dart:convert';
import 'dart:io';

import 'package:adroit/api_keys/api.dart';
import 'package:adroit/models/wallpaper.dart';
import 'package:http/http.dart' as http;

class WallpaperService {
  final String baseUrl = "https://api.unsplash.com/photos/";

  Future<List<Wallpaper>> getListOfPhotos([int page = 1]) async {
    try {
      Map<String, String> queryParams = {
        "page": page.toString(),
        "client_id": clientId,
      };

      // https://api.unsplash.com/photos?c0xpjvzVqQEheF1khDTAmJKLHP544oJ_0CYjEAZGSa0

      var uri = Uri.https("api.unsplash.com", "/photos/", queryParams);

      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        print("getListOfPhotos => Status code 200");
        List<Wallpaper> result = [];
        final data = response.body;

        final decodedData = jsonDecode(data) as List;

        for (Map<String, dynamic> singleData in decodedData) {
          Wallpaper wallpaper = Wallpaper.fromJson(singleData);
          result.add(wallpaper);
        }

        return result;
      } else {
        throw Exception("An error occurred while fetching data");
      }
    } on SocketException catch (e) {
      print("SocketException => $e");
      throw Exception("No internet connection");
    } catch (e) {
      print(e);
      throw Exception("Something went wrong please try again");
    }
  }
}
