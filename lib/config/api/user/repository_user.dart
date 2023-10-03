import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project/config/api/user/api_response.dart';
import 'package:project/config/models/auth/register/request/request_register.dart';
import 'package:project/config/models/auth/register/response/response_user.dart';

class AuthRepository {
  Future<ApiResponse> register(RequestRegister register) async {
    ApiResponse apiResponse = ApiResponse();

    try {
      final response = await http.post(
        Uri.parse('http://food.test/api/register'),
        headers: {'accept': 'application/json'},
        body: register.toMap(),
      );
      switch (response.statusCode) {
        case 200:
          apiResponse.data =
              ResponseRegister.fromJson(jsonDecode(response.body));
          break;
        case 422:
          final errors = jsonDecode(response.body)['errors'];
          apiResponse.error = errors[errors.keys.elementAt(0)][0];
          break;
        case 403:
          apiResponse.error = jsonDecode(response.body)['message'];
          break;
        default:
          apiResponse.error = "somethingWentWrong";
          break;
      }
    } catch (e) {
      apiResponse.error = "serverError";
    }
    return apiResponse;
  }
}
