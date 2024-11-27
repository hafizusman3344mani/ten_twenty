import 'package:flutter/foundation.dart';
import 'package:ten_twenty/modules/home/models/home_model.dart';

import '../../../constants/api_endpoints.dart';
import '../../../core/exceptions/api_error.dart';
import '../../../core/network/dio_client.dart';
import 'package:dio/dio.dart';

class HomeRepository {
  final DioClient _dioClient;

  HomeRepository({
    required DioClient dioClient,
  }) : _dioClient = dioClient;

  Future<VideoModelResponse> upComingVideos() async {
    try {
      var response = await _dioClient.get(Endpoints.upcomingMovies,
          queryParameters: {"api_key": Endpoints.apiKey});
      print(response);
      VideoModelResponse ticketModelResponse =
          await compute(videoModelResponseFromJson, response.data);
      return ticketModelResponse;
    } on DioException catch (e, stackTrace) {
      throw ApiError.fromDioException(e);
    } on TypeError catch (e, stackTrace) {
      throw ApiError(message: '$e', code: 0);
    } catch (e) {
      throw ApiError(message: '$e', code: 0);
    }
  }
}
