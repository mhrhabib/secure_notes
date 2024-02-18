import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class BaseClient {
  static Future<BaseOptions> getBasseOptions() async {
    final storage = GetStorage();

    BaseOptions options = BaseOptions(
      followRedirects: false,
      validateStatus: (status) {
        return status! < 500;
      },
      headers: {
        "Accept": "application/json",
        'Content-type': 'application/json',
        'X-Requested-With': 'XMLHttpRequest',
        'Authorization': 'Bearer ${storage.read("token")}',
      },
    );

    return options;
  }

  static Future<dynamic> get({required String url, var payload}) async {
    var dio = Dio(await getBasseOptions());

    var response = await dio.get(url, queryParameters: payload);
    return response;
  }

  static Future<dynamic> post({url, payload}) async {
    var dio = Dio(await getBasseOptions());
    var response = await dio.post(url, data: payload);
    return response;
  }

  static Future<dynamic> postWithQP({url, queryPayload}) async {
    var dio = Dio(await getBasseOptions());
    var response = await dio.post(url, queryParameters: queryPayload);
    return response;
  }

  static Future<dynamic> put({url, payload}) async {
    var dio = Dio(await getBasseOptions());
    var response = await dio.put(url, data: payload);
    return response;
  }

  static Future<dynamic> delete({url}) async {
    var dio = Dio(await getBasseOptions());
    var response = await dio.delete(url);
    return response;
  }
}


//**************interceptors and refresh token see this code for api call  use **************///

// import 'dart:async';

// import 'package:dio/dio.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';

// class BaseClient {
//   static Future<BaseOptions> getBaseOptions() async {
//     final storage = GetStorage();
//     BaseOptions options = BaseOptions(
//       followRedirects: false,
//       validateStatus: (status) {
//         return status! < 500;
//       },
//       headers: {
//         "Accept": "application/json",
//         'Content-type': 'application/json',
//         'X-Requested-With': 'XMLHttpRequest',
//         'Authorization': 'Bearer ${await storage.read('token')}',
//       },
//     );

//     return options;
//   }

//   static Dio createDio() {
//     var dio = Dio();
//     dio.interceptors.add(PrettyDioLogger(
//       requestHeader: true,
//       requestBody: true,
//       responseBody: true,
//       responseHeader: false,
//       error: true,
//       compact: true,
//       maxWidth: 90,
//     ));

//     dio.interceptors.add(InterceptorsWrapper(
//       onRequest: (options, handler) async {
//         // Check if the token is expired
//         if (await isTokenExpired()) {
//           // Refresh the token
//           await refreshToken();
//           // Update the Authorization header with the new token
//           options.headers['Authorization'] = 'Bearer ${await getNewToken()}';
//         }
//         return handler.next(options);
//       },
//     ));

//     return dio;
//   }

//   static Future<bool> isTokenExpired() async {
//     // Implement your logic to check if the token is expired
//     // For demonstration purposes, assume it is always expired
//     return true;
//   }

//   static Future<void> refreshToken() async {
//     try {
//       // Make an API call to refresh the token
//       // Replace 'your_refresh_token_api_endpoint' with your actual endpoint
//       var response = await Dio().post('your_refresh_token_api_endpoint');

//       // Assuming the new token is in the 'token' field of the response
//       String newToken = response.data['token'];

//       // Update the token in storage
//       await updateTokenInStorage(newToken);
//     } catch (e) {
//       // Handle token refresh failure
//       throw DioException(
//         requestOptions: RequestOptions(path: ''), // Replace with your request options
//         error: 'Token refresh failed',
//       );
//     }
//   }

//   static Future<String?> getNewToken() async {
//     // Replace this with your logic to obtain the new token
//     // e.g., from storage or make an API call
//     return GetStorage().read('token');
//   }

//   static Future<void> updateTokenInStorage(String newToken) async {
//     // Replace this with your logic to update the token in storage
//     // e.g., SharedPreferences, secure storage, etc.
//     // For demonstration purposes, print the updated token here
//     print('Updated Token: $newToken');
//     await GetStorage().write('token', newToken);
//   }

//   static Future<dynamic> get({required String url, var payload}) async {
//     var dio = createDio();
//     var response = await dio.get(url, queryParameters: payload);
//     print('\nURL: $url');
//     print('Request Body: $response\n');
//     return response;
//   }

//   static Future<dynamic> post({url, payload}) async {
//     var dio = createDio();
//     var response = await dio.post(url, data: payload);
//     print('\nURL: $url');
//     print('Request Body: $response\n');
//     return response;
//   }

//   static Future<dynamic> postWithQP({url, queryPayload}) async {
//     var dio = createDio();
//     var response = await dio.post(url, queryParameters: queryPayload);
//     return response;
//   }

//   static Future<dynamic> put({url, payload}) async {
//     var dio = createDio();
//     var response = await dio.put(url, data: payload);
//     return response;
//   }

//   static Future<dynamic> delete({url}) async {
//     var dio = createDio();
//     var response = await dio.delete(url);
//     return response;
//   }
// }

