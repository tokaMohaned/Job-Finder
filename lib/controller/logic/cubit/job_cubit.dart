import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationroject/controller/remote/dio/dio_helper.dart';
import 'package:meta/meta.dart';

import '../../remote/dio/endPoint.dart';

part 'job_state.dart';

class JobCubit extends Cubit<JobState> {
  JobCubit() : super(JobInitial());
 static JobCubit get(context)=>BlocProvider.of(context);
 
 getDataProfile()
 {
   DioHelper.getData(url: ProfileEndPoint);
 }
//////////////////////
 getDataSearch(String name){
   DioHelper.getData(url: searchEndPoint,
    queryParameters:
    {
      'name': name,
    }
   );
 }
 //////////////////
postRegister(String name, String email, String password)async
{
 Response response= await DioHelper.postData(
      url: RegisterEndPoint,
      data: {'name': name,
          'email': email,
        'password':password ,
      });
 print(response.data);

}
////////////////////////////
}//cubit
