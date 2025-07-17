import 'package:balanced_meal/provider/needed_calories_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/routing/routes.dart';

class Enteryourdetails extends ConsumerStatefulWidget {
  const Enteryourdetails({super.key});

  @override
  ConsumerState<Enteryourdetails> createState() {
    return _EnteryourdetailsState();
  }
}

class _EnteryourdetailsState extends ConsumerState<Enteryourdetails> {
  String? selectedGender;
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  List<DropdownMenuEntry<String>> get dropDown => [
    DropdownMenuEntry(
      value: 'Male',
      label: 'Male',
      trailingIcon: selectedGender == 'Male'
          ? Icon(Icons.check, color: Color(0xffF25700))
          : null,
    ),
    DropdownMenuEntry(
      value: 'Female',
      label: 'Female',
      trailingIcon: selectedGender == 'Female'
          ? Icon(Icons.check, color: Color(0xffF25700))
          : null,
    ),
  ];

  bool valid() {
    if (weightController.text.isNotEmpty &&
        heightController.text.isNotEmpty &&
        ageController.text.isNotEmpty &&
        selectedGender != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFBFBFB),
      appBar: AppBar(
        title: Text(
          'Enter Your details',
          style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          behavior: HitTestBehavior.opaque,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: SizedBox(
                  width: 327.w,
                  height: 408.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Gender',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      DropdownMenu<String>(
                        onSelected: (value) {
                          setState(() {
                            selectedGender = value;
                          });
                        },
                        width: 327.w,
                        menuStyle: MenuStyle(
                          maximumSize: WidgetStateProperty.all(
                            Size(327.w, 200),
                          ),
                          backgroundColor: WidgetStateProperty.all(
                            Color(0xffFBFBFB),
                          ),
                        ),

                        dropdownMenuEntries: dropDown,
                        inputDecorationTheme: InputDecorationTheme(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Color(0xffEAECF0)),
                          ),
                        ),
                        label: Text(
                          'Choose your gender',
                          style: TextStyle(
                            fontFamily: 'Questrial',
                            fontWeight: FontWeight.w400,
                            color: Color(0xff959595),
                          ),
                        ),
                      ),

                      Text(
                        'Weight',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      TextFormField(
                        controller: weightController,
                        decoration: InputDecoration(
                          hintText: 'Enter your Weight',
                          suffix: Text(
                            'Kg',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Color(0xffEAECF0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Color(0xffEAECF0)),
                          ),
                        ),
                      ),

                      Text(
                        'Height',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextField(
                        controller: heightController,
                        decoration: InputDecoration(
                          hintText: 'Enter your Height',
                          suffix: Text(
                            'Cm',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Color(0xffEAECF0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Color(0xffEAECF0)),
                          ),
                        ),
                      ),

                      Text(
                        'Age',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      TextField(
                        controller: ageController,
                        decoration: InputDecoration(
                          hintText: 'Enter your Age in years',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Color(0xffEAECF0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Color(0xffEAECF0)),
                          ),
                        ),
                      ),

                      // Container(height: 150),
                    ],
                  ),
                ),
              ),
              Container(
                width: 327.w,
                height: 60.h,
                margin: EdgeInsets.symmetric(vertical: 20.h),
                child: ElevatedButton(
                  onPressed: valid()
                      ? () {
                          Navigator.pushNamed(context, Routes.order);
                          ref
                              .read(NeededCaloriesProvider.notifier)
                              .neededCalories(
                                selectedGender!,
                                int.parse(ageController.text),
                                double.parse(weightController.text),
                                double.parse(heightController.text),
                              );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: valid()
                        ? Color(0xffF25700)
                        : Color(0x00eaecf0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Next',

                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
