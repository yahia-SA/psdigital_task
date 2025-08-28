import 'package:dio/dio.dart';
import 'package:psdigital_task/core/constants/endpoint_constants.dart';
import 'package:psdigital_task/core/network/api_consumer.dart';

class DioConsumer implements ApiConsumer {

  DioConsumer({required this.client}) {
    client.options
      ..baseUrl = EndpointConstants.baseUrl
      ..responseType = ResponseType.json
      ..connectTimeout = const Duration(seconds: 15)
      ..receiveTimeout = const Duration(seconds: 15);

  }
  final Dio client;

  @override
  Future<dynamic> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await client.get(path, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (error) {
      _handleDioError(error);
    }
  }

  // Implement other methods (post, put, delete)

  void _handleDioError(DioException error) {
    // Handle different error types
  }

  @override
  Future delete(String path) {
    throw UnimplementedError();
  }

  @override
  Future post(String path, {Map<String, dynamic>? body}) {
    throw UnimplementedError();
  }

  @override
  Future put(String path, {Map<String, dynamic>? body}) {
    throw UnimplementedError();
  }
}
