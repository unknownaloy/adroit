import 'package:adroit/api_keys/api.dart';
import 'package:adroit/models/wallpaper.dart';
import 'package:adroit/services/failure.dart';
import 'package:adroit/services/wallpaper_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'wallpaper_service_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('getListOfPhotos', () {
    final client = MockClient();
    final wallpaperService = WallpaperService();
    wallpaperService.client = client;

    // const listOfPhotos = '[{"id":"biKXooqmSd0","created_at":"2021-08-05T15:21:03-04:00","updated_at":"2021-09-12T01:29:54-04:00","promoted_at":null,"width":7750,"height":5167,"color":"#c0a673","blur_hash":"LKJ%UR^jX-xsP9xs\$%\$y}=wa9bae","description":null,"alt_description":"girl in white and black stripe long sleeve shirt sitting beside girl in white long sleeve","urls":{"raw":"https://images.unsplash.com/photo-1628191137549-1c40a5b83dba?ixid=MnwyNTY3MDN8MXwxfGFsbHwxfHx8fHx8Mnx8MTYzMTQ4NDg3NQ&ixlib=rb-1.2.1","full":"https://images.unsplash.com/photo-1628191137549-1c40a5b83dba?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyNTY3MDN8MXwxfGFsbHwxfHx8fHx8Mnx8MTYzMTQ4NDg3NQ&ixlib=rb-1.2.1&q=85","regular":"https://images.unsplash.com/photo-1628191137549-1c40a5b83dba?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNTY3MDN8MXwxfGFsbHwxfHx8fHx8Mnx8MTYzMTQ4NDg3NQ&ixlib=rb-1.2.1&q=80&w=1080","small":"https://images.unsplash.com/photo-1628191137549-1c40a5b83dba?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNTY3MDN8MXwxfGFsbHwxfHx8fHx8Mnx8MTYzMTQ4NDg3NQ&ixlib=rb-1.2.1&q=80&w=400","thumb":"https://images.unsplash.com/photo-1628191137549-1c40a5b83dba?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNTY3MDN8MXwxfGFsbHwxfHx8fHx8Mnx8MTYzMTQ4NDg3NQ&ixlib=rb-1.2.1&q=80&w=200"},"links":{"self":"https://api.unsplash.com/photos/biKXooqmSd0","html":"https://unsplash.com/photos/biKXooqmSd0","download":"https://unsplash.com/photos/biKXooqmSd0/download","download_location":"https://api.unsplash.com/photos/biKXooqmSd0/download?ixid=MnwyNTY3MDN8MXwxfGFsbHwxfHx8fHx8Mnx8MTYzMTQ4NDg3NQ"},"categories":[],"likes":20,"liked_by_user":false,"current_user_collections":[],"sponsorship":{"impression_urls":[],"tagline":"Made Right. On the Farm. ","tagline_url":"https://www.hillshirefarm.com/","sponsor":{"id":"sykIO2KbxWo","updated_at":"2021-09-12T14:22:19-04:00","username":"hillshirefarm","name":"Hillshire Farm","first_name":"Hillshire","last_name":"Farm","twitter_username":null,"portfolio_url":"https://www.hillshirefarm.com/","bio":"You’ll taste farmhouse goodness in everything we make.","location":null,"links":{"self":"https://api.unsplash.com/users/hillshirefarm","html":"https://unsplash.com/@hillshirefarm","photos":"https://api.unsplash.com/users/hillshirefarm/photos","likes":"https://api.unsplash.com/users/hillshirefarm/likes","portfolio":"https://api.unsplash.com/users/hillshirefarm/portfolio","following":"https://api.unsplash.com/users/hillshirefarm/following","followers":"https://api.unsplash.com/users/hillshirefarm/followers"},"profile_image":{"small":"https://images.unsplash.com/profile-1625772857933-c1efa9f839e6image?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=32&w=32","medium":"https://images.unsplash.com/profile-1625772857933-c1efa9f839e6image?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=64&w=64","large":"https://images.unsplash.com/profile-1625772857933-c1efa9f839e6image?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128"},"instagram_username":null,"total_collections":0,"total_likes":0,"total_photos":30,"accepted_tos":true,"for_hire":false,"social":{"instagram_username":null,"portfolio_url":"https://www.hillshirefarm.com/","twitter_username":null,"paypal_email":null}}},"topic_submissions":{},"user":{"id":"sykIO2KbxWo","updated_at":"2021-09-12T14:22:19-04:00","username":"hillshirefarm","name":"Hillshire Farm","first_name":"Hillshire","last_name":"Farm","twitter_username":null,"portfolio_url":"https://www.hillshirefarm.com/","bio":"You’ll taste farmhouse goodness in everything we make.","location":null,"links":{"self":"https://api.unsplash.com/users/hillshirefarm","html":"https://unsplash.com/@hillshirefarm","photos":"https://api.unsplash.com/users/hillshirefarm/photos","likes":"https://api.unsplash.com/users/hillshirefarm/likes","portfolio":"https://api.unsplash.com/users/hillshirefarm/portfolio","following":"https://api.unsplash.com/users/hillshirefarm/following","followers":"https://api.unsplash.com/users/hillshirefarm/followers"},"profile_image":{"small":"https://images.unsplash.com/profile-1625772857933-c1efa9f839e6image?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=32&w=32","medium":"https://images.unsplash.com/profile-1625772857933-c1efa9f839e6image?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=64&w=64","large":"https://images.unsplash.com/profile-1625772857933-c1efa9f839e6image?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128"},"instagram_username":null,"total_collections":0,"total_likes":0,"total_photos":30,"accepted_tos":true,"for_hire":false,"social":{"instagram_username":null,"portfolio_url":"https://www.hillshirefarm.com/","twitter_username":null,"paypal_email":null}}}]';
    const listOfPhotos =
        '[{"id":"1","created_at":"date","updated_at":"date","promoted_at":null,"width":7750,"height":5167,"color":"#c0a673","blur_hash":"hash","description":"desc","alt_description":"desc","urls":{"raw":"image-raw","full":"image-full","regular":"image-regular","small":"image-small","thumb":"image-thumb"},"links":{"self":"link-self","html":"link-html","download":"link-download","download_location":"link-download-location"},"categories":[],"likes":20,"liked_by_user":false,"current_user_collections":[],"sponsorship":{"impression_urls":[],"tagline":"text-tagline","tagline_url":"text-tagline-url","sponsor":{"id":"2","updated_at":"date","username":"hillshirefarm","name":"Hillshire Farm","first_name":"Hillshire","last_name":"Farm","twitter_username":"twitter-name","portfolio_url":"portfolio-site","bio":"bio-text","location":"Mountain","links":{"self":"self-link","html":"html-link","photos":"photo-link","likes":"likes-link","portfolio":"portfolio-link","following":"following-link","followers":"followers-link"},"profile_image":{"small":"small-link","medium":"medium-link","large":"large-link"},"instagram_username":"insta-name","total_collections":0,"total_likes":0,"total_photos":30,"accepted_tos":true,"for_hire":false,"social":{"instagram_username":null,"portfolio_url":"portfolio-url","twitter_username":"twitter-name","paypal_email":null}}},"topic_submissions":{},"user":{"id":"3","updated_at":"date","username":"hillshirefarm","name":"Hillshire Farm","first_name":"Hillshire","last_name":"Farm","twitter_username":"twitter-name","portfolio_url":"portfolio-site","bio":"bio-text","location":"Mountain","links":{"self":"link-self","html":"link-html","photos":"link-photos","likes":"link-likes","portfolio":"link-portfolio","following":"link-following","followers":"link-followers"},"profile_image":{"small":"small-link","medium":"medium-link","large":"large-link"},"instagram_username":"insta-name","total_collections":0,"total_likes":0,"total_photos":30,"accepted_tos":true,"for_hire":false,"social":{"instagram_username":"insta-name","portfolio_url":"portfolio-site","twitter_username":"twitter-name","paypal_email":null}}}]';

    Map<String, String> queryParams = {
      "page": "1",
      "client_id": clientId,
    };

    var uri = Uri.https("api.unsplash.com", "/photos/", queryParams);

    test("returns list of wallpaper if the http call completes successfully",
        () async {
      when(client.get(uri))
          .thenAnswer((_) async => http.Response(listOfPhotos, 200));

      expect(await wallpaperService.getListOfPhotos(), isA<List<Wallpaper>>());
    });

    test('throws a Failure if the http call completes with an error', () {
      when(client.get(uri))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(wallpaperService.getListOfPhotos(), throwsA(isA<Failure>()));
    });
  });
}
