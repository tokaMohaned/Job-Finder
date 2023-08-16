import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationroject/controller/logic/cubit/job_cubit.dart';
import 'package:graduationroject/controller/logic/cubit/job_cubit.dart';
import 'package:graduationroject/controller/logic/cubit/job_state.dart';
import 'package:graduationroject/utilites/AppAssets.dart';
import 'package:graduationroject/view/customeWidget/main_button.dart';
import 'package:graduationroject/view/pages/screens/Job_application.dart';
import 'package:sizer/sizer.dart';

import '../customeWidget/default_text.dart';
import '../pages/screens/profile.dart';
import 'job_details_3custom_tabs.dart';

class JobDetail extends StatelessWidget {
  static const String routName="JobDetail";
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
                          Image.asset(AppAssets.twitterIcon,height: 8.h,
                            width: 20.w,
                            fit: BoxFit.contain,),


                          ////////////////////////////////////////////////////////////////////////again
                          SizedBox(height: 3.h),
                          Text(

                            '${list[jobsindex].name}',
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 1.h),
                          Text(
                            '${list[jobsindex].compName}',
                            style: TextStyle(fontSize: 10.sp, color: Colors.black),
                          ),
                          SizedBox(height: 2.h,),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 4.h,
                                    width: 20.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: const Color(0xFFD6E4FF),
                                    ),
                                    child: Center(
                                        child: Text(
                                          '${list[jobsindex].jobTimeType}',
                                          style: TextStyle(
                                              fontSize: 10.sp,
                                              color: const Color(0xFF3366FF)),
                                        )),
                                  ),
                                ),
                                SizedBox(width: 1.w,),
                                Expanded(
                                  child: Container(
                                    height: 4.h,
                                    width: 20.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: const Color(0xFFD6E4FF),
                                    ),
                                    child: Center(
                                        child: Text(
                                          'Onsite',
                                          style: TextStyle(
                                              fontSize: 10.sp,
                                              color: const Color(0xFF3366FF)),
                                        )),
                                  ),
                                ),
                                SizedBox(width: 1.w,),
                                Expanded(
                                  child: Container(
                                    height: 4.h,
                                    width: 20.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: const Color(0xFFD6E4FF),
                                    ),
                                    child: Center(
                                        child: Text(
                                          '${list[jobsindex].jobLevel}',
                                          style: TextStyle(
                                              fontSize: 10.sp,
                                              color: const Color(0xFF3366FF)),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                  ),
                  /// tab bar
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFF4F4F5),
                          borderRadius: BorderRadius.circular(20)),
                      height: 5.h,
                      width: 90.w,
                      child: TabBar(
                        labelColor: Colors.white,
                        unselectedLabelColor: Color(0xFF6B7280),
                        indicator: BoxDecoration(
                          color: Color(0xFF02337A),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        tabs: [
                          SizedBox(
                            height: 5.h,
                            child: Center(
                                child: Text(
                                  'Description',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                  ),
                                )),
                          ),
                          SizedBox(
                            height: 5.h,
                            child: Center(
                                child: Text(
                                  'Company',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                  ),
                                )),
                          ),
                          SizedBox(
                            height: 5.h,
                            child: Center(
                                child: Text(
                                  'People',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  /// 3 tabs
                  Expanded(
                    child: TabBarView(
                      children: [
                        DescriptionPage(jobsIndex: jobsindex,),
                        CompanyPage( jobindex: jobsindex,),
                        People(),
                      ],
                    ),

                  ),
                 // Spacer(flex: 3,),

                  MainButton(text: 'Apply Now',
                      onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>JobApplication()));
                    // navigateTo(context,JobApplication() );
                  }),

          //          ElevatedButton(
          //           onPressed:  ()
          //     {
          //          Navigator.push(context, MaterialPageRoute(builder: (context)=>JobApplication()));
          // // navigateTo(context,JobApplication() );
          // },
          //           style: ElevatedButton.styleFrom(
          //               backgroundColor: Colors.transparent,
          //               shape: RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.circular(1000),
          //               )
          //           ),
          //
          //           child: Center(
          //             child: DefaultText(
          //               text:("log in"),
          //               fontSize: 14.sp,
          //               color: Colors.white,
          //             ),
          //           ),
          //         ),



                ],
              ),
            ),
          ),
         //  floatingActionButton: Container(
         //      color: Colors.transparent,
         //      child: MainButton(text: 'Apply Now', onTap: () {
         //        Navigator.push(context, MaterialPageRoute(builder: (context)=>JobApplication()));
         //       // navigateTo(context,JobApplication() );
         //      })
         //  ),
         //
         // floatingActionButtonLocation:
         // FloatingActionButtonLocation.centerFloat,


        );
      });
  }
}