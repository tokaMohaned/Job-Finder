import 'package:chip_list/chip_list.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:graduationroject/utilites/AppAssets.dart';
import 'package:graduationroject/view/customeWidget/main_button.dart';
import 'package:sizer/sizer.dart';

class ChipsBottomSheet extends StatelessWidget {
 //  ChipsBottomSheet({super.key});
  final List<String> jobTypeList=[
    'Remote',
    'Onsite',
    'Hybird',
    'Any',
  ];

  @override
  Widget build(BuildContext context) {
    return  Builder(
        builder: (context)
    {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(height: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(AppAssets.topLine),
              const SizedBox(height: 15,),
              Text("On-sit/ Remote", style:
              TextStyle(fontSize: 17.sp),),
              const SizedBox(height: 15,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ChipList(
                  listOfChipNames:jobTypeList,
                  supportsMultiSelect: true,
                  activeBgColorList: const[
                    Color(0xFFD6E4FF),
                    // Color(0xFFD6E4FF),
                    // Color(0xFFD6E4FF),
                    // Color(0xFFD6E4FF)
                  ],

                  inactiveBgColorList: const [Colors.white],
                  activeTextColorList: [Colors.blue.shade900],
                  inactiveTextColorList: const [Colors.black],
                  inactiveBorderColorList: const [Colors.black],
                  activeBorderColorList: const [Color(0xFF3366FF)],
                  borderRadiiList: const [100],
                  style: TextStyle(fontSize: 11.sp),
                  listOfChipIndicesCurrentlySeclected: [0],

                ),

              ],
              ),
              const SizedBox(height: 50,),
              MainButton(text: 'Show result ', onTap: (){})
            ],
          ),
        ),
      );
    });
  }
}
