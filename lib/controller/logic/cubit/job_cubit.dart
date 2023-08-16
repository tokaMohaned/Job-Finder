
//import 'dart:html';

import 'package:dio/dio.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:graduationroject/controller/remote/dio/dio_helper.dart';
import 'package:graduationroject/controller/remote/dio/endPoint.dart';
import 'package:graduationroject/view/pages/home/BottomNavBar.dart';
import 'package:sizer/sizer.dart';

import '../../../model/job_model.dart';
import '../../../view/pages/home/home.dart';
import '../../../view/pages/screens/Job_application.dart';
import '../../../view/pages/screens/contact_page.dart';
import '../../../view/pages/screens/profile.dart';
import '../../../view/pages/screens/saved_jobs.dart';
import '../../../view/registration_and_login/register.dart';
import '../../../view/registration_and_login/work_type.dart';
import '../../local/sharedPreference.dart';
import '../../remote/http_helper.dart';
import 'job_state.dart';

class JobCubit extends Cubit<JobsStates> {

  JobCubit() : super(NewsInitialState());

  static JobCubit get(context) => BlocProvider.of(context);


  int currentIndexs = 0;
  List<Widget> Screans = [
    HomePage(),
    ContancePage(),
    JobApplication(),
    SavedJob(),
    ProfilePage(),
  ];
  List<BottomNavigationBarItem> bottomNavItem = [
    BottomNavigationBarItem(
        label: 'home',
        icon: Image.asset('assets/images/home.png'),
        activeIcon: Image.asset('assets/images/home2.png')),
    BottomNavigationBarItem(
        label: 'messages',
        icon: Image.asset('assets/images/message.png'),
        activeIcon: Image.asset('assets/images/message2.png')),
    BottomNavigationBarItem(
        label: 'Applied',
        icon: Image.asset('assets/images/applied2.png'),
        activeIcon: Image.asset('assets/images/applied.png')),
    BottomNavigationBarItem(
        label: 'Saved',
        icon: Image.asset('assets/images/archive.png'),
        activeIcon: Image.asset('assets/images/archive2.png')),
    const BottomNavigationBarItem(
        label: 'Profile',
        icon: Icon(Icons.person)
    ),
  ];

  void changeIndexBtmNav(int index) {
    currentIndexs = index;
    emit(NavBarState());
    if(index==3){
      DioHelper.getSavedJobs(MyCache.getData(key: 'id'));
    }
    emit(NavBarState());
  }
  /////////////////////////////////////////
//git the jobs
//   List<JobModel> jobsList = [];
//   Future<List> getAllJobs() async {
//
//     List<dynamic> dataDio=await DioHelper.getData
//       (url:'http:/167.71.79.133/api/jobs');
//     //List<dynamic> data = await Api().get(url:'http://167.71.79.133/api/jobs');
//     List<JobModel> jobs = dataDio.map((job) =>
//         JobModel.fromJson(job)).toList();
//
//     jobsList = jobs;
//     emit(GetJobsSuccessState());
//     return dataDio;
//   }

  List<JobModel> jobsList = [];
  Future<List> getAllJobs() async {
    List<dynamic> data = await Api().get(url:'https://project2.amit-learning.com/api/jobs');
      //(url:'http://167.71.79.133/api/jobs');
    List<JobModel> jobs = data.map((job) =>
        JobModel.fromJson(job)).toList();

    jobsList = jobs;
    emit(GetJobsSuccessState());
    return data;
  }
  /////////////////////////////////////////////////
//log in
  String? name ;
  int? id;
  String? token;
  final dioHelper=DioHelper();

    Future<void> login(email,password,context) async {
    String url = "https://project2.amit-learning.com/api/auth/login";
    emit(loginLoadingsState());
    try{
    Response response = await dioHelper.postData( url,
         {"email": email,"password": password});
    MyCache.saveData(key: 'token', value: response.data['token']);
    MyCache.saveData(key: 'id', value: response.data['user']['id']);
    MyCache.saveData(key: 'name', value: response.data['user']['name']);
   name=MyCache.getData(key: 'name')!;
   emit(LoginSuccessState());
   Navigator.pushReplacementNamed(context, BottomNavBar.routName);
   getAllJobs();

}
catch(error)
    {
      showToast(context);
      emit(LoginErrorState());
      print(error);
    }
    // if (response.statusCode==401){
    //   showToast(context);
    //
    // }else {
      //Navigator.pushNamed(context, HomeScreen.routName);
    }
    //print (name);

void showToast( context) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(// It displays the message for a very short period, and when the specified time completed, it will be disappeared from the screen. By default,
    // snack bar displays at the bottom of the screen.
    SnackBar(
      content:  Text('email or password is wrong', style: TextStyle(
        fontSize: 13.sp,
      ),),
      action: SnackBarAction(
          label: 'OK', onPressed: scaffold.hideCurrentSnackBar),
    ),
  );
}
////////////////////////register
  Future<void> register(name, email,password,context)async
  {
    String url="https://project2.amit-learning.com/api/auth/register";
    try{
      Response response=await dioHelper.postData(url,
            {
              'name': name,
            'email': email,
            'password':password},);
      emit(RegisterSeccessState());
      Navigator.pushNamed(context, Work_Type.routName);
      print("register success");
    }
    catch(error)
    {
      if(error==401)
        {
          error=="email is registered";
        }
      showToastWhenRegister(context, error);
      print(error);
      emit(RegisterErrorState());
    }
  }
