import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationroject/controller/logic/cubit/job_cubit.dart';
import 'package:graduationroject/controller/logic/cubit/job_state.dart';
import 'package:graduationroject/utilites/AppAssets.dart';
import 'package:graduationroject/view/job_details/job_details_view.dart';
import 'package:graduationroject/view/job_details/job_details_view.dart';
import 'package:sizer/sizer.dart';

class DescriptionPage extends StatelessWidget {
  final int jobsIndex;

  DescriptionPage({super.key, required this.jobsIndex});

  var list = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<JobCubit, JobsStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit=JobCubit.get(context);
        list=cubit.jobsList;
        return Column(
          children: [
             ListTile(
               title: Text('Job Description', style: TextStyle(color: Colors.black,
               fontWeight: FontWeight.bold,
                 fontSize: 13.sp
               ),),
               subtitle: Text('${list[jobsIndex].jobDescription}',
               style: TextStyle(color: Color(0xFF4B5563),
              height: 1.5,
                   fontSize: 9.sp
               ),
               ),
             ),
            SizedBox(height: 1.h,),
            ListTile(
              title: Text('Skill Required', style: TextStyle(color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 13.sp
              ),),
              subtitle: Text('${list[jobsIndex].jobSkill}',
                style: TextStyle(color: Color(0xFF4B5563),
                    height: 1.5,
                    fontSize: 9.sp
                ),
              ),
            ),

          ],
        );
      },
    );
  }
}

class CompanyPage extends StatelessWidget {
  final int jobindex;
   CompanyPage({super.key, required this.jobindex});

  var list=[];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<JobCubit, JobsStates>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    var cubit=JobCubit.get(context);
    list=cubit.jobsList;
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 280.0),
            child: Text('Contact Us',style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.bold,
              color: Color(0xFF111827)
            ),),
          ),
          SizedBox(height: 1.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Container(
              padding: EdgeInsets.all(12),
              height: 11.h,
              width: 40.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0xFFE5E7EB),width: 1),
                color: Colors.white
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Email",style: TextStyle(
                    fontSize: 10.sp,
                    color: Color(0xFF9CA3AF)
                  ),),
                  SizedBox(height: 1.h,),
                  Text("${list[jobindex].compEmail}",style: TextStyle(
                      fontSize: 10.sp,
                      color: Colors.black
                  ))

                ],
              ),
            ),
              Container(
                padding: EdgeInsets.all(12),
                height: 11.h,
                width: 40.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xFFE5E7EB),width: 1),
                    color: Colors.white
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Website",style: TextStyle(
                        fontSize: 10.sp,
                        color: Color(0xFF9CA3AF)
                    ),),
                    SizedBox(height: 1.h,),
                    Text("${list[jobindex].compWebsite}",style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.black
                    )),


                  ],
                ),
              )

            ],
          ),
          SizedBox(height: 1.h,),
          ListTile(
            title: Text('About Company', style: TextStyle(color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 13.sp
            ),),
            subtitle: Text('${list[jobindex].aboutComp}',
              style: TextStyle(color: Color(0xFF4B5563),
                  height: 1.5,
                  fontSize: 9.sp
              ),
            ),
          ),

          // Padding(
          //   padding: const EdgeInsets.only(right: 280.0),
          //   child: Text('About Company',style: TextStyle(
          //       fontSize: 10.sp,
          //       fontWeight: FontWeight.bold,
          //       color: Color(0xFF111827)
          //   ),),
          // ),
          SizedBox(height: 1.h,),

        ],
      ),
    );
  },
);
  }
}


class People extends StatefulWidget {
  const People({Key? key}) : super(key: key);

  @override
  State<People> createState() => _PeopleState();
}

class _PeopleState extends State<People> {
  String? value;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text("6 Emplyess For", style: TextStyle(
                     fontSize: 18,
                     fontWeight: FontWeight.bold
                   ),),
                   SizedBox(height: 1.h,),
                   Text("UI/ UX Design "),

                 ],
               ),
              DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffD1D5DB),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 12),
                width: 30.w,
                child: DropdownButton(
                  iconSize: 26,
                  style: TextStyle(fontSize: 9.sp,
                  color: Color(0xFF111827),
                  ),
                  icon: Icon(Icons.keyboard_arrow_down),
                  isExpanded: true,
                  underline: Container(),
                  items: [
                    'UI/UX Desinger',
                    'UI/UX',
                    'ART',
                  ].map((element) =>
                      DropdownMenuItem(child: Text('$element'),
                        value: element,


                      //  value: element,
                      )).toList(),
                  onChanged: ( data) {
                    setState(() {
                     value=data;
                    });
                  },
                  //////////////////////////////////
                  //value: value!.isNotEmpty? value:value,
                ),

              ),
              ),
              ],
            ),
          ),
        SizedBox(height: 2.h,),
        Expanded(child: ListView.separated(
            itemBuilder: (context,index)=>ProfileWidget(),
            separatorBuilder: (context,index)=> Divider(
              height: 5.h,
              thickness: 1.5,
              color: Color(0xFFE5E7EB),
            ),
            itemCount: 6))
      ],
    );
  }
}

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        //Spacer(),
        CircleAvatar(
         // backgroundColor: Colors.transparent,
          child: Image.asset(AppAssets.twitterIcon,
            //fit: BoxFit.cover,
            height: 8.h,
          ),
        ),
        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("toka",style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.w700,
                color: Color(0xFF111827)), ),
            SizedBox(height: 1.h,),
            Text("Senior UI/UX Designer at Twitter", style: TextStyle(
                fontSize: 9.sp,
               // fontWeight: FontWeight.w700,
                color: Color(0xFF6B7280)),),

          ],
        ),
        Spacer(flex: 3,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text("working during"),
            SizedBox(height: 1.h,),
            Text("5 Years", style: TextStyle(
              color: Colors.blue
            ),)
          ],
        )
      ],
    );
  }
}
