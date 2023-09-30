import 'package:flutter/material.dart';
import 'package:patient_journey/constants/app_assets.dart';
import 'package:patient_journey/constants/app_colors.dart';

class MedicalFilesScreen extends StatefulWidget {
  const MedicalFilesScreen({super.key});

  @override
  State<MedicalFilesScreen> createState() => _MedicalFilesScreenState();
}

class _MedicalFilesScreenState extends State<MedicalFilesScreen> {
  final List<String> _currentDoctors = ['Doctor1', 'Doctor2'];
  final List<String> _treatmentPlans = ['Plans1', 'Plans2'];
  final List<String> _tests = ['Test1', 'Test2'];
  final List<String> _xRays = ['XRAys1', 'XRAys2'];
  final List<String> _performedSurgeries = [
    'performedSurgeries1',
    'performedSurgerie2'
  ];
  final List<String> _myReports = ['Report1', 'Report2'];

  _getDropDownDecoration({required hintText}) {
    return InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
        hintText: hintText,
        hintStyle: const TextStyle(
            color: AppColors.white, fontWeight: FontWeight.bold),
        filled: true,
        fillColor: AppColors.primary,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SafeArea(child: SizedBox.shrink()),
          Expanded(
            child: Image.asset(AppAssets.doctorsIMG),
          ),
          Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.all(16.0),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(24)),
                child: ListView(
                  children: [
                    DropdownButtonFormField(
                      icon: const Icon(
                        Icons.arrow_drop_down_sharp,
                        color: AppColors.white,
                      ),
                      decoration: _getDropDownDecoration(
                          hintText: 'My Current Doctor/s'),
                      items: _currentDoctors
                          .map((e) => DropdownMenuItem(
                                child: Text(e.toString()),
                                value: e.toString(),
                              ))
                          .toList(),
                      onChanged: (value) {},
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),

                    ///
                    DropdownButtonFormField(
                      icon: const Icon(
                        Icons.arrow_drop_down_sharp,
                        color: AppColors.white,
                      ),
                      decoration: _getDropDownDecoration(
                          hintText: 'My treatment plans'),
                      items: _treatmentPlans
                          .map((e) => DropdownMenuItem(
                                child: Text(e.toString()),
                                value: e.toString(),
                              ))
                          .toList(),
                      onChanged: (value) {},
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),

                    ///
                    DropdownButtonFormField(
                      icon: const Icon(
                        Icons.arrow_drop_down_sharp,
                        color: AppColors.white,
                      ),
                      decoration: _getDropDownDecoration(
                          hintText: 'My tests'),
                      items: _tests
                          .map((e) => DropdownMenuItem(
                                child: Text(e.toString()),
                                value: e.toString(),
                              ))
                          .toList(),
                      onChanged: (value) {},
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),

                    ///
                    DropdownButtonFormField(
                      icon: const Icon(
                        Icons.arrow_drop_down_sharp,
                        color: AppColors.white,
                      ),
                      decoration: _getDropDownDecoration(
                          hintText: 'My X-rays'),
                      items: _xRays
                          .map((e) => DropdownMenuItem(
                        child: Text(e.toString()),
                        value: e.toString(),
                      ))
                          .toList(),
                      onChanged: (value) {},
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),

                    ///
                    DropdownButtonFormField(
                      icon: const Icon(
                        Icons.arrow_drop_down_sharp,
                        color: AppColors.white,
                      ),
                      decoration: _getDropDownDecoration(
                          hintText: 'preformed surgeries'),
                      items: _performedSurgeries
                          .map((e) => DropdownMenuItem(
                        child: Text(e.toString()),
                        value: e.toString(),
                      ))
                          .toList(),
                      onChanged: (value) {},
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),

                    ///
                    DropdownButtonFormField(
                      icon: const Icon(
                        Icons.arrow_drop_down_sharp,
                        color: AppColors.white,
                      ),
                      decoration: _getDropDownDecoration(
                          hintText: 'My reports'),
                      items: _myReports
                          .map((e) => DropdownMenuItem(
                        child: Text(e.toString()),
                        value: e.toString(),
                      ))
                          .toList(),
                      onChanged: (value) {},
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),

                    ///
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
