import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationroject/controller/logic/cubit/job_cubit.dart';
import 'package:graduationroject/controller/logic/cubit/job_cubit.dart';
import 'package:graduationroject/controller/logic/cubit/job_state.dart';
import 'package:sizer/sizer.dart';

class JobApplication extends StatefulWidget {
  const JobApplication({Key? key}) : super(key: key);

  @override
  State<JobApplication> createState() => _JobApplicationState();
}

class _JobApplicationState extends State<JobApplication> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<JobCubit, JobsStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            toolbarHeight: 5.h,
            title: Text("Apply Job", style: TextStyle(
                color: Colors.black,
              fontSize: 16.sp,
            ),),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
          ),
        body: Column(
          children: [

          ],
        ),
        );
      },
    );
  }
}
