import 'dart:convert';
import 'dart:io';

import 'package:adroit/api_keys/api.dart';
import 'package:adroit/models/wallpaper.dart';
import 'package:http/http.dart' as http;

class WallpaperService {
  final String baseUrl = "https://api.unsplash.com/photos/";

  Future<Wallpaper> getListOfPhotos([int page = 1]) async {
    try {
      Map<String, String> queryParams = {
        "client_id": clientId,
        "page": page.toString(),
      };

      var uri = Uri.https("api.unsplash.com", "/photos/", queryParams);

      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        final data = response.body;

        final decodedData = jsonDecode(data);

        Wallpaper wallpaper = Wallpaper.fromJson(decodedData);

        return wallpaper;
      } else {
        throw Exception("An error occurred while fetching data");
      }
    } on SocketException {
      throw Exception("No internet connection");
    } catch (e) {
      throw Exception("Something went wrong please try again");
    }
  }
}
