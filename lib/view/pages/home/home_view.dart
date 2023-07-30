

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationroject/utilites/AppAssets.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/local/sharedPreference.dart';
import '../../../controller/logic/cubit/job_cubit.dart';
import '../../../controller/logic/cubit/job_state.dart';
import '../../customeWidget/constats.dart';
import '../../job_details/job_details_view.dart';
import '../../notification/notification.dart';
import '../../registration_and_login/register.dart';
import '../../search_screen/searchScreen.dart';

class HomeView extends StatefulWidget {
   static const String routName='HomeView';
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // HomeScreen({Key? key}) : super(key: key);
  var list = [];
  var name;
  bool _isSaved = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkConnectivity(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<JobCubit, JobsStates>(
        listener: (context, state) {},
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
                                  SizedBox(height: 3.h),
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
                                  Navigator.push(context, MaterialPageRoute(builder:(context)=> NotificationPage()));
                                  //navigateTo(context, const NotificationPage());
                                },
                                icon: const Icon(
                                    Icons.notifications_none_outlined)),
                          ),
                          //image: AssetImage('assets/images/ring.png')
                        ],
                      ),

                      /// search bar
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen()));
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
                            children: [
                              Image.asset(AppAssets.searchIcon),
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
                            style: TextStyle(
                              fontSize: 14.sp,
                            ),
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
                      SizedBox(
                        height: 1.h,
                      ),

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
                                  SizedBox(
                                    width: 8.w,
                                  ),
                              itemCount: list.length,
                              itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (context)=>JobDetail(jobsindex: index)));
                                },
                                child: customSuggestedJobsList(
                                    list[index], context),
                              ),
                              //list[index]
                            ),
                            fallback: (context) => const Center(
                                child: CircularProgressIndicator())),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),

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
                              style: TextStyle(
                                fontSize: 11.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      SizedBox(
                        height: 30.h,
                        child: ConditionalBuilder(
                            condition: list.isNotEmpty,
                            builder: (context) => ListView.separated(
                              physics: BouncingScrollPhysics(),
                              separatorBuilder: (context, index) =>
                                  defaultSeparatorContainer(),
                              itemCount: list.length,
                              itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (context)=>JobDetail(jobsindex: index)));
                                },
                                child: customJobsList(list[index], context),
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
      color: Colors.blue,
    ),
    child: Column(
      children: [
        Flexible(
          flex: 1,
          child: ListTile(
            leading: Image.asset(AppAssets.twitterIcon,),
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
              image: AssetImage(AppAssets.saveFilled),
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
                        style:
                        TextStyle(fontSize: 9.sp, color: Color(0xFFFFFFFF)),
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
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Apply now',
                            style:
                            TextStyle(fontSize: 9.sp, color: Colors.white),
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
        leading: Image.asset(AppAssets.twitterIcon,),
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
          onTap: () {
            var token = MyCache.getData(key: 'token')!;
            var id = MyCache.getData(key: 'id')!;

            JobCubit.get(context).saveJobs(list.id, id, token);
            // JobsCubit.get(context).getSavedJobs(id);
          },
          child: Image.asset(AppAssets.saveFilled,),
        ),
      ),
      SizedBox(height: 2.h,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
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
              SizedBox(width: 2.w,),
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
                  child: Text('Remote',style: TextStyle(
                    fontSize: 9.sp,
                  ),),
                ),
              ),
              SizedBox(width: 2.w,),
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
          Text(
            '\$${list.salary}/Month',
            style: TextStyle(fontSize: 10.sp),
          ),
        ],
      ),
      SizedBox(height: 2.h,)
    ],
  );
}

// Widget customSuggestedJobsListShimmer() {
//   return Shimmer.fromColors(
//     baseColor: Colors.red,
//     highlightColor: Colors.yellow,
//     child: Container(
//       height: 183,
//       width: 300,
//       decoration: BoxDecoration(
//         border: Border.all(
//           color: Colors.grey,
//         ),
//         borderRadius: BorderRadius.circular(15),
//         color: Colors.white,
//       ),
//       child: Column(
//         children: [
//           Flexible(
//             flex: 1,
//             child: ListTile(
//               leading: Container(color: Colors.white,),
//               title: Container(color: Colors.blue,),
//               subtitle: Container(color: Colors.white,),
//               trailing: Container(color: Colors.white,),
//             ),
//           ),
//           Flexible(
//             flex: 1,
//             child: Center(
//               child: Padding(
//                 padding: const EdgeInsets.only(right: 8, left: 8),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       width: 87,
//                       height: 30,
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           color: Colors.grey,
//                         ),
//                         borderRadius: BorderRadius.circular(20),
//                         color: Colors.white.withOpacity(0.15),
//                       ),
//                       child: Center(
//                         child: Container(color: Colors.white,),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 6.5,
//                     ),
//                     Container(
//                       width: 87,
//                       height: 30,
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           color: Colors.grey,
//                         ),
//                         borderRadius: BorderRadius.circular(20),
//                         color: Colors.white.withOpacity(0.15),
//                       ),
//                       child: Center(
//                         child: Container(color: Colors.white,),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 6.5,
//                     ),
//                     Container(
//                       width: 87,
//                       height: 30,
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           color: Colors.grey,
//                         ),
//                         borderRadius: BorderRadius.circular(20),
//                         color: Colors.white.withOpacity(0.15),
//                       ),
//                       child: Center(
//                         child: Container(color: Colors.white,),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Flexible(
//             flex: 1,
//             child: Container(
//               child: Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: Row(
//                   children: [
//                     Container(color: Colors.white,),
//                     Spacer(),
//                     // apply job
//                     InkWell(
//                       onTap: () {},
//                       child: Container(
//                         width: 96,
//                         height: 32,
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                             color: Colors.grey,
//                           ),
//                           borderRadius: BorderRadius.circular(20),
//                           color: const Color(0xFF3366FF),
//                         ),
//                         child: Center(
//                           child: Container(color: Colors.white,),
//                           ),
//                         ),
//                       ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }


// IconButton(
// icon: Icon(
// _isSaved ? Icons.bookmark : Icons.bookmark_outline,size: 36,
// color: _isSaved ? Colors.blue : Colors.grey, // Set color based on isSaved state
// ),
// onPressed: () {
// setState(() {
// _isSaved = !_isSaved; // Toggle isSaved state on button click
// });
// },
// ),