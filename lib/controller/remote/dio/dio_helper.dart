
// import 'dart:html';

import 'package:dio/dio.dart';
import 'package:graduationroject/controller/local/sharedPreference.dart';
import 'package:graduationroject/controller/remote/dio/endPoint.dart';
import 'package:graduationroject/model/job_model.dart';

class DioHelper {
  // we put here all functions
  static late Dio dio;
 static String? token=MyCache.getData(key: 'token')!;

  //////////////////
  static init()
  {
   dio=Dio(
     BaseOptions(//take the basic URL
       baseUrl:baseUrl,
       headers: { //headers fixed in all project
         'Accept': 'application/json',
         'Content-Type':'application/json',
       }

     )
   ) ;
  }
///////////////////////
 static Future<dynamic> getData({ required String url})
//      ({
//      required String url,
//     //Map<String,dynamic>?queryParameters,//it is optional
//     //String? token,//optioanl
// })
  async
  {try{
    dio.options.headers['Authorization']='Bearer ${token ?? " "}';

    // dio.options.headers={
    //   'Autorization':'Bearer ${token ?? " "}'//if there is no token let it empty
    // };
   Response response=await dio.get(url);
   return response;
  }
  catch(error){
    throw error;
  }
  }//get

///////////post data
   Future<Response> postData
      ({
    required String url,
    //Map<String,dynamic>?queryParameters,//it is optional
   // String? token,//optioanl
    required Map<String,dynamic> data
   // dynamic data,
  })async
  {try{
  // dio.options.headers={
  // 'Autorization':'Bearer ${token ?? " "}'//if there is no token let it empty
  // };
    dio.options.headers['Authorization']='Bearer ${token ?? " "}';

  Response response=await dio.post(url, data: data,);
  return response;
  }
  catch(error){
  throw error;
  }
  }
  ///////////////put
  Future <Response>put(String url, dynamic data)async
  {
    try{
      dio.options.headers['Authorization']='Bearer ${token ?? " "}';
      final response=await dio.put(url, data: data);
      return response;
    }
    catch(error){
      throw error;
    }
  }
  ///////////////////////delet
  Future<Response>delete(String url) async
  {
    try{
      dio.options.headers['Authorization']='Bearer ${token ?? " "}';
      final response=await dio.delete(url);
      return response;
    }
    catch(error)
    {
      throw error;
    }
  }

///////////////////////////////////////get saved jobs
  static Future<List<jobsModel>> getSavedJobs(int id) async {
      Response response;
      try {
       response = await dio!.get('/favorites/$id');
      } catch (e) {
       print(e);
       return [];
      }

      if (response.statusCode != 200) {
       return [];
      }

      List<dynamic> data = response.data;
      List<jobsModel> jobs = data.map((job) => jobsModel.fromJson(job)).toList();

      return jobs;
     }


}//DioHelper



