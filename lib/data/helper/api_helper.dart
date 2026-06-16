import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'app_exceptions.dart';

class ApiHelper {
  void getAPI({required String url}) {

  }

  Future<dynamic> postAPI({required String url, Map<String, dynamic>? mBodyParams}) async {
    try {
      var response = await http.post(Uri.parse(url), body: jsonEncode(mBodyParams));
      return returnResponse(response);
    } on SocketException catch (e) {
      /// internet not available
      throw NoInternetException(msg: e.toString());
    } catch (e) {
      /// any other exception
      throw FetchDataException(msg: e.toString());
    }
  }

  dynamic returnResponse(http.Response res) {
    switch (res.statusCode) {
      case 200:
        {
          dynamic data = jsonDecode(res.body);
          return data;
        }
      case 400:
        {
          throw BadRequestException(msg: res.body.toString());
        }
      case 401:
      case 403:
        {
          throw UnauthorisedException(msg: res.body.toString());
        }
      case 404:
        {
          throw NotFoundException(msg: res.body.toString());
        }
      case 500:
        {
          throw ServerException(msg: res.body.toString());
        }
      default:
        {
          throw FetchDataException(msg: res.body.toString());
        }
    }
  }
}
