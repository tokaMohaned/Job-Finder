import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationroject/controller/logic/cubit/job_cubit.dart';
import 'package:graduationroject/controller/logic/cubit/job_cubit.dart';
import 'package:graduationroject/controller/logic/cubit/job_state.dart';
import 'package:graduationroject/utilites/AppAssets.dart';
import 'package:sizer/sizer.dart';

class JobDetail extends StatelessWidget {
  final int jobsindex;
  var list = [];

  JobDetail({super.key, required this.jobsindex});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<JobCubit, JobsStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit=JobCubit.get(context);
        list=cubit.jobsList;
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            elevation: 0,
            title:  Text('Job Detail',style: TextStyle(
              fontSize: 16.sp,
              color: Colors.black
            ),),
            centerTitle: true,
            actions: [
              Image.asset(AppAssets.saveFilled),],
          ),
          body: DefaultTabController(
            length: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ///job detail_logo_jobtitle
                  Center(
                    child: SizedBox(
                      height: 28.h,
                      width: 60.w,
                      child: Column(
                        children: [
                          Image.asset(AppAssets.twitterIcon),

                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),

          ),
        );
      },
    );
  }
}
