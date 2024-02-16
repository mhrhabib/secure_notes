// import 'package:aqar_modon/core/network/base_client.dart';
// import 'package:aqar_modon/core/utils/urls.dart';
// import 'package:get/get.dart';
// import 'package:dio/dio.dart' as dio;
// import '../models/city_model.dart';

// class CityController extends GetxController {
//   Rx<CityModel> citymodel = CityModel().obs;
//   var isLoading = false.obs;

//   var selectedCity = ''.obs;

//   getCity() async {
//     isLoading.value = true;
//     try {
//       dio.Response response = await BaseClient.get(url: '${Urls.getCity}1');
//       citymodel.value = CityModel.fromJson(response.data);
//       return citymodel.value;
//     } on dio.DioException catch (err) {
//       if (err.response != null && err.response!.statusCode == 401) {
//         // Token expired, attempt to refresh
//         await refreshTokenAndRetry(() async {
//           // Retry the original request
//           await getCity();
//         });
//       } else {
//         return Future.error("internal sever error");
//       }
//     } catch (e) {
//       return Future.error(e.toString());
//     }
//   }

//   Future<void> refreshTokenAndRetry(Future<void> Function() retryFunction) async {
//     try {
//       // Refresh the token
//       await BaseClient.refreshToken();
//       // Retry the original request
//       await retryFunction();
//     } catch (refreshError) {
//       // Handle token refresh failure
//       handleError("Token refresh failed");
//     }
//   }

//   void handleError(String errorMessage) {
//     // Handle errors as needed (e.g., show an error message)
//     print(errorMessage);
//   }

//   @override
//   void onInit() {
//     super.onInit();
//     getCity();
//   }
// }
