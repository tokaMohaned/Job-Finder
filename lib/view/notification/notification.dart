
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationroject/controller/logic/cubit/job_state.dart';
import 'package:sizer/sizer.dart';

import '../../controller/logic/cubit/job_cubit.dart';



class NotificationPage extends StatelessWidget{
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<JobCubit,JobsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          // body: SafeArea(
          //   child: Padding(
          //     padding: const EdgeInsets.only(top: 10),
          //     child: Column(
          //       children: [
          //         Row(
          //           // mainAxisAlignment: MainAxisAlignment.start,
          //           children: [
          //             IconButton(
          //                 onPressed: () {
          //                   Navigator.pop(context);
          //                 },
          //                 icon: const Icon(
          //                   Icons.arrow_back_ios_new_outlined,
          //                   size: 25,
          //                 )),
          //             SizedBox(width: 25.w,),
          //             Text(
          //               'Notification',
          //               style: TextStyle(
          //                   fontSize: 18.sp,
          //                   fontWeight: FontWeight.w500,
          //                   color: const Color(0xFF111827)),
          //             ),
          //
          //           ],
          //         ),
          //         SizedBox(height: 1.h,),
          //         Container(
          //             height: 5.h,
          //             width: 360.w,
          //             decoration: BoxDecoration(
          //                 color: const Color(0xFFF4F4F5),
          //                 border: Border.all(color: const Color(0xFFE5E7EB))),
          //             child: Row(
          //               children: [
          //                 SizedBox(width: 5.w,),
          //                 Align(
          //                   alignment: Alignment.centerLeft,
          //                   child: Text(
          //                     'New',
          //                     style: TextStyle(
          //                         fontSize: 12.sp,
          //                         fontWeight: FontWeight.w500,
          //                         color: Color(0xFF6B7280)),
          //                   ),
          //                 ),
          //               ],
          //             )),
          //         SizedBox(
          //           height: 40.h,
          //           width: 300.w,
          //           child: ListView.separated(
          //               separatorBuilder: (context, index) => const Divider(
          //                 height: 2,
          //                 endIndent: 30,
          //                 indent: 30,
          //                 thickness: 1.5,
          //               ),
          //               itemCount: notificationList.length,
          //               itemBuilder: (context, index) => ListTile(
          //                   leading: Image.asset('${notificationList[index].icon}'),
          //                   title: Text(
          //                     '${notificationList[index].title}',
          //                     style: TextStyle(
          //                         fontSize: 12.sp,
          //                         color: Color(0xFF111827),
          //                         fontWeight: FontWeight.w500),
          //                   ),
          //                   subtitle: Text('${notificationList[index].subtitle}'),
          //                   trailing: Text('${notificationList[index].time}'))),
          //         ),
          //         Container(
          //             height: 5.h,
          //             width: 360.w,
          //             decoration: BoxDecoration(
          //                 color: const Color(0xFFF4F4F5),
          //                 border: Border.all(color: const Color(0xFFE5E7EB))),
          //             child: Row(
          //               children: [
          //                 SizedBox(
          //                   width: 5.w,
          //                 ),
          //                 Align(
          //                   alignment: Alignment.centerLeft,
          //                   child: Text(
          //                     'Yesterday',
          //                     style: TextStyle(
          //                         fontSize: 12.sp,
          //                         fontWeight: FontWeight.w500,
          //                         color: Color(0xFF6B7280)),
          //                   ),
          //                 ),
          //               ],
          //             )),
          //         SizedBox(
          //           height: 2.h,
          //         ),
          //         Expanded(
          //           child: ListView.separated(
          //               separatorBuilder: (context, index) => const Divider(
          //                 height: 3,
          //                 endIndent: 30,
          //                 indent: 30,
          //                 thickness: 1.5,
          //               ),
          //               itemCount: oldNotificationList.length,
          //               itemBuilder: (context, index) => ListTile(
          //                   leading:
          //                   Image.asset('${oldNotificationList[index].icon}'),
          //                   title: Text(
          //                     '${oldNotificationList[index].title}',
          //                     style: TextStyle(
          //                         fontSize: 12.sp,
          //                         color: Color(0xFF111827),
          //                         fontWeight: FontWeight.w500),
          //                   ),
          //                   subtitle:
          //                   Text('${oldNotificationList[index].subtitle}'),
          //                   trailing: Text('${oldNotificationList[index].time}'))),
          //         ),
          //         ElevatedButton(
          //             onPressed: () async {
          //               String text = "Hello, this is the text to share!";
          //               await Share.share(text);
          //
          //             },
          //             child: Text("Share Plain Text")),
          //       ],
          //     ),
          //   ),
          // ),
        );
      },
    );
  }
}


class NotificationCard extends StatelessWidget {
  Notifications model;
  NotificationCard({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Image.asset('${model.icon}'),
        title: Text(
          '${model.title}',
          style: TextStyle(
              fontSize: 12.sp,
              color: Color(0xFF111827),
              fontWeight: FontWeight.w500),
        ),
        subtitle: Text('${model.subtitle}'),
        trailing: Text('${model.time}'));
  }
}
class Notifications {
  String? title;
  String? subtitle;
  String? icon;
  String? time;
  Notifications({
    this.title,
    this.subtitle,
    this.icon,
    this.time,
  });
}

// List<Notifications> notificationList = [
//   Notifications(
//       title: 'Dana',
//       subtitle: 'Posted new design jobs',
//       icon: AssetsImages.spectrumLogo,
//       time: '10.00AM'),
//   Notifications(
//       title: 'Shoope',
//       subtitle: 'Posted new design jobs',
//       icon: 'assets/images/Shopelogo.png',
//       time: '10.00AM'),
//   Notifications(
//       title: 'Slack',
//       subtitle: 'Posted new design jobs',
//       icon: 'assets/images/slacklogo.png',
//       time: '10.00AM'),
//   Notifications(
//       title: 'Facebook',
//       subtitle: 'Posted new design jobs',
//       icon: AssetsImages.twitterLogo,
//       time: '10.00AM')
// ];

class OldNotification {
  String? title;
  String? subtitle;
  String? icon;
  String? time;
  OldNotification({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.time,
  });
}

// List<OldNotification> oldNotificationList = [
//   OldNotification(
//       title: 'Email setup successful',
//       subtitle:
//       'Your email setup was successful with the following details: Your new email is rafifdianganz@gmail.com.',
//       icon: AssetsImages.emailIcon,
//       time: '10.00AM'),
//   OldNotification(
//       title: 'Welcome to Jobsque',
//       subtitle:
//       'Hello Rafif Dian Axelingga, thank you for registering Jobsque. Enjoy the various features that....',
//       icon: AssetsImages.searchIconBlue,
//       time: '8.00AM'),
// ];