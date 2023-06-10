
import 'package:dio/dio.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:graduationroject/controller/remote/dio/dio_helper.dart';

import '../../../model/job_model.dart';
import '../../../view/pages/home/home.dart';
import '../../../view/pages/screens/Job_application.dart';
import '../../../view/pages/screens/contact_page.dart';
import '../../../view/pages/screens/profile.dart';
import '../../../view/pages/screens/saved_jobs.dart';
import '../../local/sharedPreference.dart';
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
    Profile(),
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
    emit(NewsNtmNavState());
    // if(index==3){
    //   getSavedJobs(MyCache.getData(key: 'id'));
    // }
    // emit(NewsNtmNavState());
  }
//git the jobs
  List<jobsModel> jobsList = [];
  Future<List> getAllJobs() async {

    List<dynamic> dataDio=await DioHelper.getData(url: 'http://167.71.79.133/api/jobs');
    //List<dynamic> data = await Api().get(url:'http://167.71.79.133/api/jobs');
    List<jobsModel> jobs = dataDio.map((job) =>
        jobsModel.fromJson(job)).toList();

    jobsList = jobs;
    emit(GetJobsSuccessState());
    return dataDio;
  }
//log in
  String? name ;
  Future<void> login(email,password,context) async {
    String url = "http://164.92.246.77/api/auth/login";
    emit(loginLoadingsState());
    Response response;
    var dio = Dio();
    response = await dio.post(url, data: {"password": password, "email": email,});

    MyCache.saveData(key: 'token', value: response.data['token']);
    MyCache.saveData(key: 'id', value:  response.data['user']['id']);
    MyCache.saveData(key: 'name', value:  response.data['user']['name']);
    name = MyCache.getData(key: 'name')!;
    emit(LoginSuccessState());
    if (response.statusCode==401){
      showToast(context);

    }else {
      navigateTo(context, HomeScreen());
    }
    print (name);
  }
  void showToast( context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Added to favorite'),
        action: SnackBarAction(
            label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  Future<void> register(name,email,password,context) async {
    String url = "http://167.71.79.133/api/auth/register";
    try{
      Response response=await networkService.
    }
    catch{

    }
    // Response response;
    // var dio = Dio();
    // response = await dio.post(url,
    //     data: {
    //       'name':'saad',
    //       'email':'saad@gmail.com',
    //       'password':'123456'
    //     });
    // print(response.data);
  }


  List<JobsModel> searchList = [];
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


