//part of 'job_cubit.dart';

// abstract class JobState {}
//
// class JobInitial extends JobState {}

abstract class JobsStates {}

class NewsInitialState extends JobsStates{}

class NewsNtmNavState extends JobsStates{}

class GetJobsSuccessState extends JobsStates{}

class loginLoadingsState extends JobsStates{}

class LoginSuccessState extends JobsStates{}
class searchState extends JobsStates{}

// class NewsGetLoadingsState extends JobsStates{}
//
// class NewsGetBusinessErrorState extends JobsStates{
//   final String error;
//   NewsGetBusinessErrorState(this.error);
// }