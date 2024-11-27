import 'package:flutter/foundation.dart';
import 'package:ten_twenty/modules/movieDetail/models/movie_detail_model.dart';

import '../../../constants/api_endpoints.dart';
import '../../../core/exceptions/api_error.dart';
import '../../../core/network/api_result.dart';
import '../../../core/network/dio_client.dart';
import 'package:dio/dio.dart';

class MovieDetailRepository {
  final DioClient _dioClient;

  MovieDetailRepository({
    required DioClient dioClient,
  }) : _dioClient = dioClient;

  Future<MovieDetailModel> getMovieDetail(String movieId) async {
    try {
      var response = await _dioClient.get(Endpoints.movieDetail + movieId,
          queryParameters: {"api_key": Endpoints.apiKey});
      MovieDetailModel movieDetailModel =
          await compute(movieDetailResponseFromJson, response.data);
      return movieDetailModel;
    } on DioException catch (e, stackTrace) {
      throw ApiError.fromDioException(e);
    } on TypeError catch (e, stackTrace) {
      throw ApiError(message: '$e', code: 0);
    } catch (e) {
      throw ApiError(message: '$e', code: 0);
    }
  }
}
