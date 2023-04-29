
import 'package:dio/dio.dart';
import 'package:graduationroject/controller/remote/dio/endPoint.dart';

class DioHelper {
  // we put here all functions
  static late Dio dio;
  static init()
  {
   dio=Dio(
     BaseOptions(//take the basic URL
       baseUrl:baseUrl,
       headers: { //headers fixed in all project
         'Accept': 'application/jason',
         'Content-Type':'application/jason',
       }

     )
   ) ;
  }

 static Future<Response> getData
     ({
     required String url,
    Map<String,dynamic>?queryParameters,//it is optional
    String? token,//optioanl
})async
  {try{
    dio.options.headers={
      'Autorization':'Bearer ${token ?? " "}'//if there is no token let it empty
    };
   Response response=await dio.get(url,queryParameters: queryParameters);
   return response;
  }
  catch(error){
    rethrow;
  }
  }//get


  static Future<Response> postData
      ({
    required String url,
    Map<String,dynamic>?queryParameters,//it is optional
    String? token,//optioanl
    required Map<String,dynamic> data
  })async
  {try{
  dio.options.headers={
  'Autorization':'Bearer ${token ?? " "}'//if there is no token let it empty
  };
  Response response=await dio.post(url,
      data: data,
      queryParameters: queryParameters);
  return response;
  }
  catch(error){
  rethrow;
  }
  }//get

}//DioHelper



