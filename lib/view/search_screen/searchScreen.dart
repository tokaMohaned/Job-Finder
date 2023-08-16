import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationroject/controller/logic/cubit/job_cubit.dart';
import 'package:graduationroject/controller/logic/cubit/job_state.dart';
import 'package:graduationroject/model/job_model.dart';
import 'package:graduationroject/view/search_screen/search_view_filter.dart';
import 'package:sizer/sizer.dart';

class SearchScreen extends StatefulWidget {
  static const String routName = "searchScreen";

  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchContrller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<JobCubit, JobsStates>(
      listener: (BuildContext context, Object? state) {},
      builder: (BuildContext context, state) {
        var cubit = JobCubit.get(context);
        List<JobModel> searchJobLit = cubit.jobsList;

        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //back and search bar
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back_ios_new_outlined,
                                size: 25,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Expanded(
                              flex: 7,
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                padding: EdgeInsets.fromLTRB(12, 14, 26, 10),
                                width: 10.w,
                                height: 5.h,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(90),
                                ),


                                //search textField
                                child: TextField(
                                  controller: searchContrller,
                                  onTap: () {
                                    cubit.searchJobs(searchContrller.text);

                                  },
                                  onChanged: (value) =>
                                      cubit.searchJobs(searchContrller.text),
                                  decoration: const InputDecoration.collapsed(
                                      hintText: 'Search....'),
                                ),
                              ))
                        ],
                      ),
                    ),
                    const SizedBox(height: 20,),

                    //Recent searches
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
                          child: Text('Recent searches',style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF6B7280),
                          ),),)
                        ],
                      ),
                    ),

                    //list of recent search jobs
                    SizedBox(
                      height: 200,
                      child: ConditionalBuilder(
                        condition: cubit.searchList.isEmpty,
                        builder: (context)=>
                        ListView.separated(
                          physics: BouncingScrollPhysics(),
                          separatorBuilder: (context,index)=>Divider(),
                          itemCount: cubit.searchList.length,
                          itemBuilder: (context,index)=>
                          ListTile(
                            leading: const Image(image: AssetImage("assets/images/searchIcon.jpg")),
                            trailing: Image.asset("assets/images/arrow-right.png"),
                            title: Text("${cubit.searchList[index].name}"),
                            onTap: (){
                              Navigator.pushNamed(context, SearchViewFilter.routName);
                             // Navigator.pushNamed(context, SearchScreen.routName);
                              setState(() {

                              });
                            },
                          )
                          ,

                        ),

                        fallback: (context)=>
                        InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, SearchViewFilter.routName);

                          },
                          child: ListTile(
                            leading: const Image(image: AssetImage("assets/images/clockrecentSearchIcon.png"),
                            ),
                            title: Text('junior UI designer',
                            style: TextStyle(
                              fontSize: 11.sp
                            ),),
                            trailing: const Image(image: AssetImage("assets/images/close-circle.jpg")),
                          ),
                        )
                        ,
                      )


                      // ConditionalBuilder(
                      //   condition: cubit.searchList.isEmpty,
                      //   builder: (BuildContext context) =>
                      //       ListView.separated(
                      //         physics: BouncingScrollPhysics(),
                      //         separatorBuilder: (BuildContext context, int index) =>
                      //         Divider(),
                      //
                      //         itemCount: cubit.searchList.length,
                      //         itemBuilder: (BuildContext context, int index) {
                      //            ListTile(
                      //             leading: Image(image: AssetImage("assets/images/clockrecentSearchIcon"),),
                      //             trailing: Image.asset("assets/images/close-circle"),
                      //          title: Text('${cubit.searchList[index].name}'),
                      //              onTap: (){
                      //               Navigator.pushNamed(context, SearchViewFilter.routName);
                      //              },
                      //
                      //           );
                      //         },
                      //
                      //   ),
                      //   fallback: (BuildContext context) {
                      //     InkWell(
                      //       onTap: (){
                      //         Navigator.pushNamed(context, SearchViewFilter.routName);
                      //       },
                      //       child: ListTile(
                      //         leading: const Image(image: AssetImage("assets/images/"),),
                      //       ),
                      //     );
                      //   },
                      //   // child: ListView.separated(
                      //   //     itemBuilder: itemBuilder, separatorBuilder: separatorBuilder, itemCount: itemCount),
                      // ),
                    ),

                    //Popular searches
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
                            child: Text('Popular searches',style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF6B7280),
                            ),),)
                        ],
                      ),
                    ),

                    //list of popular search jobs
                    SizedBox(
                        height: 200,
                        child: ConditionalBuilder(
                          condition: cubit.searchList.isEmpty,
                          builder: (context)=>
                              ListView.separated(
                                physics: BouncingScrollPhysics(),
                                separatorBuilder: (context,index)=>Divider(),
                                itemCount: cubit.searchList.length,
                                itemBuilder: (context,index)=>
                                    ListTile(
                                      leading: const Image(image: AssetImage("assets/images/clockrecentSearchIcon.png"),
                                      ),
                                      title: Text('junior UI designer',
                                        style: TextStyle(
                                            fontSize: 11.sp
                                        ),),
                                      trailing: const Image(image: AssetImage("assets/images/close-circle.jpg")),
                                    ),


                              ),

                          fallback: (context)=>
                              InkWell(
                                onTap: (){
                                  Navigator.pushNamed(context, SearchViewFilter.routName);

                                },
                                child:
                                ListTile(
                                  leading: const Image(image: AssetImage("assets/images/searchIcon.jpg")),
                                  trailing: Image.asset("assets/images/arrow-right.png"),
                                  title: Text("UI/UX desinger"),
                                  // title: Text("${cubit.searchList[index].name}"),
                                  onTap: (){
                                    Navigator.pushNamed(context, SearchViewFilter.routName);
                                    // Navigator.pushNamed(context, SearchScreen.routName);
                                    setState(() {

                                    });
                                  },
                                )

                              )
                          ,
                        )


                      // ConditionalBuilder(
                      //   condition: cubit.searchList.isEmpty,
                      //   builder: (BuildContext context) =>
                      //       ListView.separated(
                      //         physics: BouncingScrollPhysics(),
                      //         separatorBuilder: (BuildContext context, int index) =>
                      //         Divider(),
                      //
                      //         itemCount: cubit.searchList.length,
                      //         itemBuilder: (BuildContext context, int index) {
                      //            ListTile(
                      //             leading: Image(image: AssetImage("assets/images/clockrecentSearchIcon"),),
                      //             trailing: Image.asset("assets/images/close-circle"),
                      //          title: Text('${cubit.searchList[index].name}'),
                      //              onTap: (){
                      //               Navigator.pushNamed(context, SearchViewFilter.routName);
                      //              },
                      //
                      //           );
                      //         },
                      //
                      //   ),
                      //   fallback: (BuildContext context) {
                      //     InkWell(
                      //       onTap: (){
                      //         Navigator.pushNamed(context, SearchViewFilter.routName);
                      //       },
                      //       child: ListTile(
                      //         leading: const Image(image: AssetImage("assets/images/"),),
                      //       ),
                      //     );
                      //   },
                      //   // child: ListView.separated(
                      //   //     itemBuilder: itemBuilder, separatorBuilder: separatorBuilder, itemCount: itemCount),
                      // ),
                    ),



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
