
import 'dart:developer';

import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {

  static ApiClient get to => Get.find();
  String token = '';
  String appBaseUrl = 'http://10.10.40.217:5000/';


  Future<Response> getData(String uri) async{
    try{
      var response = await get(appBaseUrl+uri);
      return response;
    }catch(e){
      return Response(statusCode: 1,statusText: e.toString());
    }
  }

  Future<Response> postData(String uri, Map<String, dynamic>? body) async {
    log('gese');
    try{
      log('$token is the current token');
      late Response response;
      if(body != null){
        response = await post(
          uri,
          body,
        );
      }else{
        response = await post(
          uri,
          {}
        );
      }
      return response;
    } catch(e) {
      log(e.toString());
      return Response(statusCode: 1,statusText: e.toString());
    }
  }

  Future<Response> putRequest(String url, Map<String, dynamic> data) async {
    try{
      final response = await put(url, data);
      return response;
    } catch(e) {
    log(e.toString());
    return Response(statusCode: 1,statusText: e.toString());
    }
  }

  Future<Response> deleteRequest(String url) async {
    try{
      final response = await delete(url);
      return response;
    }catch(e){
      log(e.toString());
      return Response(statusCode: 1,statusText: e.toString());
    }
  }
}
