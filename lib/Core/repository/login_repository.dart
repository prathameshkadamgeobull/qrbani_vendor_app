import 'package:qrbani_vender_app/Core/constants/AppConstants.dart';

import '../api/api_constants.dart';
import '../services/api_service.dart';


class LoginRepository {

  final ApiService apiService;


  LoginRepository(this.apiService);


  Future<bool> sendOtp(String phone) async {

    /*
  final response = await apiService.post(
  //   ApiConstants.baseUrl + ApiConstants.sendOtp,
  //   {
  //     "phone": phone,
  //   },
  // );
  //
  // if (response.statusCode == 200) {
  //   return response.data["success"] == true;
  // }
  //
  // return false;
  */
    final response = await apiService.post(
          ApiConstants.baseUrl + ApiConstants.sendOtp,
          {
            "phone": phone,
          },
        );
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }


  Future<bool> verifyOtp({

    required String phone,
    required String otp,

  }) async {
    // final response = await apiService.post(
    //
    //   ApiConstants.verifyOtp,
    //
    //   {
    //     "phone": phone,
    //     "otp": otp,
    //   },
    //
    // );
    //
    //
    // if(response.statusCode == 200){
    //
    //   return response.data["success"] == true;
    //}

    final response = await apiService.post(

          ApiConstants.baseUrl+ApiConstants.verifyOtp,

          {
            "phone": phone,
            "otp": otp,
          },

        );
    await Future.delayed(const Duration(seconds: 1));

    return true;
  }


// return false;

}


