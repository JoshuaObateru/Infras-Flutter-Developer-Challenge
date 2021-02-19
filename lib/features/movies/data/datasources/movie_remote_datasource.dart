import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:infras_flutter_developer_challenge/core/exceptions/exceptions.dart';
import 'package:infras_flutter_developer_challenge/core/network/network_info_checker.dart';
import 'package:infras_flutter_developer_challenge/features/movies/data/models/film_model.dart';

class MovieRemoteDatasource {
  final http.Client client;
  final NetworkInfo networkInfo;
  final Dio dio;

  MovieRemoteDatasource({this.client, this.networkInfo, this.dio});

  Future<List<FilmModel>> getMovies() async {
    if (await networkInfo.isConnected) {
      http.Response response = await client.get(
        Uri.decodeFull("https://ghibliapi.herokuapp.com/films"),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json"
        },
      );
      if (response.statusCode == 200) {
        print(response.body);
        return FilmModel.filmModelsParser(response.body);
      } else if (response.statusCode == 400) {
        throw MovieException(message: 'Bad Request');
      } else if (response.statusCode == 404) {
        throw MovieException(message: 'Not Found');
      } else {
        throw MovieException(message: jsonDecode(response.body)["message"]);
      }
    } else {
      throw NetworkException(message: "No network connection");
    }
  }
}
