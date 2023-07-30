import 'package:chip_list/chip_list.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:graduationroject/utilites/AppAssets.dart';
import 'package:graduationroject/view/customeWidget/customtTextFormField.dart';
import 'package:graduationroject/view/customeWidget/main_button.dart';
import 'package:sizer/sizer.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  final List<String> jobTypeList=[
    'Full Time',
    'Remote',
    'Contract',
    'Part Time',
  ];
  @override
  Widget build(BuildContext context) {
    return  Builder(
        builder: (context)
    {
      return Padding(padding: EdgeInsets.all(16.0),
      child: SizedBox(height: 700,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: ()
                  {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back,
                  size: 25,
                  )),
              Text('Set Filter', style: TextStyle(
                fontSize: 17.sp,
              ),),
              TextButton(onPressed: (){},
                  child: Text("Rest",
                    style: TextStyle(
                    fontSize: 12.sp,
                  ),)),
            ],
          ),
          const SizedBox(height: 15,),
          Text('Job Tittle', style: TextStyle(
            fontSize: 12.sp,
            color: Colors.black,
          ),),
           const SizedBox( height: 15,),
          CustomTextFormField(
              image: AppAssets.jobTitleIcon,
              hintText: 'UI/UX Designer'),


          const SizedBox(height: 15,),
          Text('Location', style: TextStyle(
            fontSize: 12.sp,
            color: Colors.black,
          ),),
          const SizedBox( height: 15,),
          CustomTextFormField(
              image: AppAssets.location,
              hintText: 'Jakarta, Indonesia'),


          const SizedBox(height: 15,),
          Text('Salary', style: TextStyle(
            fontSize: 12.sp,
            color: Colors.black,
          ),),
          const SizedBox( height: 15,),
          CustomTextFormField(
              image: AppAssets.dollarIcon,
              hintText: '5K - 10K'),

          const SizedBox(height: 15,),
          Text('Job Type', style: TextStyle(
            fontSize: 12.sp,
            color: Colors.black,
          ),),
          const SizedBox(height: 25,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,

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
              inactiveBgColorList: const [
                Colors.white
              ],
              activeTextColorList: [Colors.blue.shade900],
              inactiveTextColorList: const[Colors.black],
              inactiveBorderColorList: const[Colors.black],
              activeBorderColorList: const[Color(0xFF3366FF)],
              borderRadiiList: const[100],
              style: TextStyle(fontSize: 11.sp),
              listOfChipIndicesCurrentlySeclected: [0],

            ),


          ],
        ),
          const SizedBox(height: 140,),
          MainButton(text: 'Show result', onTap: (){})

        ],

      ),
      ),
      );
    });
  }
}
