//import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:graduationroject/controller/logic/cubit/job_state.dart';
import 'package:graduationroject/utilites/AppAssets.dart';
import 'package:graduationroject/view/search_screen/searchScreen.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/logic/cubit/job_cubit.dart';
import '../../customeWidget/main_button.dart';
import '../../job_details/job_details_view.dart';
import '../../registration_and_login/register.dart';
import 'BottomNavBar.dart';

//
class HomePage extends StatefulWidget {
  static const String routName = "HomePage";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // HomeScreen({Key? key}) : super(key: key);
  var list = [];

  var name ;
  bool isSaved=false;

  void initState()
  {
    super.initState();
    checkConnectivity(context);
  }


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<JobCubit, JobsStates>(
        listener: (context, state) {   },
        builder: (context, state) {

          var cubit = JobCubit.get(context);
          list = cubit.jobsList;
          name = cubit.name;

          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.all(24.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// hi and notification
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Hi, $name 👋',
                                    style: TextStyle(
                                      fontSize: 19.sp,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                  SizedBox(height: 3.h,),
                                  Text(
                                    'Create a better future for yourself here',
                                    style: TextStyle(
                                        fontSize: 11.sp, color: Colors.grey),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(30),
                              //color: Colors.redAccent
                            ),
                            child: IconButton(
                                onPressed: () {
                                 // navigateTo(context,  NotificationPage());
                                //  Navigator.pushNamed(context, NotificationPage)
                                },
                                icon: const Icon(Icons.notifications_none_outlined)),
                          ),
                          //image: AssetImage('assets/images/ring.png')
                        ],
                      ),

                      /// search bar
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, SearchScreen.routName);
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(12, 14, 26, 10),
                          width: double.infinity,
                          height: 52,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Row(
                            children:[
                              const Image(
                                image: AssetImage('assets/images/searchIcon.jpg'),
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              const Expanded(
                                child: Text('Search....'),
                              ),
                            ],
                          ),
                        ),
                      ),

                      /// Suggested Job
                      Row(
                        children: [
                          Text(
                            'Suggested Job',
                            style: TextStyle(fontSize: 14.sp,),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {

                              print(cubit.name);

                            },
                            child: Text(
                              'View all',
                              style: TextStyle(
                                fontSize: 11.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 1.h,),
                      /// card
                      SizedBox(
                        width: double.infinity,
                        height: 21.h,
                        child: ConditionalBuilder(
                            condition: list.isNotEmpty,
                            builder: (context) => ListView.separated(
                              scrollDirection: Axis.horizontal,
                              // padding: EdgeInsets.only(left: 16,right: 6),
                              physics: BouncingScrollPhysics(),
                              separatorBuilder: (context, index) =>
                                  SizedBox(width: 8.w,),
                              itemCount: list.length,
                              itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  //Navigator.push(context, JobDetail.routName as Route<Object?>);
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>JobDetail(jobsindex: index)));
                                },
                                child:
                                customSuggestedJobsList(list[index], context),
                              ),
                              //list[index]
                            ),
                            fallback: (context) => const Center(
                                child: CircularProgressIndicator())),
                      ),
                      SizedBox(height: 2.h,),

                      /// recent job & view all
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Recent Job',
                            style: TextStyle(
                              fontSize: 14.sp,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'View all',
                              style: TextStyle(fontSize: 11.sp,),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 1.h,),
                      SizedBox(
                        height: 30.h,
                        child: ConditionalBuilder(
                            condition: list.isNotEmpty,
                            builder: (context) => ListView.separated(
                              physics: BouncingScrollPhysics(),
                              separatorBuilder: (context, index) =>
                              Container(
                                width: double.infinity,
                                height: 4,
                                color: Colors.grey[300],
                              ),
                              itemCount: list.length,
                              itemBuilder: (context, index) =>
                                  InkWell(
                                    onTap: () {
                                      navigateTo(context, JobDetail(jobsindex:index));
                                    },
                                    child:
                                    customJobsList(list[index], context),
                                  ),
                            ),
                            fallback: (context) => const Center(
                                child: CircularProgressIndicator())),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}

Widget customSuggestedJobsList(list, BuildContext context) {
  return Container(
    height: 183,
    width: 300,
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.grey,
      ),
      borderRadius: BorderRadius.circular(15),
      color: Color(0xFF091A7A),
    ),
    child: Column(
      children: [
        Flexible(
          flex: 1,
          child: ListTile(
            leading: const Image(
              image: AssetImage(AppAssets.twitterIcon),
            ),
            title: Text(
              '${list.name}',
              style: TextStyle(fontSize: 13.sp, color: Colors.white),
              textAlign: TextAlign.start,
            ),
            subtitle: Text(
              '${list.compName}',
              style: TextStyle(fontSize: 9.sp, color: Colors.grey),
              textAlign: TextAlign.start,
            ),
            trailing: const Image(
              image: AssetImage(AppAssets.saveNotFilled,),
              color: Colors.white,
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 8, left: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 87,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white.withOpacity(0.15),
                    ),
                    child: Center(
                      child: Text(
                        '${list.jobTimeType}',
                        style: TextStyle(
                            fontSize: 9.sp, color: const Color(0xFFFFFFFF)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 6.5,
                  ),
                  Container(
                    width: 87,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white.withOpacity(0.15),
                    ),
                    child: Center(
                      child: Text(
                        'Onsite',
                        style: TextStyle(
                            fontSize: 9.sp, color: Color(0xFFFFFFFF)),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 6.5,
                  ),
                  Container(
                    width: 87,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white.withOpacity(0.15),
                    ),
                    child: Center(
                      child: Text(
                        '${list.jobLevel}',
                        style: TextStyle(
                            fontSize: 9.sp, color: const Color(0xFFFFFFFF)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Text(
                    '\$${list.salary}/Month',
                    style: TextStyle(fontSize: 14.sp, color: Colors.white),
                    textAlign: TextAlign.start,
                  ),
                  Spacer(),
                  // apply job
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 96,
                      height: 32,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFF3366FF),
                      ),
                      child: Center(
                        child: InkWell(
                          onTap: () {},
                          child: Text(
                            'Apply now',
                            style: TextStyle(
                                fontSize: 9.sp, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget customJobsList(list, BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      ListTile(
        leading: const Image(
          image: AssetImage(AppAssets.twitterIcon),
        ),
        title: Text(
          '${list.name}',
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '${list.compName}',
          style: TextStyle(
            fontSize: 9.sp,
          ),
          textAlign: TextAlign.start,
        ),
        trailing: GestureDetector(
          onTap: () {},
          child: const Image(
            image: AssetImage(AppAssets.saveNotFilled),
          ),
        ),
      ),
      SizedBox(
        height: 12,
      ),
      Row(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 70,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFD6E4FF),
                  ),
                  child: Center(
                    child: Text(
                      '${list.jobTimeType}',
                      style: TextStyle(
                        fontSize: 9.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 6.5,
                ),
                Container(
                  width: 70,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFD6E4FF),
                  ),
                  child: Center(
                    child: Text(
                      'Remote',
                      style: TextStyle(
                        fontSize: 9.sp,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                SizedBox(
                  width: 6.5,
                ),
                Container(
                  width: 70,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFD6E4FF),
                  ),
                  child: Center(
                    child: Text(
                      '${list.jobLevel}',
                      style: TextStyle(
                        fontSize: 9.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Text(
            '\$${list.salary}/Month',
            style: TextStyle(fontSize: 10.sp),
          ),
        ],
      ),
      SizedBox(
        height: 2.h,
      ),

    ],

  );

}

