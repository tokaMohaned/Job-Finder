import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationroject/controller/logic/cubit/job_cubit.dart';
import 'package:graduationroject/controller/logic/cubit/job_state.dart';
import 'package:graduationroject/model/job_model.dart';
import 'package:graduationroject/utilites/AppAssets.dart';
import 'package:sizer/sizer.dart';

import '../customeWidget/Fliter_bottom_sheet.dart';
import '../customeWidget/chips_bottom_sheet.dart';
import '../customeWidget/constats.dart';
import '../job_details/job_details_view.dart';
import '../pages/home/home.dart';

class SearchViewFilter extends StatelessWidget {
  static const String routName = "search view filter";

  const SearchViewFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<JobCubit, JobsStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
       var cubit=JobCubit.get(context);
       List<JobModel> jobList=cubit.jobsList;
        return  Scaffold(
         body: SafeArea(
           child: Padding(
             padding: EdgeInsets.only(top: 10),
             child: SingleChildScrollView(
               child: Column(
                children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                       children: [
                       Expanded(
                           flex:1,
                           child:
                       IconButton(
                           onPressed: (){
                            Navigator.pop(context);
                           },
                           icon: const Icon(Icons.arrow_back_ios_new_outlined,
                           size: 25,
                           ))),
                        SizedBox(width: 5.w,),
                        Expanded(
                            flex: 7,
                            child:Container(
                             margin:  const EdgeInsets.fromLTRB(0, 0, 0, 0),
                             padding: const EdgeInsets.fromLTRB(12, 14, 26, 10),
                             width: 300,
                             height: 52,
                             decoration: BoxDecoration(
                              border: Border.all(
                               color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(90),
                             ),
                             child: Row(
                              children: [
                               Image(image: AssetImage("assets/images/searchIcon.jpg")),
                              SizedBox(width: 10,),
                                Expanded(child: TextField(
                                  decoration: InputDecoration.collapsed(hintText: 'Search...'),
                                ))
                              ],
                             ),
                            )),
                       ],
                      ),
                    ),

                  const SizedBox(height: 10,),
                  Padding(padding:EdgeInsets.fromLTRB(12, 0, 12, 0),
                  child: Row(
                    children: [
                      Expanded(
                         // flex: 1,
                          child:IconButton(
                            onPressed: ()
                            {
                              //to dedicate the filter
                              showModalBottomSheet(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25.0),
                                    topRight: Radius.circular(25.0),
                                  ),

                                ),
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (context)
                              {
                                return const FilterBottomSheet();
                              });
                            },
                            icon: Image.asset(AppAssets.settingIcon),
                          )),
                      SizedBox(width: 1.w,),
                      Expanded(
                          flex: 10,
                          child: Row(
                        children: [
                          Expanded(
                              flex: 3,
                              child: ActionChip(
                                label: const Text('Remote'),
                                labelStyle: const TextStyle(
                                  color: Colors.white, fontSize: 16,),
                                avatar: const Icon(Icons.arrow_drop_down,color: Colors.white,),
                                backgroundColor: Color(0xff091A7A),
                                onPressed: () {
                                  showModalBottomSheet(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(25.0)
                                          )
                                      ),
                                      context: context,
                                      isScrollControlled: true,
                                      builder: (BuildContext context) {
                                        return ChipsBottomSheet();
                                      });

                                })),
                            SizedBox(width: 1.w,),

                          Expanded(
                              flex: 3,
                              child: ActionChip(
                                  label: const Text('Full time'),
                                  labelStyle: const TextStyle(
                                    color: Colors.white, fontSize: 16,),
                                  avatar: const Icon(Icons.arrow_drop_down,color: Colors.white,),
                                  backgroundColor: Color(0xff091A7A),
                                  onPressed: () {
                                    showModalBottomSheet(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(25.0)
                                            )
                                        ),
                                        context: context,
                                        isScrollControlled: true,
                                        builder: (BuildContext context) {
                                          return ChipsBottomSheet();
                                        });

                                  })),
                          SizedBox(width: 1.w,),

                          Expanded(
                              flex: 3,
                              child: ActionChip(
                                  label: const Text('Post date'),
                                  labelStyle: const TextStyle(
                                    color: Colors.white, fontSize: 16,),
                                  avatar: const Icon(Icons.arrow_drop_down,color: Colors.white,),
                                  backgroundColor: Color(0xff091A7A),
                                  onPressed: () {
                                    showModalBottomSheet(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(25.0)
                                            )
                                        ),
                                        context: context,
                                        isScrollControlled: true,
                                        builder: (BuildContext context) {
                                          return ChipsBottomSheet();
                                        });

                                  })),
                          //SizedBox(width: 2.w,),
                        ],
                      )),

                      const SizedBox(
                        height: 20,
                      ),

                      ///Featuring 120+ jobs

                    ],
                  ),
                  ),
                  Container(
                    height: 5.h,
                    width: 360.w,
                    decoration: BoxDecoration(
                        color: const Color(0xFFF4F4F5),
                        border: Border.all(color: Color(0xFFE5E7EB))
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 5.w,),
                        Align(alignment: Alignment.centerLeft,
                          child: Text('Featuring 120+ jobs',style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF6B7280),
                          ),),)
                      ],
                    ),
                  ),
                   ///job list
                  SizedBox(height: 30.h,
                  child:ConditionalBuilder(
                    condition: jobList.isNotEmpty,
                    builder: (context)=> ListView.separated(
                      physics: BouncingScrollPhysics(),
                      separatorBuilder: (context,index)=>
                      defaultSeparatorContainer(),
                      itemCount: jobList.length,
                      itemBuilder: (BuildContext context, int index) =>
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>
                          JobDetail(jobsindex: index,)
                          ));
                          print("success");
                        },
                        child: customJobsList(jobList[index],context),
                      )
                      ,
                    ), fallback: (BuildContext context)=>
                     const Center(
                       child: CircularProgressIndicator(),
                     ),
                  ) ,
                  )

                ],
               ),
             ),
           ),
         ),
        );
      },
    );
  }
}
