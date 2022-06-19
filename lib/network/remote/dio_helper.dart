import 'package:dio/dio.dart';

class DioHelper{
  static late Dio dio;

  static void init(){
    dio = Dio(
      BaseOptions(
        baseUrl: '',
        receiveDataWhenStatusError: true
      )
    );
  }
  static Future<Response> getData({required String url , Map<String , dynamic>? query , String lang ='en' , String? token}){
    dio.options.headers={
      'Content-Type': 'application/json',
      'lang' : lang,
      'Authorization' : token??''
    };
    return dio.get(url,queryParameters: query,);
  }
  static Future<Response> postData({required String url,Map<String , dynamic>? query ,required Map<String , dynamic> data ,String lang ='en' , String? token}){
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang' : lang,
      'Authorization' : token??''
    };
    return dio.post(url,queryParameters: query,data: data);
  }
  static Future<Response> putData({required String url,Map<String , dynamic>? query ,required Map<String , dynamic> data ,String lang ='en' , String? token}){
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang' : lang,
      'Authorization' : token??''
    };
    return dio.put(url,queryParameters: query,data: data);
  }
}