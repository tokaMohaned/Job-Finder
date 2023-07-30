import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../controller/logic/cubit/job_cubit.dart';
import '../../../controller/logic/cubit/job_state.dart';

//this class for bottomNavigation bar of home
class BottomNavBar extends StatelessWidget {
  static const String routName = "HomeScreenBottomNavBar";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<JobCubit,JobsStates>(
      listener: (context, state) {},
      builder:(context, state) {
        var cubit = JobCubit.get(context);
        return Scaffold(
          body: cubit.Screans[cubit.currentIndexs],

          ///  bottomNavigation Bar
          bottomNavigationBar: BottomNavigationBar(
            showUnselectedLabels: true,
            selectedItemColor: const Color(0xFF3366FF),
            unselectedItemColor: const Color(0xFF9CA3AF),
            currentIndex: cubit.currentIndexs,
            onTap: (index) {
              cubit.changeIndexBtmNav(index);
            },
            items: cubit.bottomNavItem,
          ),
        );
      },
    );
  }
}