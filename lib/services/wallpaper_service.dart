import 'dart:convert';
import 'dart:io';

import 'package:adroit/api_keys/api.dart';
import 'package:adroit/models/wallpaper.dart';
import 'package:adroit/services/failure.dart';
import 'package:adroit/utilities/strings.dart';
import 'package:http/http.dart' as http;

class WallpaperService {
  http.Client client = http.Client();

  Future<List<Wallpaper>> getListOfPhotos([int page = 1]) async {
    try {
      Map<String, String> queryParams = {
        "page": page.toString(),
        "client_id": clientId,
      };

      var uri = Uri.https("api.unsplash.com", "/photos/", queryParams);

      final response = await client.get(uri);

      if (response.statusCode == 200) {
        List<Wallpaper> result = [];
        final data = response.body;

        final decodedData = jsonDecode(data) as List;

        for (Map<String, dynamic> singleData in decodedData) {
          Wallpaper wallpaper = Wallpaper.fromJson(singleData);
          result.add(wallpaper);
        }

        return result;
      } else {
        /// TODO: Throw an exception here
        throw Exception("Failed to load");
      }
    } on SocketException catch (e) {
      print("getListOfPhotos => SocketException $e");
      throw Failure(kSocketException);
    } on HttpException catch (e) {
      print("getListOfPhotos => HttpException === $e");
      throw Failure(kHttpException);
    } catch (e) {
      print(e);
      throw Failure(kCatchException);
    }
  }
}