////////
//   void showRegisterToast(context)
//   {
//     final scaffold=ScaffoldMessenger.of(context);
//     scaffold.showSnackBar(
//       SnackBar(content: Text('email or password is invalid',style:
//         TextStyle(
//           fontSize: 13.sp),),
//       action: SnackBarAction(
//           label: 'ok',
//         onPressed: scaffold.hideCurrentSnackBar,
//       )
//     ));
//   }
  //////////////  saved job
  var newJobId;
  // Future<void> saveJobs(jobId, id , token) async
  // {
  //   String url="https://project2.amit-learning.com/api/favorites";
  //   var dio=Dio();
  //   try{
  //     Response response=await dio.post(url,data:{'job_id': jobId, 'user_id': id});
  //     //Response response = await networkService.postData(url, {'job_id': jobId, 'user_id': id});
  //     MyCache.saveData(key: 'newJobId',
  //         value: response.data['data']['id']);
  //     newJobId=MyCache.getData(key: 'newJobID');
  //
  //   }
  //   catch(error)
  //   {
  //     print(error.toString());
  //   }
  // }


  Future<void> saveJobs(jobId, id, token) async {
    String url = "https://project2.amit-learning.com/api/favorites";
    // var dio = Dio();
    try {
      Response response = await dioHelper.postData(
          url, {'job_id': jobId, 'user_id': id});

      MyCache.saveData(key: 'newJobId', value: response.data['data']['id']);
      newJobId = MyCache.getData(key: 'newJobId')!;
    }catch(e){
      print(e.toString());
    }
  }

  ///////////get saved jobs list
  // List<JobModel> saveJobList=[];
  // Future <List> getSavedJobes(id) async
  // {
  //   Response<dynamic> data= await DioHelper.getData(url:("https://project2.amit-learning.com/api/favorites/$id"));
  //   print(id);
  //
  //
  //   //'https://project2.amit-learning.com/api/favorites/$id');
  //   List<JobModel> jobs=
  //   data.map((job) => JobModel.fromJson(job)).toList();
  //   saveJobList=jobs;
  //   emit(GetSavedJobsSeccessState());
  //   return jobs;
  // }

  List<JobModel> savedJobsList = [];
  Future<List> getSavedJobes(id) async {
    List<dynamic> data = await Api().get(url:'https://project2.amit-learning.com/api/favorites/$id');
    List<JobModel> jobs = data.map((job) =>
        JobModel.fromJson(job)).toList();
    savedJobsList = jobs;
    emit(GetSavedJobsSeccessState());
    return jobs;
  }
  //////////deletJob
Future<void> deleteJob(jobId,token )async{
    String url="https://project2.amit-learning.com/api/favorites/$jobId";
    try{
      emit(deletJobState());
      Response response=await DioHelper.dio.delete(url);
    }
    catch(error)
  {
    print(error.toString());
  }
}
/////////////////edit profile
  dynamic dio=DioHelper();
  Future<Response?> editProfile(token,userID, String name,
      String bio, String address , String mobile) async{
    try{
      Response response=await dio.put(
        'https://project2.amit-learning.com/api/user/profile/edit/${userID}',
          { 'bio': bio, 'address': address, 'mobile': mobile, 'name': name}
      );
    }
    catch(error)
    {
      print(error.toString());
    }
  }
/////////////////////updateProfile
/////////////////////searchList
  List<JobModel> searchList = [];
  void searchJobs(String query) {
    // if (query==0){
    //   searchList=[];
    // }else{
    //   searchList =  jobsList.where((job) =>
    //       job.name!.toLowerCase().contains(query.toLowerCase())).toList();
    //   emit(searchState());
    // }
    searchList =  jobsList.where((job) =>
        job.name!.toLowerCase().contains(query.toLowerCase())).toList();
    emit(searchState());

  }

}


