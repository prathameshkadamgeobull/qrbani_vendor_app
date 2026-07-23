

import 'package:dio/dio.dart';

class ApiService {

  final Dio dio = Dio();

  Future<Response> post(
      String url,
      Map<String, dynamic> data,
      ) async {
    print("Mock Url: $url");
    print("Mock Data: $data");

    await Future.delayed(const Duration(seconds: 1));

    return Response(
      requestOptions: RequestOptions(path: url),
      statusCode: 200,
      data: {
        "success": true,
        "message": "Success",
      },
    );
  }


  // Future<Response> post(
  //     String url,
  //     Map<String, dynamic> data,
  //     ) async {
  //   try {
  //     print("Url: $url");
  //     print("Data: $data");
  //
  //     final response = await dio.post(
  //       url,
  //       data: data,
  //     );
  //
  //     print("Response: ${response.data}");
  //
  //     return response;
  //   } on DioException catch (e) {
  //     throw Exception(e.response?.data ?? e.message);
  //   }
  // }

  Future<Response> get(
      String url,
      ) async {

    try {

      print("GET URL: $url");


      final response = await dio.get(
        url,
      );


      print("Response: ${response.data}");

      return response;


    } on DioException catch(e){

      throw Exception(
          e.response?.data ?? e.message
      );

    }

  }



}