import 'package:dio/dio.dart';

class HomeRepo {
  static final Dio _dio = Dio();
  String baseUrl = 'http://10.0.2.2:8080/api/v1/'; // Use appropriate address

  Future<dynamic> signin(String endpoint, String email, String password) async {
    try {
      final response = await _dio.post(
        baseUrl + endpoint,
        data: {'username': email, 'password': password},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      print('Response status: ${response.statusCode}');
      print('Response data: ${response.data}');
      return response.data;
    } catch (error) {
      print('Error: $error');
      if (error is DioError) {
        print('DioError response: ${error.response?.data}');
      }
      throw error; // Rethrow the error to propagate it further if needed
    }
  }

  Future<dynamic> findalldoctor(String endpoint, String token) async {
    try {
      final response = await _dio.get(
        baseUrl + endpoint,
        options: Options(
          receiveTimeout: const Duration(seconds: 7),
          receiveDataWhenStatusError: true,
          sendTimeout: const Duration(seconds: 7),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      return response.data;
    } catch (error) {
      throw error; // Rethrow the error to propagate it further if needed
    }
  }

  Future<dynamic> breastcanser(
      String endpoint, String token, MultipartFile image) async {
    try {
      FormData formData = FormData.fromMap({
        'image': image,
      });

      final response = await _dio.post(
        baseUrl + endpoint,
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      return response.data;
    } catch (error) {
      throw error; // Rethrow the error to propagate it further if needed
    }
  }
}
